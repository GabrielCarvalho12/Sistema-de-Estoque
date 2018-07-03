program Sistema;

uses
  Vcl.Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmPrincipal},
  URelatorio in 'URelatorio.pas' {frmRelatorio},
  Vcl.Themes,
  Vcl.Styles,
  ModConexao in 'ModConexao.pas' {DataModule1: TDataModule},
  UCliente in 'UCliente.pas' {frmCliente},
  UProduto in 'UProduto.pas' {frmProduto},
  UdmRelatorios in 'UdmRelatorios.pas' {dmrelatorios: TDataModule},
  Ufuncoes in 'Ufuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Slate Classico');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
