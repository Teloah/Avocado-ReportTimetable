unit Reports;

interface

uses
  Spring.Collections, Spring.Collections.Lists;

type
  TReportID = string;
  TCompany = string;

  TReport = record
    ID : TReportID;
    Company : TCompany;
  end;

  TReportEntry = record
  public
    Report : TReportID;
    Date : TDate;
    DateCompleted : TDate;
    Notes : string;
  end;

  IReportEntries = IEnumerable<TReportEntry>;

implementation

end.
