unit Interfaces;

interface

type
  INota = interface
    ['{77F8286A-D396-4796-A0CD-A77EDA0657B5}']
    function SetId(const AValue: string): INota;
    function GetId: string;
  end;

  INotaItens = interface
    ['{E3540961-5F40-4618-9057-17BDEE785FC7}']
    function SetCodProd(const AValue: string): INotaItens;
    function GetCodProd: string;
  end;


  TNota = class(TInterfacedObject, INota)
  private
    FNotaId: string;
    FNotaItens: INotaItens;
  public
    function GetId: string;
    function SetId(const AValue: string): INota;

    class function New: INota;

    constructor Create;
    destructor Destroy; override;
  end;

  TNotaItens = class(TInterfacedObject, INotaItens)
  private
    FCodProd: string;
  //[weak]
    FNota: INota;
  public
    function GetCodProd: string;
    function SetCodProd(const AValue: string): INotaItens;

    class function New(const ANota: INota): INotaItens;

    constructor Create(const ANota: INota);
    destructor Destroy; override;
  end;

implementation

uses
  Utils;

{ TNota }

constructor TNota.Create;
begin
  FNotaItens := TNotaItens.New(Self);
end;

destructor TNota.Destroy;
begin

  inherited;
end;

function TNota.GetId: string;
begin
  Result := FNotaId;
end;

class function TNota.New: INota;
begin
  Result := Self.Create;
end;

function TNota.SetId(const AValue: string): INota;
begin
  FNotaId := AValue;
end;

{ TNotaItens }

constructor TNotaItens.Create(const ANota: INota);
begin
  //FNota := ANota;
  TInjection.Weak(@FNota, ANota);
end;

destructor TNotaItens.Destroy;
begin

  inherited;
end;

function TNotaItens.GetCodProd: string;
begin
  Result := FCodProd;
end;

class function TNotaItens.New(const ANota: INota): INotaItens;
begin
  Result := Self.Create(ANota);
end;

function TNotaItens.SetCodProd(const AValue: string): INotaItens;
begin
  FCodProd := AValue;
end;

end.
