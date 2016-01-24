unit NewTemplateRequestListener;

interface

uses
  ReportTemplate;

type
  INewTemplateRequestListener = interface
    ['{47FCE0A4-B7F2-43A9-88EE-C4A869CB7CDC}']
    procedure AddTemplate(const aTemplate : TReportTemplate);
  end;

  TNullNewTemplateRequestListener = class(TInterfacedObject, INewTemplateRequestListener)
  public
    procedure AddTemplate(const aTemplate : TReportTemplate);
  end;

implementation

{ TNullNewTemplateRequestListener }

procedure TNullNewTemplateRequestListener.AddTemplate(const aTemplate : TReportTemplate);
begin
  // do nothing
end;

end.
