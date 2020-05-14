unit Pessoa;

interface

type

  TEventMsg = procedure(AValue: string) of object;

  TPessoa =  class
  private
    FSobreNome: string;
    FNome: string;
    FMyEvent: TEventMsg;
    procedure SetMyEvent(const Value: TEventMsg);
  public
    property Nome: string read FNome write FNome;
    property SobreNome: string  read FSobreNome write FSobreNome;
    property MyEvent: TEventMsg read FMyEvent write SetMyEvent;

    procedure Cadastrar;

  end;

implementation

uses
  System.SysUtils;

{ TPessoa }

procedure TPessoa.Cadastrar;
begin
  MyEvent(Format('Nome: %s '#13+#10'Sobrenome %s', [Nome, SobreNome]));
end;

procedure TPessoa.SetMyEvent(const Value: TEventMsg);
begin
  FMyEvent := Value;
end;

end.
