unit TspQueryTeste;

interface

uses TestFramework, uspQuery, FireDAC.Stan.Factory;

type
  TspQueryTestes = class(TTestCase)
  private
    FspQuery: TspQuery;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGeraSQL;

  end;
  implementation
{ TspQueryTestes }

procedure TspQueryTestes.SetUp;
begin
  inherited;
  FspQuery := TspQuery.Create(Nil);
end;

procedure TspQueryTestes.TearDown;
begin
  inherited;
  FspQuery.Free;
end;

procedure TspQueryTestes.TestGeraSQL;
begin
  FspQuery.spColunas.Add('id');
  FspQuery.spColunas.Add('nome');
  FspQuery.spColunas.Add('endereco');
  FspQuery.spTabelas.Add('cliente');
  FspQuery.spCondicoes.Add('id = 123');
  FspQuery.spCondicoes.Add('nome = ''Luisandro''');
  FspQuery.GeraSQL;
  CheckEquals('select id , nome , endereco from cliente where id = 123 and nome = ''Luisandro''',FspQuery.SQL.Text);
end;

initialization
  TestFramework.RegisterTest(TspQueryTestes.Suite);

end.
