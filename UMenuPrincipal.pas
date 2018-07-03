unit UMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    BtnClientes: TSpeedButton;
    BtnProdutos: TSpeedButton;
    BtnRelatorio: TSpeedButton;
    Image1: TImage;
    BtnSair: TSpeedButton;
    dsclientes: TDataSource;
    dsprodutos: TDataSource;
    procedure BtnClientesClick(Sender: TObject);
    procedure BtnProdutosClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UClientes, UProdutos, URelatorio, UCliente, UProduto, ModConexao;

procedure TfrmPrincipal.BtnClientesClick(Sender: TObject);
begin

TClientDataset(dsclientes.DataSet).Open;

try
    Application.CreateForm(TfrmCliente,frmClientes);
    frmClientes.ShowModal;
finally

    FreeAndNil(frmClientes);

end;

end;

procedure TfrmPrincipal.BtnProdutosClick(Sender: TObject);
begin

TClientDataset(dsprodutos.DataSet).Open;

try
    Application.CreateForm(TfrmProduto,frmProduto);
    frmProduto.ShowModal;
finally

    FreeAndNil(frmProduto);

end;

end;

procedure TfrmPrincipal.BtnRelatorioClick(Sender: TObject);
begin

try
    Application.CreateForm(TfrmRelatorio, frmRelatorio);
    frmRelatorio.ShowModal;
finally

    FreeAndNil(frmRelatorio);

end;

end;



procedure TfrmPrincipal.BtnSairClick(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente sair ?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

Application.Terminate

else
abort;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Deseja realmente sair ?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

Application.Terminate

else
abort;

end;

end.
