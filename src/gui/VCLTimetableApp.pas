unit VCLTimetableApp;

interface

uses
  Vcl.Forms, System.IOUtils, Generics.Collections, TimetableApp, ReportsConfig, Main, MainFormListener,
  NewTemplateRequestListener, ReportTemplate;

type
  TVCLTimetableApp = class(TInterfacedObject, ITimetableApp, IMainFormListener, INewTemplateRequestListener)
  private
    FConfig : IReportsConfig;
    FForms : TObjectList<TForm>;
    procedure CleanupForms();
  public
    constructor Create();
    procedure Run();
    procedure Stop();
    procedure NewTemplateClicked();
    procedure AddTemplate(const aTemplate : TReportTemplate);
  end;

implementation

uses
  JsonReportsConfig, NewTemplate;

const
  TIMETABLE_DIR = '\Avocado\Timetable';

  { TVCLTimetableApp }

procedure TVCLTimetableApp.CleanupForms();
begin
  FForms.Free();
  FForms := nil;
end;

constructor TVCLTimetableApp.Create();
begin
  inherited;
  FForms := TObjectList<TForm>.Create();
end;

procedure TVCLTimetableApp.AddTemplate(const aTemplate : TReportTemplate);
begin
  FConfig.SaveTemplate(aTemplate);
end;

procedure TVCLTimetableApp.NewTemplateClicked();
var
  lForm : TfrmNewTemplate;
begin
  lForm := TfrmNewTemplate.Create(nil);
  FForms.Add(lForm);
  lForm.Listener := Self;
  lForm.Show();
end;

procedure TVCLTimetableApp.Run();
begin
  Application.Initialize();
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Avocado Timetable';
  Application.CreateForm(TfrmMain, frmMain);
  FConfig := TJsonReportsConfig.Create(TPath.GetHomePath() + TIMETABLE_DIR);
  frmMain.Listener := Self;
  frmMain.Show();
end;

procedure TVCLTimetableApp.Stop();
begin
  frmMain.Release();
  CleanupForms();
end;

end.
