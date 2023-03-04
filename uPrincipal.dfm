object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 299
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mainPrincipal: TMainMenu
    Left = 808
    Top = 8
    object menuCadastro: TMenuItem
      Caption = 'Cadastro'
      object menuCliente: TMenuItem
        Caption = 'Cliente'
        OnClick = menuClienteClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menuCategoria: TMenuItem
        Caption = 'Categoria'
        OnClick = menuCategoriaClick
      end
      object menuProduto: TMenuItem
        Caption = 'Produto'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object menuFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = menuFecharClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object menuVendas: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object menuRelatorioCliente: TMenuItem
        Caption = 'Cliente'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object menuRelatorioProduto: TMenuItem
        Caption = 'Produto'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object menuRelatorioVendaporData: TMenuItem
        Caption = 'Venda por Data'
      end
    end
  end
end
