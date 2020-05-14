unit Pessoa;

interface

uses
  System.Classes, Atributos;

type
  TPessoa = class(TPersistent)
  private
    FSobreNome: string;
    FNome: string;
    FIdade: Integer;
  public
    [TValidateString(False, 'O campo %s não pode estar vazio!')]
    property Nome: string read FNome write FNome;

    [TValidateString(False)]
    [TValidateString(True, 5)]
    property SobreNome: string read FSobreNome write FSobreNome;

    [TValidateInteger(1,50)]
    property Idade: Integer read FIdade write FIdade;


  end;

implementation

uses
  System.SysUtils;

initialization
  RegisterClass(TPessoa);

finalization
  UnRegisterClass(TPessoa);

end.
