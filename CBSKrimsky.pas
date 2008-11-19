unit CBSKrimsky;

interface
uses Classes, Sysutils, DB, DBCtrls, NativeXML;

type

  TBoxPosition = (UL, UC, UR, CL, CC, CR, LL, LC, LR);

  TCBSGridType = (CGTsc, CGTscprime, CGTcc, CGTccprime);

  TKrimskyCellData = class;

  TCBSCTGridData = class(TComponent)
  private
    FDataLink: TFieldDataLink;
  protected
    FDataStore: TNativeXML;
    procedure DataChange(Sender: TObject);
    function GetDataField: Widestring;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: Widestring);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetDataStore(const Value: TNativeXML);
  public
    procedure UpdateData(Sender: TObject);
    procedure SetData(const CellData: TKrimskyCelldata);{overload; }
    procedure GetData(var CellData: TKrimskyCelldata);{overload; }
    property DataField: Widestring read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataStore: TNativeXML read FDataStore write SetDataStore;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
  end;


  TKrimskyDataPoint = class(TComponent)
  strict private
    FDirection:String;
    FPrism:String;
    function GetKrimskyData : String;
    procedure SetDirection(val : String);
    function GetDirection : String;
    procedure SetPrism(val : String);
    function GetPrism : String;
  public
    property Prism :  String read GetPrism write SetPrism;
    property Direction :  String read GetDirection write SetDirection;
    property KrimskyData : String read GetKrimskyData;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure Assign(ADataPoint: TPersistent);override;
  end;

  TKrimskyCellData = class(TComponent)
  strict private
    FBoxPosition:TBoxPosition;
    FHorizontal:TKrimskyDataPoint;
    FVertical:TKrimskyDataPoint;
    procedure SetVertical(val : TKrimskyDataPoint);
    function GetVertical : TKrimskyDataPoint;
    procedure SetHorizontal(val : TKrimskyDataPoint);
    function GetHorizontal : TKrimskyDataPoint;
    procedure SetBoxPosition(val : TBoxPosition);
    function GetBoxPosition : TBoxPosition;
  private
    FCTData: TCBSCTGridData;
    FGridType: TCBSGridType;
    procedure SetGridType(const Value: TCBSGridType);
    procedure SetCTData(const Value: TCBSCTGridData);
  published
  public
    property CTData: TCBSCTGridData read FCTData write SetCTData; 
    property BoxPosition :  TBoxPosition read GetBoxPosition write SetBoxPosition;
    property Horizontal :  TKrimskyDataPoint read GetHorizontal write SetHorizontal;
    property Vertical :  TKrimskyDataPoint read GetVertical write SetVertical;
    property GridType: TCBSGridType read FGridType write SetGridType;
    procedure Assign(ACellData: TPersistent);override;
    procedure UpdateData(ACellData: TKrimskyCellData);
    procedure ClearData;
    constructor Create(AOwner: TComponent; ACTData:TCBSCTGridData);
    destructor Destroy;override;
  end;

  function Translate(Value: TBoxPosition):String;overload;
  function Translate(Value: TCBSGridType):String;overload;

implementation

uses CBSKrimskyDisplay;

function TKrimskyDataPoint.GetPrism: String;
begin
  Result := FPrism;
end;

procedure TKrimskyDataPoint.SetPrism(val : String);
begin
  FPrism := val;
end;

procedure TKrimskyDataPoint.Assign(ADataPoint: TPersistent);
begin
  if ADataPoint is TKrimskyDataPoint then
  begin
    Direction := TKrimskyDataPoint(ADataPoint).Direction;
    Prism := TKrimskyDataPoint(ADataPoint).Prism;
  end
  else
    inherited;

end;

constructor TKrimskyDataPoint.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TKrimskyDataPoint.Destroy;
begin
  inherited;
end;

function TKrimskyDataPoint.GetDirection: String;
begin
  Result := FDirection;
end;

procedure TKrimskyDataPoint.SetDirection(val : String);
begin
  FDirection := val;
end;

function TKrimskyDataPoint.GetKrimskyData: String;
begin
  if Prism='' then
    Result := Direction
  else
    Result := Prism+' '+Direction;
