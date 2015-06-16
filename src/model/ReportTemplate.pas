unit ReportTemplate;

interface

uses
  Reports, System.SysUtils;

type
  TReportTemplate = record
    ID : TReportID; // autogenerate
    Name : string;
    ReportClass : string;
    Config : string;
    constructor Create(const aID : TReportID; const aReportClass, aName, aConfig : string);
    function ToString() : string;
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

function TReportTemplate.ToString() : string;
begin
  Result := Format('ID[%s],Name[%s],Class[%s],Config[%s]', [ID, name, ReportClass, Config]);
end;

end.
