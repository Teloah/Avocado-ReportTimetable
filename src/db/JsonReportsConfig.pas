unit JsonReportsConfig;

interface

uses
  Classes, System.JSON, System.IOUtils, Spring.Collections, ReportsConfig, ReportTemplate;

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
  lDoc : TJSONObject;
  lCfg : TJSONObject;
begin
  lDir := TPath.GetHomePath() + '\Avocado\Timetable\';
  TDirectory.CreateDirectory(lDir);
  lFileName := lDir + 'Config.json';

  lDoc := TJSONObject.Create();
  try
    lDoc.AddPair(TJSONPair.Create(TJSONString.Create('class'), TJSONString.Create('MONTHLY')));
    lDoc.AddPair(TJSONPair.Create(TJSONString.Create('id'), TJSONString.Create('VSA')));
    lDoc.AddPair(TJSONPair.Create(TJSONString.Create('name'), TJSONString.Create('Valsts Sociâlâ Atskaite')));
    lCfg := TJSONObject.Create();
    lCfg.AddPair(TJSONPair.Create(TJSONString.Create('day'), TJSONNumber.Create(15)));
    lDoc.AddPair(TJSONPair.Create(TJSONString.Create('config'), lCfg));

    lList := TStringList.Create();
    try
      lList.Add(lDoc.ToString);
      lList.SaveToFile(lFileName);
    finally
      lList.Free();
    end;
  finally
    lDoc.Free();
  end;
end;

end.
