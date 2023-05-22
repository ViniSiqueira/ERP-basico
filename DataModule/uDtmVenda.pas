unit uDtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDtmConexao, Datasnap.DBClient;

type
  TdtmVenda = class(TDataModule)
    qryCliente: TZQuery;
    qryClienteCLIENTE_ID: TIntegerField;
    qryClienteNOME: TWideStringField;
    qryProdutos: TZQuery;
    qryProdutosPRODUTO_ID: TIntegerField;
    qryProdutosNOME: TWideStringField;
    qryProdutosVALOR: TFloatField;
    qryProdutosQUANTIDADE: TFloatField;
    cdsItensVenda: TClientDataSet;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendaPRODUTO_ID: TIntegerField;
    cdsItensVendaNOME_PRODUTO: TStringField;
    cdsItensVendaQUANTIDADE: TFloatField;
    cdsItensVendaVALOR_UNITARIO: TFloatField;
    cdsItensVendaVALOR_TOTAL: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  qryCliente.Open;
  qryProdutos.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  qryCliente.Close;
  qryProdutos.Close;
end;

end.
