unit ReportsConfig;

interface

uses
  Spring.Collections, Spring.Collections.Lists, Reports, ReportTemplate;

type
  IReportsConfig = interface(IInvokable)
    ['{0569597C-D5C0-44EA-9A2D-76CD42968F0A}']
    function LoadTemplate(const aID : string) : TReportTemplate;
    procedure SaveTemplate(const aTemplate : TReportTemplate);
  end;

implementation

end.
