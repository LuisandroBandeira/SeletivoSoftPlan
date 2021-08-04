program ProvaDelphiApp;

uses
  Vcl.Forms,
  ufPrincipal in 'ufPrincipal.pas' {fTarefas},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  uProgresso in 'uProgresso.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfTarefas, fTarefas);
  Application.Run;
end.
