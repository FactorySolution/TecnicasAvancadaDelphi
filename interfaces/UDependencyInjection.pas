unit UDependencyInjection;

interface

uses
  uInterfaces;

type
  TDependencyInjection = class(TInterfacedObject, IDependencyInjection)
  var
    FRetorno: string;
    FResultado: IResultado;
  public
    function Calcular(A, B: Double): IDependencyInjection;
    function Result: string;

    class function New(const AResultado: IResultado): IDependencyInjection;

    constructor Create(const AResultado: IResultado);
    destructor Destroy; override;


  end;

implementation

{ TDependencyInjection }

function TDependencyInjection.Calcular(A, B: Double): IDependencyInjection;
begin
  Result := Self;
  FRetorno := FResultado.Resultado(A, B);
end;

constructor TDependencyInjection.Create(const AResultado: IResultado);
begin
  FResultado := AResultado;
end;

destructor TDependencyInjection.Destroy;
begin

  inherited;
end;

class function TDependencyInjection.New(
  const AResultado: IResultado): IDependencyInjection;
begin
  Result := Self.Create(AResultado);
end;

function TDependencyInjection.Result: string;
begin
  Result := FRetorno;
end;

end.
