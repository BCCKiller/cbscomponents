unit ExpandingComponent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OurCollection;

type
  TExpandingRecord = class(TPersistent)
  private
    FIntegerProp : Integer;
    FStringProp : String;
    FCollectionProp : TOurCollection;
    procedure SetCollectionProp(const Value: TOurCollection);
  public
    constructor Create(AOwner : TComponent);
    destructor Destroy; override;

    procedure Assign(Source : TPersistent); override;
  published
    property IntegerProp : Integer
      read FIntegerProp
      write FIntegerProp;
    property StringProp : String
      read FStringProp
      write FStringProp;
    property CollectionProp : TOurCollection
      read FCollectionProp
      write SetCollectionProp;
  end;

  TExpandingComponent = class(TComponent)
  private
    { Private declarations }
    FProperty1,
    FProperty2,
    FProperty3 : TExpandingRecord;
  protected
    { Protected declarations }
    procedure SetProperty1(const Value : TExpandingRecord);
    procedure SetProperty2(const Value : TExpandingRecord);
    procedure SetProperty3(const Value : TExpandingRecord);
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Property1 : TExpandingRecord
      read FProperty1
      write SetProperty1;
    property Property2 : TExpandingRecord
      read FProperty2
      write SetProperty2;
    property Property3 : TExpandingRecord
      read FProperty3
      write SetProperty3;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Article', [TExpandingComponent]);
end;

{ TExpandingRecord }

procedure TExpandingRecord.Assign(Source: TPersistent);
begin
  if Source is TExpandingRecord then
    with TExpandingRecord(Source) do begin
      Self.IntegerProp := IntegerProp;
      Self.StringProp := StringProp;
      Self.CollectionProp := CollectionProp; //This actually assigns
    end else
      inherited; //raises an exception
end;

constructor TExpandingRecord.Create(AOwner : TComponent);
begin
  inherited Create;
  FCollectionProp := TOurCollection.Create(AOwner);
end;

destructor TExpandingRecord.Destroy;
begin
  FCollectionProp.Free;
  inherited;
end;

procedure TExpandingRecord.SetCollectionProp(const Value: TOurCollection);
begin
  FCollectionProp.Assign(Value);
end;

{ TExpandingComponent }

constructor TExpandingComponent.Create(AOwner: TComponent);
begin
  inherited;
  FProperty1 := TExpandingRecord.Create(Self);
  FProperty2 := TExpandingRecord.Create(Self);
  FProperty3 := TExpandingRecord.Create(Self);
end;

destructor TExpandingComponent.Destroy;
begin
  FProperty1.Free;
  FProperty2.Free;
  FProperty3.Free;
  inherited;
end;

procedure TExpandingComponent.SetProperty1(const Value: TExpandingRecord);
begin
  FProperty1.Assign(Value);
end;

procedure TExpandingComponent.SetProperty2(const Value: TExpandingRecord);
begin
  FProperty2.Assign(Value);
end;

procedure TExpandingComponent.SetProperty3(const Value: TExpandingRecord);
begin
  FProperty3.Assign(Value);
end;

end.
 