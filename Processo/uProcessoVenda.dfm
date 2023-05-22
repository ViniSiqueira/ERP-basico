inherited frmProcessoVenda: TfrmProcessoVenda
  Caption = 'Vendas'
  ClientHeight = 510
  ClientWidth = 1108
  ExplicitWidth = 1114
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1108
    Height = 469
    ExplicitWidth = 1108
    ExplicitHeight = 469
    inherited tbListagem: TTabSheet
      ExplicitWidth = 1100
      ExplicitHeight = 441
      inherited pnlListagemTopo: TPanel
        Width = 1100
        ExplicitWidth = 1100
      end
      inherited gridListagem: TDBGrid
        Width = 1100
        Height = 392
        Columns = <
          item
            Expanded = False
            FieldName = 'VENDA_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_VENDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_VENDA'
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 1100
      ExplicitHeight = 441
      object lblCliente: TLabel
        Left = 168
        Top = 4
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object lblDataVenda: TLabel
        Left = 852
        Top = 4
        Width = 71
        Height = 13
        Caption = 'Data da Venda'
      end
      object edtCodigo: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 20
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtCliente: TDBLookupComboBox
        Left = 168
        Top = 20
        Width = 641
        Height = 21
        KeyField = 'CLIENTE_ID'
        ListField = 'NOME'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 853
        Top = 20
        Width = 120
        Height = 21
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object pnlItens: TPanel
        Left = 0
        Top = 56
        Width = 1100
        Height = 385
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object pnlItensVenda: TPanel
          Left = 0
          Top = 65
          Width = 1100
          Height = 279
          Align = alClient
          TabOrder = 0
          object gridItens: TDBGrid
            Left = 1
            Top = 1
            Width = 1098
            Height = 277
            Align = alClient
            Color = clBtnFace
            DataSource = dtmVenda.dtsItensVenda
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = gridItensDblClick
            OnKeyDown = gridItensKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'PRODUTO_ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_PRODUTO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Visible = True
              end>
          end
        end
        object pnlProduto: TPanel
          Left = 0
          Top = 0
          Width = 1100
          Height = 65
          Align = alTop
          TabOrder = 1
          object lblProduto: TLabel
            Left = 3
            Top = 4
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object lblValorUnitario: TLabel
            Left = 416
            Top = 4
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object lblQuantidade: TLabel
            Left = 544
            Top = 4
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object lblValorTotal: TLabel
            Left = 675
            Top = 4
            Width = 51
            Height = 13
            Caption = 'Valor Total'
          end
          object edtProduto: TDBLookupComboBox
            Left = 3
            Top = 20
            Width = 396
            Height = 21
            KeyField = 'PRODUTO_ID'
            ListField = 'NOME'
            ListSource = dtmVenda.dtsProdutos
            TabOrder = 0
            OnExit = edtProdutoExit
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 416
            Top = 20
            Width = 113
            Height = 21
            TabOrder = 1
          end
          object edtQuantidade: TCurrencyEdit
            Left = 544
            Top = 20
            Width = 113
            Height = 21
            DisplayFormat = ',0.00;-,0.00'
            TabOrder = 2
            OnExit = edtQuantidadeExit
          end
          object edtValorTotal: TCurrencyEdit
            Left = 675
            Top = 20
            Width = 113
            Height = 21
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object btnAdicionar: TBitBtn
            Left = 806
            Top = 20
            Width = 75
            Height = 21
            Caption = 'Adicionar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF828282
              828282828282818181818181818181818181818181408D4041A6413CB23C4AA5
              4A009900FF00FFFF00FFFF00FF8F8F8FFDFDFDADBBD7F9F9F9F9F9F9F9F9F9F9
              F9F936AE3649BB4965BB655FBF5FA8E8A882D5820D9F0DFF00FFFF00FF999999
              959596ADBBD7E2C1A3E2C1A3E2C1A371AD5125A9258AC38AC6C6C6C8D1C846BA
              4665C96547B847009900FF00FFA2A2A2FAFAFAADBBD7EBEBEBEBEBEBEBEBEB2A
              A82A77C477CCCCCCAAD1AACECECE9ACA9A31AE312CA72C069906FF00FFAAAAAA
              E2C1A3ADBBD7E2C1A3E2C1A3E2C1A30B9F0B6FC36F89CC8915A2158ACD8AF6F6
              F655BB553BAF3B19A219FF00FFAFAFAFFBFBFBADBBD7F0F0F0F0F0F0F0F0F053
              BA5374CC7447BB4744BE442EB12EDEF2DEEEF8EE49B8492FAD2FFF00FFB5B5B5
              E2C1A3ADBBD7E2C1A3E2C1A3E2C1A371AD5189D28986D18675CC7570CA705EBF
              5EFEFEFE9FD89F2FAD2FFF00FFB8B8B8959596ADBBD7F4F4F4F5F5F5F5F5F5E5
              EEE53CB03CA2DAA2AFDEAFA6DAA683CC836FC66F41B341FF00FFFF00FFBBBBBB
              E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3D4BE9971AD5155B24936AF3655B2
              492FAD2FFF00FFFF00FFFF00FFBDBDBDFDFDFDADBBD7F8F8F8F8F8F8F8F8F8F8
              F8F8F7F7F7F6F6F6F5F5F5F4F4F4FCFCFCBDBDBDFF00FFFF00FFFF00FFBEBEBE
              E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1
              A3BEBEBEFF00FFFF00FFFF00FFBFBFBFFDFDFDADBBD7FAFAFAFAFAFAFBFBFBFA
              FAFAFAFAFAF9F9F9F8F8F8F6F6F6FDFDFDBFBFBFFF00FFFF00FFFF00FFC0C0C0
              E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3C0C0C0CBCBCBDBDB
              DBBFBFBFFF00FFFF00FFFF00FFC0C0C0959596ADBBD7FBFBFBFCFCFCFCFCFCFC
              FCFCFBFBFBFAFAFACBCBCBE2E2E2C0C0C0FF00FFFF00FFFF00FFFF00FFC0C0C0
              FFFFFFADBBD7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAFADBDBDBC0C0C0FF00
              FFFF00FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 3
            OnClick = btnAdicionarClick
          end
          object brnRemover: TBitBtn
            Left = 898
            Top = 20
            Width = 75
            Height = 21
            Caption = 'Remover'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FF767676333333414141717171A5A5A5CBCBCBEEEEEECECECEA0A0A0FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF727272313131434343747474A7
              A7A7CBCBCBEEEEEECECECEA0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              DDDDDDEAE9E8FFFDFCFFFEFCFFFEFDFFFEFEFFFFFEFFFFFFFFFFFFF2F2F2D4D4
              D4FF00FFFF00FFFF00FFFF00FFFF00FFCFCFCFF6F3F0FEFBF8FEFBF9FEFCFAFE
              FCFBFEFDFCFEFEFDFFFEFEFFFFFFCBCBCBFF00FFFF00FFFF00FFFF00FFFF00FF
              C0C0C0FEFBF7FEFAF6FEFBF7FEFBF8FEFCF9F3DCCFFEFDFCFEFEFDFFFEFEC5C5
              C5FF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9FEF9F5EDCDBAD28357CF794AF0
              D4C4D07C4ECF794AE4B398FEFEFCCDCDCDFF00FFFF00FFFF00FFFF00FFFF00FF
              D5D4D3F9ECE3D48C62D7956EDB9A76F2DBCCD28357D58960CF794AF3DCCFDAD9
              D9FF00FFFF00FFFF00FFFF00FFDEDEDEE2E0DEF9ECE2D6966ED7966FF6E5D9FE
              FAF6F8EAE1D58960CF794AF5E3D8ECEBEAD9D9D9FF00FFFF00FFFF00FFD3D3D3
              EBE7E3FBF2E9E4BA9DD99E78FEF8F2FEF8F3FBF1E9E7B99FECCAB5FEFAF7F5F2
              EFCACACAFF00FFFF00FFFF00FFC4C4C3FEF7F0FDF5ECFDF5EDF3DFCFE2B698EE
              D0BBD17F52D8916AFEF8F1FEF8F2FEF9F4BFBEBEFF00FFFF00FFFF00FFBDBCBA
              FEF3E8FDF3E8FDF3E8E4BFA1D9A17AD59268D17F52DB9872F8E5D8FEF6EDFEF7
              EEC2C0BEFF00FFFF00FFFF00FFC7C3BFFDF0E2FDF0E2FDF0E3F6E3D1DBA682D5
              9269D3875BFBEBDCFDF2E6FEF3E8FEF4E8D1CBC6FF00FFFF00FFFF00FFD4CCC4
              FDEDDCFDEDDCFDEDDDFDEEDDFDEEDEFDEEDEFDEEDFFDEFDFFDEFE0FDF0E1FDF0
              E2DAD1C8FF00FFFF00FFFF00FFD5CCC2D5C8BBCABDAFCABEB1CEC2B4D6CABDE4
              D8CBECE1D4EEE1D5EBDFD3E8DDD1E6DBCFD4CCC2FF00FFFF00FFC3C3C39A9A9A
              5F5F5F2F2F2F3434344242426363639B9B9BBCBCBCBFBFBFB4B4B4A9A9A99F9F
              9F979797939393FF00FFC4C4C49A9A9A5F5F5F2F2F2F3434344242426363639B
              9B9BBCBCBCBFBFBFB4B4B4A9A9A99F9F9F979797939393FF00FF}
            TabOrder = 4
            OnClick = brnRemoverClick
          end
        end
        object pnlValorTotal: TPanel
          Left = 0
          Top = 344
          Width = 1100
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 342
          object lblValor: TLabel
            Left = 880
            Top = 14
            Width = 84
            Height = 13
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValor: TCurrencyEdit
            Left = 972
            Top = 10
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 469
    Width = 1108
    ExplicitTop = 469
    ExplicitWidth = 1108
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT VENDAS.VENDA_ID, VENDAS.CLIENTE_ID,'
      'CLIENTES.NOME, VENDAS.DATA_VENDA, VENDAS.TOTAL_VENDA'
      'FROM VENDAS'
      'INNER JOIN CLIENTES ON CLIENTES.CLIENTE_ID = VENDAS.CLIENTE_ID')
    Left = 596
    Top = 65520
    object qryListagemVENDA_ID: TIntegerField
      DisplayLabel = 'C'#243'digo Venda'
      FieldName = 'VENDA_ID'
      ReadOnly = True
    end
    object qryListagemCLIENTE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CLIENTE_ID'
      Required = True
    end
    object qryListagemNOME: TWideStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME'
      Size = 50
    end
    object qryListagemDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA_VENDA'
    end
    object qryListagemTOTAL_VENDA: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'TOTAL_VENDA'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 724
    Top = 65520
  end
end
