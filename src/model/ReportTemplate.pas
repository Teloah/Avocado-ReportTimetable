unit ReportTemplate;

interface

uses
  Reports;

type
  TReportTemplate = record
    ID : TReportID; // autogenerate
    Name : string;
    ReportClass : string;
    Config : string;
    constructor Create(const aID : TReportID; const aReportClass, aName, aConfig : string);
  end;

implementation

{ TReportTemplate }

constructor TReportTemplate.Create(const aID : TReportID; const aReportClass, aName, aConfig : string);
begin
  ID := aID;
  ReportClass := aReportClass;
  name := aName;
  Config := aConfig;
end;

end.
