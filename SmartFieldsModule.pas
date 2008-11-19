unit SmartFieldsModule;

interface

uses
  SysUtils, Classes, BASE_PARSER, PaxScripter, PaxPascal, IMP_Dialogs,
  IMP_Classes;

type
  TSmartField = class(TDataModule)
    SmartFieldScript: TPaxScripter;
    PaxPascal1: TPaxPascal;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SmartField: TSmartField;

implementation

{$R *.dfm}

procedure TSmartField.DataModuleCreate(Sender: TObject);
begin
  SmartFieldScript.AddModule('Clicks','PaxPascal');
  SmartFieldScript.AddCodeFromFile('Clicks','Test.pp');
  SmartFieldScript.Compile();
  SmartFieldScript.SaveToFile('test.bin');
  SmartFieldScript.Run();
end;

end.
