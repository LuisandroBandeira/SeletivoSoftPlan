object fTarefas: TfTarefas
  Left = 0
  Top = 0
  Caption = 'ProvaDelphiApp - Luisandro N. Bandeira'
  ClientHeight = 512
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = menuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object menuPrincipal: TMainMenu
    Left = 192
    Top = 8
    object menuItemTarefas: TMenuItem
      Caption = 'Tarefas'
      object subMenuItemTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = subMenuItemTarefa1Click
      end
      object subMenuItemTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = subMenuItemTarefa2Click
      end
      object subMenuItemTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = subMenuItemTarefa3Click
      end
    end
  end
end
