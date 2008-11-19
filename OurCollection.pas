unit OurCollection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TOurCollectionItem = class(TCollectionItem)
  private
    FSomeValue : String;
  protected
    function GetDisplayName : String; override;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property SomeValue : String
      read FSomeValue
      write FSomeValue;
  end;

  TOurCollection = class(TCollection)
  private
    { Private declarations }
    FOwner : TComponent;
  protected
    { Protected declarations }
    function GetOwner : TPersistent; override;
    function GetItem(Index: Integer): TOurCollectionItem;
    procedure SetItem(Index: Integer; Value: TOurCollectionItem);
    procedure Update(Item: TOurCollectionItem); 
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); 
    
    function Add : TOurCollectionItem;
    function Insert(Index: Integer): TOurCollectionItem;

    property Items[Index: Integer]: TOurCollectionItem
      read GetItem
      write SetItem;
  published
    { Published declarations }
  end;

  TCollectionComponent = class(TComponent)
  private
    FOurCollection : TOurCollection;
    procedure SetOurCollection(const Value: TOurCollection);
  protected
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property OurCollection : TOurCollection
      read FOurCollection
      write SetOurCollection;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Article', [TCollectionComponent]);
end;

{ TOurCollectionItem }

procedure TOurCollectionItem.Assign(Source: TPersistent);
begin
  if Source is TOurCollectionItem then
    SomeValue := TOurCollectionItem(Source).SomeValue
  else
    inherited; //raises an exception
end;

function TOurCollectionItem.GetDisplayName: String;
begin
  Result := Format('Item %d',[Index]);
end;

{ TOurCollection }

function TOurCollection.Add: TOurCollectionItem;
begin
  Result := TOurCollectionItem(inherited Add);
end;

constructor TOurCollection.Create(AOwner: TComponent);
begin
  inherited Create(TOurCollectionItem);
  FOwner := AOwner;
end;

function TOurCollection.GetItem(Index: Integer): TOurCollectionItem;
begin
  Result := TOurCollectionItem(inherited GetItem(Index));
end;

function TOurCollection.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TOurCollection.Insert(Index: Integer): TOurCollectionItem;
begin
  Result := TOurCollectionItem(inherited Insert(Index));
end;

procedure TOurCollection.SetItem(Index: Integer; Value: TOurCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TOurCollection.Update(Item: TOurCollectionItem);
begin
  inherited Update(Item);
end;

{ TCollectionComponent }

constructor TCollectionComponent.Create(AOwner: TComponent);
begin
  inherited;
  FOurCollection := TOurCollection.Create(Self);
end;

destructor TCollectionComponent.Destroy;
begin
  FOurCollection.Free;
  inherited;
end;

procedure TCollectionComponent.SetOurCollection(
  const Value: TOurCollection);
begin
  FOurCollection.Assign(Value);
end;

end.
