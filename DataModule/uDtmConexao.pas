unit uDtmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdtmConexao = class(TDataModule)
    conexaoDB: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
