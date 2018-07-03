unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDataModule1 = class(TDataModule)
    SQLConnection: TSQLConnection;
    sdsclientes: TSQLDataSet;
    dspclientes: TDataSetProvider;
    cdsclientes: TClientDataSet;
    sdsprodutos: TSQLDataSet;
    dspprodutos: TDataSetProvider;
    cdsprodutos: TClientDataSet;
    cdsclientescodigo: TIntegerField;
    cdsclientesnome: TStringField;
    cdsclientescpf: TStringField;
    cdsclientesendereco: TStringField;
    cdsclientescidade: TStringField;
    cdsclientesuf: TStringField;
    cdsclientescep: TStringField;
    cdsclientesfone: TStringField;
    cdsclientesemail: TStringField;
    cdsprodutoscodigo: TIntegerField;
    cdsprodutosnome: TStringField;
    cdsprodutosfabricante: TStringField;
    cdsprodutosquantidade: TIntegerField;
    cdsprodutoscusto: TSingleField;
    cdsprodutospreco: TSingleField;
    cdsprodutosunidade: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
