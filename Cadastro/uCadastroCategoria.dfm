inherited frmCadastroCategoria: TfrmCadastroCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 428
  ClientWidth = 1295
  ExplicitWidth = 1301
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1295
    Height = 387
    ExplicitWidth = 1295
    ExplicitHeight = 387
    inherited tbListagem: TTabSheet
      ExplicitWidth = 1287
      ExplicitHeight = 359
      inherited pnlListagemTopo: TPanel
        Width = 1287
        ExplicitWidth = 1287
      end
      inherited gridListagem: TDBGrid
        Width = 1287
        Height = 310
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORIA_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 1287
      ExplicitHeight = 359
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
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Left = 3
        Top = 65
        Width = 500
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 200
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 387
    Width = 1295
    ExplicitTop = 387
    ExplicitWidth = 1295
    inherited brnFechar: TBitBtn
      Left = 1216
      Anchors = [akTop, akRight]
      ExplicitLeft = 1216
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT CATEGORIA_ID, DESCRICAO'
      'FROM CATEGORIAS')
    Left = 452
    object qryListagemCATEGORIA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CATEGORIA_ID'
    end
    object qryListagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  inherited dtsListagem: TDataSource
    Left = 508
  end
end
