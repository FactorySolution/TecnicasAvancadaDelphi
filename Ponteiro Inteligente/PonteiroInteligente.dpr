program PonteiroInteligente;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  SmartPoint in 'SmartPoint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
