unit VCLTimetableApp;

interface

uses
  Vcl.Forms, TimetableApp;

type
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
