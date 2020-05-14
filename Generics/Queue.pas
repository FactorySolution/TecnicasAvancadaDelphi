unit Queue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TFrmQueue = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    Fila : TQueue<String>;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmQueue.Button1Click(Sender: TObject);
begin
  Fila.Enqueue(Edit1.Text);
end;

procedure TFrmQueue.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add(Fila.Dequeue);
end;

procedure TFrmQueue.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Add(Fila.Extract);
end;

procedure TFrmQueue.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Add(Fila.Peek);
end;

procedure TFrmQueue.Button5Click(Sender: TObject);
begin
  Fila.TrimExcess;
end;

procedure TFrmQueue.Button6Click(Sender: TObject);
begin
  Memo1.Lines.Add(Fila.Count.ToString);
end;

procedure TFrmQueue.Button7Click(Sender: TObject);
begin
  Memo1.Lines.Add(Fila.Capacity.ToString);
end;

procedure TFrmQueue.FormCreate(Sender: TObject);
begin
  Fila := TQueue<String>.Create;
end;

initialization
  RegisterClass(TFrmQueue);

end.
