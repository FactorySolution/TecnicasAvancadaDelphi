program RTTI;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  Atributos in 'Atributos.pas',
  Pessoa in 'Pessoa.pas',
  Utils in 'Utils.pas',
  Controller in 'Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
