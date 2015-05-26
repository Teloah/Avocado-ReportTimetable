unit AddReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1 : TLabel;
    Label2 : TLabel;
    Label3 : TLabel;
    ComboBox1 : TComboBox;
    ComboBox2 : TComboBox;
    DateTimePicker1 : TDateTimePicker;
    Bevel1 : TBevel;
    btnOK : TButton;
    Button1 : TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1 : TForm1;

implementation

{$R *.dfm}

end.
