unit uEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmDados: TMemo;
    btnAdicionar: TButton;
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MeuEvento(AValue: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Pessoa;

{$R *.dfm}

procedure TForm1.btnAdicionarClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  LPessoa := TPessoa.Create;
  try
    LPessoa.MyEvent := MeuEvento;
    LPessoa.Nome := 'Andre';
    LPessoa.SobreNome := 'Oliveira';
    LPessoa.Cadastrar;
  finally
    LPessoa.Free
  end;
end;

procedure TForm1.MeuEvento(AValue: string);
begin
  mmDados.Lines.Add(AValue);
end;

end.
