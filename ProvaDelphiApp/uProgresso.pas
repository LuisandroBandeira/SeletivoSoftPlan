unit uProgresso;

interface

uses Vcl.ComCtrls, Classes;

type
  TProgresso = class(TThread)

    FBarraDeProgresso: TProgressBar;
    FContagem: Integer;
    FTempoEspera : Integer;
    /// <summary>
    /// <para>M�todo: Contagem</para>
    /// <para>Descri��o: Realiza a contagem da barra de progresso e controla quando a thread sera encerrada.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure Contagem;
    /// <summary>
    /// <para>M�todo: Execute</para>
    /// <para>Descri��o: Executa a thread que controla o progresso da barra de progresso.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure Execute; override;
    /// <summary>
    /// <para>M�todo: InicializaExecucao</para>
    /// <para>Descri��o: Inicializa a execu��o da Thread</para>
    /// </summary>
    /// <param name="aBarraDeProgresso: TProgressBar">Barra de progresso</param>
    /// <param name="aTempoEspera: Integer">Tempo de espera entre cada intera��o da contagem.</param>
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
