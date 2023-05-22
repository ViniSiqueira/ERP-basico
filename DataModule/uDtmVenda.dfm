object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 248
  Width = 446
  object qryCliente: TZQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT CLIENTE_ID, NOME FROM CLIENTES')
    Params = <>
    Left = 80
    Top = 56
    object qryClienteCLIENTE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIENTE_ID'
      ReadOnly = True
    end
    object qryClienteNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT PRODUTO_ID, NOME, VALOR, QUANTIDADE FROM PRODUTOS')
    Params = <>
    Left = 152
    Top = 56
    object qryProdutosPRODUTO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRODUTO_ID'
      ReadOnly = True
    end
    object qryProdutosNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object qryProdutosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object qryProdutosQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 56
    object cdsItensVendaPRODUTO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'PRODUTO_ID'
    end
    object cdsItensVendaNOME_PRODUTO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_PRODUTO'
      Size = 50
    end
    object cdsItensVendaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsItensVendaVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsItensVendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 80
    Top = 104
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 152
    Top = 104
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 224
    Top = 112
  end
end
