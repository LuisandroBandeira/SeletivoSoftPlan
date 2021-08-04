object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 171
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblProgresso1: TLabel
    Left = 184
    Top = 21
    Width = 63
    Height = 13
    Caption = 'Progresso 01'
  end
  object lblProgresso2: TLabel
    Left = 184
    Top = 80
    Width = 63
    Height = 13
    Caption = 'Progresso 02'
  end
  object lblTempoEspera2: TLabel
    Left = 8
    Top = 80
    Width = 154
    Height = 13
    Caption = 'Tempo de espera (Milisegundos)'
  end
  object lblTempoEspera1: TLabel
    Left = 8
    Top = 21
    Width = 154
    Height = 13
    Caption = 'Tempo de espera (Milisegundos)'
  end
  object Progresso1: TProgressBar
    Left = 184
    Top = 40
    Width = 475
    Height = 21
    TabOrder = 0
  end
  object Progresso2: TProgressBar
    Left = 184
    Top = 99
    Width = 475
    Height = 21
    TabOrder = 1
  end
  object edtTempoEsperaProgresso1: TEdit
    Left = 8
    Top = 40
    Width = 154
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '2000'
  end
  object edtTempoEsperaProgresso2: TEdit
    Left = 8
    Top = 99
    Width = 154
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '1000'
  end
  object btExecutaThread: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 4
    OnClick = btExecutaThreadClick
  end
end
