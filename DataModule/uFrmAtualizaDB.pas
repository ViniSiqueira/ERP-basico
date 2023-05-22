unit uFrmAtualizaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmAtualizaDB = class(TForm)
    pnlAtualizaDB: TPanel;
    pnlAtualizaSuperior: TPanel;
    imgAtualiza: TImage;
    lblAtualizacao: TLabel;
    cbConexao: TCheckBox;
    cbTabelas: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaDB: TfrmAtualizaDB;

implementation

{$R *.dfm}

end.
