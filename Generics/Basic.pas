unit Basic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TKeyValue<T> = class
  private
    FKey: String;
    FValue: T;
    procedure SetKey(const Value: String);
    procedure SetValue(const Value: T);
  public
    property Key : String read FKey write SetKey;
    property Value : T read FValue write SetValue;
  end;


  TFrmBase = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmBase.Button1Click(Sender: TObject);
var
  KV  : TKeyValue<Integer>;
  KV2 : TKeyValue<string>;
begin
  KV := TKeyValue<Integer>.Create;
  try
    KV.Key := 'F1';
    KV.Value := 100;

    ShowMessage(KV.Key + ' - ' + KV.Value.ToString);
  finally
    KV.Free;
  end;

  try
    KV2 := TKeyValue<string>.Create;
    KV2.Key := 'F1';
    KV2.Value := '100';

    ShowMessage(KV2.Key + ' - ' + KV2.Value);
  finally
    KV2.Free;
  end;
end;

{ TKeyValue<T> }

procedure TKeyValue<T>.SetKey(const Value: String);
begin
  FKey := Value;
end;

procedure TKeyValue<T>.SetValue(const Value: T);
begin
  FValue := Value;
end;

initialization
  RegisterClass(TFrmBase);

end.
