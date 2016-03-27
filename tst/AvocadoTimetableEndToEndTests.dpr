program AvocadoTimetableEndToEndTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  TestInsight.DUnitX,
  EndToEndTests in 'endtoend\EndToEndTests.pas',
  TimetableApp in '..\src\TimetableApp.pas',
  Main in '..\src\gui\Main.pas' {frmMain},
  DUnitX.GUITest in 'DUnitX.GUITest.pas',
  ApplicationRunner in 'helpers\ApplicationRunner.pas',
  NewTemplate in '..\src\gui\NewTemplate.pas' {frmNewTemplate},
  NewReportFormRunner in 'helpers\NewReportFormRunner.pas',
  ConfigHelper in 'helpers\ConfigHelper.pas',
  Reports in '..\src\model\Reports.pas',
  ReportsConfig in '..\src\model\ReportsConfig.pas',
  ReportTemplate in '..\src\model\ReportTemplate.pas',
  JsonReportsConfig in '..\src\db\JsonReportsConfig.pas',
  VCLTimetableApp in '..\src\gui\VCLTimetableApp.pas',
  MainFormListener in '..\src\gui\MainFormListener.pas',
  NewTemplateRequestListener in '..\src\gui\NewTemplateRequestListener.pas',
  AvocadoToolbar in '..\src\gui\AvocadoToolbar.pas',
  AvocadoReportsTree in '..\src\gui\AvocadoReportsTree.pas';

{$R *.RES}

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    RunRegisteredTests();
  except
    on E : Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
