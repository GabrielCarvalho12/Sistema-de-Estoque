unit UCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCliente = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ImageListCadastro: TImageList;
    PageControl1: TPageControl;
    Label1: TLabel;
    btnfiltrar: TButton;
    editpesquisar: TEdit;
    Pesquisa: TTabSheet;
    actacoes: TActionList;
    Inserir: TAction;
    Excluir: TAction;
    Pesquisar: TAction;
    Fechar: TAction;
    SpeedButton1: TSpeedButton;
    Salvar: TAction;
    Cancelar: TAction;
    dsclientes: TDataSource;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Editar: TAction;
    SpeedButton8: TSpeedButton;
    cbxfiltros: TComboBoxEx;
    Label2: TLabel;
    DbgDados: TDBGrid;
    DbeCodigo: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure btinserirClick(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure CancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pesquisa2Show(Sender: TObject);
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
    procedure DimensionarGrid(dbg: TDbGrid; var formulario);
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
  frmProduto: TfrmCliente;

implementation

{$R *.dfm}

uses ModConexao, UMenuPrincipal;

procedure TfrmCliente.Inserir2Execute(Sender: TObject);
begin
LimparFiltro;

if PageControl1.ActivePage = Pesquisa then
PageControl1.ActivePage := Pesquisa;
if not TClientDataset(dsclientes.DataSet).Active then

TClientDataset(dsclientes.DataSet).Open;
TClientDataset(dsclientes.DataSet).Insert;
end;

procedure TfrmCliente.Inserir2Update(Sender: TObject);
begin
Inserir.Enabled := dsclientes.State in [dsBrowse,dsInactive];
end;


procedure TfrmCliente.btinserirClick(Sender: TObject);
begin
TClientDataset(dsclientes.DataSet).Open;
TClientDataset(dsclientes.DataSet).Insert;
end;


procedure TfrmCliente.btnfiltrarClick(Sender: TObject);
begin
 if editpesquisar.Text = '' then

 begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   editpesquisar.SetFocus;
   Abort;
 end;

  DataModule1.cdsclientes.Close;
  case cbxfiltros.ItemIndex of
   0 : DataModule1.cdsclientes.CommandText := 'SELECT * FROM clientes WHERE codigo LIKE '+QuotedStr('%'+editpesquisar.Text+'%');
   1 : DataModule1.cdsclientes.CommandText := 'SELECT * FROM clientes WHERE nome LIKE '+QuotedStr('%'+editpesquisar.Text+'%');
   2 : DataModule1.cdsclientes.CommandText := 'SELECT * FROM clientes WHERE cpf LIKE '+QuotedStr('%'+ editpesquisar.Text+'%');
  end;
  DataModule1.cdsclientes.Open;
end;

procedure TfrmCliente.CancelarExecute(Sender: TObject);
begin
LimparTudo;
TClientDataSet(dsclientes.DataSet).Cancel;
end;

procedure TfrmCliente.CancelarUpdate(Sender: TObject);
begin
Cancelar.Enabled := Salvar.Enabled = true;
end;

procedure TfrmCliente.DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  begin

  if not odd(DataModule1.cdsclientes.RecNo) then
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

procedure TfrmCliente.Editar2Execute(Sender: TObject);
begin

if dsclientes.State in  [dsInsert] then
if PageControl1.ActivePage = Pesquisa then
PageControl1.ActivePage := Pesquisa;
TClientDataset(dsclientes.DataSet).Open;
TClientDataSet(dsclientes.DataSet).Edit;
end;

procedure TfrmCliente.Editar2Update(Sender: TObject);
begin
if (not TClientDataSet(dsclientes.DataSet).IsEmpty) then

Editar.Enabled := Inserir.Enabled = true;
end;


procedure TfrmCliente.Excluir2Execute(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsclientes.DataSet).Delete;
      TClientDataSet(dsclientes.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro excluido com sucesso.', 'Informação', MB_OK);
      TClientDataSet(dsclientes.DataSet).Open;

      except on E : Exception do
      raise Exception.Create('Erro ao excluir registro: '+ E.Message);

    end;
  end;

  LimparFiltro;
end;

procedure TfrmCliente.Excluir2Update(Sender: TObject);
begin
if (not TClientDataSet(dsclientes.DataSet).IsEmpty) then
Excluir.Enabled := dsclientes.State in [dsEdit];
end;



procedure TfrmCliente.Fechar2Execute(Sender: TObject);
begin
close;
LimparFiltro;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TClientDataSet(dsclientes.DataSet).Cancel;
    TClientDataSet(dsclientes.DataSet).Close;
end;

procedure TfrmCliente.LimparTudo;
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

procedure TfrmCliente.LimparFiltro;
begin

DataModule1.cdsclientes.Close;
DataModule1.cdsclientes.CommandText := 'SELECT * FROM clientes';
DataModule1.cdsclientes.Open;

end;

procedure TfrmCliente.Pesquisar2Execute(Sender: TObject);
begin
LimparFiltro;

TClientDataSet(dsclientes.DataSet).Close;
TClientDataSet(dsclientes.DataSet).Open;

Excluir.Enabled := False;
Editar.Enabled := False;
Cancelar.Enabled := False;

end;


procedure TfrmCliente.Pesquisa2Show(Sender: TObject);
begin
PageControl1.ActivePage := Pesquisa;
end;


procedure TfrmCliente.SalvarExecute(Sender: TObject);
begin
try

TClientDataSet(dsclientes.DataSet).Post;
TClientDataSet(dsclientes.DataSet).ApplyUpdates(0);

      case dsclientes.State of
      dsEdit : Application.MessageBox('Registro atualizado com sucesso.', 'Informação', MB_OK+MB_ICONINFORMATION);
      dsInsert : Application.MessageBox('Registro inserido com sucesso.', 'Informação', MB_OK+MB_ICONINFORMATION);
      end;

        //limpar os campos
        LimparTudo;
        TClientDataSet(dsclientes.DataSet).Open;

except  on E : Exception do
raise Exception.Create('Erro ao Salvar Registro: '+ E.Message);

end;
end;

procedure TfrmCliente.SalvarUpdate(Sender: TObject);
begin
Salvar.Enabled := dsclientes.State in [dsInsert, dsEdit];
end;

procedure TfrmCliente.DimensionarGrid(dbg: TDbGrid; var formulario);
   type
      TArray = Array of integer;
   procedure AjustarColumns(Swidth,TSize:integer;Asize:TArray);
     var
       idx:integer;
   begin
     if Tsize = 0 then
        begin
           Tsize:=dbg.Columns.Count;
             for idx:=0 to dbg.Columns.Count-1 do
               dbg.Columns[Idx].Width:=
                     (dbg.Width- dbg.Canvas.TextWidth('AAAAAA')) div Tsize
        end
     else
      for idx:=0 to dbg.Columns.Count-1 do
        dbg.Columns[Idx].Width:=dbg.Columns[Idx].Width + (Swidth*Asize[idx] div Tsize);
    end;
  var
   Idx,Twidth,Tsize,Swidth: Integer;
   AWidth:TArray;
   Asize:TArray;
   NomeColuna:String;
 begin
   SetLength(AWidth,dbg.Columns.Count);
   SetLength(ASize,dbg.Columns.Count);
   TWidth:=0;
   TSize:=0;
     for Idx := 0 to dbg.Columns.Count - 1  do
        begin
          NomeColuna:=Dbg.Columns[Idx].Title.Caption;
          dbg.Columns[Idx].Width :=
                   dbg.Canvas.TextWidth(Dbg.Columns[Idx].Title.Caption+'A');
          AWidth[idx]:=dbg.Columns[Idx].Width;
          TWidth:= TWidth + AWidth[idx];
          Asize[idx]:= dbg.Columns[idx].Field.Size;
          Tsize:= Tsize+Asize[idx];
       end;
if dgColLines in dbg.Options then
     TWidth:= TWidth+ Dbg.Columns.Count;

//adiciona a largura da coluna indicada do cursor
if dgIndicator in Dbg.Options then
    TWidth:=TWidth+IndicatorWidth;

Swidth:=dbg.ClientWidth - TWidth;
AjustarColumns(Swidth,TSize,Asize);
dbg.Width:=dbg.Width + dbg.Canvas.TextWidth('AAAAAA');
Dbg.Left:=(Tform(formulario).Width - dbg.Width) div 2 -
          (dbg.Canvas.TextWidth('AA') div 2);
 end;

end.
