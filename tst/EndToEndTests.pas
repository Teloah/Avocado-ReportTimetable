unit EndToEndTests;

interface

uses
  DUnitX.TestFramework, DUnitX.GUITest, ApplicationRunner, ConfigHelper;

type

  [TestFixture('End to end tests')]
  TEndToEndTests = class
  private
    App : TApplicationRunner;
    ConfigHelper : IConfigHelper;
  public
    constructor Create();
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
  end;

implementation

uses
  NewReportFormRunner, ReportTemplate;

{ TEndToEndTests }

constructor TEndToEndTests.Create();
begin
  inherited;
  ConfigHelper := TConfigHelper.Create();
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
end;

procedure TEndToEndTests.NewReportFormAllowsToEnterMonthlyReport();
var
  NewFormRunner : INewReportFormRunner;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();
  NewFormRunner.EnterMonthlyTemplate();

  NewFormRunner.AssertFormIsNotVisible();
end;

procedure TEndToEndTests.NewMonthlyReportTemplateGetsSavedToFile();
var
  NewFormRunner : INewReportFormRunner;
  lTemplate : TReportTemplate;
begin
  App.ClickNewReportButton();
  NewFormRunner := TNewReportFormRunner.Create();
  NewFormRunner.EnterMonthlyTemplate();

  lTemplate.ID := 'ID';
  lTemplate.Name := NEW_REPORT_VALUE_ID;
  lTemplate.ReportClass := 'MONTHLY';
  lTemplate.Config := '15';

  ConfigHelper.AssertContainsTemplate(lTemplate);
end;

initialization

TDUnitX.RegisterTestFixture(TEndToEndTests);

end.
