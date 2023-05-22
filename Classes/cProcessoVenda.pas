unit cProcessoVenda;

interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TProcessoVenda = class
  private
    FConexaoDB: TZConnection;
    FVendaId: Integer;
    FClienteId: Integer;
    FDataVenda: TDateTime;
    FTotalVenda: Double;


  public
    constructor Create(conexao: TZConnection);
    destructor Destroy; override;

    function Inserir(clientDataSet: TClientDataSet): Boolean;
    function InserirItens(clientDataSet: TClientDataSet; idVenda: Integer): Boolean;
    function Atualizar(clientDataSet: TClientDataSet): Boolean;
    function Apagar(Id: Integer): Boolean;
    function ApagarItens(clientDataSet: TClientDataSet): Boolean;
    function Selecionar(Id: Integer; var clientDataSet: TClientDataSet): Boolean;
    function InNot(clientDataSet: TClientDataSet): String;

    property ConexaoDB: TZConnection read FConexaoDB write FConexaoDB;
    property VendaId: Integer read FVendaId write FVendaId;
    property ClienteId: Integer read FClienteId write FClienteId;
    property DataVenda: TDateTime read FDataVenda write FDataVenda;
    property TotalVenda: Double read FTotalVenda write FTotalVenda;
  end;

implementation

uses
  System.SysUtils;

{ TCadastroCliente }

function TProcessoVenda.Apagar(Id: Integer): Boolean;
begin
  var qryExcluirVenda := TZQuery.Create(nil);

  try
    Result := True;
    ConexaoDB.StartTransaction;
    qryExcluirVenda.Connection := FConexaoDB;
    qryExcluirVenda.SQL.Clear;
    qryExcluirVenda.SQL.Add('DELETE VENDAS_ITENS WHERE VENDA_ID = :VENDA_ID');
    qryExcluirVenda.SQL.Add('DELETE VENDAS WHERE VENDA_ID = :VENDA_ID');
    qryExcluirVenda.ParamByName('VENDA_ID').AsInteger := Id;

    try
      qryExcluirVenda.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result := False;
    end;

  finally
    if Assigned(qryExcluirVenda) then
      FreeAndNil(qryExcluirVenda);
  end;
end;

function TProcessoVenda.ApagarItens(clientDataSet: TClientDataSet): Boolean;
begin
  var qryApagarItemVenda := TZQuery.Create(nil);

  try
    Result := True;
    qryApagarItemVenda.Connection := FConexaoDB;
    qryApagarItemVenda.SQL.Clear;
    qryApagarItemVenda.SQL.Add('DELETE VENDAS_ITENS WHERE VENDA_ID = :VENDA_ID AND PRODUTO_ID NOT IN ('+InNot(clientDataSet)+')');
    qryApagarItemVenda.ParamByName('VENDA_ID').AsInteger := FVendaId;

    try
      qryApagarItemVenda.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryApagarItemVenda) then
      FreeAndNil(qryApagarItemVenda);
  end;
end;

function TProcessoVenda.Atualizar(clientDataSet: TClientDataSet): Boolean;
begin
  var qryAtualizarVenda := TZQuery.Create(nil);

  try
    Result := True;
    FConexaoDB.StartTransaction;
    qryAtualizarVenda.Connection := FConexaoDB;
    qryAtualizarVenda.SQL.Clear;
    qryAtualizarVenda.SQL.Add('UPDATE VENDAS SET CLIENTE_ID = :CLIENTE_ID, DATA_VENDA = :DATA_VENDA, TOTAL_VENDA = :TOTAL_VENDA');
    qryAtualizarVenda.SQL.Add('WHERE VENDA_ID = :VENDA_ID');
    qryAtualizarVenda.ParamByName('VENDA_ID').AsInteger := FVendaId;
    qryAtualizarVenda.ParamByName('CLIENTE_ID').AsInteger := FClienteId;
    qryAtualizarVenda.ParamByName('DATA_VENDA').AsDateTime := FDataVenda;
    qryAtualizarVenda.ParamByName('TOTAL_VENDA').AsFloat := FTotalVenda;

    try
      qryAtualizarVenda.ExecSQL;
      ApagarItens(clientDataSet);

      clientDataSet.First;
      while not clientDataSet.Eof do
      begin

        clientDataSet.Next;
      end;

    except
      FConexaoDB.Rollback;
      Result := False;
    end;

    FConexaoDB.Commit;

  finally
    if Assigned(qryAtualizarVenda) then
      FreeAndNil(qryAtualizarVenda);
  end;
end;

function TProcessoVenda.InNot(clientDataSet: TClientDataSet): String;
begin
  Result := EmptyStr;
  clientDataSet.First;
  while not clientDataSet.Eof do
  begin
    if Result = EmptyStr then
      Result := clientDataSet.FieldByName('PRODUTO_ID').AsString
    else
      Result := Result + ', ' + clientDataSet.FieldByName('PRODUTO_ID').AsString;

    clientDataSet.Next;
  end;
end;

