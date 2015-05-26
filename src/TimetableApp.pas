unit TimetableApp;

interface

uses
  Vcl.Forms;

type
  ITimetableApp = interface(IInvokable)
    ['{6A661F36-1E87-4794-A91A-4CD8CB36052D}']
    procedure Run();
    procedure Stop();
  end;

  TTimetableApp = class(TInterfacedObject, ITimetableApp)
  public
    procedure Run();
    procedure Stop();
  end;

implementation

uses
  Main;

{ TTimetableApp }

procedure TTimetableApp.Run();
begin
  Application.Initialize();
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Avocado Timetable';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Show();
end;

procedure TTimetableApp.Stop();
begin
  frmMain.Release();
end;

end.
