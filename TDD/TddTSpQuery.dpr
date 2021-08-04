program TddTSpQuery;

uses
  Forms,
  TestFrameWork,
  GuiTestRunner,
  TspQueryTeste in 'TspQueryTeste.pas',
  uspQuery in '..\pacotes\uspQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
