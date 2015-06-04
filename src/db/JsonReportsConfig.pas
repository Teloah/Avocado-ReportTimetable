unit JsonReportsConfig;

interface

uses
  Classes, System.SysUtils, System.JSON, System.IOUtils, Spring.Collections, ReportsConfig, ReportTemplate;

type
  TJSONReportTemplate = class
  private
    FDoc : TJSONObject;
    procedure AddNode(const aName : string; aValue : Integer); overload;
    procedure AddNode(const aName, aValue : string); overload;
  public
    constructor Create();
    destructor Destroy(); override;
    function AsString() : string;
    procedure SetDay(aValue : Integer);
    procedure SetID(const aID : string);
    procedure SetName(const aName : string);
    procedure SetReportClass(const aReportClass : string);
  end;

  TJsonReportsConfig = class(TInterfacedObject, IReportsConfig)
  private
    FConfigDir : string;
    function ConfigFile() : string;
    procedure SaveJSONTemplateToFile(lJSON : TJSONReportTemplate);
  public
    constructor Create(const aConfigDir : string);
    procedure SaveTemplate(const aTemplate : TReportTemplate);
  end;

implementation

{ TJSONReportTemplate }

constructor TJSONReportTemplate.Create();
begin
  inherited;
  FDoc := TJSONObject.Create();
end;

destructor TJSONReportTemplate.Destroy();
begin
  FDoc.Free();
  inherited;
end;

procedure TJSONReportTemplate.AddNode(const aName : string; aValue : Integer);
begin
  FDoc.AddPair(aName, TJSONNumber.Create(aValue));
end;

procedure TJSONReportTemplate.AddNode(const aName, aValue : string);
begin
  FDoc.AddPair(aName, TJSONString.Create(aValue));
end;

function TJSONReportTemplate.AsString() : string;
begin
  Result := FDoc.ToString();
end;

procedure TJSONReportTemplate.SetDay(aValue : Integer);
var
  lCfg : TJSONObject;
begin
  lCfg := TJSONObject.Create();
  lCfg.AddPair('day', TJSONNumber.Create(aValue));
  FDoc.AddPair('config', lCfg);
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
end;

function TJsonReportsConfig.ConfigFile() : string;
begin
  Result := FConfigDir + 'Config.json';
end;

procedure TJsonReportsConfig.SaveJSONTemplateToFile(lJSON : TJSONReportTemplate);
var
  lList : TStringList;
begin
  lList := TStringList.Create();
  try
    lList.Add(lJSON.AsString());
    lList.SaveToFile(ConfigFile());
  finally
    lList.Free();
  end;
end;

procedure TJsonReportsConfig.SaveTemplate(const aTemplate : TReportTemplate);
var
  lJSON : TJSONReportTemplate;
begin
  lJSON := TJSONReportTemplate.Create();
  try
    lJSON.SetReportClass(aTemplate.ReportClass);
    lJSON.SetID(aTemplate.ID);
    lJSON.SetName(aTemplate.Name);
    lJSON.SetDay(StrToInt(aTemplate.Config));
    SaveJSONTemplateToFile(lJSON);
  finally
    lJSON.Free();
  end;
end;

end.
