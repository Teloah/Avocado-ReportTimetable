program AvocadoTimetableTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DUnitX.TestFramework,
  DUnitX.Loggers.Console,
  DUnitX.Windows.Console,
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
