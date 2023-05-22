unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDtmConexao, uEnum, RxToolEdit, RxCurrEdit;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tbListagem: TTabSheet;
    tbManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btmPesquisar: TBitBtn;
    gridListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    brnFechar: TBitBtn;
    btnNavegator: TDBNavigator;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure brnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure gridListagemDblClick(Sender: TObject);
    procedure gridListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FEstadoCadastro: TEstadoCadastro;
    FIndiceAtual: String;
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar: TBitBtn; btnNavegador: TDBNavigator; pgcPrincipal: TPageControl; flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
    function RetornarCampoPesquisado(campo: String):String;
    procedure ExibirCampoPesquisa(campo: String; tLabel: TLabel);
    procedure DesabilitarCampoPk;
    procedure LimparCampos;
    procedure VerificarAlteracaoRegistro;
  public
    { Public declarations }

    function Apagar: Boolean; virtual;
    function Salvar(estadoCadastro: TEstadoCadastro): Boolean; virtual;
    procedure BloquearCtrlDel(var Key: Word; Shift: TShiftState);

    property EstadoCadastro: TEstadoCadastro read FEstadoCadastro write FEstadoCadastro;
    property IndiceAtual: String read FIndiceAtual write FIndiceAtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmConexao.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  gridListagem.DataSource := dtsListagem;
  gridListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> '') then
  begin
    qryListagem.IndexFieldNames := FIndiceAtual;
    ExibirCampoPesquisa(FIndiceAtual, lblIndice);
    qryListagem.Open;
  end;
  ControlarIndiceTab(pgcPrincipal,0);
  DesabilitarCampoPk;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.gridListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.gridListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BloquearCtrlDel(Key, Shift);
end;

procedure TfrmTelaHeranca.gridListagemTitleClick(Column: TColumn);
begin
  FIndiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames := FIndiceAtual;
  ExibirCampoPesquisa(FIndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.LimparCampos;
begin
  for var i := 0 to ComponentCount - 1 do
  begin
    if (Components[i]) is TLabeledEdit then
      TLabeledEdit(Components[i]).Text := ''
    else if (Components[i]) is TMaskEdit then
      TMaskEdit(Components[i]).Text := ''
    else if (Components[i]) is TDateEdit then
      TDateEdit(Components[i]).Date := Date
    else if (Components[i]) is TCurrencyEdit then
      TCurrencyEdit(Components[i]).Value := 0
    else if (Components[i]) is TDBLookupComboBox then
      TDBLookupComboBox(Components[i]).KeyValue := Null;
  end;
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(FIndiceAtual,TMaskEdit(Sender).Text, [loPartialKey]);
end;

function TfrmTelaHeranca.RetornarCampoPesquisado(campo: String): String;
begin
  for var i := 0 to qryListagem.Fields.Count - 1 do
  begin
    if lowerCase(qryListagem.Fields[i].FieldName) = lowerCase(campo) then
    begin
      Result := qryListagem.Fields[i].DisplayLabel;
      break;
    end;
  end;
end;

function TfrmTelaHeranca.Salvar(estadoCadastro: TEstadoCadastro): Boolean;
begin
  Result := True;
end;

procedure TfrmTelaHeranca.VerificarAlteracaoRegistro;
begin
  if qryListagem.RecordCount = 0 then
  begin
    MessageDlg('Atenção! Para alterar é necessário ter um registro cadastrado', mtInformation,[mbOk],0);
    abort;
  end;
end;

procedure TfrmTelaHeranca.BloquearCtrlDel(var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmTelaHeranca.brnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, false);
    VerificarAlteracaoRegistro;
  finally
    FEstadoCadastro := ecAlterar;
  end;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  try
    if Apagar then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparCampos;
      qryListagem.Refresh;
    end;
  finally
    FEstadoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);
    LimparCampos;
  finally
    FEstadoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    if Salvar(FEstadoCadastro) then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparCampos;
      qryListagem.Refresh;
    end;
  finally
    FEstadoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavegator, pgcPrincipal, false);
    LimparCampos;
  finally
    FEstadoCadastro := ecNovo;
  end;
end;

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,btnGravar, btnApagar: TBitBtn; btnNavegador: TDBNavigator; pgcPrincipal: TPageControl; flag: Boolean);
begin
  btnNovo.Enabled := flag;
  btnApagar.Enabled := flag;
  btnAlterar.Enabled := flag;
  btnNavegador.Enabled := flag;
  pgcPrincipal.Pages[0].TabVisible := flag;
  btnCancelar.Enabled := not flag;
  btnGravar.Enabled := not flag;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
begin
  if pgcPrincipal.Pages[indice].TabVisible  then
    pgcPrincipal.TabIndex := indice;
end;

procedure TfrmTelaHeranca.DesabilitarCampoPk;
begin
  for var i := 0 to ComponentCount - 1 do
  begin
    if (Components[i]) is TLabeledEdit then
      if (TLabeledEdit(Components[i]).Tag = 1) then
      begin
        TLabeledEdit(Components[i]).Enabled := False;
        Break;
      end;
  end;
end;

function TfrmTelaHeranca.Apagar: Boolean;
begin
  Result:= True;
end;

procedure TfrmTelaHeranca.ExibirCampoPesquisa(campo: String; tLabel: TLabel);
begin
  tLabel.Caption := RetornarCampoPesquisado(campo);
end;

end.
