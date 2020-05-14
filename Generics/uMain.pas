unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateForm(AFormName: string);
  public
    { Public declarations }
  end;

  TPessoa = class
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    property Nome: string read FNome write SetNome;
  end;


implementation

uses
  Basic,
  Generic,
  Method,
  Enum,
  Interfaces,
  List,
  Queue,
  System.Generics.Collections;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  CreateForm(TFrmBase.ClassName);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  CreateForm(TFrmMethod.ClassName);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  CreateForm(TFrmGeneric.ClassName);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  CreateForm(TFrmEnum.ClassName);
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  CreateForm(TFrmInterfaces.ClassName);
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  CreateForm(TFrmList.ClassName);
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  CreateForm(TFrmQueue.ClassName);
end;

procedure TForm4.CreateForm(AFormName: string);
var
  LForm: TForm;
  LFormClass: TFormClass;
begin
  LFormClass := TFormClass(FindClass(AFormName));
  if Assigned(LFormClass) then
  begin
    LForm := LFormClass.Create(Self);
    try
      LForm.Position := poScreenCenter;
      LForm.ShowModal;
    finally
      FreeAndNil(LForm);
    end;
  end;
end;

{ TPessoa }

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
