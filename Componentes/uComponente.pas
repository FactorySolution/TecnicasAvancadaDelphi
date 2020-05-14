unit uComponente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, myComponent, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    MyComponent: TMyComponent;
    edtTexto: TLabeledEdit;
    mmEvento: TMemo;
    lblTotal: TLabel;
    Button1: TButton;
    procedure MyComponentStatus(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SayMyName(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  lblTotal.Caption := 'Total ' +  MyComponent.LengthString(edtTexto.Text).ToString;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  MyComponent.Status := SayMyName;
end;

procedure TForm2.MyComponentStatus(Sender: TObject);
begin
  mmEvento.Lines.Add(TMyComponent(Sender).OtherName);
end;

procedure TForm2.SayMyName(Sender: TObject);
begin
  mmEvento.Lines.Add(TMyComponent(Sender).OtherName);
end;

end.
