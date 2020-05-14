unit SmartPoint;

interface

type
  TSmartPointer<T : class, constructor> = record
    strict private
      FValue : T;
      FFreeObject : IInterface;
      function GetValue : T;
    public
      class operator Implicit(smart: TSmartPointer<T>): T;
      class operator Implicit(AValue: T): TSmartPointer<T>;
      constructor Create(aValue : T);
      property Value : T read GetValue;
  end;

  TFreeTheValue = class (TInterfacedObject)
  private
    FObject: TObject;
  public
    constructor Create(AObject: TObject);
    destructor Destroy; override;
  end;

implementation

{ TSmartPointer<T> }

constructor TSmartPointer<T>.Create(aValue: T);
begin
  FValue := aValue;
  FFreeObject := TFreeTheValue.Create(FValue);
end;

function TSmartPointer<T>.GetValue: T;
begin
  if not Assigned(FFreeObject) then
    Self := TSmartPointer<T>.Create(T.Create);

  Result := FValue;
end;

class operator TSmartPointer<T>.Implicit(AValue: T): TSmartPointer<T>;
begin
  Result := TSmartPointer<T>.Create(AValue);
end;

class operator TSmartPointer<T>.Implicit(smart: TSmartPointer<T>): T;
begin
  Result := smart.Value;
end;

{ TFreeTheValue }

constructor TFreeTheValue.Create(AObject: TObject);
begin
  FObject := AObject;
end;

destructor TFreeTheValue.Destroy;
begin
  FObject.Free;
  inherited;
end;

end.
