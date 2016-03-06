program CompleteTestSuite;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  TestInsight.DUnitX,
  EndToEndTests in 'endtoend\EndToEndTests.pas',
  JsonReportsConfigTests in 'integration\JsonReportsConfigTests.pas',
  ReportTemplateTests in 'unit\ReportTemplateTests.pas',
  ApplicationRunner in 'helpers\ApplicationRunner.pas',
  ConfigHelper in 'helpers\ConfigHelper.pas',
  NewReportFormRunner in 'helpers\NewReportFormRunner.pas',
  JsonReportsConfig in '..\src\db\JsonReportsConfig.pas',
  AddReport in '..\src\gui\AddReport.pas' {frmAddReport},
  Main in '..\src\gui\Main.pas' {frmMain},
  MainFormListener in '..\src\gui\MainFormListener.pas',
  NewTemplate in '..\src\gui\NewTemplate.pas' {frmNewTemplate},
  NewTemplateRequestListener in '..\src\gui\NewTemplateRequestListener.pas',
  VCLTimetableApp in '..\src\gui\VCLTimetableApp.pas',
  Reports in '..\src\model\Reports.pas',
  ReportsConfig in '..\src\model\ReportsConfig.pas',
  ReportTemplate in '..\src\model\ReportTemplate.pas',
  TimetableApp in '..\src\TimetableApp.pas',
  AvocadoToolbar in '..\src\gui\AvocadoToolbar.pas';

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    RunRegisteredTests();
  except
    on E : Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