function TProcessoVenda.Inserir(clientDataSet: TClientDataSet): Boolean;
begin
  var qryInserirVenda := TZQuery.Create(nil);

  try
    Result := True;
    ConexaoDB.StartTransaction;
    qryInserirVenda.Connection := FConexaoDB;
    qryInserirVenda.SQL.Clear;
    qryInserirVenda.SQL.Add('INSERT INTO VENDAS(CLIENTE_ID, DATA_VENDA, TOTAL_VENDA)');
    qryInserirVenda.SQL.Add('VALUES(:CLIENTE_ID, :DATA_VENDA, :TOTAL_VENDA)');
    qryInserirVenda.ParamByName('CLIENTE_ID').AsInteger := FClienteId;
    qryInserirVenda.ParamByName('DATA_VENDA').AsDateTime := FDataVenda;
    qryInserirVenda.ParamByName('TOTAL_VENDA').AsFloat := FTotalVenda;

    try
      qryInserirVenda.ExecSQL;
      qryInserirVenda.SQL.Clear;
      qryInserirVenda.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      qryInserirVenda.Open;

      var idVendaGerado := qryInserirVenda.FieldByName('ID').AsInteger;
      clientDataSet.First;
      while not clientDataSet.Eof do
      begin
        InserirItens(clientDataSet, idVendaGerado);
        clientDataSet.Next;
      end;

      ConexaoDB.Commit;

    except
      ConexaoDB.Rollback;
      Result := False;
    end;

  finally
    if Assigned(qryInserirVenda) then
      FreeAndNil(qryInserirVenda);
  end;
end;

function TProcessoVenda.InserirItens(clientDataSet: TClientDataSet;
  idVenda: Integer): Boolean;
begin
  var qryInserirItemVenda := TZQuery.Create(nil);

  try
    Result := True;
    qryInserirItemVenda.Connection := FConexaoDB;
    qryInserirItemVenda.SQL.Clear;
    qryInserirItemVenda.SQL.Add('INSERT INTO VENDAS_ITENS(VENDA_ID, PRODUTO_ID, VALOR_UNITARIO, QUANTIDADE, TOTAL_PRODUTO)');
    qryInserirItemVenda.SQL.Add('VALUES(:VENDA_ID, :PRODUTO_ID, :VALOR_UNITARIO, :QUANTIDADE, :TOTAL_PRODUTO)');
    qryInserirItemVenda.ParamByName('VENDA_ID').AsInteger := idVenda;
    qryInserirItemVenda.ParamByName('PRODUTO_ID').AsInteger := clientDataSet.FieldByName('PRODUTO_ID').AsInteger;
    qryInserirItemVenda.ParamByName('VALOR_UNITARIO').AsFloat := clientDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
    qryInserirItemVenda.ParamByName('QUANTIDADE').AsFloat := clientDataSet.FieldByName('QUANTIDADE').AsFloat;
    qryInserirItemVenda.ParamByName('TOTAL_PRODUTO').AsFloat := clientDataSet.FieldByName('VALOR_TOTAL').AsFloat;

    try
      qryInserirItemVenda.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryInserirItemVenda) then
      FreeAndNil(qryInserirItemVenda);
  end;
end;

function TProcessoVenda.Selecionar(Id: Integer; var clientDataSet: TClientDataSet): Boolean;
begin
  var tblVendas := TZQuery.Create(nil);

  try
    Result := True;
    tblVendas.Connection := FConexaoDB;
    tblVendas.SQL.Clear;
    tblVendas.SQL.Add('SELECT * FROM VENDAS WHERE VENDA_ID = :VENDA_ID');
    tblVendas.ParamByName('VENDA_ID').AsInteger := Id;

    try
      tblVendas.Open;

      FVendaId := tblVendas.FieldByName('VENDA_ID').AsInteger;
      FClienteId := tblVendas.FieldByName('CLIENTE_ID').AsInteger;
      FDataVenda := tblVendas.FieldByName('DATA_VENDA').AsDateTime;
      FTotalVenda := tblVendas.FieldByName('TOTAL_VENDA').AsFloat;


      clientDataSet.First;
      while not clientDataSet.Eof do
      begin
        clientDataSet.Delete;
        clientDataSet.Next;
      end;

      tblVendas.Close;
      tblVendas.SQL.Clear;
      tblVendas.SQL.Add('SELECT VENDAS_ITENS.*, PRODUTOS.NOME FROM VENDAS_ITENS');
      tblVendas.SQL.Add('INNER JOIN PRODUTOS ON PRODUTOS.PRODUTO_ID = VENDAS_ITENS.PRODUTO_ID');
      tblVendas.SQL.Add('WHERE VENDA_ID = :VENDA_ID');
      tblVendas.ParamByName('VENDA_ID').AsInteger := FVendaId;
      tblVendas.Open;

      tblVendas.First;
      while not tblVendas.Eof do
      begin
        clientDataSet.Append;
        clientDataSet.FieldByName('PRODUTO_ID').AsInteger := tblVendas.FieldByName('PRODUTO_ID').AsInteger;
        clientDataSet.FieldByName('NOME_PRODUTO').AsString := tblVendas.FieldByName('NOME_PRODUTO').AsString;
        clientDataSet.FieldByName('QUANTIDADE').AsFloat := tblVendas.FieldByName('QUANTIDADE').AsFloat;
        clientDataSet.FieldByName('VALOR_UNITARIO').AsFloat := tblVendas.FieldByName('VALOR_UNITARIO').AsFloat;
        clientDataSet.FieldByName('VALOR_TOTAL').AsFloat := tblVendas.FieldByName('VALOR_TOTAL').AsFloat;
        clientDataSet.Post;
        tblVendas.Next;
      end;

    except
      Result := False;
    end;

  finally
    if Assigned(tblVendas) then
      FreeAndNil(tblVendas);
  end;
end;

constructor TProcessoVenda.Create(conexao: TZConnection);
begin
  FConexaoDB := conexao;
end;

destructor TProcessoVenda.Destroy;
begin

  inherited;
end;

end.
