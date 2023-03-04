unit cCadCategoria;

interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCategoria = class

  private
    FCategoriaId: Integer;
    FDescricao: String;
    FConexaoDB: TZConnection;
  public
    constructor Create(conexao: TZConnection);
    destructor Destroy; override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar(Id: Integer): Boolean;
    function Selecionar(Id: Integer): Boolean;

    property CategoriaId: Integer read FCategoriaId write FCategoriaId;
    property Descricao: String read FDescricao write FDescricao;
    property ConexaoDB: TZConnection read FConexaoDB write FConexaoDB;
  end;

implementation

uses
  System.SysUtils;

{ TCategoria }

function TCategoria.Apagar(Id: Integer): Boolean;
begin
  var qryExcluirCategoria := TZQuery.Create(nil);

  try
    Result := True;
    qryExcluirCategoria.Connection := FConexaoDB;
    qryExcluirCategoria.SQL.Clear;
    qryExcluirCategoria.SQL.Add('DELETE CATEGORIAS WHERE CATEGORIA_ID = :CATEGORIA_ID');
    qryExcluirCategoria.ParamByName('CATEGORIA_ID').AsInteger := Id;

    try
      qryExcluirCategoria.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryExcluirCategoria) then
      FreeAndNil(qryExcluirCategoria);
  end;
end;

function TCategoria.Atualizar: Boolean;
begin
  var qryAtualizarCategoria := TZQuery.Create(nil);

  try
    Result := True;
    qryAtualizarCategoria.Connection := FConexaoDB;
    qryAtualizarCategoria.SQL.Clear;
    qryAtualizarCategoria.SQL.Add('UPDATE CATEGORIAS SET DESCRICAO = :DESCRICAO WHERE CATEGORIA_ID = :CATEGORIA_ID');
    qryAtualizarCategoria.ParamByName('DESCRICAO').AsString := FDescricao;
    qryAtualizarCategoria.ParamByName('CATEGORIA_ID').AsInteger := FCategoriaId;

    try
      qryAtualizarCategoria.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryAtualizarCategoria) then
      FreeAndNil(qryAtualizarCategoria);
  end;
end;

function TCategoria.Inserir: Boolean;
begin
  var qryInserirCategoria := TZQuery.Create(nil);

  try
    Result := True;
    qryInserirCategoria.Connection := FConexaoDB;
    qryInserirCategoria.SQL.Clear;
    qryInserirCategoria.SQL.Add('INSERT INTO CATEGORIAS(DESCRICAO) VALUES(:DESCRICAO)');
    qryInserirCategoria.ParamByName('DESCRICAO').AsString := FDescricao;

    try
      qryInserirCategoria.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryInserirCategoria) then
      FreeAndNil(qryInserirCategoria);
  end;
end;

function TCategoria.Selecionar(Id: Integer): Boolean;
begin
  var tblCategorias := TZQuery.Create(nil);

  try
    Result := True;
    tblCategorias.Connection := FConexaoDB;
    tblCategorias.SQL.Clear;
    tblCategorias.SQL.Add('SELECT CATEGORIA_ID, DESCRICAO FROM CATEGORIAS WHERE CATEGORIA_ID = :CATEGORIA_ID');
    tblCategorias.ParamByName('CATEGORIA_ID').AsInteger := Id;

    try
      tblCategorias.Open;

      FDescricao := tblCategorias.FieldByName('DESCRICAO').AsString;
      FCategoriaId := tblCategorias.FieldByName('CATEGORIA_ID').AsInteger;
    except
      Result := False;
    end;

  finally
    if Assigned(tblCategorias) then
      FreeAndNil(tblCategorias);
  end;
end;

constructor TCategoria.Create(conexao: TZConnection);
begin
  FConexaoDB := conexao;
end;

destructor TCategoria.Destroy;
begin

end;

end.
