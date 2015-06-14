unit EndToEndTests;

interface

uses
  DUnitX.TestFramework, DUnitX.GUITest, ApplicationRunner, ConfigHelper, ReportTemplate;

type

  [TestFixture('End to end tests')]
  TEndToEndTests = class
  private
    App : TApplicationRunner;
    ConfigHelper : IConfigHelper;
    function DefaultMonthlyTemplate() : TReportTemplate;
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
  NewReportFormRunner;

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

initialization

TDUnitX.RegisterTestFixture(TEndToEndTests);

end.
