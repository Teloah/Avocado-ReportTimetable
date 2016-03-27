unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, MainFormListener, VirtualTrees,
  Vcl.Imaging.jpeg, AvocadoReportsTree;

type
  TfrmMain = class(TForm)
    procedure FormCreate(Sender : TObject);
  private
    FListener : IMainFormListener;
    ReportsTree : TAvocadoReportsTree;
    procedure SetListener(const Value : IMainFormListener);
    procedure NewTemplateClick(Sender : TObject);
  public
    property Listener : IMainFormListener read FListener write SetListener;
  end;

var
  frmMain : TfrmMain;

implementation

uses
  AvocadoToolbar;

const
  REPORTS = 'Atskaites';
  TEMPLATES = 'Sagataves';
  COMPANIES = 'Firmas';

{$R *.dfm}

  { TfrmMain }

procedure TfrmMain.FormCreate(Sender : TObject);
var
  lToolbar : TAvocadoToolbar;
begin
  FListener := TNullMainFormListener.Create();

  lToolbar := TAvocadoToolbar.Create(Self);
  lToolbar.Parent := Self;
  lToolbar.AddButton('tbtReports', REPORTS, nil);
  lToolbar.AddButton('tbtTemplates', TEMPLATES, NewTemplateClick);
  lToolbar.AddButton('tbtCompanies', COMPANIES, nil);
  lToolbar.Align := alTop;
  lToolbar.Height := 42;

  lToolbar := TAvocadoToolbar.Create(Self);
  lToolbar.Parent := Self;
  lToolbar.AddButton('tbtNew', 'Jauna', nil);
  lToolbar.AddButton('tbtEdit', 'Labot', nil);
  lToolbar.AddButton('tbtDelete', 'Dzçst', nil);
  lToolbar.Align := alBottom;
  lToolbar.Height := 42;

  ReportsTree := TAvocadoReportsTree.Create(Self);
  ReportsTree.Name := 'artReports';
  ReportsTree.Align := alClient;
  ReportsTree.Parent := Self;
end;

procedure TfrmMain.SetListener(const Value : IMainFormListener);
begin
  FListener := Value;
end;

procedure TfrmMain.NewTemplateClick(Sender : TObject);
begin
  FListener.NewTemplateClicked();
end;

end.
