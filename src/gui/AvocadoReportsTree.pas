unit AvocadoReportsTree;

interface

uses
  VirtualTrees, Reports;

type
  IReportTreeEntry = interface
    ['{7005AC94-5F00-4900-888B-F4CF6D7A0097}']
    function ReportName() : string;
    function Company() : string;
    function IsCompleted() : Boolean;
  end;

  TReportTreeEntry = class(TInterfacedObject, IReportTreeEntry)
  private
    FCompany : string;
    FCompleted : Boolean;
    FReportName : string;
  public
    function ReportName() : string;
    function Company() : string;
    function IsCompleted() : Boolean;
    procedure SetReportName(const aValue : string);
    procedure SetCompany(const aValue : string);
    procedure SetCompleted(aValue : Boolean);
  end;

  TAvocadoReportsTree = class(TVirtualStringTree)
  public
    function GetEntry(aIndex : Integer) : IReportTreeEntry;
  end;

implementation

{ TAvocadoReportsTree }

function TAvocadoReportsTree.GetEntry(aIndex : Integer) : IReportTreeEntry;
begin
  Result := TReportTreeEntry.Create();
end;

{ TReportTreeEntry }

function TReportTreeEntry.Company() : string;
begin
  Result := FCompany;
end;

function TReportTreeEntry.IsCompleted() : Boolean;
begin
  Result := FCompleted;
end;

function TReportTreeEntry.ReportName() : string;
begin
  Result := FReportName;
end;

procedure TReportTreeEntry.SetCompany(const aValue : string);
begin
  FCompany := aValue;
end;

procedure TReportTreeEntry.SetCompleted(aValue : Boolean);
begin
  FCompleted := aValue;
end;

procedure TReportTreeEntry.SetReportName(const aValue : string);
begin
  FReportName := aValue;
end;

end.
