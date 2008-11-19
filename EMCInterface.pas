unit EMCInterface;

interface
uses Classes;
type

TStringArray = array of String;

IEMCHeader = interface
['{0C60283A-4F24-45F8-A36A-5025DA218918}']
function GetProdCode: Integer;
procedure SetProdCode(Value: Integer);
function GetEMCDest: String;
procedure SetEMCDest(Value: String);
function GetReq_Plan: String;
procedure SetReq_Plan(Value: String);
function GetReq_Loc: String;
procedure SetReq_Loc(Value: String);
function GetReq_Doc: String;
procedure SetReq_Doc(Value: String);
function GetLedgerIDLoc: Boolean;
procedure SetLedgerIDLoc(Value: Boolean);
property ProdCode: Integer read GetProdCode write SetProdCode;
property EMCDest: String read GetEMCDest write SetEMCDest;
property Req_Plan: String read GetReq_Plan write SetReq_Plan;
property Req_Loc: String read GetReq_Loc write SetReq_Loc;
property Req_Doc: String read GetReq_Doc write SetReq_Doc;
property LedgerIDLoc: Boolean read GetLedgerIDLoc write SetLedgerIDLoc;
end;

TEMCHeader = class(TInterfacedObject, IEMCHeader)
private
FProdCode: Integer;
FEMCDest: String;
FReq_Plan: String;
FReq_Loc: String;
FReq_Doc: String;
FLedgerIDLoc: Boolean;
function GetProdCode: Integer;
procedure SetProdCode(Value: Integer);
function GetEMCDest: String;
procedure SetEMCDest(Value: String);
function GetReq_Plan: String;
procedure SetReq_Plan(Value: String);
function GetReq_Loc: String;
procedure SetReq_Loc(Value: String);
function GetReq_Doc: String;
procedure SetReq_Doc(Value: String);
function GetLedgerIDLoc: Boolean;
procedure SetLedgerIDLoc(Value: Boolean);
public
property ProdCode: Integer read GetProdCode write SetProdCode;
property EMCDest: String read GetEMCDest write SetEMCDest;
property Req_Plan: String read GetReq_Plan write SetReq_Plan;
property Req_Loc: String read GetReq_Loc write SetReq_Loc;
property Req_Doc: String read GetReq_Doc write SetReq_Doc;
property LedgerIDLoc: Boolean read GetLedgerIDLoc write SetLedgerIDLoc;
end;

IEMCBody = interface
['{9AFAD5E2-BC89-48BF-9F07-D6C00929275F}']
function GetLedgerLines: TStrings;
procedure SetLedgerLines(Value: TStrings);
function GetInsured_P: TStringArray;
procedure SetInsured_P(Value: TStringArray);
function GetInsured_S: TStringArray;
procedure SetInsured_S(Value: TStringArray);
function GetInsured_T: TStringArray;
procedure SetInsured_T(Value: TStringArray);
function GetClaim: TStringArray;
procedure SetClaim(Value: TStringArray);
property LedgerLines: TStrings read GetLedgerLines write SetLedgerLines;
property Insured_P: TStringArray read GetInsured_P write SetInsured_P;
property Insured_S: TStringArray read GetInsured_S write SetInsured_S;
property Insured_T: TStringArray read GetInsured_T write SetInsured_T;
property Claim: TStringArray read GetClaim write SetClaim;
end;

TEMCBody = class(TInterfacedObject, IEMCBody)
private
FLedgerLines: TStrings;
FInsured_P: TStringArray;
FInsured_S: TStringArray;
FInsured_T: TStringArray;
FClaim: TStringArray;
function GetLedgerLines: TStrings;
procedure SetLedgerLines(Value: TStrings);
function GetInsured_P: TStringArray;
procedure SetInsured_P(Value: TStringArray);
function GetInsured_S: TStringArray;
procedure SetInsured_S(Value: TStringArray);
function GetInsured_T: TStringArray;
procedure SetInsured_T(Value: TStringArray);
function GetClaim: TStringArray;
procedure SetClaim(Value: TStringArray);
public
constructor Create;
destructor Destroy; override;
property LedgerLines: TStrings read GetLedgerLines write SetLedgerLines;
property Insured_P: TStringArray read GetInsured_P write SetInsured_P;
property Insured_S: TStringArray read GetInsured_S write SetInsured_S;
property Insured_T: TStringArray read GetInsured_T write SetInsured_T;
property Claim: TStringArray read GetClaim write SetClaim;
end;


implementation

{ TEMCHeader }

procedure TEMCHeader.SetReq_Plan(Value: String);
begin
  FReq_Plan := Value;
end;

function TEMCHeader.GetReq_Doc: String;
begin
  Result := Req_Doc;
end;

function TEMCHeader.GetEMCDest: String;
begin
  Result := EMCDest;
end;

procedure TEMCHeader.SetReq_Loc(Value: String);
begin
  FReq_Loc := Value;
end;

function TEMCHeader.GetLedgerIDLoc: Boolean;
begin
  Result := LedgerIDLoc;
end;

procedure TEMCHeader.SetProdCode(Value: Integer);
begin
  FProdCode := Value;
end;

procedure TEMCHeader.SetReq_Doc(Value: String);
begin
  FReq_Doc := Value;
end;

procedure TEMCHeader.SetEMCDest(Value: String);
begin
  FEMCDest := Value;
end;

procedure TEMCHeader.SetLedgerIDLoc(Value: Boolean);
begin
  FLedgerIDLoc := Value;
end;

function TEMCHeader.GetReq_Plan: String;
begin
  Result := Req_Plan;
end;

function TEMCHeader.GetReq_Loc: String;
begin
  Result := Req_Loc;
end;

function TEMCHeader.GetProdCode: Integer;
begin
  Result := ProdCode;
end;

{ TEMCBody }

procedure TEMCBody.SetInsured_T(Value: TStringArray);
begin
  FInsured_T := Copy(Value);
end;

constructor TEMCBody.Create;
begin
  FLedgerLines := TStringList.Create;
end;

procedure TEMCBody.SetClaim(Value: TStringArray);
begin
  FClaim := Copy(Value);
end;

procedure TEMCBody.SetLedgerLines(Value: TStrings);
begin
  FLedgerLines := Value;
end;

function TEMCBody.GetInsured_S: TStringArray;
begin
  Result := Copy(FInsured_S);
end;

function TEMCBody.GetInsured_P: TStringArray;
begin
  Result := Copy(FInsured_P);
end;

function TEMCBody.GetInsured_T: TStringArray;
begin
  Result := Copy(FInsured_T);
end;

function TEMCBody.GetClaim: TStringArray;
begin
  Result := Copy(FClaim);
end;

function TEMCBody.GetLedgerLines: TStrings;
begin
  Result := LedgerLines;
end;

procedure TEMCBody.SetInsured_S(Value: TStringArray);
begin
  FInsured_S := Value;
end;

destructor TEMCBody.Destroy;
begin
  FLedgerLines.Free;
  FLedgerLines := nil;
  inherited;
end;

procedure TEMCBody.SetInsured_P(Value: TStringArray);
begin
  FInsured_P := Value;
end;

end.
