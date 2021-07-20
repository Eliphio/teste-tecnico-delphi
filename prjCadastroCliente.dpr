program prjCadastroCliente;

uses
  Vcl.Forms,
  untCadastroCliente in 'untCadastroCliente.pas' {frmCadCliente},
  uCliente in 'classes\uCliente.pas',
  uEmail in 'classes\uEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
