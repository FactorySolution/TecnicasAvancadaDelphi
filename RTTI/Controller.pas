unit Controller;

interface

uses
  Pessoa, System.Classes;

type
  TController = class(TPersistent)
  public
    class function saveOrUpdate(const p: TPessoa): string;
  end;


  TControllerB = class(TPersistent)
    function saveOrUpdate(const p: TPessoa): string;
  end;

implementation

uses
  System.SysUtils;

{ TController }

class function TController.saveOrUpdate(const p: TPessoa): string;
begin
  Result := p.Nome + ' ' + p.SobreNome + ' ' + p.Idade.ToString;
end;


{ TControllerB }

function TControllerB.saveOrUpdate(const p: TPessoa): string;
begin
  Result := p.Nome + ' ' + p.SobreNome + ' ' + p.Idade.ToString;
end;

initialization
  RegisterClass(TController);
  RegisterClass(TControllerB);

end.
