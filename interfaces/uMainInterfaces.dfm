object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 611
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
  object btnSomar: TButton
    Left = 48
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Somar'
    TabOrder = 0
    OnClick = btnSomarClick
  end
  object btnSubtrair: TButton
    Left = 48
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Subtrair'
    TabOrder = 1
    OnClick = btnSubtrairClick
  end
  object edtValorA: TLabeledEdit
    Left = 48
    Top = 29
    Width = 121
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor A'
    TabOrder = 2
    Text = '0'
  end
  object edtValorb: TLabeledEdit
    Left = 200
    Top = 29
    Width = 97
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor B'
    NumbersOnly = True
    TabOrder = 3
    Text = '0'
  end
  object mmResults: TMemo
    Left = 418
    Top = 8
    Width = 185
    Height = 265
    TabOrder = 4
  end
  object Button1: TButton
    Left = 176
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Results'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 152
    Width = 97
    Height = 25
    Caption = 'Teste Interface'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 192
    Width = 75
    Height = 25
    Caption = 'DI'
    TabOrder = 7
    OnClick = Button3Click
  end
end
