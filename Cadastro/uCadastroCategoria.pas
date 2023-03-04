unit uCadastroCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria,
  uDtmConexao, uEnum;

type
  TfrmCadastroCategoria = class(TfrmTelaHeranca)
    qryListagemCATEGORIA_ID: TIntegerField;
    qryListagemDESCRICAO: TWideStringField;
    edtCodigo: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria: TCategoria;

    procedure ValidarCamposObrigatorios;
  public
    { Public declarations }
    function Apagar: Boolean; override;
    function Salvar(estadoCadastro: TEstadoCadastro): Boolean; override;
  end;

var
  frmCadastroCategoria: TfrmCadastroCategoria;

implementation

{$R *.dfm}

function TfrmCadastroCategoria.Apagar: Boolean;
begin
  if MessageDlg('Deseja mesmo apagar o registro atual?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Abort;

  Result := oCategoria.Apagar(qryListagem.FieldByName('CATEGORIA_ID').AsInteger);
end;

function TfrmCadastroCategoria.Salvar(estadoCadastro: TEstadoCadastro): Boolean;
begin
  Result := False;

  if edtCodigo.Text <> EmptyStr then
    oCategoria.CategoriaId := StrToInt(edtCodigo.Text)
  else
    oCategoria.CategoriaId := 0;

  oCategoria.Descricao := edtDescricao.Text;

  if EstadoCadastro = ecNovo then
    Result := oCategoria.Inserir
  else if EstadoCadastro = ecAlterar then
    Result := oCategoria.Atualizar;
end;

procedure TfrmCadastroCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('CATEGORIA_ID').AsInteger) then
  begin
    edtCodigo.Text := oCategoria.CategoriaId.ToString;
    edtDescricao.Text := oCategoria.Descricao;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadastroCategoria.btnGravarClick(Sender: TObject);
begin
  ValidarCamposObrigatorios;
  inherited;
end;

procedure TfrmCadastroCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria)
end;

procedure TfrmCadastroCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria := TCategoria.Create(dtmConexao.conexaoDB);
  IndiceAtual := 'descricao';
end;

procedure TfrmCadastroCategoria.ValidarCamposObrigatorios;
begin
  if edtDescricao.Text = '' then
    raise Exception.Create('Atenção! O campo descrição é obrigatório');

end;

end.
