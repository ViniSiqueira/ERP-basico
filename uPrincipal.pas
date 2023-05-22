unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDtmConexao, Enter, uFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    menuCadastro: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    menuCliente: TMenuItem;
    N1: TMenuItem;
    menuCategoria: TMenuItem;
    menuProduto: TMenuItem;
    N3: TMenuItem;
    menuFechar: TMenuItem;
    menuVendas: TMenuItem;
    menuRelatorioCliente: TMenuItem;
    N4: TMenuItem;
    menuRelatorioProduto: TMenuItem;
    N5: TMenuItem;
    menuRelatorioVendaporData: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuCategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure menuClienteClick(Sender: TObject);
    procedure menuProdutoClick(Sender: TObject);
    procedure menuVendasClick(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure CriarConexaoComBanco;
    procedure AtualizacaoBancoDados(form: TfrmAtualizaDB);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uCadastroCategoria, uCadastroCliente, uCadastroProduto, uProcessoVenda;

procedure TfrmPrincipal.AtualizacaoBancoDados(form: TfrmAtualizaDB);
begin
  form.cbConexao.Checked := True;
  form.Refresh;
  Sleep(1000);
  dtmConexao.qryTabelas.ExecSql;
  form.cbTabelas.Checked := True;
  form.Refresh;
  Sleep(1000);
end;

procedure TfrmPrincipal.CriarConexaoComBanco;
begin
  frmAtualizaDB := TfrmAtualizaDB.Create(self);
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;

  dtmConexao := TdtmConexao.Create(Self);
  dtmConexao.ConexaoDB.SQLHourGlass := true;
  dtmConexao.ConexaoDB.Protocol := 'mssql';
  dtmConexao.ConexaoDB.LibraryLocation := 'C:\Users\vinic\Documents\ProjetoDelphi\ntwdblib.dll';
  dtmConexao.ConexaoDB.Hostname := '.\SQLEXPRESS';
  dtmConexao.ConexaoDB.Port := 1433;
  dtmConexao.ConexaoDB.DataBase := 'VINICIUS_PRD';
  dtmConexao.ConexaoDB.Connected := true;

  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CriarConexaoComBanco;

  TeclaEnter := TMREnter.Create(Self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.menuCategoriaClick(Sender: TObject);
begin
  frmCadastroCategoria := TfrmCadastroCategoria.Create(self);
  frmCadastroCategoria.ShowModal;
  frmCadastroCategoria.Release;
end;

procedure TfrmPrincipal.menuClienteClick(Sender: TObject);
begin
  frmCadastroCliente := TfrmCadastroCliente.Create(self);
  frmCadastroCliente.ShowModal;
  frmCadastroCliente.Release;
end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmPrincipal.menuProdutoClick(Sender: TObject);
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(self);
  frmCadastroProduto.ShowModal;
  frmCadastroProduto.Release;
end;

procedure TfrmPrincipal.menuVendasClick(Sender: TObject);
begin
  frmProcessoVenda := TfrmProcessoVenda.Create(self);
  frmProcessoVenda.ShowModal;
  frmProcessoVenda.Release;
end;

end.
