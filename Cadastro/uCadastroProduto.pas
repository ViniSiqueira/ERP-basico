unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, uEnum, cCadProduto, uDtmConexao;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oProduto : TCadastroProduto;
  public
    { Public declarations }
    function Apagar: Boolean; override;
    function Salvar(estadoCadastro: TEstadoCadastro): Boolean; override;
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

function TfrmCadastroProduto.Apagar: Boolean;
begin
  if MessageDlg('Deseja mesmo apagar o registro atual?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Abort;

  Result := oProduto.Apagar(qryListagem.FieldByName('PRODUTO_ID').AsInteger);
end;

procedure TfrmCadastroProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(qryListagem.FieldByName('PRODUTO_ID').AsInteger) then
  begin
    edtCodigo.Text := oProduto.ProdutoId.ToString;
    edtNome.Text := oProduto.Nome;
    edtDescricao.Text := oProduto.Descricao;
    edtValor.Value := oProduto.Valor;
    edtQuantidade.Value :=oProduto.Quantidade;
    edtCategoria.KeyValue := oProduto.CategoriaId.ToString;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadastroProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCategoria.Close;
  if Assigned(oProduto) then
    FreeAndNil(oProduto)
end;

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto := TCadastroProduto.Create(dtmConexao.conexaoDB);
  IndiceAtual := 'nome';
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;
end;

function TfrmCadastroProduto.Salvar(estadoCadastro: TEstadoCadastro): Boolean;
begin
  Result := False;

  if edtCodigo.Text <> EmptyStr then
    oProduto.ProdutoId := StrToInt(edtCodigo.Text)
  else
    oProduto.ProdutoId := 0;

  oProduto.Nome := edtNome.Text;
  oProduto.Descricao := edtDescricao.Text;
  oProduto.Valor := edtValor.Value;
  oProduto.Quantidade := edtQuantidade.Value;
  oProduto.CategoriaId := edtCategoria.KeyValue;

  if EstadoCadastro = ecNovo then
    Result := oProduto.Inserir
  else if EstadoCadastro = ecAlterar then
    Result := oProduto.Atualizar;
end;

end.
