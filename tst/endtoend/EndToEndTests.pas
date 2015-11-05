unit EndToEndTests;

interface

uses
  System.IOUtils, DUnitX.TestFramework, DUnitX.GUITest, ApplicationRunner, ConfigHelper, ReportTemplate;

type

  [TestFixture('End to end tests')]
  TEndToEndTests = class
  private
    App : TApplicationRunner;
    ConfigHelper : IConfigHelper;
    function DefaultMonthlyTemplate() : TReportTemplate;
  public
    constructor Create();
    function ConfigFileName : string;
    [Setup]
    procedure Setup();
    [TearDown]
    procedure TearDown();
    [Test]
    procedure ShowsEmptyForm();
    [Test]
    procedure ShowsNewReprotForm();
    [Test]
    procedure ShowsTwoNewReportFormsSimultaneously();
    [Test]
    procedure CorrectlyClosesSeveralNewReportFormsWhenClosingMainForm();
    [Test]
    procedure NewReportFormAllowsToEnterMonthlyReport();
    [Test]
    procedure NewMonthlyReportTemplateGetsSavedToFile();
    [Test]
    procedure NewMonthlyReportTemplateGetsAddedToExistingTemplates();
    [Test]
    procedure TemplatesArePersistedBetweenSessions();
  end;

implementation

uses
  NewReportFormRunner;

{ TEndToEndTests }

constructor TEndToEndTests.Create();
begin
  inherited;
  ConfigHelper := TConfigHelper.Create(ConfigFileName());
end;

function TEndToEndTests.ConfigFileName() : string;
begin
  Result := TPath.GetHomePath() + '\Avocado\Timetable\Config.json';
end;

procedure TEndToEndTests.Setup();
begin
  ConfigHelper.ClearConfig();
  App := TApplicationRunner.Create();
end;

procedure TEndToEndTests.TearDown();
begin
  App.Free();
end;

procedure TEndToEndTests.ShowsEmptyForm();
begin
  App.AssertShowsForm();
  App.AssertShowsNoEntries();
end;

procedure TEndToEndTests.ShowsNewReprotForm();
begin
  App.ClickNewReportButton();
  App.AssertNewReportFormIsVisible();
  App.CloseNewReportForm();
  Assert.Pass();
end;

procedure TEndToEndTests.ShowsTwoNewReportFormsSimultaneously();
begin
  App.ClickNewReportButton();
  App.ClickNewReportButton();
  App.AssertTwoNewReportFormsAreVisible();
  App.CloseAllNewReportForms();
end;

procedure TEndToEndTests.CorrectlyClosesSeveralNewReportFormsWhenClosingMainForm();
begin
  App.ClickNewReportButton();
  App.ClickNewReportButton();
  // there should be no memleaks from these lines
  Assert.Pass();
end;

function TEndToEndTests.DefaultMonthlyTemplate() : TReportTemplate;
begin
  Result.ID := 'ID';
  Result.Name := 'MONTHLY REPORT';
  Result.ReportClass := 'MONTHLY';
  Result.Config := '15';
end;

procedure TEndToEndTests.NewReportFormAllowsToEnterMonthlyReport();
var
  NewFormRunner : INewReportFormRunner;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();
  NewFormRunner.EnterMonthlyTemplate(DefaultMonthlyTemplate());

  NewFormRunner.AssertFormIsNotVisible();
end;

procedure TEndToEndTests.NewMonthlyReportTemplateGetsSavedToFile();
var
  NewFormRunner : INewReportFormRunner;
  lTemplate : TReportTemplate;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();

  lTemplate := DefaultMonthlyTemplate();
  NewFormRunner.EnterMonthlyTemplate(lTemplate);

  ConfigHelper.AssertContainsTemplate(lTemplate);
end;

procedure TEndToEndTests.NewMonthlyReportTemplateGetsAddedToExistingTemplates();
var
  NewFormRunner : INewReportFormRunner;
  lTemplate : TReportTemplate;
  lTemplate2 : TReportTemplate;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();

  lTemplate := DefaultMonthlyTemplate();
  NewFormRunner.EnterMonthlyTemplate(lTemplate);

  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();

  lTemplate2.ID := 'ID2';
  lTemplate2.Name := 'Other monthly report';
  lTemplate2.ReportClass := 'MONTHLY';
  lTemplate2.Config := '1';
  NewFormRunner.EnterMonthlyTemplate(lTemplate2);

  ConfigHelper.AssertContainsTemplate(lTemplate);
end;

procedure TEndToEndTests.TemplatesArePersistedBetweenSessions();
var
  NewFormRunner : INewReportFormRunner;
  lTemplate : TReportTemplate;
  lTemplate2 : TReportTemplate;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();

  lTemplate := DefaultMonthlyTemplate();
  NewFormRunner.EnterMonthlyTemplate(lTemplate);

  App.Free();
  App := TApplicationRunner.Create();

  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();

  lTemplate2.ID := 'ID2';
  lTemplate2.Name := 'Other monthly report';
  lTemplate2.ReportClass := 'MONTHLY';
  lTemplate2.Config := '1';
  NewFormRunner.EnterMonthlyTemplate(lTemplate2);

  ConfigHelper.AssertContainsTemplate(lTemplate);
end;

initialization

TDUnitX.RegisterTestFixture(TEndToEndTests);

end.
