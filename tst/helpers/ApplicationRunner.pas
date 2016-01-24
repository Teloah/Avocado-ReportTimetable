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
  end;

implementation

uses
  NewReportFormRunner, VCLTimetableApp;

const
  MAIN_CAPTION = 'Avocado Timetable';
  MAIN_FORM_CLASS = 'TfrmMain';
  MEMO_NAME = 'Memo1';
  NEW_REPORT_NAME = 'tbtNewTemplate';

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
  lMemo : TMemo;
begin
  lForm := FindForm(MAIN_FORM_CLASS);
  lMemo := FindControl(lForm, MEMO_NAME) as TMemo;
  Assert.AreEqual('No reports found'#13#10, lMemo.Text);
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
  lButton : TToolButton;
begin
  lForm := FindForm(MAIN_FORM_CLASS);
  lButton := FindControl(lForm, NEW_REPORT_NAME) as TToolButton;
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
