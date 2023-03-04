unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDtmConexao, Enter;

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
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure CriarConexaoComBanco;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uCadastroCategoria;

procedure TfrmPrincipal.CriarConexaoComBanco;
begin
  dtmConexao := TdtmConexao.Create(Self);
  dtmConexao.ConexaoDB.SQLHourGlass := true;
  dtmConexao.ConexaoDB.Protocol := 'mssql';
  dtmConexao.ConexaoDB.LibraryLocation := 'C:\Users\vinic\Documents\ProjetoDelphi\ntwdblib.dll';
  dtmConexao.ConexaoDB.Hostname := '.\SQLEXPRESS';
  dtmConexao.ConexaoDB.Port := 1433;
  dtmConexao.ConexaoDB.DataBase := 'VINICIUS_PRD';
  dtmConexao.ConexaoDB.Connected := true;
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

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  application.Terminate;
end;

end.
