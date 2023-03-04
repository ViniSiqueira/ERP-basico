inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 306
  ClientWidth = 692
  ExplicitWidth = 698
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 692
    Height = 265
    ActivePage = tbManutencao
    ExplicitTop = 1
    inherited tbListagem: TTabSheet
      ExplicitWidth = 684
      ExplicitHeight = 237
      inherited pnlListagemTopo: TPanel
        Width = 684
      end
      inherited gridListagem: TDBGrid
        Width = 684
        Height = 188
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 684
      ExplicitHeight = 237
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
        TabOrder = 1
      end
      object edtCep: TMaskEdit
        Left = 520
        Top = 68
        Width = 120
        Height = 21
        EditMask = '99999-999;1;_'
        MaxLength = 9
        TabOrder = 2
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
        TabOrder = 6
      end
      object edtDataNascimento: TDateEdit
        Left = 520
        Top = 201
        Width = 120
        Height = 21
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 7
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 265
    Width = 692
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
  end
  object edtTelefone: TMaskEdit [2]
    Left = 524
    Top = 182
    Width = 120
    Height = 21
    EditMask = '(99)9999-9999;1;_'
    MaxLength = 13
    TabOrder = 2
    Text = '(  )    -    '
  end
end
