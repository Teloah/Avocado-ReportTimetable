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
  VCLTimetableApp in 'gui\VCLTimetableApp.pas',
  MainFormListener in 'gui\MainFormListener.pas',
  NewTemplateRequestListener in 'gui\NewTemplateRequestListener.pas',
  AvocadoToolbar in 'gui\AvocadoToolbar.pas',
  AvocadoReportsTree in 'gui\AvocadoReportsTree.pas';

{$R *.res}

var
  App : ITimetableApp;

begin
  ReportMemoryLeaksOnShutdown := True;
  App := TVCLTimetableApp.Create();
  try
    App.Run();
    Application.Run();
  finally
    App.Stop();
  end;

end.
