unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Datasnap.DBClient;

type
  TfrmClientes = class(TForm)
    SearchBox1: TSearchBox;
    btinserir: TButton;
    bdeditar: TButton;
    btsair: TButton;
    Clientes: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    DBListBox1: TDBListBox;
    dsclientes: TDataSource;
    ActionManagerCadastro: TActionManager;
    Panel1: TPanel;
    procedure btsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchBox1Change(Sender: TObject);
    procedure btinserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses ModConexao;

procedure TfrmClientes.btinserirClick(Sender: TObject);
begin
TClientDataset(dsclientes.DataSet).Open;
TClientDataset(dsclientes.DataSet).Insert;
end;

procedure TfrmClientes.btsairClick(Sender: TObject);
begin
close;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TClientDataSet(dsclientes.DataSet).Cancel;
TClientDataset(dsclientes.DataSet).Close;
end;

procedure TfrmClientes.SearchBox1Change(Sender: TObject);
begin
TClientDataset(dsclientes.DataSet).Close;
TClientDataset(dsclientes.DataSet).Open;
end;

end.
