unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.Math;

type
  TfTarefa3 = class(TForm)
    gradeProjetos: TDBGrid;
    pnlRodaPe: TPanel;
    lblValoresProjeto: TLabel;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    btTotal: TButton;
    btTotalDivisoes: TButton;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btTotalClick(Sender: TObject);
    procedure btTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FClientProjetos : TClientDataSet;
    FDsProjetos : TDataSource;
    /// <summary>
    /// <para>Método: preparaGrade</para>
    /// <para>Descrição: Prepara grade de daodos do projetos para uso.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure preparaGrade;
    /// <summary>
    /// <para>Método: criaComponentesDados</para>
    /// <para>Descrição: Cria os componentes FClientProjetos(TClientDataSet) e FDsProjetos(TDataSource).</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure criaComponentesDados;
    /// <summary>
    /// <para>Método: destruirComponentesDados</para>
    /// <para>Descrição: Libera da memória os componentes FClientProjetos(TClientDataSet) e FDsProjetos(TDataSource).</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure destruirComponentesDados;
    /// <summary>
    /// <para>Método: criaColunasDataSet</para>
    /// <para>Descrição: Cria as colunas IdProjeto, NomeProjeto e Valor no Dataset dos Projetos.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure criaColunasDataSet;
    /// <summary>
    /// <para>Método: carregaValoresProjetos</para>
    /// <para>Descrição: Preenche dataset dos projetos com 10 registros de projetos.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure carregaValoresProjetos;
    /// <summary>
    /// <para>Método: pegaValorAleatorio</para>
    /// <para>Descrição: Gera um valor aletório numérico de ponto flutuante entre 1,00 e 1.000,99.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Double : Valor aletório numérico de ponto flutuante entre 1,00 e 1.000,99</returns>
    function pegaValorAleatorio : Double;
    /// <summary>
    /// <para>Método: somaTotal</para>
    /// <para>Descrição: Executa a soma do total dos valores dos projetos.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Double : Total da soma dos valores dos projetos.</returns>
    function somaTotal : Double;
    /// <summary>
    /// <para>Método: somaTotalDivisoes</para>
    /// <para>Descrição: Executa a soma do resultado das divisões dos valores dos projetos.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Double : Total da soma das diviões valores dos projetos.</returns>
    function somaTotalDivisoes : Double;
    /// <summary>
    /// <para>Método: divisao</para>
    /// <para>Descrição: Executa a divisão entre dois valores </para>
    /// </summary>
    /// <param name="aValorAnterior: Double">Valor do projeto anterior.</param>
    /// <param name="aValorSeguinte: Double">Valor do projeto seguinte.</param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Double : resultado = aValorSeguinte / aValorAnterior</returns>
    function divisao(aValorAnterior, aValorSeguinte : Double) : Double;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btTotalClick(Sender: TObject);
begin
  edtTotal.Text := FloatToStr(somaTotal);
end;

procedure TfTarefa3.btTotalDivisoesClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := FloatToStr(somaTotalDivisoes);
end;

procedure TfTarefa3.carregaValoresProjetos;
var
  i : Integer;
begin
   for I := 1 to 10 do
     FClientProjetos.InsertRecord([i, 'Projeto '+IntToStr(i), pegaValorAleatorio]);
end;

procedure TfTarefa3.criaColunasDataSet;
begin
  with FClientProjetos.FieldDefs do
  begin
    Clear;
    Add('IdProjeto',ftInteger, 0, True);
    Add('NomeProjeto',ftString, 85, True);
    Add('Valor',ftCurrency, 0, True);
  end;
  FClientProjetos.CreateDataSet;
end;

procedure TfTarefa3.criaComponentesDados;
begin
  FClientProjetos := TClientDataSet.Create(Nil);
  FDsProjetos := TDataSource.Create(Nil);
  FDsProjetos.DataSet := FClientProjetos;
  criaColunasDataSet;
end;

procedure TfTarefa3.destruirComponentesDados;
begin
   FClientProjetos.Free;
   FDsProjetos.Free;
end;

function TfTarefa3.divisao(aValorAnterior, aValorSeguinte: Double): Double;
begin
  try
    Result := aValorSeguinte / aValorAnterior;
  except
    on e: Exception do
    begin
      raise Exception.Create(e.message);
    end;
  end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  destruirComponentesDados;
  fTarefa3.Free;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
 preparaGrade;
end;

function TfTarefa3.pegaValorAleatorio: Double;
begin
  result := StrToFloat(IntToStr(RandomRange(1, 1000)) + ',' + IntToStr(RandomRange(0, 99)));
end;

procedure TfTarefa3.preparaGrade;
begin
  criaComponentesDados;
  carregaValoresProjetos;
  gradeProjetos.DataSource := FDsProjetos;
end;

function TfTarefa3.somaTotal: Double;
var
  mSoma : Double;
begin
   mSoma := 0;

   FClientProjetos.First;
   FClientProjetos.DisableControls;

   while not FClientProjetos.eof do
   begin
     mSoma := mSoma + FClientProjetos.FieldByName('Valor').AsFloat;
     FClientProjetos.Next;
   end;

   FClientProjetos.First;
   FClientProjetos.EnableControls;

   Result := mSoma;
end;

function TfTarefa3.somaTotalDivisoes: Double;
var
  mSomaDivisoes : Double;
  mValorAnterior : Double;
  mValorSeguinte : Double;
begin
  mSomaDivisoes := 0;

  FClientProjetos.First;
  FClientProjetos.DisableControls;

  while not FClientProjetos.eof do
  begin
   mValorAnterior := FClientProjetos.FieldByName('Valor').AsFloat;
   FClientProjetos.Next;
   if (not FClientProjetos.eof) and (mValorAnterior > 0)then
   begin
     mValorSeguinte := FClientProjetos.FieldByName('Valor').AsFloat;
     mSomaDivisoes := mSomaDivisoes + divisao(mValorAnterior,mValorSeguinte);
   end;
  end;

  FClientProjetos.First;
  FClientProjetos.EnableControls;

  Result := mSomaDivisoes;

end;

end.
