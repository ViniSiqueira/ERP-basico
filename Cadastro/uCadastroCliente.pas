unit uCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadCliente, uEnum;

type
  TfrmCadastroCliente = class(TfrmTelaHeranca)
    edtNome: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    edtCep: TMaskEdit;
    lblCEP: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    lblTelefone: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    lblDataNascimento: TLabel;
    qryListagemCLIENTE_ID: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemENDERECO: TWideStringField;
    qryListagemCIDADE: TWideStringField;
    qryListagemBAIRRO: TWideStringField;
    qryListagemESTADO: TWideStringField;
    qryListagemCEP: TWideStringField;
    qryListagemTELEFONE: TWideStringField;
    qryListagemEMAIL: TWideStringField;
    qryListagemDATA_NASCIMENTO: TDateTimeField;
    edtTelefone: TMaskEdit;
    edtEstado: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente : TCadastroCliente;
  public
    { Public declarations }
    function Apagar: Boolean; override;
    function Salvar(estadoCadastro: TEstadoCadastro): Boolean; override;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  uDtmConexao;

{$R *.dfm}

{ TfrmCadastroCliente }

function TfrmCadastroCliente.Apagar: Boolean;
begin
  if MessageDlg('Deseja mesmo apagar o registro atual?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Abort;

  Result := oCliente.Apagar(qryListagem.FieldByName('CLIENTE_ID').AsInteger);
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCadastroCliente.Create(dtmConexao.conexaoDB);
  IndiceAtual := 'nome';
end;

procedure TfrmCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(qryListagem.FieldByName('CLIENTE_ID').AsInteger) then
  begin
    edtCodigo.Text := oCliente.ClienteId.ToString;
    edtNome.Text := oCliente.Nome;
    edtEndereco.Text := oCliente.Endereco;
    edtCidade.Text := oCliente.Cidade;
    edtBairro.Text :=oCliente.Bairro;
    edtEstado.Text := oCliente.Estado;
    edtCep.Text := oCliente.CEP;
    edtTelefone.Text := oCliente.Telefone;
    edtEmail.Text := oCliente.Email;
    edtDataNascimento.Date := oCliente.DataNascimento;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadastroCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
    FreeAndNil(oCliente)
end;

function TfrmCadastroCliente.Salvar(estadoCadastro: TEstadoCadastro): Boolean;
begin
  Result := False;

  if edtCodigo.Text <> EmptyStr then
    oCliente.ClienteId := StrToInt(edtCodigo.Text)
  else
    oCliente.ClienteId := 0;

  oCliente.Nome := edtNome.Text;
  oCliente.Endereco := edtEndereco.Text;
  oCliente.Cidade := edtCidade.Text;
  oCliente.Bairro := edtBairro.Text;
  oCliente.Estado := edtEstado.Text;
  oCliente.CEP := edtCep.Text;
  oCliente.Telefone := edtTelefone.Text;
  oCliente.Email := edtEmail.Text;
  oCliente.DataNascimento := edtDataNascimento.Date;

  if EstadoCadastro = ecNovo then
    Result := oCliente.Inserir
  else if EstadoCadastro = ecAlterar then
    Result := oCliente.Atualizar;
end;

end.
