unit DUnitX.GUITest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.SysUtils, Vcl.Forms, Vcl.Controls, Spring.Collections;

type
  EFormNotFound = class(Exception);
  EControlNotFound = class(Exception);

function FindControl(aParent : TControl; const aName : string) : TControl;
function FindForm(const aClassName : string) : TForm;
function FindAllForms(const aClassName : string) : ICollection<TForm>;

function FindWindowsForm(const aClassName : string) : HWND;
function GetWindowText(aWindow : HWND) : string;

implementation

function DoFind(aParent : TComponent; const aName : string) : TControl;
var
  aa : Integer;
  lComp : TComponent;
begin
  Result := nil;
  for aa := 0 to aParent.ComponentCount - 1 do begin
    lComp := aParent.Components[aa];
    if (lComp is TControl) and (UpperCase(lComp.Name) = aName) then
      Exit(lComp as TControl)
    else
      Result := DoFind(lComp, aName);
    if Assigned(Result) then
      Exit;
  end;
end;

function FindControl(aParent : TControl; const aName : string) : TControl;
const
  E_CONTROL_NOT_FOUND = 'Control %s not found in parent %s.';
begin
  Result := DoFind(aParent, UpperCase(aName));
  if not Assigned(Result) then
    raise EControlNotFound.CreateFmt(E_CONTROL_NOT_FOUND, [aName, aParent.Name]);
end;

function FindForm(const aClassName : string) : TForm;
const
  E_FORM_NOT_FOUND = 'Form %s not found.';
var
  aa : Integer;
  lForm : TForm;
begin
  for aa := 0 to Screen.FormCount - 1 do begin
    lForm := Screen.Forms[aa];
    if lForm.ClassName = aClassName then
      Exit(lForm);
  end;
  raise EFormNotFound.CreateFmt(E_FORM_NOT_FOUND, [aClassName]);
end;

function FindAllForms(const aClassName : string) : ICollection<TForm>;
var
  aa : Integer;
  lForm : TForm;
begin
  Result := TCollections.CreateList<TForm>();
  for aa := 0 to Screen.FormCount - 1 do begin
    lForm := Screen.Forms[aa];
    if lForm.ClassName = aClassName then
      Result.Add(lForm);
  end;
end;

function FindWindowsForm(const aClassName : string) : HWND;
var
  lStart : Cardinal;
begin
  Result := 0;
  lStart := GetTickCount();
  while (GetTickCount() - lStart) < 5000 do begin
    Result := FindWindow(PWideChar(aClassName), 0);
    if Result <> 0 then
      Exit;
    Sleep(1);
  end;
end;

function GetWindowText(aWindow : HWND) : string;
var
  lText : array [0 .. 32768] of Char;
begin
  SendMessage(aWindow, WM_GETTEXT, 32768, LongInt(@lText));
  Result := lText;
end;

end.
