unit cCadProduto;

interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCadastroProduto = class

  private
    FConexaoDB: TZConnection;
    FNome: String;
    FDescricao: String;
    FValor: Double;
    FQuantidade: Double;
    FProdutoId: Integer;
    FCategoriaId: Integer;

  public
    constructor Create(conexao: TZConnection);
    destructor Destroy; override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar(Id: Integer): Boolean;
    function Selecionar(Id: Integer): Boolean;

    property ConexaoDB: TZConnection read FConexaoDB write FConexaoDB;
    property Nome: String read FNome write FNome;
    property Descricao: String read FDescricao write FDescricao;
    property Valor: Double read FValor write FValor;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ProdutoId: Integer read FProdutoId write FProdutoId;
    property CategoriaId: Integer read FCategoriaId write FCategoriaId;
  end;

implementation

uses
  System.SysUtils;

{ TCadastroProduto }

constructor TCadastroProduto.Create(conexao: TZConnection);
begin
  FConexaoDB := conexao;
end;

destructor TCadastroProduto.Destroy;
begin

  inherited;
end;

function TCadastroProduto.Apagar(Id: Integer): Boolean;
begin
  var qryExcluirProduto := TZQuery.Create(nil);

  try
    Result := True;
    qryExcluirProduto.Connection := FConexaoDB;
    qryExcluirProduto.SQL.Clear;
    qryExcluirProduto.SQL.Add('DELETE PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID');
    qryExcluirProduto.ParamByName('PRODUTO_ID').AsInteger := Id;

    try
      qryExcluirProduto.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryExcluirProduto) then
      FreeAndNil(qryExcluirProduto);
  end;
end;

function TCadastroProduto.Atualizar: Boolean;
begin
  var qryAtualizarProduto := TZQuery.Create(nil);

  try
    Result := True;
    qryAtualizarProduto.Connection := FConexaoDB;
    qryAtualizarProduto.SQL.Clear;
    qryAtualizarProduto.SQL.Add('UPDATE PRODUTOS SET NOME = :NOME, DESCRICAO = :DESCRICAO, VALOR = :VALOR,');
    qryAtualizarProduto.SQL.Add('QUANTIDADE = :QUANTIDADE, CATEGORIA_ID = :CATEGORIA_ID');
    qryAtualizarProduto.SQL.Add('WHERE PRODUTO_ID = :PRODUTO_ID');
    qryAtualizarProduto.ParamByName('PRODUTO_ID').AsInteger := FProdutoId;
    qryAtualizarProduto.ParamByName('NOME').AsString := FNome;
    qryAtualizarProduto.ParamByName('DESCRICAO').AsString := FDescricao;
    qryAtualizarProduto.ParamByName('VALOR').AsFloat := FValor;
    qryAtualizarProduto.ParamByName('QUANTIDADE').AsFloat := FQuantidade;
    qryAtualizarProduto.ParamByName('CATEGORIA_ID').AsInteger := FCategoriaId;

    try
      qryAtualizarProduto.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryAtualizarProduto) then
      FreeAndNil(qryAtualizarProduto);
  end;
end;

function TCadastroProduto.Inserir: Boolean;
begin
  var qryInserirProduto := TZQuery.Create(nil);

  try
    Result := True;
    qryInserirProduto.Connection := FConexaoDB;
    qryInserirProduto.SQL.Clear;
    qryInserirProduto.SQL.Add('INSERT INTO PRODUTOS(NOME,DESCRICAO,VALOR, QUANTIDADE,CATEGORIA_ID)');
    qryInserirProduto.SQL.Add('VALUES(:NOME,:DESCRICAO,:VALOR, :QUANTIDADE,:CATEGORIA_ID)');
    qryInserirProduto.ParamByName('NOME').AsString := FNome;
    qryInserirProduto.ParamByName('DESCRICAO').AsString := FDescricao;
    qryInserirProduto.ParamByName('VALOR').AsFloat := FValor;
    qryInserirProduto.ParamByName('QUANTIDADE').AsFloat := FQuantidade;
    qryInserirProduto.ParamByName('CATEGORIA_ID').AsInteger := FCategoriaId;

    try
      qryInserirProduto.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryInserirProduto) then
      FreeAndNil(qryInserirProduto);
  end;
end;

function TCadastroProduto.Selecionar(Id: Integer): Boolean;
begin
  var tblProduto := TZQuery.Create(nil);

  try
    Result := True;
    tblProduto.Connection := FConexaoDB;
    tblProduto.SQL.Clear;
    tblProduto.SQL.Add('SELECT * FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID');
    tblProduto.ParamByName('PRODUTO_ID').AsInteger := Id;

    try
      tblProduto.Open;

      FProdutoId := tblProduto.FieldByName('PRODUTO_ID').AsInteger;
      FNome := tblProduto.FieldByName('NOME').AsString;
      FDescricao := tblProduto.FieldByName('DESCRICAO').AsString;
      FValor := tblProduto.FieldByName('VALOR').AsFloat;
      FQuantidade := tblProduto.FieldByName('QUANTIDADE').AsFloat;
      FCategoriaId := tblProduto.FieldByName('CATEGORIA_ID').AsInteger;

    except
      Result := False;
    end;

  finally
    if Assigned(tblProduto) then
      FreeAndNil(tblProduto);
  end;
end;

end.
