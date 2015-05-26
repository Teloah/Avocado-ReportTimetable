program AvocadoTimetable;

uses
  Vcl.Forms,
  Main in 'gui\Main.pas' {frmMain},
  Reports in 'model\Reports.pas',
  ReportsConfig in 'model\ReportsConfig.pas',
  TimetableApp in 'TimetableApp.pas',
  NewReport in 'gui\NewReport.pas' {frmNewReport},
  AddReport in 'gui\AddReport.pas' {Form1},
  JsonReportsConfig in 'db\JsonReportsConfig.pas',
  ReportTemplate in 'model\ReportTemplate.pas';

{$R *.res}

var
  App : ITimetableApp;

begin
  ReportMemoryLeaksOnShutdown := True;
  App := TTimetableApp.Create();
  App.Run();
  Application.CreateForm(TForm1, Form1);
  Application.Run();

end.