end;

{ TKrimskyCellData }

procedure TKrimskyCellData.Assign(ACellData: TPersistent);
begin
  if ACellData is TKrimskyCellData then
  begin
    BoxPosition := TKrimskyCellData(ACellData).BoxPosition;
    Horizontal.Assign(TKrimskyCellData(ACellData).Horizontal);
    Vertical.Assign(TKrimskyCellData(ACellData).Vertical);
  end
  else
    inherited;

end;

procedure TKrimskyCellData.ClearData;
begin
  FHorizontal.Prism := '';
  FHorizontal.Direction := '';
  FVertical.Prism := '';
  FVertical.Direction := '';
end;

constructor TKrimskyCellData.Create(AOwner: TComponent; ACTData:TCBSCTGridData);
begin
  inherited Create(AOwner);
  FCTData := ACTData;
  FBoxPosition := UL;
  FHorizontal := TKrimskyDataPoint.Create(Self);
  FVertical := TKrimskyDataPoint.Create(Self);
end;

destructor TKrimskyCellData.Destroy;
begin
  inherited;

end;

function TKrimskyCellData.GetHorizontal: TKrimskyDataPoint;
begin
  Result := FHorizontal;
end;

function TKrimskyCellData.GetBoxPosition: TBoxPosition;
begin
  Result := FBoxPosition;
end;

function TKrimskyCellData.GetVertical: TKrimskyDataPoint;
begin
  Result := FVertical;
end;

procedure TKrimskyCellData.SetHorizontal(val: TKrimskyDataPoint);
begin
  FHorizontal.Assign(val);
end;

procedure TKrimskyCellData.SetBoxPosition(val: TBoxPosition);
begin
  FBoxPosition := val;
end;

procedure TKrimskyCellData.SetCTData(const Value: TCBSCTGridData);
begin
  FCTData := Value;
end;

procedure TKrimskyCellData.SetGridType(const Value: TCBSGridType);
begin
  FGridType := Value;
end;

procedure TKrimskyCellData.SetVertical(val: TKrimskyDataPoint);
begin
  FVertical.Assign(val);
end;

procedure TKrimskyCellData.UpdateData(ACellData: TKrimskyCellData);
begin
  Horizontal.Assign(ACellData.Horizontal);
  Vertical.Assign(ACellData.Vertical);
  FCTData.SetData(Self);
end;

{ TCBSCTGridData }

constructor TCBSCTGridData.Create(AOwner: TComponent);
begin
  inherited;
  FDataStore := TNativeXML.Create;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataStore.CreateName('CTGrids');
  FDataStore.LoadFromFile('MyKrimsky.xml');
  DataChange(Self);
end;

procedure TCBSCTGridData.DataChange(Sender: TObject);
begin
  if Owner is TCustomKrimsky then
  
end;

destructor TCBSCTGridData.Destroy;
begin
  FreeAndNil(FDataLink);
  FreeAndNil(FDataStore);
  inherited;
end;


function TCBSCTGridData.GetDataField: Widestring;
begin
  Result := FDataLink.FieldName;
end;

function TCBSCTGridData.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TCBSCTGridData.SetData(const CellData: TKrimskyCelldata);
var GridNode, BoxNode, HorizontalNode, VerticalNode: TXMLNode;
begin
    { TODO : 
Rewrite this section to only save XML section if there is data and to 
eliminate data if it is removed from the XML, not just update with blank. }
  GridNode := FDataStore.Root.NodeFindOrCreate(Translate(CellData.GridType));
  BoxNode := GridNode.NodeFindOrCreate(Translate(CellData.BoxPosition));
  HorizontalNode := BoxNode.NodeFindOrCreate('Horizontal');
  VerticalNode := BoxNode.NodeFindOrCreate('Vertical');
  HorizontalNode.NodeFindOrCreate('Direction').ValueAsString := CellData.Horizontal.Direction;
  HorizontalNode.NodeFindOrCreate('Prism').ValueAsString := CellData.Horizontal.Prism;
  VerticalNode.NodeFindOrCreate('Direction').ValueAsString := CellData.Vertical.Direction;
  VerticalNode.NodeFindOrCreate('Prism').ValueAsString := CellData.Vertical.Prism;
