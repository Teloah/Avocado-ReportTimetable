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
  end;

implementation

end.
