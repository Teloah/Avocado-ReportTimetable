unit ApplicationRunner;

interface

uses
  Winapi.Windows, Winapi.Messages, System.IOUtils, Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls, Winapi.ShellAPI,
  DUnitX.TestFramework, Spring.Collections, DUnitX.GUITest, TimetableApp, AvocadoReportsTree;

type
  TApplicationRunner = class
  private
    App : HINST;
    MainWindow : HWND;
    function GetMainForm() : TForm;
    function GetReportsTree(aForm : TForm) : TAvocadoReportsTree;
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
  REPORTS_TREE_NAME = 'artReports';
  NEW_REPORT_NAME = 'tbtTemplates';

  { TApplicationRunner }

constructor TApplicationRunner.Create();
begin
  inherited;
  // App := TVCLTimetableApp.Create();
end;

destructor TApplicationRunner.Destroy();
begin
  SendMessage(MainWindow, WM_CLOSE, 0, 0);
  Application.ProcessMessages();
  inherited;
end;

procedure TApplicationRunner.StartGUI();
var
  lPath : string;
begin
  lPath := TPath.GetDirectoryName(Application.ExeName) + '\..\..\..\src\Win32\Debug\AvocadoTimetable.exe';
  // OutputDebugString(PWideChar(lPath));
  App := ShellExecute(0, 'open', PWideChar(lPath), nil, nil, SW_SHOWNORMAL);
  MainWindow := FindWindowsForm(MAIN_FORM_CLASS);
end;

procedure TApplicationRunner.AssertNewReportFormIsVisible();
begin
  FindForm(NEW_REPORT_FORM_CLASS);
end;

procedure TApplicationRunner.AssertShowsForm();
begin
  Assert.AreNotEqual(Cardinal(0), Cardinal(MainWindow));
  Assert.AreEqual(MAIN_CAPTION, GetWindowText(MainWindow));
end;

procedure TApplicationRunner.AssertShowsNoEntries();
var
  lForm : TForm;
  lTree : TVirtualStringTree;
begin
  lForm := GetMainForm();
  lTree := GetReportsTree(lForm);
  Assert.AreEqual(0, lTree.RootNodeCount);
end;

procedure TApplicationRunner.AssertShowsReportAsIncomplete(const aReportName, aCompany : string);
var
  lForm : TForm;
  lTree : TAvocadoReportsTree;
  lReportEntry : IReportTreeEntry;
begin
  lForm := GetMainForm();
  lTree := GetReportsTree(lForm);

  lReportEntry := lTree.GetEntry(0);

  Assert.AreEqual(aReportName, lReportEntry.ReportName());
  Assert.AreEqual(aCompany, lReportEntry.Company());
  Assert.AreEqual(False, lReportEntry.IsCompleted());
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
  lForm := GetMainForm();
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

function TApplicationRunner.GetMainForm() : TForm;
begin
  Result := FindForm(MAIN_FORM_CLASS);
end;

function TApplicationRunner.GetReportsTree(aForm : TForm) : TAvocadoReportsTree;
begin
  Result := FindControl(aForm, REPORTS_TREE_NAME) as TAvocadoReportsTree;
end;

end.
