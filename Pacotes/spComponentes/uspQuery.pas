unit uspQuery;

interface

uses
 SysUtils, Classes, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet,FireDAC.Phys.FB;

type
 TspQuery = class(TFDQuery)
 private
    FSpColunas : TStringList;
    FSpTabelas : TStringList;
    FSpCondicoes : TStringList;
    /// <summary>
    /// <para>Método: MontaParteSQL</para>
    /// <para>Descrição: Monta parte do SQL de acordo com o separador e a lista informados.</para>
    /// </summary>
    /// <param name="aLista: TstringList"></param>
    /// <param name="aSeparador: String"></param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    function MontaParteSQL(aLista : TstringList; aSeparador : String = '') : String;
    /// <summary>
    /// <para>Método: verificaPropriedadesSP</para>
    /// <para>Descrição: Verifica se as propriedades spColunas, spTabelas e spCondicoes estão preenchidas corretamente.</para>
    /// <para>Caso algumas propriedades não esteja correta será gerada uma mensagem de erro(Execption).</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure verificaPropriedadesSP;
 public
    /// <summary>
    /// <para>Método: GeraSQL</para>
    /// <para>Descrição: Atribuí ao valor da propriedade TspQuery.SQL o SQL gerado com base nos valores das propriedades spColunas, spTabelas e spCondicoes.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure GeraSQL;
    /// <summary>
    /// <para>Método: LimpaPropriedadesSP</para>
    /// <para>Descrição: Limpa as propriedades spColunas, spTabelas e spCondicoes.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 04/08/2021        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure LimpaPropriedadesSP;
    constructor Create(AOwner : TComponent); overload; override;
    destructor Destroy; override;
 published
    property spColunas: TStringList read FSpColunas write FSpColunas;
    property spTabelas: TStringList read FSpTabelas write FSpTabelas;
    property spCondicoes: TStringList read FSpCondicoes write FSpCondicoes;
 end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSpColunas := TStringList.Create;
  FSpTabelas := TStringList.Create;
  FSpCondicoes := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  LimpaPropriedadesSP;

  FSpColunas.Free;
  FSpTabelas.Free;
  FSpCondicoes.Free;

  inherited;
end;

procedure TspQuery.GeraSQL;
const
  _SQL = 'select %s from %s %s';
var
  mColunas : String;
  mCondicoes : String;
begin
 try
    verificaPropriedadesSP;

    mColunas := MontaParteSQL(FSpColunas,',');

    if spCondicoes.Count > 0 then
      mCondicoes := 'where ' + MontaParteSQL(FSpCondicoes)
    else
      mCondicoes := EmptyStr;

    Self.SQL.Text := Format(_SQL, [mColunas,FSpTabelas.Strings[0],mCondicoes]);

 Except
    on e: Exception do
    begin
      raise Exception.Create(e.message);
    end;
  end;
end;

procedure TspQuery.LimpaPropriedadesSP;
begin
    FSpColunas.Clear;
    FSpTabelas.Clear;
    FSpCondicoes.Clear;
end;

function TspQuery.MontaParteSQL(aLista: TstringList; aSeparador: String): String;
var
  mItem : String;
  mConjunto : string;
begin
    for mItem in aLista do
    begin
       if aLista.IndexOf(mItem) > 0 then
        mConjunto := mConjunto + ' ' + aSeparador + ' '+ mItem
       else
        mConjunto := mItem;
    end;
    Result := mConjunto;
end;

procedure TspQuery.verificaPropriedadesSP;
begin
  if FSpColunas.Text = EmptyStr then
    raise Exception.Create('Propriedade Colunas não contém dados!');

  if spTabelas.Text = EmptyStr then
    raise Exception.Create('Propriedade Tabelas não contém dados!');

  if spTabelas.Count > 1 then
    raise Exception.Create('É permitido informar apenas uma tabela!');
end;

end.
