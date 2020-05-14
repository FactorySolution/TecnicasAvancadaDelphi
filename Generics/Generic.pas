unit Generic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type

  TPessoa = class
  private
    FNome: String;
    procedure SetNome(const Value: String);
  public
    property Nome : String read FNome write SetNome;
  end;


  TMyGeneric<T : constructor> = class
    FObject : T;
    constructor Create;
    function GetObject : T;
  end;

  TFrmGeneric = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmGeneric.Button1Click(Sender: TObject);
var
  LMyGeneric : TMyGeneric<TPessoa>;
begin
  LMyGeneric := TMyGeneric<TPessoa>.Create;
  try
    LMyGeneric.FObject.Nome := 'André Oliveira';
  finally
    LMyGeneric.Free;
  end;
end;

{ TPessoa }

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TMyGeneric<T> }

constructor TMyGeneric<T>.Create;
begin
  FObject := T.Create;
end;

function TMyGeneric<T>.GetObject: T;
begin
  Result := FObject;
end;

initialization
  RegisterClass(TFrmGeneric);

end.
