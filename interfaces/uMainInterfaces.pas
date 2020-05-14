unit uMainInterfaces;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uInterfaces;

type
  TForm3 = class(TForm)
    btnSomar: TButton;
    btnSubtrair: TButton;
    edtValorA: TLabeledEdit;
    edtValorb: TLabeledEdit;
    mmResults: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
   LResultadoSoma: IResultado;
   LResultadoSub:  IResultado;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  uResultadoSoma, uResultadoSubtracao, uTesteInterface, UDependencyInjection;

{$R *.dfm}

procedure TForm3.btnSomarClick(Sender: TObject);
begin
  ShowMessage(LResultadoSoma.Resultado(StrToFloatDef(edtValorA.Text, 0),
                                   StrToFloatDef(edtValorB.Text, 0)));
end;

procedure TForm3.btnSubtrairClick(Sender: TObject);
begin
  ShowMessage(LResultadoSub.Resultado(StrToFloatDef(edtValorA.Text, 0),
                                   StrToFloatDef(edtValorB.Text, 0)));
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  Values: string;
begin
  mmResults.Lines.Add('Soma');
  for Values in LResultadoSoma.AllResults do
    mmResults.Lines.Add(Values);

  mmResults.Lines.Add('subtraçao');

  for Values in LResultadoSub.AllResults do
    mmResults.Lines.Add(Values);

end;

procedure TForm3.Button2Click(Sender: TObject);
var
  LTesteInterface: ITesteInterface;
begin
  LTesteInterface := TTesteInterface.
                        New.
                          SetName('Andre').
                          SetSobreNome('Oliveira');

  //LTesteInterface.SetName('Andre').SetSobreNome('Oliveira');


  ShowMessage(LTesteInterface.GetName);


end;

procedure TForm3.Button3Click(Sender: TObject);
//var
//  LDependency: IDependencyInjection;
begin

  //LDependency := TDependencyInjection.New(LResultadoSoma).Calcular(1,1);

  ShowMessage(TDependencyInjection.New(LResultadoSub).Calcular(1,1).Result);

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  LResultadoSoma := TResultadoSoma.Create;
  LResultadoSub  :=  TResultadoSubtracao.Create;
end;

end.
