unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, System.IOUtils, Generics.Collections, ReportsConfig;

type
  TfrmMain = class(TForm)
    ToolBar1 : TToolBar;
    tbtDummy : TToolButton;
    Memo1 : TMemo;
    tbtNewTemplate : TToolButton;
    procedure FormDestroy(Sender : TObject);
    procedure FormCreate(Sender : TObject);
    procedure tbtNewTemplateClick(Sender : TObject);
  private
    FForms : TObjectList<TForm>;
    FConfig : IReportsConfig;
  public
    { Public declarations }
  end;

var
  frmMain : TfrmMain;

implementation

uses
  NewTemplate, JsonReportsConfig;

{$R *.dfm}

procedure TfrmMain.FormDestroy(Sender : TObject);
begin
  FForms.Free();
end;

procedure TfrmMain.FormCreate(Sender : TObject);
begin
  FForms := TObjectList<TForm>.Create();
  FConfig := TJsonReportsConfig.Create(TPath.GetHomePath() + '\Avocado\Timetable');
end;

procedure TfrmMain.tbtNewTemplateClick(Sender : TObject);
var
  lForm : TfrmNewTemplate;
begin
  lForm := TfrmNewTemplate.Create(nil);
  lForm.Config := FConfig;
  lForm.Show();
  FForms.Add(lForm);
end;

end.
