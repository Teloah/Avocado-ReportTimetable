unit NewReportFormRunner;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, DUnitX.GUITest;

type
  INewReportFormRunner = interface
    ['{66777927-8F01-43EB-8AE7-CFDF4E1AA745}']
    procedure ChooseMonthlyReportType();
    procedure ClickOKButton();
    procedure EnterMonthlyReportDate();
    procedure EnterNewReportName();
  end;

  TNewReportFormRunner = class(TInterfacedObject, INewReportFormRunner)
  private
    Form : TForm;
  public
    constructor Create();
    procedure ChooseMonthlyReportType();
    procedure ClickOKButton();
    procedure EnterMonthlyReportDate();
    procedure EnterNewReportName();
  end;

const
  NEW_REPORT_FORM_CLASS = 'TfrmNewReport';
  NEW_REPORT_MONTHLY_RADIO = 'rbtMonthly';
  NEW_REPORT_MONTHLY_EDIT = 'edtMonthlyDate';
  NEW_REPORT_OK_BUTTON = 'btnOK';
  NEW_REPORT_MONTHLY_VALUE_DATE = '15';
  NEW_REPORT_VALUE_ID = 'REPORT_ID';

implementation

const
  REPORT_NAME_EDIT = 'edtReportName';

  { TNewReportFormRunner }

constructor TNewReportFormRunner.Create();
begin
  inherited Create();
  Form := FindForm(NEW_REPORT_FORM_CLASS);
end;

procedure TNewReportFormRunner.ChooseMonthlyReportType();
var
  lMonthlyButton : TRadioButton;
begin
  lMonthlyButton := FindControl(Form, NEW_REPORT_MONTHLY_RADIO) as TRadioButton;
  lMonthlyButton.Checked := True;
end;

procedure TNewReportFormRunner.ClickOKButton();
var
  lBtn : TButton;
begin
  lBtn := FindControl(Form, NEW_REPORT_OK_BUTTON) as TButton;
  lBtn.Click();
end;

procedure TNewReportFormRunner.EnterMonthlyReportDate();
var
  lEdit : TEdit;
begin
  lEdit := FindControl(Form, NEW_REPORT_MONTHLY_EDIT) as TEdit;
  lEdit.Text := NEW_REPORT_MONTHLY_VALUE_DATE;
end;

procedure TNewReportFormRunner.EnterNewReportName();
var
  lEdit : TEdit;
begin
  lEdit := FindControl(Form, REPORT_NAME_EDIT) as TEdit;
  lEdit.Text := NEW_REPORT_VALUE_ID;
end;

end.
