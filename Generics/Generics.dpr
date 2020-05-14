program Generics;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form4},
  List in 'List.pas' {FrmList},
  Queue in 'Queue.pas' {FrmQueue},
  Method in 'Method.pas' {FrmMethod},
  Enum in 'Enum.pas' {FrmEnum},
  Basic in 'Basic.pas' {FrmBase},
  Interfaces in 'Interfaces.pas' {FrmInterfaces},
  Generic in 'Generic.pas' {FrmGeneric};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
