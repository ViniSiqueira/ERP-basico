program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDtmConexao in 'DataModule\uDtmConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadastroCategoria in 'Cadastro\uCadastroCategoria.pas' {frmCadastroCategoria},
  Enter in 'Terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadastroCliente in 'Cadastro\uCadastroCliente.pas' {frmCadastroCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uCadastroProduto in 'Cadastro\uCadastroProduto.pas' {frmCadastroProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  uFrmAtualizaDB in 'DataModule\uFrmAtualizaDB.pas' {frmAtualizaDB},
  uDtmVenda in 'DataModule\uDtmVenda.pas' {dtmVenda: TDataModule},
  uProcessoVenda in 'Processo\uProcessoVenda.pas' {frmProcessoVenda},
  cProcessoVenda in 'Classes\cProcessoVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmVenda, dtmVenda);
  Application.CreateForm(TfrmProcessoVenda, frmProcessoVenda);
  Application.Run;
end.
