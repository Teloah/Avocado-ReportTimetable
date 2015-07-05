unit JsonReportsConfigTests;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils, DUnitX.TestFramework, ReportsConfig, JsonReportsConfig, ConfigHelper;

type

  [TestFixture('Integration tests')]
  TJsonReportsConfigTests = class
  private
    Config : IReportsConfig;
    ConfigHelper : IConfigHelper;
    function CreateConfig() : IReportsConfig;
    procedure RecreateConfigDir();
  public
    [Setup]
    procedure Setup();
    [Test]
    procedure SaveTemplate_OneTemplate_SavesIt();
  end;

implementation

uses
  ReportTemplate;

const
  CONFIG_DIR = '.\config';
  CONFIG_NAME = CONFIG_DIR + '\Config.json';

  { TJsonReportsConfigTests }

procedure TJsonReportsConfigTests.Setup();
begin
  RecreateConfigDir();
  ConfigHelper := TConfigHelper.Create(CONFIG_NAME);
end;

function TJsonReportsConfigTests.CreateConfig() : IReportsConfig;
begin
  Result := TJsonReportsConfig.Create(CONFIG_DIR);
end;

procedure TJsonReportsConfigTests.RecreateConfigDir();
begin
  if TDirectory.Exists(CONFIG_DIR) then
    TDirectory.Delete(CONFIG_DIR, True);
  TDirectory.CreateDirectory(CONFIG_DIR);
end;

procedure TJsonReportsConfigTests.SaveTemplate_OneTemplate_SavesIt();
var
  lTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('VSA', 'MONTHLY', 'Valsts Sociâlâ Atskaite', '15');
  Config := CreateConfig();

  Config.SaveTemplate(lTemplate);

  ConfigHelper.AssertContainsTemplate(lTemplate);

  // AssertConfigIs('{"templates":[' +
  // '{"class":"MONTHLY","id":"VSA","name":"Valsts Sociâlâ Atskaite","config":{"day":15}}' //
  // + ']}'#13#10);
end;

initialization

TDUnitX.RegisterTestFixture(TJsonReportsConfigTests);

end.
