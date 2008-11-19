unit SQLScriptModule;

interface

uses
  SysUtils, Classes, DB, adsdata, adsfunc, adstable, adscnnct;

type
  TcbsSQLScript = class(TDataModule)
    DBFConnection: TAdsConnection;
    ADTConnection: TAdsConnection;
    DBFQuery: TAdsQuery;
    ADTQuery: TAdsQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cbsSQLScript: TcbsSQLScript;

implementation

{$R *.dfm}

end.
