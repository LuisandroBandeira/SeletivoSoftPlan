object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 359
  ClientWidth = 733
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblValoresProjeto: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 727
    Height = 13
    Align = alTop
    Caption = 'Valores por projeto:'
    ExplicitWidth = 96
  end
  object gradeProjetos: TDBGrid
    Left = 0
    Top = 19
    Width = 733
    Height = 221
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlRodaPe: TPanel
    Left = 0
    Top = 240
    Width = 733
    Height = 119
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblTotal: TLabel
      Left = 609
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lblTotalDivisoes: TLabel
      Left = 609
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Total divis'#245'es R$'
    end
    object edtTotal: TEdit
      Left = 609
      Top = 24
      Width = 121
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
    object edtTotalDivisoes: TEdit
      Left = 609
      Top = 73
      Width = 121
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 1
    end
    object btTotal: TButton
      Left = 521
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Obter Total'
      TabOrder = 2
      OnClick = btTotalClick
    end
    object btTotalDivisoes: TButton
      Left = 489
      Top = 73
      Width = 107
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 3
      OnClick = btTotalDivisoesClick
    end
  end
end
