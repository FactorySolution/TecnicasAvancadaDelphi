program Eventos;

uses
  Vcl.Forms,
  uEventos in 'uEventos.pas' {Form1},
  Pessoa in 'Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
