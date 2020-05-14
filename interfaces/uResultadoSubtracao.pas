unit uResultadoSubtracao;

interface

uses
  uInterfaces,
  System.Generics.Collections;


type
  TResultadoSubtracao = class(TInterfacedObject, IResultado)
  private
    FResults: TList<String>;
  public
    function Resultado(A: Double; B: Double): string;
    function AllResults: TList<string>;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  System.SysUtils;

{ TResultadoSubtracao }

function TResultadoSubtracao.AllResults: TList<System.string>;
begin
  Result := FResults;
end;

constructor TResultadoSubtracao.Create;
begin
  FResults := TList<string>.Create;
end;

destructor TResultadoSubtracao.Destroy;
begin
  FResults.Free;
  inherited;
end;

function TResultadoSubtracao.Resultado(A, B: Double): string;
begin
  Result := FloatToStr(A-B);
  FResults.Add(Result);
end;

end.
