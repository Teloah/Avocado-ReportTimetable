unit JsonReportsConfigTests;

interface

uses
  System.Classes, DUnitX.TestFramework, ReportsConfig, JsonReportsConfig;

type

  [TestFixture('Integration tests')]
  TJsonReportsConfigTests = class
  private
  public
    [Test]
    procedure Hookup();
  end;

implementation

uses
  ReportTemplate;

{ TJsonReportsConfigTests }

procedure TJsonReportsConfigTests.Hookup();
var
  lConfig : IReportsConfig;
  lTemplate : TReportTemplate;
  lFile : TStringList;
const
  CONFIG_NAME = 'C:\Users\klaipand\AppData\Roaming\Avocado\Timetable\Config.json';
begin
  lConfig := TJsonReportsConfig.Create();

  lTemplate.ReportClass := 'MONTHLY';
  lTemplate.ID := 'VSA';
  lTemplate.Name := 'Valsts Sociâlâ Atskaite';
  lTemplate.Config := '15';

  lConfig.SaveTemplate(lTemplate);

  lFile := TStringList.Create();
  try
    lFile.LoadFromFile(CONFIG_NAME);
    Assert.AreEqual( //
      '{"class":"MONTHLY","id":"VSA","name":"Valsts Sociâlâ Atskaite","config":{"day":15}}'#13#10, //
      lFile.Text);
  finally
    lFile.Free();
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TJsonReportsConfigTests);

end.
