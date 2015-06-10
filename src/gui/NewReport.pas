unit NewReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.IOUtils;

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
  public
    procedure SaveTemplate();
  end;

implementation

uses
  ReportsConfig, JsonReportsConfig, ReportTemplate;

{$R *.dfm}

procedure TfrmNewReport.btnOKClick(Sender : TObject);
begin
  SaveTemplate();
  Close();
end;

procedure TfrmNewReport.SaveTemplate();
var
  lTemplate : TReportTemplate;
  lConfig : IReportsConfig;
begin
  lTemplate := TReportTemplate.Create('', 'MONTHLY', 'TEST', '1');
  lConfig := TJsonReportsConfig.Create(TPath.GetHomePath() + '\Avocado\Timetable');
  lConfig.SaveTemplate(lTemplate);
end;

end.
