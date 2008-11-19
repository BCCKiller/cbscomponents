unit DrawComponents;

interface

uses
  Classes, Buttons, GR32;

const
  ButtonWidth = 40;
  CaptionHeight = 0;
  ButtonColumnCount = 4;

type

//DJ Changed to object from record to better use in Medical information
  TMedProcedure = class(TComponent)
  public
    ID: Integer;
    ProcLabel: String;
    ICD: String;
    PostCode: String;
    TextForField: String;
    FieldToUpdate: String;
    Color: String;
  end;

  TDropToolButton = class(TSpeedButton)
  private
    FDropBitMap: TBitMap32;
    FMedProcedure: TMedProcedure;
    procedure SetMedProcedure(const Value: TMedProcedure);
  public
    property MedProcedure: TMedProcedure read FMedProcedure Write SetMedProcedure;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DropBitMap: TBitMap32 read FDropBitMap write FDropBitMap;
  end;

implementation

uses ExtCtrls;

{ TDropToolButton }

constructor TDropToolButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMedProcedure := TMedProcedure.Create(Self);
  FDropBitMap := TBitMap32.Create;
  Width := ButtonWidth;
  Height := ButtonWidth+CaptionHeight;
end;

destructor TDropToolButton.Destroy;
begin
  FMedProcedure.Free;
  inherited;
end;

procedure TDropToolButton.SetMedProcedure(const Value: TMedProcedure);
begin
  FMedProcedure := Value;
end;


end.
