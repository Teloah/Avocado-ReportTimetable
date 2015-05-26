object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Avocado Timetable'
  ClientHeight = 636
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 17
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 951
    Height = 31
    AutoSize = True
    ButtonHeight = 31
    ButtonWidth = 104
    Caption = 'ToolBar1'
    List = True
    ShowCaptions = True
    TabOrder = 0
    object tbtNewReport: TToolButton
      Left = 0
      Top = 0
      Caption = 'tbtNewReport'
      ImageIndex = 3
      OnClick = tbtNewReportClick
    end
    object tbtDummy: TToolButton
      Left = 104
      Top = 0
      AutoSize = True
      Caption = 'tbtDummy'
      ImageIndex = 2
      Style = tbsDropDown
      Visible = False
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 31
    Width = 951
    Height = 605
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Lines.Strings = (
      'No reports found')
    TabOrder = 1
  end
end
