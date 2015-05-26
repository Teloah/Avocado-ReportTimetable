unit Reports;

interface

uses
  Spring.Collections, Spring.Collections.Lists;

type
  TReportID = string;
  TCompany = string;

  IReport = interface(IInvokable)
    ['{91D6E422-F054-46FC-8E1B-C6EFA7CD47BD}']
  end;

  TReportEntry = record
  public
    Company : TCompany;
    Report : TReportID;
    Date : TDate;
    DateCompleted : TDate;
    Notes : string;
  end;

  IReportEntries = IEnumerable<TReportEntry>;

implementation

end.
