object frmNewTemplate: TfrmNewTemplate
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Jauns '#353'ablons'
  ClientHeight = 197
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 147
    Width = 284
    Height = 50
    Align = alBottom
    Shape = bsTopLine
  end
  object lblMonthlyDate: TLabel
    Left = 165
    Top = 60
    Width = 36
    Height = 13
    Caption = 'datum'#257
  end
  object Label1: TLabel
    Left = 32
    Top = 27
    Width = 58
    Height = 13
    Caption = 'Nosaukums:'
  end
  object Label2: TLabel
    Left = 165
    Top = 87
    Width = 36
    Height = 13
    Caption = 'datum'#257
  end
  object edtReportName: TEdit
    Left = 104
    Top = 24
    Width = 150
    Height = 21
    TabOrder = 0
    Text = 'edtReportName'
  end
  object rbtMonthly: TRadioButton
    Left = 40
    Top = 59
    Width = 81
    Height = 17
    Caption = 'reizi m'#275'nes'#299
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object edtMonthlyDate: TEdit
    Left = 133
    Top = 57
    Width = 26
    Height = 21
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 2
    Text = '15'
  end
  object rbtQuarterly: TRadioButton
    Left = 40
    Top = 86
    Width = 81
    Height = 17
    Caption = 'reizi ceturksn'#299
    TabOrder = 3
  end
  object edtQuarterlyDate: TEdit
    Left = 133
    Top = 84
    Width = 26
    Height = 21
    Enabled = False
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 4
    Text = '15'
  end
  object rbtYearly: TRadioButton
    Left = 40
    Top = 111
    Width = 81
    Height = 17
    Caption = 'reizi gad'#257
    TabOrder = 5
  end
  object edtYearlyDate: TEdit
    Left = 133
    Top = 109
    Width = 26
    Height = 21
    Enabled = False
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 6
    Text = '15'
  end
  object cmbMonth: TComboBox
    Left = 165
    Top = 109
    Width = 89
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemIndex = 0
    TabOrder = 7
    Text = 'janv'#257'r'#299
    Items.Strings = (
      'janv'#257'r'#299
      'febru'#257'r'#299
      'mart'#257
      'apr'#299'l'#299
      'maij'#257
      'j'#363'nij'#257
      'j'#363'lij'#257
      'august'#257
      'septembr'#299
      'oktobr'#299
      'novembr'#299
      'decembr'#299)
  end
  object btnOK: TButton
    Left = 98
    Top = 159
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 8
    OnClick = btnOKClick
  end
  object Button1: TButton
    Left = 179
    Top = 159
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Atcelt'
    TabOrder = 9
  end
end