end;


procedure TCBSCTGridData.GetData(var CellData: TKrimskyCelldata);
var GridNode, BoxNode, HorizontalNode, VerticalNode: TXMLNode;
begin
  if DataStore = nil then exit;
  
  if not Assigned(FDataStore) then exit;
  GridNode := FDataStore.Root.FindNode(Translate(CellData.GridType));
  BoxNode := GridNode.FindNode(Translate(CellData.BoxPosition));
  HorizontalNode := BoxNode.FindNode('Horizontal');
  VerticalNode := BoxNode.FindNode('Vertical');
//  HorizontalNode.NodeFindOrCreate('Direction').ValueAsString := CellData.Horizontal.Direction;
//  HorizontalNode.NodeFindOrCreate('Prism').ValueAsString := CellData.Horizontal.Prism;
//  VerticalNode.NodeFindOrCreate('Direction').ValueAsString := CellData.Vertical.Direction;
//  VerticalNode.NodeFindOrCreate('Prism').ValueAsString := CellData.Vertical.Prism;
end;


//var
//  NodePath: String;
//  HorizontalNode, VerticalNode: TXMLNode;
//  FoundNode: TXMLNode;
//begin
//  Nodepath := '/CTGrids/'+Translate(CellData.GridType)+'/'+Translate(CellData.BoxPosition)+'/';
//  FoundNode := FDataStore.Root.FindNode(NodePath+'Horizontal');
// // CellData.Horizontal.Direction := FDataStore.Root.FindNode(NodePath+'Horizontal/Direction').ValueAsString;
//  CellData.Horizontal.Direction := FoundNode.FindNode('Direction').ValueAsString;
//
//  CellData.Horizontal.Prism := FDataStore.Root.FindNode(NodePath+'Horizontal/Prism').ValueAsString;
//  CellData.Vertical.Direction := FDataStore.Root.FindNode(NodePath+'Vertical/Direction').ValueAsString;
//  CellData.Vertical.Prism := FDataStore.Root.FindNode(NodePath+'Vertical/Prism').ValueAsString;
//end;

procedure TCBSCTGridData.SetDataField(const Value: Widestring);
begin
  FDataLink.FieldName := Value;
end;

procedure TCBSCTGridData.SetDataSource(const Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCBSCTGridData.SetDataStore(const Value: TNativeXML);
begin
  FDataStore := Value;
end;

procedure TCBSCTGridData.UpdateData(Sender: TObject);
var
  I: TBoxPosition;
  J: TCBSGridType;
begin
if Sender is TKrimskyCellData then
    SetData(Sender as TKrimskyCellData);
  if Sender is TCustomKrimsky then
  begin
    with Sender as TCustomKrimsky do
    begin
      for I := low(TBoxPosition) to high(TBoxPosition) do
        SetData(Cells[I].CellData as TKrimskyCellData)
    end;
  end;
  if Sender is TCBSCTGrid then
  begin
    with Sender as TCBSCTGrid do
    begin
      for J := low(TCBSGridType) to high(TCBSGridType) do
        Self.UpdateData(Grids[J] as TCustomKrimsky);
    end;
  end;
  FDataStore.SaveToFile('MyKrimsky.xml');

end;

function Translate(Value: TBoxPosition):String;overload;
begin
  Result := '';
  case Value of
    UL: Result := 'UL';
    UC: Result := 'UC';
    UR: Result := 'UR';
    CL: Result := 'CL';
    CC: Result := 'CC';
    CR: Result := 'CR';
    LL: Result := 'LL';
    LC: Result := 'LC';
    LR: Result := 'LR';
  end;
end;
function Translate(Value: TCBSGridType):String;overload;
begin
  Result := '';
  case Value of
    CGTsc: Result := 'CGTsc';
    CGTscprime: Result := 'CGTscprime';
    CGTcc: Result := 'CGTcc';
    CGTccprime: Result := 'CGTccprime';
  end;
end;
end.
