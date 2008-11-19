unit NewCropInt;
{ Interface routing for NewCrop.DLL}

interface
uses Windows, Classes;

{ There is currently one function to get to all of the NewCrop click through info

procedure NewCropEPrescribe(HApplication, HConnection: THandle; NewCropData: INewCropData );StdCall;
It is used by creating an object that is a TNewCropData and passing it as an INewCropData along with
Application Handle and the database connection handle as in the following:

var MyNewCrop: TNewCropData;
begin
MyNewCrop := TNewCropData.Create;
MyNewCrop.Destination := 'compose';
MyNewCrop.Patient := T_Patient.PatUnique;
MyNewCrop.UserRole := urDoctor;
MyNewCrop.UserID := LoginID;
MyNewCrop.PrescriberID := Patient.Doctor;

NewCropEPrescribe(Application.Handle, ADSConnection1.Handle, MyNewCropData as INewCropData);

end;


Make sure you free the TNewCropData at an appropriate time.  It is possible to get back
information from the call, so don't destroy before you are done with it.
All of the properties of INewCropData are described below
}
{
The INewCropData interface is designed to have enough flexibility to be able to
interact with the New Crop system without adding an awkward level of complexity.
INewCropData is represented in usage by a TNewCropData object which is instantiated
and ultimately freed on the calling side.  The information can be transferred in
one of the following properties
UserID = String containing login ID of person at workstation that is calling the interface
PrescriberID = String containing ID of prescribing doctor to be used...should link to Doctors table
Destination = String Starting page in NewCrop click through
Patient = Integer, patient Identifier...patunique
Location = String, ties to prescribing location.  Should tie to the NewCrop location
Encounter = Integer, Encounter identifier...should be examunique
UserRole = TUserRole, one of the roles that NewCrop recognizes
TransferXML = TStrings, can contain data to be sent to NewCrop, will be updated to
              contain information received back from NewCrop
}
{
Documentation for NewCrop's XML is at
A) https://secure.newcropaccounts.com/InterfaceV7/NCStandard.xsd
and
B) https://secure.newcropaccounts.com/InterfaceV7/NCScript.xsd

B is the actual XML that is sent and A is the sub-types that are used in A
As an example,
DestinationType.requestedPage is a section in B which is of type
NCStandard:RequestedPageType.  In A, Requested PageType is defined as
<xs:simpleType name="RequestedPageType">
?
<xs:restriction base="xs:string">
<xs:enumeration value="compose"/>
<xs:enumeration value="admin"/>
<xs:enumeration value="manager"/>
<xs:enumeration value="status"/>
<xs:enumeration value="ws-rx-send"/>
<xs:enumeration value="ws-rx-bulk"/>
<xs:enumeration value="ws-rx-bulk-no-match"/>
<xs:enumeration value="ws-renewal-send"/>
<xs:enumeration value="ws-register-licensedPrescriber"/>
<xs:enumeration value="ws-image-rx-send"/>
<xs:enumeration value="ws-pbm-eligibility"/>
<xs:enumeration value="medentry"/>
<xs:enumeration value="patientDetail"/>
<xs:enumeration value="transmit"/>
<xs:enumeration value="resource"/>
<xs:enumeration value="maintainHealthplans"/>
<xs:enumeration value="ws-register"/>
<xs:enumeration value="route"/>
<xs:enumeration value="rxhistory-external"/>
<xs:enumeration value="renewal-confirmation"/>
<xs:enumeration value="ws-process-renewal"/>
<xs:enumeration value="rxdetail"/>
<xs:enumeration value="renewal"/>
<xs:enumeration value="ws-gen-test-renewal"/>
<xs:enumeration value="dosing"/>
<xs:enumeration value="formulary-coverage-detail"/>
</xs:restriction>
</xs:simpleType>
?
}
type TNewCropUserRole = (URClerk, URManager, URNurse, URMidLevel, URDoctor);

//
//['{7FD19624-1B71-41FC-AB3E-AF296F7E9893}']
//['{02CF15F6-0ECE-4FC7-87B0-E265F4CBE5AE}']
//['{42B5C98C-98FA-458B-8B65-AAE0D176E323}']

type INewCropData = interface
['{3008A8FC-55D5-4CB5-AC31-3E9E5FF49684}']

