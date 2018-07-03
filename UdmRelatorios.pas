unit UdmRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet;

type
  Tdmrelatorios = class(TDataModule)
    frxReportCliente: TfrxReport;
    frxDBdsclientes: TfrxDBDataset;
    frxDBdsprodutos: TfrxDBDataset;
    frxReportProduto: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmrelatorios: Tdmrelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ModConexao;

{$R *.dfm}

end.
