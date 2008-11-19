object PickPrintLayoutForm: TPickPrintLayoutForm
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Pick a Print Layout'
  ClientHeight = 72
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object LayoutChoices: TRadioGroup
    Left = 0
    Top = 0
    Width = 137
    Height = 72
    Align = alLeft
    Caption = 'Click choice below'
    TabOrder = 0
  end
  object ChooseButton: TButton
    Left = 144
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Select'
    Default = True
    TabOrder = 1
    OnClick = ChooseButtonClick
  end
  object CancelButton: TButton
    Left = 144
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
