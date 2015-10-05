unit ReportTemplateTests;

interface

uses
  DUnitX.TestFramework, ReportTemplate;

type

  [TestFixture('Unit tests')]
  TReportTemplateTests = class
  public
    [Test]
    procedure Create_AssignsUniqueID();
    [Test]
    procedure Create_KeepsProvidedID();
  end;

implementation

{ TReportTemplateTests }

procedure TReportTemplateTests.Create_AssignsUniqueID();
var
  lTemplate1 : TReportTemplate;
  lTemplate2 : TReportTemplate;
begin
  lTemplate1 := TReportTemplate.Create('', '', '', '');
  lTemplate2 := TReportTemplate.Create('', '', '', '');

  Assert.AreNotEqual(lTemplate1.ID, lTemplate2.ID);
end;

procedure TReportTemplateTests.Create_KeepsProvidedID();
var
  lTemplate : TReportTemplate;
const
  ID = 'ID';
begin
  lTemplate := TReportTemplate.Create(ID, '', '', '');

  Assert.AreEqual(ID, lTemplate.ID);
end;

initialization

TDUnitX.RegisterTestFixture(TReportTemplateTests);

end.
