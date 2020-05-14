unit uInterfaces;

interface

uses
  System.Generics.Collections;

type
  IResultado = interface
    ['{0C87779D-C809-432F-94A1-B36D58888E4F}']
    function Resultado(A, B: Double): string;
    function AllResults: TList<String>;
  end;


  ITesteInterface = interface
    ['{E3314056-E784-49F1-AFB2-F9407530A38E}']
    function SetName(const AValue: string): ITesteInterface;
    function SetSobreNome(const AValue: string): ITesteInterface;

    function GetName: string;
    function GetSobreNome: string;

  end;

  IDependencyInjection = interface
    ['{F7343963-71A0-4228-B051-2132A2F2650C}']
    function Calcular(A, B: Double): IDependencyInjection;
    function &Result: string;
  end;

implementation

end.
