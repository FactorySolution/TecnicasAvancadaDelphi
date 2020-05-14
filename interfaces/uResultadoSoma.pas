unit uResultadoSoma;

interface

uses
  uInterfaces,
  System.Generics.Collections;

type
  TResultadoSoma = class(TInterfacedObject, IResultado)
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

{ TResultadoSoma }

function TResultadoSoma.AllResults: TList<string>;
begin
  Result := FResults;
end;

constructor TResultadoSoma.Create;
begin
  FResults := TList<string>.Create;
end;

destructor TResultadoSoma.Destroy;
begin
  FResults.Free;
  inherited;
end;

function TResultadoSoma.Resultado(A, B: Double): string;
begin
  Result := FloatToStr(A + B);
  FResults.Add(Result);
end;

end.