function GetUserID:String;
procedure SetUserID(value: String);
function GetPrescriberID:String;
procedure SetPrescriberID(value: String);
function GetDestination:String;
procedure SetDestination(value: String);
function GetPatient:Integer;
procedure SetPatient(value: Integer);
function GetLocation:String;
procedure SetLocation(value: String);
function GetEncounter:Integer;
procedure SetEncounter(value: Integer);
function GetUserRole:TNewCropUserRole;
function GetTransferXML: TStrings;
procedure SetTransferXML(value: TStrings);
procedure SetUserRole(value: TNewCropUserRole);
property UserID: String read GetUserID write SetUserID;
property PrescriberID: String read GetPrescriberID write SetPrescriberID;
property Destination: String read GetDestination write SetDestination;
property Patient: Integer read GetPatient write SetPatient;
property Location: String read GetLocation write SetLocation;
property Encounter: Integer read GetEncounter write SetEncounter;
property UserRole: TNewCropUserRole read GetUserRole write SetUserRole;
property TransferXML: TStrings read GetTransferXML write SetTransferXML;
end;

type TNewCropData = class(TComponent, INewCropData)
  private
    FEncounter: Integer;
    FLocation: String;
    FDestination: String;
    FNewCropUserRole: TNewCropUserRole;
    FUserID: String;
    FPatient: Integer;
    FPrescriberID: String;
    FTransferXML: TStrings;
    function GetUserID:String;
    procedure SetUserID(value: String);
    function GetPrescriberID:String;
    procedure SetPrescriberID(value: String);
    function GetDestination:String;
    procedure SetDestination(value: String);
    function GetPatient:Integer;
    procedure SetPatient(value: Integer);
    function GetLocation:String;
    procedure SetLocation(value: String);
    function GetEncounter:Integer;
    procedure SetEncounter(value: Integer);
    function GetUserRole:TNewCropUserRole;
    procedure SetUserRole(value: TNewCropUserRole);
    function GetTransferXML: TStrings;
    procedure SetTransferXML(value: TStrings);
  public
    constructor Create;
    destructor Destroy;
    property UserID: String read GetUserID write SetUserID;
    property PrescriberID: String read GetPrescriberID write SetPrescriberID;
    property Destination: String read GetDestination write SetDestination;
    property Patient: Integer read GetPatient write SetPatient;
    property Location: String read GetLocation write SetLocation;
    property Encounter: Integer read GetEncounter write SetEncounter;
    property UserRole: TNewCropUserRole read GetUserRole write SetUserRole;
    property TransferXML: TStrings read GetTransferXML write SetTransferXML;
end;

{$IFNDEF NEWCROP}
{ Declare functions with export keywords}
procedure NewCropEPrescribe(HApplication, HConnection: THandle; NewCropData: INewCropData );StdCall;

{$ENDIF}

implementation
{$IFNDEF NEWCROP}
{ Define the imported functions}
procedure NewCropEPrescribe; external 'PrintHandler.DLL' name 'NewCropEPrescribe';
{$ENDIF}



{ TNewCropData }

constructor TNewCropData.Create;
begin
  FTransferXML := TStringList.Create;
end;

destructor TNewCropData.Destroy;
begin
  FTransferXML.Free;
end;

function TNewCropData.GetDestination: String;
begin
  Result := FDestination;
end;

function TNewCropData.GetEncounter: Integer;
begin
  Result := FEncounter;
end;

function TNewCropData.GetLocation: String;
begin
  Result := FLocation;
end;

function TNewCropData.GetPatient: Integer;
begin
  Result := FPatient;
end;

function TNewCropData.GetPrescriberID: String;
begin
  Result := FPrescriberID;
end;

function TNewCropData.GetTransferXML: TStrings;
begin
  Result := FTransferXML;
end;

function TNewCropData.GetUserID: String;
begin
  Result := FUserID;
end;

function TNewCropData.GetUserRole: TNewCropUserRole;
begin
  Result := FNewCropUserRole;
end;

procedure TNewCropData.SetDestination(value: String);
begin
  FDestination := value;
end;

procedure TNewCropData.SetEncounter(value: Integer);
begin
  FEncounter := value;
end;

procedure TNewCropData.SetLocation(value: String);
begin
  FLocation := value;
end;

procedure TNewCropData.SetPatient(value: Integer);
begin
  FPatient := value;
end;

procedure TNewCropData.SetPrescriberID(value: String);
begin
  FPrescriberID := value;
end;

procedure TNewCropData.SetTransferXML(value: TStrings);
begin
  FTransferXML := value;
end;

procedure TNewCropData.SetUserID(value: String);
begin
  FUserID := value;
end;

procedure TNewCropData.SetUserRole(value: TNewCropUserRole);
begin
  FNewCropUserRole := value;
end;

end.

