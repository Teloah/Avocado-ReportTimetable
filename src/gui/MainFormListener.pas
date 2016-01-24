unit MainFormListener;

interface

type
  IMainFormListener = interface
    ['{7377A9E2-7E0F-4FD6-B345-768A35575D0A}']
    procedure NewTemplateClicked();
  end;

  TNullMainFormListener = class(TInterfacedObject, IMainFormListener)
  public
    procedure NewTemplateClicked();
  end;

implementation

{ TNullMainFormListener }

procedure TNullMainFormListener.NewTemplateClicked();
begin
  // do nothing
end;

end.
