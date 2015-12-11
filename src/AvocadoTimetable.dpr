program AvocadoTimetable;

uses
  Vcl.Forms,
  Main in 'gui\Main.pas' {frmMain},
  Reports in 'model\Reports.pas',
  ReportsConfig in 'model\ReportsConfig.pas',
  TimetableApp in 'TimetableApp.pas',
  NewTemplate in 'gui\NewTemplate.pas' {frmNewTemplate},
  AddReport in 'gui\AddReport.pas' {frmAddReport},
  JsonReportsConfig in 'db\JsonReportsConfig.pas',
  ReportTemplate in 'model\ReportTemplate.pas',
  VCLTimetableApp in 'gui\VCLTimetableApp.pas';

{$R *.res}

var
  App : ITimetableApp;

begin
  ReportMemoryLeaksOnShutdown := True;
  App := TTimetableApp.Create();
  App.Run();
  Application.Run();

end.
