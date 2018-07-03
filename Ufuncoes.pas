unit Ufuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.Buttons, Data.DBXMySQL, Data.FMTBcd, Datasnap.Provider, Data.DB, Data.SqlExpr;

  function GetId (Campo, Tabela : String) : Integer;

implementation

uses ModConexao, UCliente, UMenuPrincipal;

function GetId (Campo, Tabela : String) : Integer;
  begin
    with
    TSQLQuery.Create(nil) do
    try
      SQLConnection := DataModule1.SQLConnection;
      sql.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
      open;
      result := Fields[0].AsInteger + 1;
    finally
      close;
      free;

    end;
  end;

end.
