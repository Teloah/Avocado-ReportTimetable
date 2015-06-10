unit ConfigHelper;

interface

uses
  System.IOUtils, ReportsConfig, System.SysUtils;

type
  IConfigHelper = interface
    ['{E34334E6-E7FF-46A5-B97D-EB06E653A000}']
    procedure ClearConfig();
    // function Contains(aEntry : TReportConfig) : Boolean;
  end;

  TConfigHelper = class(TInterfacedObject, IConfigHelper)
  private
    FileName : string;
  public
    constructor Create();
    procedure ClearConfig();
  end;

implementation

{ TConfigHelper }

constructor TConfigHelper.Create();
begin
  inherited;
  FileName := TPath.GetHomePath() + '\Avocado\Timetable\Config.json';
end;

procedure TConfigHelper.ClearConfig();
begin
  if TFile.Exists(FileName) then
    TFile.Delete(FileName);
end;

end.
