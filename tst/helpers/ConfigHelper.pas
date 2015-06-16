unit ConfigHelper;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils, System.JSON, DUnitX.TestFramework, ReportsConfig, ReportTemplate;

type
  IConfigHelper = interface
    ['{E34334E6-E7FF-46A5-B97D-EB06E653A000}']
    procedure ClearConfig();
    procedure AssertContainsTemplate(const aTemplate : TReportTemplate);
  end;

  TConfigHelper = class(TInterfacedObject, IConfigHelper)
  private
    FileName : string;
  public
    constructor Create();
    procedure ClearConfig();
    procedure AssertContainsTemplate(const aTemplate : TReportTemplate);
    function JSONMatchesTemplate(JSONTemplate : TJSONValue; const aTemplate : TReportTemplate) : Boolean;
  end;

implementation

{ TConfigHelper }

constructor TConfigHelper.Create();
begin
  inherited;
  FileName := TPath.GetHomePath() + '\Avocado\Timetable\Config.json';
end;

procedure TConfigHelper.ClearConfig();
begin
  if TFile.Exists(FileName) then
    TFile.Delete(FileName);
end;

procedure TConfigHelper.AssertContainsTemplate(const aTemplate : TReportTemplate);
var
  lCfg : TJSONObject;
  lList : TStringList;
  lTemplates : TJSONArray;
  lTemplate : TJSONValue;
  lStr : string;
begin
  Assert.IsTrue(TFile.Exists(FileName), 'Config file does not exist');

  lList := TStringList.Create();
  try
    lList.LoadFromFile(FileName);
    lStr := lList.Text;
    lCfg := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lStr), 0) as TJSONObject;
    try
      lTemplates := lCfg.GetValue('templates') as TJSONArray;

      for lTemplate in lTemplates do begin
        if JSONMatchesTemplate(lTemplate, aTemplate) then
          Assert.Pass();
      end;

      Assert.Fail(Format('Template "%s" not found in config', [aTemplate.ToString()]));
    finally
      lCfg.Free();
    end;
  finally
    lList.Free();
  end;
end;

function TConfigHelper.JSONMatchesTemplate(JSONTemplate : TJSONValue; const aTemplate : TReportTemplate) : Boolean;
var
  lConfig : TJSONValue;
begin
  Result := (aTemplate.Name = JSONTemplate.GetValue<string>('name')) and
    (aTemplate.ReportClass = JSONTemplate.GetValue<string>('class'));
  if not Result then
    Exit;
  lConfig := JSONTemplate.GetValue<TJSONValue>('config');
  Result := aTemplate.Config = lConfig.GetValue<string>('day');
end;

end.
