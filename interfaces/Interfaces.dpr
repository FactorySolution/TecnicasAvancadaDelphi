program Interfaces;

uses
  Vcl.Forms,
  uMainInterfaces in 'uMainInterfaces.pas' {Form3},
  uInterfaces in 'uInterfaces.pas',
  uResultadoSoma in 'uResultadoSoma.pas',
  uResultadoSubtracao in 'uResultadoSubtracao.pas',
  uTesteInterface in 'uTesteInterface.pas',
  UDependencyInjection in 'UDependencyInjection.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
