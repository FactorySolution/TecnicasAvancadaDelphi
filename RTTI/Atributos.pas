unit Atributos;

interface

type
  TValidator = class(TCustomAttribute)
  private
    FMessage: string;
  public
    constructor Create(const AMessage: string);
    property &Message: string read FMessage;
  end;

  TValidateString = class(TValidator)
  private
    FIsEmpty: Boolean;
    FValidateMinLength: Boolean;
    FMinLength: Integer;
  public
    constructor Create(const isEmpty: Boolean); overload;
    constructor Create(const isEmpty: Boolean; const AMessage: string); overload;
    constructor Create(const ValidateMinLength: Boolean; const minLength: Integer); overload;
    constructor Create(const ValidateMinLength: Boolean; const minLength: Integer; const aMessage: string); overload;

    property isEmpty: Boolean read FIsEmpty;
    property MinLength: Integer read FMinLength;
    property ValidateMinLength: Boolean read FValidateMinLength;
  end;


  TValidateInteger = class(TValidator)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
  public
    constructor Create(minValue, maxValue: Integer); overload;
    constructor Create(minValue, maxValue: Integer; const AMessage: string); overload;
    property MinValue: Integer read FMinValue;
    property MaxValue: Integer read FMaxValue;
  end;

implementation

{ TValidator }

constructor TValidator.Create(const AMessage: string);
begin
  FMessage := AMessage;
end;

{ TValidateString }

constructor TValidateString.Create(const isEmpty: Boolean;
  const AMessage: string);
begin
  inherited Create(AMessage);
  FIsEmpty := isEmpty;
end;

constructor TValidateString.Create(const isEmpty: Boolean);
begin
  Create(isEmpty, 'O campo %s não pode estar vazio!');
end;

constructor TValidateString.Create(const ValidateMinLength: Boolean;
  const minLength: Integer);
begin
  inherited Create('O tamanho do campo "%s" deve ser maior que %d');
  FValidateMinLength := ValidateMinLength;
  FMinLength := minLength;
end;

constructor TValidateString.Create(const ValidateMinLength: Boolean;
  const minLength: Integer; const aMessage: string);
begin
  Create(ValidateMinLength, minLength, aMessage);
end;

{ TValidateInteger }

constructor TValidateInteger.Create(minValue, maxValue: Integer;
  const AMessage: string);
begin
  inherited Create(AMessage);
  FMinValue := minValue;
  FMaxValue := maxValue;
end;

constructor TValidateInteger.Create(minValue, maxValue: Integer);
begin
  Create(minValue, maxValue, 'O valor do campo "%s" deve estar entre %d e %d');
end;


end.
