unit NewTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ReportsConfig, ReportTemplate, NewTemplateRequestListener;

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
    procedure FormCreate(Sender : TObject);
    procedure btnOKClick(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
  private
    FListener : INewTemplateRequestListener;
  public
    procedure SaveTemplate();
    property Listener : INewTemplateRequestListener read FListener write FListener;
  end;

implementation

{$R *.dfm}

procedure TfrmNewTemplate.FormCreate(Sender : TObject);
begin
  FListener := TNullNewTemplateRequestListener.Create();
end;

procedure TfrmNewTemplate.btnOKClick(Sender : TObject);
begin
  SaveTemplate();
  Close();
end;

procedure TfrmNewTemplate.FormClose(Sender : TObject; var Action : TCloseAction);
begin
  FListener := nil;
end;

procedure TfrmNewTemplate.SaveTemplate();
var
  lTemplate : TReportTemplate;
begin
  lTemplate := TReportTemplate.Create('ID', 'MONTHLY', edtReportName.Text, edtMonthlyDate.Text);
  Listener.AddTemplate(lTemplate);
end;

end.
