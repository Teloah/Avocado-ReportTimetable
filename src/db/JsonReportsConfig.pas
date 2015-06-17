unit JsonReportsConfig;

interface

uses
  Classes, System.SysUtils, Generics.Collections, System.JSON, System.IOUtils, Spring.Collections, ReportsConfig,
  ReportTemplate;

type
  TJSONReportTemplate = class
  private
    FRoot : TJSONObject;
    procedure AddNode(const aName : string; aValue : Integer); overload;
    procedure AddNode(const aName, aValue : string); overload;
  public
    constructor Create(aParent : TJSONArray);
    function AsString() : string;
    procedure SetDay(aValue : Integer);
    procedure SetID(const aID : string);
    procedure SetName(const aName : string);
    procedure SetReportClass(const aReportClass : string);
  end;

  TJsonReportsConfig = class(TInterfacedObject, IReportsConfig)
  private
    FConfigDir : string;
    FDoc : TJSONObject;
    FTemmplatesDict : TDictionary<string, TReportTemplate>;
    FTemplates : TJSONArray;
    function ConfigFile() : string;
    procedure SaveJSONTemplateToFile();
  public
    constructor Create(const aConfigDir : string);
    destructor Destroy(); override;
    procedure SaveTemplate(const aTemplate : TReportTemplate);
  end;

implementation

{ TJSONReportTemplate }

constructor TJSONReportTemplate.Create(aParent : TJSONArray);
begin
  inherited Create();
  FRoot := TJSONObject.Create();
  aParent.AddElement(FRoot);
end;

procedure TJSONReportTemplate.AddNode(const aName : string; aValue : Integer);
begin
  FRoot.AddPair(aName, TJSONNumber.Create(aValue));
end;

procedure TJSONReportTemplate.AddNode(const aName, aValue : string);
begin
  FRoot.AddPair(aName, TJSONString.Create(aValue));
end;

function TJSONReportTemplate.AsString() : string;
begin
  Result := FRoot.ToString();
end;

procedure TJSONReportTemplate.SetDay(aValue : Integer);
var
  lCfg : TJSONObject;
begin
  lCfg := TJSONObject.Create();
  lCfg.AddPair('day', TJSONNumber.Create(aValue));
  FRoot.AddPair('config', lCfg);
end;

procedure TJSONReportTemplate.SetID(const aID : string);
begin
  AddNode('id', aID);
end;

procedure TJSONReportTemplate.SetName(const aName : string);
begin
  AddNode('name', aName);
end;

procedure TJSONReportTemplate.SetReportClass(const aReportClass : string);
begin
  AddNode('class', aReportClass);
end;

{ TJsonReportsConfig }

constructor TJsonReportsConfig.Create(const aConfigDir : string);
begin
  inherited Create();
  FConfigDir := IncludeTrailingPathDelimiter(aConfigDir);
  FTemmplatesDict := TDictionary<string, TReportTemplate>.Create();
end;

destructor TJsonReportsConfig.Destroy();
begin
  FTemmplatesDict.Free();
  inherited;
end;

function TJsonReportsConfig.ConfigFile() : string;
begin
  Result := FConfigDir + 'Config.json';
end;

procedure TJsonReportsConfig.SaveJSONTemplateToFile();
var
  lList : TStringList;
begin
  lList := TStringList.Create();
  try
    lList.Add(FDoc.ToString());
    lList.SaveToFile(ConfigFile());
  finally
    lList.Free();
  end;
end;

procedure TJsonReportsConfig.SaveTemplate(const aTemplate : TReportTemplate);
var
  lJSON : TJSONReportTemplate;
  lTemplate : TReportTemplate;
begin
  FTemmplatesDict.Add(aTemplate.Name, aTemplate);
  FDoc := TJSONObject.Create();
  try
    FTemplates := TJSONArray.Create();
    FDoc.AddPair('templates', FTemplates);
    for lTemplate in FTemmplatesDict.Values do begin
      lJSON := TJSONReportTemplate.Create(FTemplates);
      try
        lJSON.SetReportClass(lTemplate.ReportClass);
        lJSON.SetID(lTemplate.ID);
        lJSON.SetName(lTemplate.Name);
        lJSON.SetDay(StrToInt(lTemplate.Config));
      finally
        lJSON.Free();
      end;
    end;
    SaveJSONTemplateToFile();
  finally
    FDoc.Free();
  end;
end;

end.
