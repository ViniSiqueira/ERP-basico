object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 388
  Width = 814
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    SQLHourGlass = True
    HostName = '.\SQLEXPRESS'
    Port = 0
    Database = 'VINICIUS_PRD'
    User = ''
    Password = ''
    Protocol = 'mssql'
    LibraryLocation = 'C:\Users\vinic\Documents\ProjetoDelphi\ntwdblib.dll'
    Left = 112
    Top = 136
  end
  object qryTabelas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      '--DADOS SQL'
      ''
      'IF OBJECT_ID('#39'CATEGORIAS'#39') IS NULL'
      'BEGIN'
      #9'CREATE TABLE CATEGORIAS'
      #9'('
      #9#9'CATEGORIA_ID INTEGER NOT NULL IDENTITY PRIMARY KEY,'
      #9#9'DESCRICAO VARCHAR(50) NULL'
      #9')'
      'END'
      ''
      'IF OBJECT_ID('#39'CLIENTES'#39') IS NULL'
      'BEGIN'
      #9'CREATE TABLE CLIENTES'
      #9'('
      #9#9'CLIENTE_ID INTEGER NOT NULL IDENTITY PRIMARY KEY,'
      #9#9'NOME VARCHAR(50) NULL,'
      #9#9'ENDERECO VARCHAR(250) NULL,'
      #9#9'CIDADE VARCHAR(250) NULL,'
      #9#9'BAIRRO VARCHAR(100) NULL,'
      #9#9'ESTADO VARCHAR(2) NULL,'
      #9#9'CEP VARCHAR(10) NULL,'
      #9#9'TELEFONE VARCHAR(14) NULL,'
      #9#9'EMAIL VARCHAR(250) NULL,'
      #9#9'DATA_NASCIMENTO DATETIME NULL'
      #9')'
      'END'
      ''
      'IF OBJECT_ID('#39'PRODUTOS'#39') IS NULL'
      'BEGIN'
      #9'CREATE TABLE PRODUTOS'
      #9'('
      #9#9'PRODUTO_ID INTEGER NOT NULL IDENTITY PRIMARY KEY,'
      #9#9'NOME VARCHAR(50) NULL,'
      #9#9'DESCRICAO VARCHAR(250) NULL,'
      #9#9'VALOR DECIMAL(19,6) NULL,'
      #9#9'QUANTIDADE DECIMAL(19,6) NULL,'
      #9#9'CATEGORIA_ID INT NULL'
      ''
      #9#9'CONSTRAINT FK_PROUTOS_CATEGORIAS'
      #9#9'FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIAS(CATEGORIA_ID)'
      #9')'
      'END'
      ''
      'IF OBJECT_ID('#39'VENDAS'#39') IS NULL'
      'BEGIN'
      #9'CREATE TABLE VENDAS'
      #9'('
      #9#9'VENDA_ID INTEGER NOT NULL IDENTITY PRIMARY KEY,'
      #9#9'CLIENTE_ID INTEGER NOT NULL,'
      #9#9'DATA_VENDA DATETIME DEFAULT GETDATE(),'
      #9#9'TOTAL_VENDA DECIMAL(19,6)'
      ''
      #9#9'CONSTRAINT FK_VENDAS_CLIENTES'
      #9#9'FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTES(CLIENTE_ID)'
      #9')'
      'END'
      ''
      'IF OBJECT_ID('#39'VENDAS_ITENS'#39') IS NULL'
      'BEGIN'
      #9'CREATE TABLE VENDAS_ITENS'
      #9'('
      #9#9'VENDA_ID INTEGER NOT NULL,'
      #9#9'PRODUTO_ID INTEGER NOT NULL,'
      #9#9'VALOR_UNITARIO DECIMAL(19,6),'
      #9#9'QUANTIDADE DECIMAL(19,6),'
      #9#9'TOTAL_PRODUTO DECIMAL(19,6)'
      ''
      #9#9'PRIMARY KEY(VENDA_ID,PRODUTO_ID)'
      #9#9'CONSTRAINT FK_VENDAS_ITENS_PRODUTOS'
      #9#9'FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS(PRODUTO_ID)'
      #9')'
      'END')
    Params = <>
    Left = 408
    Top = 96
  end
end
