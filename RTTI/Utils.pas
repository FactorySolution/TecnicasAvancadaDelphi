unit Utils;

interface

uses
  System.Generics.Collections, System.Rtti, Atributos, System.SysUtils;

type
  TUtils = class
    class function Validar(Objeto: TObject): TList<String>;
    class function invoke(Classe, Metodo: string; Parametros: array of TValue): string;
    class function invokeCreate(Classe, Metodo: string; Parametros: array of TValue): string;
  end;

implementation

{ TUtils }

class function TUtils.invoke(Classe, Metodo: string;
  Parametros: array of TValue): string;
var
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
begin
  try
    Contexto := TRttiContext.Create;
    RttiInstanceType := Contexto.FindType(Classe).AsInstance;
    Result := RttiInstanceType.GetMethod(Metodo).Invoke(RttiInstanceType.MetaclassType, Parametros).AsString;
  finally
    Contexto.Free
  end;
end;

class function TUtils.invokeCreate(Classe, Metodo: string;
  Parametros: array of TValue): string;
var
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  RttiMethod: TRttiMethod;
  Instance: TValue;
begin
  try
    Contexto := TRttiContext.Create;
    RttiInstanceType := Contexto.FindType(Classe).AsInstance;
    RttiMethod := RttiInstanceType.GetMethod('Create');
    Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType,[]);
    RttiMethod := RttiInstanceType.GetMethod(Metodo);
    Result := RttiMethod.Invoke(Instance, Parametros).AsString;
  finally
    Contexto.Free
  end;
end;


class function TUtils.Validar(Objeto: TObject): TList<String>;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  &Length, min, max, value : Integer;
  function getMessage(Msg: string; const AFieldName: array of const): string;
  begin
    Result := Format(Msg, AFieldName);
  end;

begin
  Result := TList<String>.Create;
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(Objeto.ClassType);
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TValidateString then
        begin
          if (Atributo as TValidateString).ValidateMinLength then
          begin
            &Length := (Atributo as TValidateString).MinLength;
            if Propriedade.GetValue(Objeto).AsString.Length < &Length then
            begin
              Result.Add(getMessage((Atributo as TValidateString).Message, [Propriedade.Name, (Atributo as TValidateString).MinLength]));
            end;
          end
          else
          if not (Atributo as TValidateString).isEmpty then
          begin
            if Propriedade.GetValue(Objeto).AsString.Trim.IsEmpty then
            begin
              Result.Add(getMessage((Atributo as TValidateString).Message, [Propriedade.Name]));
            end;
          end;
        end
        else
        if Atributo is TValidateInteger then
        begin
          min := (Atributo as TValidateInteger).MinValue;
          max := (Atributo as TValidateInteger).MaxValue;
          value := Propriedade.GetValue(Objeto).AsInteger;
          if (value < min) or (value > max) then
          begin
            Result.Add(getMessage((Atributo as TValidateInteger).Message, [Propriedade.Name, min, max]));
          end;
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

end.
