unit ApplicationRunner;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls, DUnitX.TestFramework, Spring.Collections, DUnitX.GUITest, TimetableApp;

type
  TApplicationRunner = class
  private
    App : ITimetableApp;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure StartGUI();
    procedure AssertNewReportFormIsVisible();
    procedure AssertShowsForm();
    procedure AssertShowsNoEntries();
    procedure AssertTwoNewReportFormsAreVisible();
    procedure ClickNewReportButton();
    procedure CloseAllNewReportForms();
    procedure CloseNewReportForm();
    procedure AssertShowsReportAsIncomplete(const aReportName : string; const aCompany : string);
  end;

implementation

uses
  NewReportFormRunner, VCLTimetableApp, VirtualTrees, AvocadoToolbar;

const
  MAIN_CAPTION = 'Avocado Timetable';
  MAIN_FORM_CLASS = 'TfrmMain';
  REPORTS_TREE_NAME = 'vstReports';
  NEW_REPORT_NAME = 'tbtTemplates';

  { TApplicationRunner }

constructor TApplicationRunner.Create();
begin
  inherited;
  App := TVCLTimetableApp.Create();
end;

destructor TApplicationRunner.Destroy();
begin
  App.Stop();
  Application.ProcessMessages();
  inherited;
end;

procedure TApplicationRunner.StartGUI();
begin
  App.Run();
end;

procedure TApplicationRunner.AssertNewReportFormIsVisible();
begin
  FindForm(NEW_REPORT_FORM_CLASS);
end;

procedure TApplicationRunner.AssertShowsForm();
var
  lForm : TForm;
begin
  lForm := FindForm(MAIN_FORM_CLASS);

  Assert.IsTrue(Assigned(lForm));
  Assert.AreEqual(MAIN_CAPTION, lForm.Caption);
end;

procedure TApplicationRunner.AssertShowsNoEntries();
var
  lForm : TCustomForm;
  lTree : TVirtualStringTree;
begin
  lForm := FindForm(MAIN_FORM_CLASS);
  lTree := FindControl(lForm, REPORTS_TREE_NAME) as TVirtualStringTree;
  Assert.AreEqual(0, lTree.RootNodeCount);
end;

procedure TApplicationRunner.AssertShowsReportAsIncomplete(const aReportName, aCompany : string);
var
  lForm : TForm;
begin
  lForm := FindForm(MAIN_FORM_CLASS);
  // TODO: add checking
end;

procedure TApplicationRunner.AssertTwoNewReportFormsAreVisible();
var
  lForms : IEnumerable<TForm>;
begin
  lForms := FindAllForms(NEW_REPORT_FORM_CLASS);
  Assert.AreEqual(2, lForms.Count);
end;

procedure TApplicationRunner.ClickNewReportButton();
var
  lForm : TForm;
  lButton : TAvocadoToolButton;
begin
  lForm := FindForm(MAIN_FORM_CLASS);
  lButton := FindControl(lForm, NEW_REPORT_NAME) as TAvocadoToolButton;
  lButton.Click();
  Application.ProcessMessages();
end;

procedure TApplicationRunner.CloseAllNewReportForms();
var
  lForms : IEnumerable<TForm>;
  lForm : TForm;
begin
  lForms := FindAllForms(NEW_REPORT_FORM_CLASS);
  for lForm in lForms do begin
    lForm.Close();
  end;
end;

procedure TApplicationRunner.CloseNewReportForm();
var
  lForm : TForm;
begin
  lForm := FindForm(NEW_REPORT_FORM_CLASS);
  lForm.Close();
end;

end.
