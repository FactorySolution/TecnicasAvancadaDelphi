unit uTesteInterface;

interface

uses
  uInterfaces,
  System.Generics.Collections;

type
  TTesteInterface = class(TInterfacedObject, ITesteInterface)
  private
    FName: string;
    FSobreNome: string;
    FTeste: TList<string>;
  public
    function GetName: string;
    function GetSobreNome: string;
    function SetName(const AValue: string): ITesteInterface;
    function SetSobreNome(const AValue: string): ITesteInterface;

    class function New: ITesteInterface;

    constructor Create;
    destructor Destroy; override;


  end;

implementation

{ TTesteInterface }

constructor TTesteInterface.Create;
begin
  FTeste := TList<string>.create;
end;

destructor TTesteInterface.Destroy;
begin
  FTeste.free;
  inherited;
end;

function TTesteInterface.GetName: string;
begin
  Result := FName;
end;

function TTesteInterface.GetSobreNome: string;
begin
  Result := FSobreNome;
end;

class function TTesteInterface.New: ITesteInterface;
begin
  Result := Self.Create;
end;

function TTesteInterface.SetName(const AValue: string): ITesteInterface;
begin
  Result := Self;
  FName := AValue;
end;

function TTesteInterface.SetSobreNome(const AValue: string): ITesteInterface;
begin
  Result := Self;
  FSobreNome := AValue;
end;

end.
