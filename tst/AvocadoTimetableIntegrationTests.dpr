program AvocadoTimetableIntegrationTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DUnitX.TestFramework,
  DUnitX.Loggers.Console,
  DUnitX.Windows.Console,
  JsonReportsConfigTests in 'integration\JsonReportsConfigTests.pas',
  ReportsConfig in '..\src\model\ReportsConfig.pas',
  JsonReportsConfig in '..\src\db\JsonReportsConfig.pas',
  Reports in '..\src\model\Reports.pas',
  ReportTemplate in '..\src\model\ReportTemplate.pas',
  ConfigHelper in 'helpers\ConfigHelper.pas';

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
