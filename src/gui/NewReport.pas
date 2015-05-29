unit NewReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmNewReport = class(TForm)
    edtReportName : TEdit;
    rbtMonthly : TRadioButton;
    edtMonthlyDate : TEdit;
    lblMonthlyDate : TLabel;
    Label1 : TLabel;
    Label2 : TLabel;
    rbtQuarterly : TRadioButton;
    edtQuarterlyDate : TEdit;
    rbtYearly : TRadioButton;
    edtYearlyDate : TEdit;
    cmbMonth : TComboBox;
    btnOK : TButton;
    Button1 : TButton;
    Bevel1 : TBevel;
    procedure btnOKClick(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmNewReport.btnOKClick(Sender : TObject);
begin
  Close();
end;

end.
