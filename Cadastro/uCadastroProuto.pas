unit uCadastroProuto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit;

type
  TfrmCadastroProduto = class(TfrmTelaHeranca)
    qryListagemPRODUTO_ID: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemDESCRICAO: TWideStringField;
    qryListagemVALOR: TFloatField;
    qryListagemQUANTIDADE: TFloatField;
    qryListagemDESCRICAO_CATEGORIA: TWideStringField;
    qryListagemCATEGORIA_ID: TIntegerField;
    edtNome: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    edtCategoria: TDBLookupComboBox;
    qryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    qryCategoriaCATEGORIA_ID: TIntegerField;
    qryCategoriaDESCRICAO: TWideStringField;
    lblCategoria: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

end.
