unit ImageHandlerInt;

interface

uses
  ShareMem, Classes, CBSGraphics;

const
// Values for the calling table reference
ctExam = 1;
ctPatient = 2;
ctFram_Rx = 3;
ctLens_Rx = 4;
ctClaim = 5;
ctAppt = 6;
ctBill = 7;

{$IFNDEF ImageHandler}
{ Declare procedures with export keywords}
function HandleImage(Fields: IImageFieldInformation; ReturnCodes: IReturnCodeReceiver;CallingHandle:THandle; RecordUnique:Integer; RecordSource:Integer):Integer; Register;
{$ENDIF}

implementation

{$IFNDEF ImageHandler}
{ Define the imported procedures}
function HandleImage; external 'IHandler.DLL' name 'HandleImage';
{$ENDIF}

end.
