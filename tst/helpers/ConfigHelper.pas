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
  lConfig : TJSONValue;
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
      lTemplate := lTemplates.Items[0];
      Assert.AreEqual(aTemplate.Name, lTemplate.GetValue<string>('name'));
      Assert.AreEqual(aTemplate.ReportClass, lTemplate.GetValue<string>('class'));
      lConfig := lTemplate.GetValue<TJSONValue>('config');
      Assert.AreEqual(aTemplate.Config, lConfig.GetValue<string>('day'));
    finally
      lCfg.Free();
    end;
  finally
    lList.Free();
  end;
end;

end.
