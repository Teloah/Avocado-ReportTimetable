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
  private
    procedure CreateUniqueID();
  end;

implementation

{ TReportTemplate }

constructor TReportTemplate.Create(const aID : TReportID; const aReportClass, aName, aConfig : string);
begin
  if aID = '' then
    CreateUniqueID()
  else
    ID := aID;
  ReportClass := aReportClass;
  name := aName;
  Config := aConfig;
end;

procedure TReportTemplate.CreateUniqueID;
var
  lGUID : TGUID;
begin
  if CreateGUID(lGUID) = 0 then
    ID := lGUID.ToString;
end;

function TReportTemplate.ToString() : string;
begin
  Result := Format('ID[%s],Name[%s],Class[%s],Config[%s]', [ID, name, ReportClass, Config]);
end;

end.
