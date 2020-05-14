unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnValidar: TButton;
    btn1: TButton;
    btn2: TButton;
    procedure btnValidarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Pessoa, Utils, System.Generics.Collections;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
  Pessoa.Nome := 'Andre';
  Pessoa.SobreNome := 'Oli';
  Pessoa.Idade := 0;

  ShowMessage(TUtils.invoke('Controller.TController', 'saveOrUpdate', ['Andre']));
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;

  Pessoa.Nome := 'Andre';
  Pessoa.SobreNome := 'Oli';
  Pessoa.Idade := 0;
  ShowMessage(TUtils.invokeCreate('Controller.TControllerB', 'saveOrUpdate', [Pessoa]));
end;


procedure TForm1.btnValidarClick(Sender: TObject);
var
  Pessoa: TPessoa;
  Retorno: TList<string>;
  Msg, error: string;
begin
  Pessoa := TPessoa.Create;

  Pessoa.Nome := 'Andre';
  Pessoa.SobreNome := '';
  Pessoa.Idade := 1;

  Retorno := TUtils.Validar(Pessoa);

  if Retorno.Count > 0 then
  begin
    error := '';
    for Msg in Retorno do
    begin
      error := error + Msg + #13 + #10;
    end;
    ShowMessage(error);
  end;

end;

end.

