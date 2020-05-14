unit Utils;

interface

type
  TInjection = class
  public
    class procedure Weak(aInterfaceField: Pointer;
    const aValue: IInterface);
  end;

implementation

{ TInjection }

class procedure TInjection.Weak(aInterfaceField: Pointer;
  const aValue: IInterface);
begin
  PPointer(aInterfaceField)^ := Pointer(aValue);
end;

end.
