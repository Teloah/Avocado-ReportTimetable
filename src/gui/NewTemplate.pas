unit NewTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ReportsConfig;

type
  TfrmNewTemplate = class(TForm)
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
    FConfig : IReportsConfig;
  public
    procedure SaveTemplate();
    property Config : IReportsConfig read FConfig write FConfig;
  end;

implementation

uses
  JsonReportsConfig, ReportTemplate;

{$R *.dfm}

procedure TfrmNewTemplate.btnOKClick(Sender : TObject);
begin
  SaveTemplate();
  Close();
end;

procedure TfrmNewTemplate.SaveTemplate();
var
  lTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('ID', 'MONTHLY', edtReportName.Text, edtMonthlyDate.Text);
  FConfig.SaveTemplate(lTemplate);
end;

end.
