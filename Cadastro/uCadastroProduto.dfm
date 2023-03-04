inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produtos'
  ClientHeight = 348
  ClientWidth = 1108
  ExplicitWidth = 1114
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1108
    Height = 307
    ActivePage = tbManutencao
    ExplicitWidth = 1108
    ExplicitHeight = 307
    inherited tbListagem: TTabSheet
      ExplicitWidth = 1100
      ExplicitHeight = 279
      inherited pnlListagemTopo: TPanel
        Width = 1100
        ExplicitWidth = 1100
      end
      inherited gridListagem: TDBGrid
        Width = 1100
        Height = 230
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CATEGORIA_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_CATEGORIA'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 1100
      ExplicitHeight = 279
      object lblValor: TLabel
        Left = 539
        Top = 46
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 539
        Top = 92
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lblCategoria: TLabel
        Left = 3
        Top = 138
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtNome: TLabeledEdit
        Left = 3
        Top = 65
        Width = 500
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 200
        TabOrder = 0
      end
      object edtCodigo: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 20
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 4
      end
      object edtDescricao: TLabeledEdit
        Left = 3
        Top = 111
        Width = 500
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 200
        TabOrder = 2
      end
      object edtValor: TCurrencyEdit
        Left = 539
        Top = 65
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtQuantidade: TCurrencyEdit
        Left = 539
        Top = 111
        Width = 121
        Height = 21
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 3
      end
      object edtCategoria: TDBLookupComboBox
        Left = 3
        Top = 155
        Width = 500
        Height = 21
        KeyField = 'CATEGORIA_ID'
        ListField = 'DESCRICAO'
        ListSource = dtsCategoria
        TabOrder = 5
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 307
    Width = 1108
    ExplicitTop = 307
    ExplicitWidth = 1108
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT PRODUTOS.*, '
      'CATEGORIAS.DESCRICAO AS DESCRICAO_CATEGORIA '
      'FROM PRODUTOS'
      
        'LEFT JOIN CATEGORIAS ON PRODUTOS.CATEGORIA_ID = CATEGORIAS.CATEG' +
        'ORIA_ID')
    Left = 284
    Top = 8
    object qryListagemPRODUTO_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRODUTO_ID'
      ReadOnly = True
    end
    object qryListagemNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object qryListagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object qryListagemVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object qryListagemQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object qryListagemCATEGORIA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo Categoria'
      FieldName = 'CATEGORIA_ID'
    end
    object qryListagemDESCRICAO_CATEGORIA: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Categoria'
      FieldName = 'DESCRICAO_CATEGORIA'
      Size = 50
    end
  end
  inherited dtsListagem: TDataSource
    Left = 348
    Top = 16
  end
  object qryCategoria: TZQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT * FROM CATEGORIAS')
    Params = <>
    Left = 508
    Top = 8
    object qryCategoriaCATEGORIA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CATEGORIA_ID'
      ReadOnly = True
    end
    object qryCategoriaDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 440
  end
end
