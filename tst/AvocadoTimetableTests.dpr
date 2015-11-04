program AvocadoTimetableTests;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  TestInsight.DUnitX,
  ReportTemplate in '..\src\model\ReportTemplate.pas',
  ReportTemplateTests in 'unit\ReportTemplateTests.pas';

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
