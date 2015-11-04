program AvocadoTimetableIntegrationTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  TestInsight.DUnitX,
  JsonReportsConfigTests in 'integration\JsonReportsConfigTests.pas',
  ReportsConfig in '..\src\model\ReportsConfig.pas',
  JsonReportsConfig in '..\src\db\JsonReportsConfig.pas',
  Reports in '..\src\model\Reports.pas',
  ReportTemplate in '..\src\model\ReportTemplate.pas',
  ConfigHelper in 'helpers\ConfigHelper.pas';

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
