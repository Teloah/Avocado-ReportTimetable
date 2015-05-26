unit ReportsConfig;

interface

uses
  Spring.Collections, Spring.Collections.Lists, Reports;

type
  TReportConfig = record
  public
    Company : TCompany;
    Report : TReportID;
    FirstDate : TDate;
    LastDate : TDate;
  end;

  IReportsConfig = interface(IInvokable)
    ['{0569597C-D5C0-44EA-9A2D-76CD42968F0A}']
    procedure Add(aEntry : TReportConfig);
    function Entries() : ICollection<TReportConfig>;
  end;

implementation

end.
