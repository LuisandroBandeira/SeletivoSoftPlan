unit uProgresso;

interface

uses Vcl.ComCtrls, Classes;

type
  TProgresso = class(TThread)

    FBarraDeProgresso: TProgressBar;
    FContagem: Integer;
    FTempoEspera : Integer;
    /// <summary>
    /// <para>Método: Contagem</para>
    /// <para>Descrição: Realiza a contagem da barra de progresso e controla quando a thread sera encerrada.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure Contagem;
    /// <summary>
    /// <para>Método: Execute</para>
    /// <para>Descrição: Executa a thread que controla o progresso da barra de progresso.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure Execute; override;
    /// <summary>
    /// <para>Método: InicializaExecucao</para>
    /// <para>Descrição: Inicializa a execução da Thread</para>
    /// </summary>
    /// <param name="aBarraDeProgresso: TProgressBar">Barra de progresso</param>
    /// <param name="aTempoEspera: Integer">Tempo de espera entre cada interação da contagem.</param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    constructor InicializaExecucao(const aBarraDeProgresso: TProgressBar; aTempoEspera : Integer);
  end;

implementation

{ TProgresso }

procedure TProgresso.Contagem;
begin
  Inc(fContagem);
  fBarraDeProgresso.Position := fContagem;
  if fContagem = 100 then
    Terminate;
end;

procedure TProgresso.Execute;
begin
  while not Terminated do
  begin
    Synchronize(Contagem);
    Sleep(FTempoEspera);
  end;
end;

constructor TProgresso.InicializaExecucao(const aBarraDeProgresso: TProgressBar; aTempoEspera : Integer);
begin
  Create(False);
  FBarraDeProgresso := aBarraDeProgresso;
  FTempoEspera      := aTempoEspera;
  FreeOnTerminate   := True;
  FContagem         := 0;
end;

end.
