unit AvocadoToolbar;

interface

uses
  System.Classes, Winapi.Messages, System.SysUtils, Vcl.Controls, Generics.Collections;

type
  TAvocadoToolButton = class;

  IAvocadoButtonListener = interface(IInvokable)
    ['{A296F7F4-90D7-4D0A-A147-C4EB9BC87BDB}']
    procedure ButtonSelected(aButton : TAvocadoToolButton);
  end;

  TAvocadoToolButton = class(TCustomControl)
  private
    FCaption : string;
    FSelected : Boolean;
    FOver : Boolean;
    FListener : IAvocadoButtonListener;
    procedure SetCaption(const Value : string);
    procedure SetSelected(const Value : Boolean);
  protected
    procedure Paint(); override;
    procedure CMMouseEnter(var Message : TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message : TMessage); message CM_MOUSELEAVE;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    property Caption : string read FCaption write SetCaption;
    property Selected : Boolean read FSelected write SetSelected;
    property Listener : IAvocadoButtonListener read FListener write FListener;
    procedure Click(); override;
  end;

  TAvocadoToolbar = class(TCustomControl, IAvocadoButtonListener)
  private
    FButtons : TList<TAvocadoToolButton>;
  protected
    procedure Paint(); override;
    procedure ButtonSelected(aButton : TAvocadoToolButton);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure AddButton(const aName, aCaption : string; aOnClick : TNotifyEvent);
  end;

implementation

{ TAvocadoToolbar }

procedure TAvocadoToolButton.Click();
begin
  FSelected := not FSelected;
  Listener.ButtonSelected(Self);
  Invalidate();
  inherited;
end;

procedure TAvocadoToolButton.CMMouseEnter(var Message : TMessage);
begin
  inherited;
  FOver := True;
  Invalidate();
end;

procedure TAvocadoToolButton.CMMouseLeave(var Message : TMessage);
begin
  FOver := False;
  Invalidate();
  inherited;
end;

constructor TAvocadoToolButton.Create(AOwner : TComponent);
begin
  inherited;
  Canvas.Font.Name := 'Segoe UI';
  Canvas.Font.Size := 18;
  Canvas.Font.Color := $DDDDDD;
end;

destructor TAvocadoToolButton.Destroy();
begin

  inherited;
end;

procedure TAvocadoToolButton.Paint();
begin
  if FSelected then
    Canvas.Brush.Color := $004D26
  else if FOver then
    Canvas.Brush.Color := $006632
  else
    Canvas.Brush.Color := $00994B;
  Canvas.FillRect(ClientRect);
  Canvas.TextOut(10, 2, Caption);
end;

procedure TAvocadoToolButton.SetCaption(const Value : string);
var
  lWidth : Integer;
begin
  FCaption := Value;
  lWidth := Canvas.TextWidth(Value);
  Width := lWidth + 20;
end;

procedure TAvocadoToolButton.SetSelected(const Value : Boolean);
begin
  FSelected := Value;
  Invalidate();
end;

{ TAvocadoToolbar }

procedure TAvocadoToolbar.AddButton(const aName, aCaption : string; aOnClick : TNotifyEvent);
var
  lButton : TAvocadoToolButton;
begin
  lButton := TAvocadoToolButton.Create(Self);
  lButton.Parent := Self;
  lButton.Name := aName;
  lButton.Align := alLeft;
  lButton.Caption := aCaption;
  lButton.OnClick := aOnClick;
  lButton.Listener := Self;
  if FButtons.Count > 0 then
    lButton.Left := FButtons[FButtons.Count - 1].Left + 1;
  FButtons.Add(lButton);
end;

procedure TAvocadoToolbar.ButtonSelected(aButton : TAvocadoToolButton);
var
  lButton : TAvocadoToolButton;
begin
  for lButton in FButtons do begin
    if lButton <> aButton then
      lButton.Selected := False;
  end;
end;

constructor TAvocadoToolbar.Create(AOwner : TComponent);
begin
  inherited;
  FButtons := TList<TAvocadoToolButton>.Create();
end;

destructor TAvocadoToolbar.Destroy();
begin
  FButtons.Free();
  inherited;
end;

procedure TAvocadoToolbar.Paint();
begin
  Canvas.Brush.Color := $00994B;
  Canvas.FillRect(ClientRect);
end;

end.
