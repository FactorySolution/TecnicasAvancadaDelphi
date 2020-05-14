unit Method;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TProduto = class
  private
    FDescricao: String;
    procedure SetDescricao(const Value: String);
  public
    constructor Create;
    property Descricao : String read FDescricao write SetDescricao;
  end;

  TUtis = class
    class function IIF<T>(Condition : Boolean; T1, T2 : T) : T;
  end;

  TFrmMethod = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  math, System.StrUtils;

{$R *.dfm}

procedure TFrmMethod.Button1Click(Sender: TObject);
var
  aux : String;
begin
  aux := TUtis.IIF<string>((Edit1.Text <> ''), Edit1.Text, 'Laranja');
  ShowMessage(aux);
end;

{ TUtis }

class function TUtis.IIF<T>(Condition: Boolean; T1, T2: T): T;
begin
  if Condition then
    Result := T1
  else
    Result := T2;
end;

{ TProduto }

constructor TProduto.Create;
begin
  FDescricao := 'Produto Generico';
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TFrmMethod.Button2Click(Sender: TObject);
var
  Prod1, Prod2 : TProduto;
begin
  Prod1 := TProduto.Create;
  Prod1.Descricao := 'Laranja Pera';


  Prod2 := TUtis.IIF<TProduto>(Assigned(Prod1 ), Prod1, TProduto.Create);

  ShowMessage(Prod2.Descricao);

end;

initialization
  RegisterClass(TFrmMethod);

end.
