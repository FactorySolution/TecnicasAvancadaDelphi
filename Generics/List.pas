unit List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TFrmList = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    ListaNum : TList<Integer>;
    procedure Notificacao (Sender : TObject; const Item : Integer; Action : TCollectionNotification);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmList.Button1Click(Sender: TObject);
begin
  ListaNum.Add(StrToInt(Edit1.Text));
end;

procedure TFrmList.Button2Click(Sender: TObject);
var
  I: Integer;
  A: Integer;
  J: TEnumerator<Integer>;
begin
  Memo1.Lines.Clear;

  for A in ListaNum do
  begin
    Memo1.Lines.Add(A.ToString)
  end;

  J := ListaNum.GetEnumerator;

  while j.MoveNext do
     Memo1.Lines.Add(j.Current.ToString);


  for I := 0 to Pred(ListaNum.Count) do
    Memo1.Lines.Add(ListaNum[I].ToString)
end;

procedure TFrmList.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ListaNum.Capacity.ToString);
end;

procedure TFrmList.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ListaNum.Count.ToString);
end;

procedure TFrmList.Button5Click(Sender: TObject);
begin
  ListaNum.OnNotify := Notificacao;
end;

procedure TFrmList.Button6Click(Sender: TObject);
begin
  ListaNum.Delete(Pred(ListaNum.Count));
end;

procedure TFrmList.FormCreate(Sender: TObject);
begin
  ListaNum := TList<Integer>.Create;
end;

procedure TFrmList.Notificacao(Sender: TObject; const Item: Integer;
  Action: TCollectionNotification);
begin
  case Action of
    cnAdded: Memo1.Lines.Add('O Item ' + Item.ToString + ' foi adicionado');
    cnRemoved: Memo1.Lines.Add('O Item ' + Item.ToString + ' foi removido');
    cnExtracted: Memo1.Lines.Add('O Item ' + Item.ToString + ' foi extraido');
  end;
end;

initialization
  RegisterClass(TFrmList);

end.
