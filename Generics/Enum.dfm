object FrmEnum: TFrmEnum
  Left = 0
  Top = 0
  Caption = 'Enum'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 120
    Top = 111
    Width = 156
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object Button1: TButton
    Left = 120
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Mes'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 201
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Dia'
    TabOrder = 2
    OnClick = Button2Click
  end
end
