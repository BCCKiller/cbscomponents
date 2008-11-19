object KrimskyDataEntryForm: TKrimskyDataEntryForm
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'KrimskyDataEntryForm'
  ClientHeight = 401
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TButton
    Left = 0
    Top = 375
    Width = 49
    Height = 26
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 220
    Top = 375
    Width = 58
    Height = 26
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object HPanel: TPanel
    Left = 0
    Top = 0
    Width = 140
    Height = 369
    Caption = 'Horizontal'
    TabOrder = 2
    VerticalAlignment = taAlignTop
    OnClick = HPanelClick
    object HDirectionGroup: TRadioGroup
      Left = 7
      Top = 222
      Width = 122
      Height = 138
      Caption = 'Direction'
      Columns = 2
      Items.Strings = (
        'ET'
        'E(T)'
        'EP'
        'RET'
        'RE(T)'
        'REP'
        'LET'
        'LE(T)'
        'LEP'
        'XT'
        'X(T)'
        'XP'
        'RXT'
        'RX(T)'
        'RXP'
        'LXT'
        'LX(T)'
        'LXP')
      TabOrder = 0
      OnClick = HPanelClick
    end
    object HPrismGroup: TRadioGroup
      Left = 8
      Top = 16
      Width = 121
      Height = 185
      Caption = 'Prism'
      Columns = 2
      TabOrder = 1
      OnClick = HPanelClick
    end
    object HOrtho: TRadioButton
      Left = 16
      Top = 207
      Width = 50
      Height = 17
      Caption = 'Ortho'
      TabOrder = 2
      OnClick = HPanelClick
    end
  end
  object VPanel: TPanel
    Left = 146
    Top = 0
    Width = 140
    Height = 369
    Caption = 'Vertical'
    TabOrder = 3
    VerticalAlignment = taAlignTop
    OnClick = VPanelClick
    object VDirectionGroup: TRadioGroup
      Left = 8
      Top = 222
      Width = 121
      Height = 138
      Caption = 'Direction'
      Color = clBtnFace
      Columns = 2
      Items.Strings = (
        'RHT'
        'RH(T)'
        'RHP'
        'LHT'
        'LH(T)'
        'LHP'
        'RHoT'
        'RHo(T)'
        'RHoP'
        'LHoT'
        'LHo(T)'
        'LHoP')
      ParentColor = False
      TabOrder = 0
      OnClick = VPanelClick
    end
    object VPrismGroup: TRadioGroup
      Left = 8
      Top = 16
      Width = 121
      Height = 185
      Caption = 'Prism'
      Columns = 2
      TabOrder = 1
      OnClick = VPanelClick
    end
    object VOrtho: TRadioButton
      Left = 16
      Top = 207
      Width = 49
      Height = 17
      Caption = 'Ortho'
      TabOrder = 2
      OnClick = VPanelClick
    end
    object VClear: TButton
      Left = 71
      Top = 207
      Width = 45
      Height = 16
      Caption = 'Clear'
      TabOrder = 3
      OnClick = VPanelClick
    end
  end
  object CopyToBlanksButton: TButton
    Left = 59
    Top = 375
    Width = 81
    Height = 18
    Caption = 'Copy to blanks'
    ModalResult = 10
    TabOrder = 4
  end
  object HClear: TButton
    Left = 72
    Top = 207
    Width = 45
    Height = 16
    Caption = 'Clear'
    TabOrder = 5
    OnClick = HPanelClick
  end
  object CopyToAllButton: TButton
    Left = 146
    Top = 375
    Width = 68
    Height = 18
    Caption = 'Copy to all'
    ModalResult = 9
    TabOrder = 6
  end
end
