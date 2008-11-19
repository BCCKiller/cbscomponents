object TabAdjustForm: TTabAdjustForm
  Left = 0
  Top = 0
  Width = 308
  Height = 313
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Delete Tabs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TabList: TJvCheckListBox
    Left = 16
    Top = 16
    Width = 145
    Height = 249
    ItemHeight = 13
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 184
    Top = 16
    Width = 75
    Height = 57
    Caption = 'Cancel without changes'
    Default = True
    TabOrder = 1
    WordWrap = True
    OnClick = CancelButtonClick
  end
  object ChangeButton: TButton
    Left = 184
    Top = 80
    Width = 75
    Height = 41
    Cancel = True
    Caption = 'Make Changes'
    TabOrder = 2
    WordWrap = True
    OnClick = ChangeButtonClick
  end
  object AffectGroup: TRadioGroup
    Left = 168
    Top = 128
    Width = 113
    Height = 81
    Caption = 'Deletes  Affect'
    ItemIndex = 0
    Items.Strings = (
      'This Layout Only'
      'All Layouts')
    TabOrder = 3
  end
end
