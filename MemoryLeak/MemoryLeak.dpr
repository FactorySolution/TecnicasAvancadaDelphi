program MemoryLeak;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form5},
  Interfaces in 'Interfaces.pas',
  Utils in 'Utils.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
