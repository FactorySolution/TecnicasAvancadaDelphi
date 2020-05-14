object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 517
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
  object lblTotal: TLabel
    Left = 24
    Top = 136
    Width = 47
    Height = 19
    Caption = 'Total: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtTexto: TLabeledEdit
    Left = 24
    Top = 96
    Width = 153
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Texto'
    TabOrder = 0
  end
  object mmEvento: TMemo
    Left = 324
    Top = 8
    Width = 185
    Height = 241
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MyComponent: TMyComponent
    OtherName = 'Say My Name'
    Left = 48
    Top = 32
  end
end
