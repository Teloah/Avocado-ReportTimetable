program AvocadoTimetableEndToEndTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DUnitX.TestFramework,
  DUnitX.Loggers.Console,
  DUnitX.Windows.Console,
  EndToEndTests in 'EndToEndTests.pas',
  TimetableApp in '..\src\TimetableApp.pas',
  Main in '..\src\gui\Main.pas' {frmMain},
  DUnitX.GUITest in 'DUnitX.GUITest.pas',
  ApplicationRunner in 'helpers\ApplicationRunner.pas',
  NewReport in '..\src\gui\NewReport.pas' {frmNewReport},
  NewReportFormRunner in 'helpers\NewReportFormRunner.pas',
  ConfigHelper in 'helpers\ConfigHelper.pas',
  Reports in '..\src\model\Reports.pas',
  ReportsConfig in '..\src\model\ReportsConfig.pas',
  ReportTemplate in '..\src\model\ReportTemplate.pas';

{$R *.RES}

var
  Runner : ITestRunner;
  Logger : ITestLogger;
  Results : IRunResults;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    Runner := TDUnitX.CreateRunner();
    Logger := TDUnitXConsoleLogger.Create(True);
    Runner.AddLogger(Logger);
    Results := Runner.Execute();
    System.Readln;
  except
    on E : Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
