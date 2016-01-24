unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, MainFormListener;

type
  TfrmMain = class(TForm)
    ToolBar1 : TToolBar;
    tbtDummy : TToolButton;
    Memo1 : TMemo;
    tbtNewTemplate : TToolButton;
    procedure FormCreate(Sender : TObject);
    procedure tbtNewTemplateClick(Sender : TObject);
  private
    FListener : IMainFormListener;
    procedure SetListener(const Value : IMainFormListener);
  public
    property Listener : IMainFormListener read FListener write SetListener;
  end;

var
  frmMain : TfrmMain;

implementation

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender : TObject);
begin
  FListener := TNullMainFormListener.Create();
end;

procedure TfrmMain.SetListener(const Value : IMainFormListener);
begin
  FListener := Value;
end;

procedure TfrmMain.tbtNewTemplateClick(Sender : TObject);
begin
  FListener.NewTemplateClicked();
end;

end.
