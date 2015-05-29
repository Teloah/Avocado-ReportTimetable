unit JsonReportsConfigTests;

interface

uses
  DUnitX.TestFramework, ReportsConfig, JsonReportsConfig;

type

  [TestFixture('Integration tests')]
  TJsonReportsConfigTests = class
  private
  public
    [Test]
    procedure Hookup();
  end;

implementation

{ TJsonReportsConfigTests }

procedure TJsonReportsConfigTests.Hookup();
var
  lConfig : IReportsConfig;
begin
  lConfig := TJsonReportsConfig.Create();
end;

initialization

TDUnitX.RegisterTestFixture(TJsonReportsConfigTests);

end.
