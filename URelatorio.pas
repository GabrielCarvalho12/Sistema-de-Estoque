unit URelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TfrmRelatorio = class(TForm)
    ImageListRelatorio: TImageList;
    actacoes: TActionList;
    btncliente: TAction;
    btnproduto: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnclienteExecute(Sender: TObject);
    procedure btnprodutoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses UdmRelatorios;


procedure TfrmRelatorio.btnclienteExecute(Sender: TObject);
begin
//
end;

procedure TfrmRelatorio.btnprodutoExecute(Sender: TObject);
begin
//
end;

procedure TfrmRelatorio.SpeedButton1Click(Sender: TObject);
begin
dmrelatorios := TdmRelatorios.Create(nil);
try
dmrelatorios.frxReportProduto.LoadFromFile(ExtractFilePath(Application.ExeName)+'relatorios\RelProdutos.fr3');
dmrelatorios.frxReportProduto.ShowReport(true);
finally
FreeAndNil(dmrelatorios);
end;
end;

procedure TfrmRelatorio.SpeedButton2Click(Sender: TObject);
begin
dmrelatorios := TdmRelatorios.Create(nil);
try
dmrelatorios.frxReportCliente.LoadFromFile(ExtractFilePath(Application.ExeName)+'relatorios\RelClientes.fr3');
dmrelatorios.frxReportCliente.ShowReport(true);
finally
FreeAndNil(dmrelatorios);
end;
end;

end.
