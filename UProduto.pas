unit UProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmProduto = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    dsprodutos: TDataSource;
    ImageListCadastro: TImageList;
    PageControl1: TPageControl;
    Label1: TLabel;
    btnfiltrar: TButton;
    editpesquisar: TEdit;
    Pesquisa: TTabSheet;
    DbgDados: TDBGrid;
    actacoes: TActionList;
    Inserir: TAction;
    Editar: TAction;
    Excluir: TAction;
    Pesquisar: TAction;
    Fechar: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Salvar: TAction;
    Cancelar: TAction;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label2: TLabel;
    cbxfiltros: TComboBoxEx;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DbeCodigo: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btinserirClick(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure CancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalvarUpdate(Sender: TObject);
    procedure Inserir2Execute(Sender: TObject);
    procedure Editar2Execute(Sender: TObject);
    procedure Excluir2Execute(Sender: TObject);
    procedure Pesquisar2Execute(Sender: TObject);
    procedure Fechar2Execute(Sender: TObject);
    procedure Inserir2Update(Sender: TObject);
    procedure Editar2Update(Sender: TObject);
    procedure Excluir2Update(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure LimparTudo;
    procedure LimparFiltro;

  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses ModConexao;

procedure TfrmProduto.Inserir2Execute(Sender: TObject);
begin
LimparFiltro;

if PageControl1.ActivePage = Pesquisa then
PageControl1.ActivePage := Pesquisa;
if not TClientDataset(dsprodutos.DataSet).Active then

TClientDataset(dsprodutos.DataSet).Open;
TClientDataset(dsprodutos.DataSet).Insert;
end;

procedure TfrmProduto.Inserir2Update(Sender: TObject);
begin
Inserir.Enabled := dsprodutos.State in [dsBrowse,dsInactive];
end;


procedure TfrmProduto.btinserirClick(Sender: TObject);
begin
TClientDataset(dsprodutos.DataSet).Open;
TClientDataset(dsprodutos.DataSet).Insert;
end;


procedure TfrmProduto.btnfiltrarClick(Sender: TObject);
begin
 if editpesquisar.Text = '' then

 begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   editpesquisar.SetFocus;
   Abort;
 end;

  DataModule1.cdsprodutos.Close;
  case cbxfiltros.ItemIndex of
   0 : DataModule1.cdsprodutos.CommandText := 'SELECT * FROM produtos WHERE codigo LIKE '+QuotedStr('%'+editpesquisar.Text+'%');
   1 : DataModule1.cdsprodutos.CommandText := 'SELECT * FROM produtos WHERE nome LIKE '+QuotedStr('%'+editpesquisar.Text+'%');
   2 : DataModule1.cdsprodutos.CommandText := 'SELECT * FROM produtos WHERE fabricante LIKE '+QuotedStr('%'+ editpesquisar.Text+'%');
  end;
  DataModule1.cdsprodutos.Open;
end;

procedure TfrmProduto.CancelarExecute(Sender: TObject);
begin
LimparTudo;
TClientDataSet(dsprodutos.DataSet).Cancel;
end;

procedure TfrmProduto.CancelarUpdate(Sender: TObject);
begin
Cancelar.Enabled := Salvar.Enabled = true;
end;

procedure TfrmProduto.DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

begin

  if not odd(DataModule1.cdsprodutos.RecNo) then
  begin
    DbgDados.Canvas.Brush.Color:= clSilver;
    DbgDados.Canvas.FillRect(Rect);
    DbgDados.DefaultDrawDataCell(Rect, Column.Field, State);

    if gdFocused in State then
    begin
      DbgDados.Canvas.Brush.Color:= clBlack;
      DbgDados.Canvas.FillRect(Rect);
      DbgDados.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;

end;

procedure TfrmProduto.Editar2Execute(Sender: TObject);
begin

if dsprodutos.State in  [dsInsert] then
if PageControl1.ActivePage = Pesquisa then
PageControl1.ActivePage := Pesquisa;
TClientDataset(dsprodutos.DataSet).Open;
TClientDataSet(dsprodutos.DataSet).Edit;
end;

procedure TfrmProduto.Editar2Update(Sender: TObject);
begin
if (not TClientDataSet(dsprodutos.DataSet).IsEmpty) then

Editar.Enabled := Inserir.Enabled = true;
end;


procedure TfrmProduto.Excluir2Execute(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsprodutos.DataSet).Delete;
      TClientDataSet(dsprodutos.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro excluido com sucesso.', 'Informação', MB_OK);
      TClientDataSet(dsprodutos.DataSet).Open;

      except on E : Exception do
      raise Exception.Create('Erro ao excluir registro: '+ E.Message);

    end;
  end;

  LimparFiltro;
end;

procedure TfrmProduto.Excluir2Update(Sender: TObject);
begin
if (not TClientDataSet(dsprodutos.DataSet).IsEmpty) then
Excluir.Enabled := dsprodutos.State in [dsEdit];
end;



procedure TfrmProduto.Fechar2Execute(Sender: TObject);
begin
close;
LimparFiltro;
end;

procedure TfrmProduto.FecharExecute(Sender: TObject);
begin
close;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TClientDataSet(dsprodutos.DataSet).Cancel;
    TClientDataSet(dsprodutos.DataSet).Close;
end;

procedure TfrmProduto.LimparTudo;
var
  i:integer;
begin
for i := 0 to ComponentCount -1  do
begin
  if Components[i] is TCustomEdit then
     TCustomEdit(Components[i]).Clear;
end;
      if PageControl1.ActivePage = Pesquisa then
        PageControl1.ActivePage := Pesquisa;

end;

procedure TfrmProduto.LimparFiltro;
begin

DataModule1.cdsprodutos.Close;
DataModule1.cdsprodutos.CommandText := 'SELECT * FROM produtos';
DataModule1.cdsprodutos.Open;

end;

procedure TfrmProduto.Pesquisar2Execute(Sender: TObject);
begin
LimparFiltro;

TClientDataSet(dsprodutos.DataSet).Close;
TClientDataSet(dsprodutos.DataSet).Open;

Excluir.Enabled := False;
Editar.Enabled := False;
Cancelar.Enabled := False;

end;


procedure TfrmProduto.SalvarExecute(Sender: TObject);
begin
try

TClientDataSet(dsprodutos.DataSet).Post;
TClientDataSet(dsprodutos.DataSet).ApplyUpdates(0);

      case dsprodutos.State of
      dsEdit : Application.MessageBox('Registro atualizado com sucesso.', 'Informação', MB_OK+MB_ICONINFORMATION);
      dsInsert : Application.MessageBox('Registro inserido com sucesso.', 'Informação', MB_OK+MB_ICONINFORMATION);
      end;

        //limpar os campos
        LimparTudo;
        TClientDataSet(dsprodutos.DataSet).Open;

except  on E : Exception do
raise Exception.Create('Erro ao Salvar Registro: '+ E.Message);

end;
end;

procedure TfrmProduto.SalvarUpdate(Sender: TObject);
begin
Salvar.Enabled := dsprodutos.State in [dsInsert, dsEdit];
end;


end.
