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
    procedure DeleteConfigDir();
  public
    [Setup]
    procedure Setup();
    [Test]
    procedure SaveTemplate_OneTemplate_SavesIt();
    [Test]
    procedure LoadTemplate_SavedTemplate_LoadsIt();
    [Test]
    procedure LoadTemplate_SeveralTemplates_LoadsSecondOne();
    [Test]
    procedure LoadTemplate_TemplateFromAnotherSession_LoadsTemplate();
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
  DeleteConfigDir();
  ConfigHelper := TConfigHelper.Create(CONFIG_NAME);
end;

function TJsonReportsConfigTests.CreateConfig() : IReportsConfig;
begin
  Result := TJsonReportsConfig.Create(CONFIG_DIR);
end;

procedure TJsonReportsConfigTests.DeleteConfigDir();
begin
  if TDirectory.Exists(CONFIG_DIR) then
    TDirectory.Delete(CONFIG_DIR, True);
end;

procedure TJsonReportsConfigTests.SaveTemplate_OneTemplate_SavesIt();
var
  lTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('VSA', 'MONTHLY', 'Valsts Soci�l� Atskaite', '15');
  Config := CreateConfig();

  Config.SaveTemplate(lTemplate);

  ConfigHelper.AssertContainsTemplate(lTemplate);
end;

procedure TJsonReportsConfigTests.LoadTemplate_SavedTemplate_LoadsIt();
var
  lTemplate : TReportTemplate;
  lOtherTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('VSA', 'MONTHLY', 'Valsts Soci�l� Atskaite', '15');
  Config := CreateConfig();
  Config.SaveTemplate(lTemplate);

  Config := CreateConfig();
  lOtherTemplate := Config.LoadTemplate('VSA');

  Assert.AreEqual(lTemplate.ToString(), lOtherTemplate.ToString());
end;

procedure TJsonReportsConfigTests.LoadTemplate_SeveralTemplates_LoadsSecondOne();
var
  lTemplate : TReportTemplate;
  lOtherTemplate : TReportTemplate;
begin
  Config := CreateConfig();
  Config.SaveTemplate(TReportTemplate.Create('', 'MONTHLY', 'Pirm� Atskaite', '1'));
  lTemplate := TReportTemplate.Create('VSA', 'MONTHLY', 'Valsts Soci�l� Atskaite', '15');
  Config.SaveTemplate(lTemplate);

  Config := CreateConfig();
  lOtherTemplate := Config.LoadTemplate('VSA');

  Assert.AreEqual(lTemplate.ToString(), lOtherTemplate.ToString());
end;

procedure TJsonReportsConfigTests.LoadTemplate_TemplateFromAnotherSession_LoadsTemplate();
var
  lTemplate : TReportTemplate;
  lOtherTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('VSA', 'MONTHLY', 'Valsts Soci�l� Atskaite', '15');
  Config := CreateConfig();
  Config.SaveTemplate(lTemplate);

  Config := CreateConfig();
  Config.SaveTemplate(TReportTemplate.Create('', 'MONTHLY', 'Pirm� Atskaite', '1'));
  lOtherTemplate := Config.LoadTemplate('VSA');

  Assert.AreEqual(lTemplate.ToString(), lOtherTemplate.ToString());
end;

initialization

TDUnitX.RegisterTestFixture(TJsonReportsConfigTests);

end.
