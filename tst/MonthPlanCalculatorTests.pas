unit MonthPlanCalculatorTests;

interface

uses
  SysUtils, System.Rtti, DUnitX.TestFramework, Spring.Collections, MonthPlanCalculator, Reports, ReportsConfig,
  Delphi.Mocks;

type

  [TestFixture]
  TTMonthPlanCalculatorTests = class
  private
    procedure AddConfigEntry(aConfig : ICollection<TReportConfig>; const aFirm, aDate, aReport : string);
  public
    [SetupFixture]
    procedure SetupDateFormats();
    [Test]
    procedure EmptyConfig_ReturnsNoEntries();
    [Test]
    procedure EntryWithStartDateInConfig_ReturnsTheEntry();
  end;

implementation

{ TMonthPlanCalculatorTests }

procedure TTMonthPlanCalculatorTests.SetupDateFormats();
begin
  FormatSettings.DateSeparator := '/';
  FormatSettings.ShortDateFormat := 'd/m/y';
end;

procedure TTMonthPlanCalculatorTests.AddConfigEntry(aConfig : ICollection<TReportConfig>;
  const aFirm, aDate, aReport : string);
var
  lConfigEntry : TReportConfig;
begin
  lConfigEntry.Company := aFirm;
  lConfigEntry.FirstDate := StrToDate(aDate);
  lConfigEntry.Report := aReport;
  aConfig.Add(lConfigEntry);
end;

procedure TTMonthPlanCalculatorTests.EmptyConfig_ReturnsNoEntries();
var
  lCalc : IMonthPlanCalculator;
  lList : IReportEntries;
  lConfig : TStub<IReportsConfig>;
  lConfigList : ICollection<TReportConfig>;
begin
  lConfig := TStub<IReportsConfig>.Create();
  lConfigList := TCollections.CreateList<TReportConfig>();
  lConfig.Setup.WillReturn(TValue.From(lConfigList)).When.Entries();
  lCalc := TMonthPlanCalculator.Create(lConfig);

  lList := lCalc.Calculate(0);

  Assert.IsTrue(lList.IsEmpty, 'List is not empty');
end;

procedure TTMonthPlanCalculatorTests.EntryWithStartDateInConfig_ReturnsTheEntry();
var
  lCalc : IMonthPlanCalculator;
  lList : IReportEntries;
  lConfig : TStub<IReportsConfig>;
  lConfigList : ICollection<TReportConfig>;
const
  C_CURRENTDATE = '01/01/2000';
  C_FIRSTDATE = '15/01/2000';
  C_FIRM = 'Firm';
  C_REPORT = 'Report';
begin
  lConfig := TStub<IReportsConfig>.Create();
  lConfigList := TCollections.CreateList<TReportConfig>();
  lConfig.Setup.WillReturn(TValue.From(lConfigList)).When.Entries();

  AddConfigEntry(lConfigList, C_FIRM, C_FIRSTDATE, C_REPORT);
  lCalc := TMonthPlanCalculator.Create(lConfig);

  lList := lCalc.Calculate(StrToDate(C_CURRENTDATE));

  Assert.AreEqual(1, lList.Count, 'List should contain 1 entry');
  Assert.AreEqual(C_FIRM, lList.First.Company);
  Assert.AreEqual(C_FIRSTDATE, FormatDateTime('dd/mm/yyyy', lList.First.Date));
  Assert.AreEqual(C_REPORT, lList.First.Report);
end;

initialization

TDUnitX.RegisterTestFixture(TTMonthPlanCalculatorTests);

end.
