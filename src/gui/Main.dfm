object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Avocado Timetable'
  ClientHeight = 486
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 727
    Height = 27
    AutoSize = True
    ButtonHeight = 27
    ButtonWidth = 97
    Caption = 'ToolBar1'
    List = True
    ShowCaptions = True
    TabOrder = 0
    object tbtNewTemplate: TToolButton
      Left = 0
      Top = 0
      Caption = 'tbtNewTemplate'
      ImageIndex = 3
      OnClick = tbtNewTemplateClick
    end
    object tbtDummy: TToolButton
      Left = 97
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
    Top = 27
    Width = 727
    Height = 459
    Align = alClient
    Lines.Strings = (
      'No reports found')
    TabOrder = 1
  end
end
