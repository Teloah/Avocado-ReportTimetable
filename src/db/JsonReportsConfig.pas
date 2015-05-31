unit JsonReportsConfig;

interface

uses
  Classes, System.IOUtils, Spring.Collections, ReportsConfig, ReportTemplate;

type
  TJsonReportsConfig = class(TInterfacedObject, IReportsConfig)
  public
    procedure Add(aEntry : TReportConfig);
    function Entries() : ICollection<TReportConfig>;
    procedure SaveTemplate(const aTemplate : TReportTemplate);
  end;

implementation

{ TJsonReportsConfig }

procedure TJsonReportsConfig.Add(aEntry : TReportConfig);
begin

end;

function TJsonReportsConfig.Entries() : ICollection<TReportConfig>;
begin

end;

procedure TJsonReportsConfig.SaveTemplate(const aTemplate : TReportTemplate);
var
  lFileName : string;
  lList : TStringList;
  lDir : string;
begin
  lDir := TPath.GetHomePath() + '\Avocado\Timetable\';
  TDirectory.CreateDirectory(lDir);
  lFileName := lDir + 'Config.json';
  lList := TStringList.Create();
  try
    lList.Add('{}');
    lList.SaveToFile(lFileName);
  finally
    lList.Free();
  end;
end;

end.
