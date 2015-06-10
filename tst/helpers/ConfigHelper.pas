unit ConfigHelper;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils, System.JSON, DUnitX.TestFramework, ReportsConfig;

type
  IConfigHelper = interface
    ['{E34334E6-E7FF-46A5-B97D-EB06E653A000}']
    procedure ClearConfig();
    procedure AssertContainsTemplate(const aTemplateName : string);
  end;

  TConfigHelper = class(TInterfacedObject, IConfigHelper)
  private
    FileName : string;
  public
    constructor Create();
    procedure ClearConfig();
    procedure AssertContainsTemplate(const aTemplateName : string);
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

procedure TConfigHelper.AssertContainsTemplate(const aTemplateName : string);
var
  lCfg : TJSONObject;
  lList : TStringList;
begin
  Assert.IsTrue(TFile.Exists(FileName), 'Config file does not exist');

  lList := TStringList.Create();
  lCfg := TJSONObject.Create();
  try
    lList.LoadFromFile(FileName);
    lCfg.Parse(BytesOf(lList.ToString()), 0);

    // TODO add checking of the template

  finally
    lCfg.Free();
    lList.Free();
  end;
end;

end.
