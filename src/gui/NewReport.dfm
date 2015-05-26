object frmNewReport: TfrmNewReport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Jauns '#353'ablons'
  ClientHeight = 258
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 17
  object Bevel1: TBevel
    Left = 0
    Top = 192
    Width = 371
    Height = 66
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Shape = bsTopLine
  end
  object lblMonthlyDate: TLabel
    Left = 216
    Top = 78
    Width = 47
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'datum'#257
  end
  object Label1: TLabel
    Left = 42
    Top = 35
    Width = 76
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Nosaukums:'
  end
  object Label2: TLabel
    Left = 216
    Top = 114
    Width = 47
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'datum'#257
  end
  object edtReportName: TEdit
    Left = 136
    Top = 31
    Width = 196
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    Text = 'edtReportName'
  end
  object rbtMonthly: TRadioButton
    Left = 52
    Top = 77
    Width = 106
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'reizi m'#275'nes'#299
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object edtMonthlyDate: TEdit
    Left = 174
    Top = 75
    Width = 34
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 2
    Text = '15'
  end
  object rbtQuarterly: TRadioButton
    Left = 52
    Top = 112
    Width = 106
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'reizi ceturksn'#299
    TabOrder = 3
  end
  object edtQuarterlyDate: TEdit
    Left = 174
    Top = 110
    Width = 34
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Enabled = False
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 4
    Text = '15'
  end
  object rbtYearly: TRadioButton
    Left = 52
    Top = 145
    Width = 106
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'reizi gad'#257
    TabOrder = 5
  end
  object edtYearlyDate: TEdit
    Left = 174
    Top = 143
    Width = 34
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Enabled = False
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 6
    Text = '15'
  end
  object cmbMonth: TComboBox
    Left = 216
    Top = 143
    Width = 116
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
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
    Left = 128
    Top = 208
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    Default = True
    TabOrder = 8
  end
  object Button1: TButton
    Left = 234
    Top = 208
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Cancel = True
    Caption = 'Atcelt'
    TabOrder = 9
  end
end
