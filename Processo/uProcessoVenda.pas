unit uProcessoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,uDtmVenda, uDtmConexao,
  RxToolEdit, RxCurrEdit, cProcessoVenda, uEnum;

type
  TfrmProcessoVenda = class(TfrmTelaHeranca)
    qryListagemVENDA_ID: TIntegerField;
    qryListagemCLIENTE_ID: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemDATA_VENDA: TDateTimeField;
    qryListagemTOTAL_VENDA: TFloatField;
    edtCodigo: TLabeledEdit;
    edtCliente: TDBLookupComboBox;
    lblCliente: TLabel;
    edtDataVenda: TDateEdit;
    lblDataVenda: TLabel;
    pnlItens: TPanel;
    pnlProduto: TPanel;
    pnlValorTotal: TPanel;
    lblValor: TLabel;
    edtValor: TCurrencyEdit;
    pnlItensVenda: TPanel;
    gridItens: TDBGrid;
    edtProduto: TDBLookupComboBox;
    lblProduto: TLabel;
    edtValorUnitario: TCurrencyEdit;
    lblValorUnitario: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtValorTotal: TCurrencyEdit;
    btnAdicionar: TBitBtn;
    brnRemover: TBitBtn;
    lblQuantidade: TLabel;
    lblValorTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure ValidarCamposObrigatorios;
    procedure ValidarProdutoRepetido;
    function TotalizarProduto(valorUnitario, quantidade: Double): Double;
    function TotalizarVenda: Double;
    procedure InserirValorTotal;
    procedure BuscarValorUnitarioProduto;
    procedure edtProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure AdicionarProduto;
    procedure LimparCampos;
    procedure LimparClientDataSet;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure CarregarRegistrosSelecionados;
    procedure brnRemoverClick(Sender: TObject);
    procedure ValidarProdutoSelecionado;
    procedure RemoverItem;
    procedure gridItensDblClick(Sender: TObject);
  private
    { Private declarations }
    dtmVenda: TdtmVenda;
    oProcessoVenda : TProcessoVenda;
  public
    { Public declarations }
    function Apagar: Boolean; override;
    function Salvar(estadoCadastro: TEstadoCadastro): Boolean; override;
  end;

var
  frmProcessoVenda: TfrmProcessoVenda;

implementation

{$R *.dfm}

procedure TfrmProcessoVenda.AdicionarProduto;
begin
  dtmVenda.cdsItensVenda.Append;
  dtmVenda.cdsItensVenda.FieldByName('PRODUTO_ID').AsString := edtProduto.KeyValue;
  dtmVenda.cdsItensVenda.FieldByName('NOME_PRODUTO').AsString := dtmVenda.qryProdutos.FieldByName('NOME').AsString;
  dtmVenda.cdsItensVenda.FieldByName('QUANTIDADE').AsFloat := edtQuantidade.Value;
  dtmVenda.cdsItensVenda.FieldByName('VALOR_UNITARIO').AsFloat := edtValorUnitario.Value;
  dtmVenda.cdsItensVenda.FieldByName('VALOR_TOTAL').AsFloat := edtValorTotal.Value;
  dtmVenda.cdsItensVenda.Post;

  edtValor.Value := TotalizarVenda;
end;

