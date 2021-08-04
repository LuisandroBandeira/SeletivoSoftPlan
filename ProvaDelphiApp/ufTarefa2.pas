unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type

  TfTarefa2 = class(TForm)
    Progresso1: TProgressBar;
    lblProgresso1: TLabel;
    lblProgresso2: TLabel;
    Progresso2: TProgressBar;
    edtTempoEsperaProgresso1: TEdit;
    edtTempoEsperaProgresso2: TEdit;
    lblTempoEspera2: TLabel;
    lblTempoEspera1: TLabel;
    btExecutaThread: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExecutaThreadClick(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    /// <para>Método: ExecutarThreadProgressos</para>
    /// <para>Descrição: Executa as Threads que controlam a barras de progresso da tela.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure ExecutarThreadProgressos;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  uProgresso;

{$R *.dfm}

procedure TfTarefa2.btExecutaThreadClick(Sender: TObject);
begin
  ExecutarThreadProgressos;
end;

procedure TfTarefa2.ExecutarThreadProgressos;
begin
  TProgresso.InicializaExecucao(Progresso1,StrToInt(edtTempoEsperaProgresso1.Text));
  TProgresso.InicializaExecucao(Progresso2,StrToInt(edtTempoEsperaProgresso2.Text));
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTarefa2.Free;
end;

end.
