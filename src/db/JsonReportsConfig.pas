unit JsonReportsConfig;

interface

uses
  ReportsConfig, Spring.Collections;

type
  TJsonReportsConfig = class(TInterfacedObject, IReportsConfig)
  public
    procedure Add(aEntry : TReportConfig);
    function Entries() : ICollection<TReportConfig>;
  end;

implementation

{ TJsonReportsConfig }

procedure TJsonReportsConfig.Add(aEntry : TReportConfig);
begin

end;

function TJsonReportsConfig.Entries : ICollection<TReportConfig>;
begin

end;

end.