function TfrmProcessoVenda.Apagar: Boolean;
begin
  if MessageDlg('Deseja mesmo apagar o registro atual?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Abort;

  Result := oProcessoVenda.Apagar(qryListagem.FieldByName('VENDA_ID').AsInteger);
end;

procedure TfrmProcessoVenda.brnRemoverClick(Sender: TObject);
begin
  inherited;
  ValidarProdutoSelecionado;
  RemoverItem;
end;

procedure TfrmProcessoVenda.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  ValidarCamposObrigatorios;
  ValidarProdutoRepetido;
  InserirValorTotal;
  AdicionarProduto;
  LimparCampos;
  edtProduto.SetFocus;
end;

procedure TfrmProcessoVenda.btnAlterarClick(Sender: TObject);
begin
  if oProcessoVenda.Selecionar(qryListagem.FieldByName('VENDA_ID').AsInteger, dtmVenda.cdsItensVenda) then
  begin
    edtCodigo.Text := oProcessoVenda.VendaId.ToString;
    edtCliente.KeyValue := oProcessoVenda.ClienteId;
    edtDataVenda.Date := oProcessoVenda.DataVenda;
    edtValor.Value := oProcessoVenda.TotalVenda;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmProcessoVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparClientDataSet;
end;

procedure TfrmProcessoVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparClientDataSet;
end;

procedure TfrmProcessoVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := Date;
  edtCliente.SetFocus;
  LimparClientDataSet;
end;

procedure TfrmProcessoVenda.BuscarValorUnitarioProduto;
begin
  edtValorUnitario.Value := dtmVenda.qryProdutos.FieldByName('VALOR').AsFloat;
end;

procedure TfrmProcessoVenda.CarregarRegistrosSelecionados;
begin
  edtProduto.KeyValue := dtmVenda.cdsItensVenda.FieldByName('PRODUTO_ID').AsString;
  edtQuantidade.Value := dtmVenda.cdsItensVenda.FieldByName('QUANTIDADE').AsFloat;
  edtValorUnitario.Value := dtmVenda.cdsItensVenda.FieldByName('VALOR_UNITARIO').AsFloat;
  edtValorTotal.Value := dtmVenda.cdsItensVenda.FieldByName('VALOR_TOTAL').AsFloat;;
end;

procedure TfrmProcessoVenda.edtProdutoExit(Sender: TObject);
begin
  inherited;

  if TDBLookupComboBox(Sender).KeyValue <> Null then
    BuscarValorUnitarioProduto;
end;

procedure TfrmProcessoVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  InserirValorTotal;
end;

procedure TfrmProcessoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
    FreeAndNil(dtmVenda);

  if Assigned(oProcessoVenda) then
    FreeAndNil(oProcessoVenda);
end;

procedure TfrmProcessoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda := TdtmVenda.Create(Self);
  oProcessoVenda := TProcessoVenda.Create(dtmConexao.conexaoDB);
  IndiceAtual := 'CLIENTE_ID';
end;

procedure TfrmProcessoVenda.gridItensDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistrosSelecionados;
end;

procedure TfrmProcessoVenda.gridItensKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  inherited;
  BloquearCtrlDel(Key, Shift);
end;

procedure TfrmProcessoVenda.InserirValorTotal;
begin
  edtValorTotal.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProcessoVenda.LimparCampos;
begin
  edtProduto.KeyValue := NULL;
  edtQuantidade.Value := 0;
  edtValorUnitario.Value := 0;
  edtValorTotal.Value := 0;
end;

procedure TfrmProcessoVenda.LimparClientDataSet;
begin
  dtmVenda.cdsItensVenda.First;
  while not dtmVenda.cdsItensVenda.Eof do
    dtmVenda.cdsItensVenda.Delete;
end;

procedure TfrmProcessoVenda.RemoverItem;
begin
  if dtmVenda.cdsItensVenda.Locate('PRODUTO_ID', edtProduto.KeyValue, []) then
  begin
    dtmVenda.cdsItensVenda.Delete;
    LimparCampos;
  end;

  edtValor.Value := TotalizarVenda;
end;

function TfrmProcessoVenda.Salvar(estadoCadastro: TEstadoCadastro): Boolean;
begin
  Result := False;

  if edtCodigo.Text <> EmptyStr then
    oProcessoVenda.VendaId := StrToInt(edtCodigo.Text)
  else
    oProcessoVenda.VendaId := 0;

  oProcessoVenda.ClienteId := edtCliente.KeyValue;
  oProcessoVenda.DataVenda := edtDataVenda.Date;
  oProcessoVenda.TotalVenda := edtValor.Value;

  if EstadoCadastro = ecNovo then
    Result := oProcessoVenda.Inserir(dtmVenda.cdsItensVenda)
  else if EstadoCadastro = ecAlterar then
    Result := oProcessoVenda.Atualizar(dtmVenda.cdsItensVenda);
end;

function TfrmProcessoVenda.TotalizarProduto(valorUnitario, quantidade: Double): Double;
begin
  Result := valorUnitario * quantidade;
end;

function TfrmProcessoVenda.TotalizarVenda: Double;
begin
  Result:= 0.0;

  dtmVenda.cdsItensVenda.First;
  while not dtmVenda.cdsItensVenda.Eof do
  begin
    Result := Result + dtmVenda.cdsItensVenda.FieldByName('VALOR_TOTAL').AsFloat;
    dtmVenda.cdsItensVenda.Next;
  end;
end;

procedure TfrmProcessoVenda.ValidarCamposObrigatorios;
begin
  if edtProduto.KeyValue = Null then
  begin
    MessageDlg('Atenção! O Produto é obrigatório', mtInformation,[mbOk],0);
    edtProduto.SetFocus;
    abort;
  end;

  if edtValorUnitario.Value <= 0 then
  begin
    MessageDlg('Atenção! O Valor Unitário não pode ser menor ou igual a zero', mtInformation,[mbOk],0);
    edtValorUnitario.SetFocus;
    abort;
  end;

  if edtQuantidade.Value <= 0 then
  begin
    MessageDlg('Atenção! A Quantidade não pode ser menor ou igual a zero', mtInformation,[mbOk],0);
    edtQuantidade.SetFocus;
    abort;
  end;
end;

procedure TfrmProcessoVenda.ValidarProdutoRepetido;
begin
  if dtmVenda.cdsItensVenda.Locate('PRODUTO_ID', edtProduto.KeyValue, []) then
  begin
    MessageDlg('Atenção! O Produto já foi informado na venda', mtInformation,[mbOk],0);
    edtProduto.SetFocus;
    abort;
  end;
end;

procedure TfrmProcessoVenda.ValidarProdutoSelecionado;
begin
  if edtProduto.KeyValue = NULL then
  begin
    MessageDlg('Atenção! Selecione um produto para ser excluído', mtInformation,[mbOk],0);
    gridItens.SetFocus;
    abort;
  end;
end;

end.
