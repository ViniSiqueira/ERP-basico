inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 360
  ClientWidth = 1118
  ExplicitWidth = 1124
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1118
    Height = 319
    ActivePage = tbManutencao
    ExplicitWidth = 1118
    ExplicitHeight = 319
    inherited tbListagem: TTabSheet
      ExplicitWidth = 1110
      ExplicitHeight = 291
      inherited pnlListagemTopo: TPanel
        Width = 1110
        ExplicitWidth = 1110
      end
      inherited gridListagem: TDBGrid
        Width = 1110
        Height = 242
        Columns = <
          item
            Expanded = False
            FieldName = 'CLIENTE_ID'
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
            FieldName = 'ENDERECO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NASCIMENTO'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 1110
      ExplicitHeight = 291
      object lblCEP: TLabel
        Left = 520
        Top = 49
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblTelefone: TLabel
        Left = 520
        Top = 141
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lblDataNascimento: TLabel
        Left = 520
        Top = 185
        Width = 96
        Height = 13
        Caption = 'Data de Nascimento'
      end
      object edtNome: TLabeledEdit
        Left = 3
        Top = 65
        Width = 500
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 50
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
        TabOrder = 8
      end
      object edtCep: TMaskEdit
        Left = 520
        Top = 68
        Width = 65
        Height = 21
        EditMask = '99999-999;1;_'
        MaxLength = 9
        TabOrder = 1
        Text = '     -   '
      end
      object edtEndereco: TLabeledEdit
        Left = 3
        Top = 113
        Width = 500
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 250
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Left = 520
        Top = 113
        Width = 120
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 100
        TabOrder = 4
      end
      object edtCidade: TLabeledEdit
        Left = 3
        Top = 158
        Width = 500
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 250
        TabOrder = 5
      end
      object edtEmail: TLabeledEdit
        Left = 3
        Top = 201
        Width = 500
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 250
        TabOrder = 7
      end
      object edtDataNascimento: TDateEdit
        Left = 523
        Top = 204
        Width = 120
        Height = 21
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 9
      end
      object edtTelefone: TMaskEdit
        Left = 523
        Top = 158
        Width = 117
        Height = 21
        EditMask = '(99)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 6
        Text = '(  )    -    '
      end
      object edtEstado: TLabeledEdit
        Left = 601
        Top = 68
        Width = 39
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado'
        MaxLength = 2
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 319
    Width = 1118
    ExplicitTop = 319
    ExplicitWidth = 1118
    inherited brnFechar: TBitBtn
      Left = 1028
      ExplicitLeft = 1028
    end
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 380
    Top = 32
    object qryListagemCLIENTE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIENTE_ID'
      ReadOnly = True
    end
    object qryListagemNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object qryListagemENDERECO: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 250
    end
    object qryListagemCIDADE: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 250
    end
    object qryListagemBAIRRO: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 100
    end
    object qryListagemESTADO: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 2
    end
    object qryListagemCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qryListagemTELEFONE: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 14
    end
    object qryListagemEMAIL: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 250
    end
    object qryListagemDATA_NASCIMENTO: TDateTimeField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATA_NASCIMENTO'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 436
    Top = 32
  end
end
