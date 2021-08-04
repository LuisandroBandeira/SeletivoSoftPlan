unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    btnGeraSQL: TButton;
    memoSqlGerado: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSqlGerado: TLabel;
    spQuery: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    /// <summary>
    /// <para>Método: BloqueiaTeclaEspaco</para>
    /// <para>Descrição: Bloqueia o uso da tecla espaço.</para>
    /// </summary>
    /// <param name="Sender: TObject"></param>
    /// <param name="Key: Char"></param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure BloqueiaTeclaEspaco(Sender: TObject; var Key: Char);
    /// <summary>
    /// <para>Método: removeLinhasEmBranco</para>
    /// <para>Descrição: Remove as linhas em branco de um TMemo.</para>
    /// </summary>
    /// <param name="Sender: TObject">TMemo</param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure removeLinhasEmBranco(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    /// <para>Método: CarregaPropriedadesListaSQL</para>
    /// <para>Descrição: Carrega propriedade do tipo TStringList do componente spQuery(TspQuery) com o conteúdo do componente(TMemo) informados nos parâmetros.</para>
    /// </summary>
    /// <param name="aListaSql: TStringList">propriedade do tipo TStringList do componente spQuery(TspQuery)</param>
    /// <param name="aCampoMemo: TMemo">componente(TMemo)</param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure CarregaPropriedadesListaSQL(aListaSql : TStringList; aCampoMemo : TMemo);
    /// <summary>
    /// <para>Método: GeraSQL</para>
    /// <para>Descrição: </para>
    /// <para> - Carrega as propriedades do tipo TStringList do componente spQuery(TspQuery)</para>
    /// <para> - Executa comando GeraSQL do componente spQuery(TspQuery)</para>
    /// <para> - Atribuí ao campo memoSqlGerado.Lines a propriedade SQL do componente spQuery(TspQuery).</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure GeraSQL;

  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.BloqueiaTeclaEspaco(Sender: TObject; var Key: Char);
begin
  if Key = #32 then
    Key:=#0;
end;

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  GeraSQL;
end;

procedure TfTarefa1.carregaPropriedadesListaSQL(aListaSql: TStringList; aCampoMemo: TMemo);
var
  item : string;
begin
  for item in aCampoMemo.Lines do
  begin
   aListaSql.Add(item);
  end;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTarefa1.Free;
end;

procedure TfTarefa1.GeraSQL;
begin
  spQuery.LimpaPropriedadesSP;
  CarregaPropriedadesListaSQL(spQuery.spColunas,memoColunas);
  CarregaPropriedadesListaSQL(spQuery.spTabelas,memoTabelas);
  CarregaPropriedadesListaSQL(spQuery.spCondicoes,memoCondicoes);
  spQuery.GeraSQL;
  memoSqlGerado.Lines := spQuery.SQL
end;

procedure TfTarefa1.removeLinhasEmBranco(Sender: TObject);
var
 mItem : String;
 mIndex : Integer;
 mCampoMemo : TMemo;
begin
  mCampoMemo := TMemo(Sender);
  for mItem in mCampoMemo.Lines do
  begin
     if Trim(mItem) = EmptyStr then
     begin
        mIndex := mCampoMemo.Lines.IndexOf(mItem);
        mCampoMemo.Lines.Delete(mIndex)
     end;
  end;
end;

end.
