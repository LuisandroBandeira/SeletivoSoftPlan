unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfTarefas = class(TForm)
    menuPrincipal: TMainMenu;
    menuItemTarefas: TMenuItem;
    subMenuItemTarefa1: TMenuItem;
    subMenuItemTarefa2: TMenuItem;
    subMenuItemTarefa3: TMenuItem;
    procedure subMenuItemTarefa1Click(Sender: TObject);
    procedure subMenuItemTarefa2Click(Sender: TObject);
    procedure subMenuItemTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefas: TfTarefas;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TfTarefas.subMenuItemTarefa1Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa1,fTarefa1);
end;

procedure TfTarefas.subMenuItemTarefa2Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa2,fTarefa2);
end;

procedure TfTarefas.subMenuItemTarefa3Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa3,fTarefa3);
end;

end.
