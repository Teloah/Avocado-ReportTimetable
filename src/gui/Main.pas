unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Generics.Collections;

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
  public
    { Public declarations }
  end;

var
  frmMain : TfrmMain;

implementation

uses
  NewTemplate;

{$R *.dfm}

procedure TfrmMain.FormDestroy(Sender : TObject);
begin
  FForms.Free();
end;

procedure TfrmMain.FormCreate(Sender : TObject);
begin
  FForms := TObjectList<TForm>.Create();
end;

procedure TfrmMain.tbtNewTemplateClick(Sender : TObject);
var
  lForm : TForm;
begin
  lForm := TfrmNewTemplate.Create(nil);
  lForm.Show();
  FForms.Add(lForm);
end;

end.
