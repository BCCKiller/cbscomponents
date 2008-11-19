unit CBSKrimskyDisplay;

interface
uses Windows, Messages, ExtCtrls, StdCtrls, SysUtils, Variants,
Classes, Graphics, Controls, CBSKrimsky, CBSKrimskyEntry, DB, DBCtrls, dialogs;

const GridBorder = 4;
      CM_CTDATAChange = WM_APP+400;
type

  TGridOrientation = (goHorizontal, goVertical, goSquare);

  //TCBSKrimskyDataDisplay individual panel that shows Vertical or Horizontal data in cell
  TCBSKrimskyDataDisplay = class(TPanel)
  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
  end;
  //TCBSKrimskyCell- Individual Cell in grid

  TCustomKrimskyCell = class(TPanel)
  private
    FCellData: TKrimskyCellData;
    VerticalDisplay, HorizontalDisplay: TCBSKrimskyDataDisplay;
    VerticalLabel, HorizontalLabel: TLabel;
    FBoxIsSelected: Boolean;
    FGridType: TCBSGridType;
    procedure SetCellData(Value: TKrimskyCellData);
    procedure DisplayClick(Sender: TObject);
    procedure SetBoxIsSelected(const Value: Boolean);
    function GetBoxPosition: TBoxPosition;
    procedure SetBoxPosition(const Value: TBoxPosition);
    function GetIsEmpty: Boolean;
    procedure SetGridType(const Value: TCBSGridType);
  protected
    procedure Paint; override;
  public
    property GridType: TCBSGridType read FGridType write SetGridType;
    property CellData: TKrimskyCellData read FCellData write SetCellData;
    property BoxPosition: TBoxPosition read GetBoxPosition write SetBoxPosition;
    property BoxIsSelected: Boolean read FBoxIsSelected write SetBoxIsSelected;
    property IsEmpty: Boolean read GetIsEmpty;
    constructor Create(AOwner: TComponent; ACTData: TCBSCTGridData);
    destructor Destroy; override;
  end;


  TCBSKrimskyCell = class(TCustomKrimskyCell);

  //TCustomKrimsky - the full single grid with all cells
  TCustomKrimsky = class(TPanel)
  private
    FCurrentCellData: TKrimskyCellData;
    FGridType: TCBSGridType;
    FGridSize: Integer;
    procedure SetCurrentCellData(Value: TKrimskyCellData);
    procedure SetGridType(const Value: TCBSGridType);
    procedure SetGridSize(const Value: Integer);
    procedure SetCTData(const Value: TCBSCTGridData);
  protected
    procedure Paint; override;
    procedure CellsSelect(SendPosition: TBoxPosition);
    procedure DisplayClick(Sender: TObject);
    procedure CreateCells(ACTData: TCBSCTGridData);
  public
    Cells: array[TBoxPosition] of TCBSKrimskyCell;
    property CTData: TCBSCTGridData write SetCTData;
    property CurrentCellData: TKrimskyCellData read FCurrentCellData write SetCurrentCellData;
    property GridType: TCBSGridType read FGridType write SetGridType;
    property GridSize: Integer read FGridSize write SetGridSize;
    procedure CopyToAll(CopyOnlyToBlanks:Boolean=True);
    procedure ClearAll;
    constructor Create(AOwner: TComponent; ACTData: TCBSCTGridData);
    destructor Destroy; override;
  end;

  TCBSKrimskyGrid = class(TCustomKrimsky);
  //TCustomCTGrid - collection of 4 grids

  TCustomCTGrid = class(TPanel)
  private
    FCTData: TCBSCTGridData;
    FGridOrientation: TGridOrientation;
    FGridSize: Integer;
    FMinimumGrid: Integer;
    function GetDataField: Widestring;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: Widestring);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetGridOrientation(const Value: TGridOrientation);
    procedure SetGridSize(const Value: Integer);
    procedure SetMinimumGrid(const Value: Integer);
    procedure SetColor(const Value: TColor);
    function GetColor: TColor;
    procedure SetCTData(const Value: TCBSCTGridData);
  protected
    procedure Paint; override;
    property CTData: TCBSCTGridData read FCTData write SetCTData;
    procedure Change;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
  public
    Grids: array[TCBSGridType] of TCBSKrimskyGrid;
    procedure UpdateData;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    property MinimumGrid: Integer read FMinimumGrid write SetMinimumGrid default 160;
  published
    property DataField: Widestring read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property GridOrientation: TGridOrientation read FGridOrientation write SetGridOrientation;
    property GridSize: Integer read FGridSize write SetGridSize;
    property Color read GetColor write SetColor;
  end;

  TCBSCTGrid = class(TCustomCTGrid)
  published
    property Top;
    property Left;
    property Height;
    property Width;
    property Visible;
  end;


implementation
 { TCBSKrimsky }

procedure TCustomKrimsky.CellsSelect(SendPosition: TBoxPosition);
var I: TBoxPosition;
begin
  for I := low(TBoxPosition) to high(TBoxPosition) do
  begin
    if I = SendPosition then continue
    else Cells[I].BoxIsSelected := False;
    Cells[I].Refresh;
  end;
end;


procedure TCustomKrimsky.ClearAll;
begin
  CurrentCellData.ClearData;
  CopyToAll(False);
end;

procedure TCustomKrimsky.CopyToAll(CopyOnlyToBlanks:Boolean=True);
var I: TBoxPosition;
begin
  for I := low(TBoxPosition) to high(TBoxPosition) do
  begin
    if not Cells[I].BoxIsSelected then
    begin
      if not CopyOnlyToBlanks or (Cells[I].IsEmpty) then
        Cells[I].CellData := CurrentCellData;
    end;
  end;

end;

constructor TCustomKrimsky.Create(AOwner: TComponent; ACTData: TCBSCTGridData);
begin
  inherited Create(AOwner as TComponent);
  FCurrentCellData := TKrimskyCellData.Create(Self, ACTData);
  if AOwner is TWinControl then
     Parent := TWinControl(AOwner);
  if AOwner is TCustomCTGrid then
  begin
    with AOwner as TCustomCTGrid do
    begin
      Height := 201;
      Width := 185;
      Top := 5;
      Left := 5;
    end;
  end
  else
  begin
    Height := 201;
    Width := 185;
    Top := 5;
    Left := 5;
  end;
  VerticalAlignment := taAlignTop;
  CreateCells(ACTData);
end;

procedure TCustomKrimsky.CreateCells(ACTData: TCBSCTGridData);
  var I: TBoxPosition;
  TempData: TKrimskyCellData;
begin
  for I := Low(TBoxPosition) to high(TBoxPosition) do
  begin
    Cells[I] := TCBSKrimskyCell.Create(Self, ACTData);
    Cells[I].Color := Self.Color;
    Cells[I].Parent := Self;
    Cells[I].BoxPosition := I;
    Cells[I].BoxIsSelected := False;
    Cells[I].GridType := GridType;
  end;
end;

destructor TCustomKrimsky.Destroy;
begin

  inherited;
end;

procedure TCustomKrimsky.DisplayClick(Sender: TObject);
begin
  ShowMessage('In Grid');
end;

procedure TCustomKrimsky.Paint;
 var
  AWinControl: TWinControl;
  ACanvas: TCanvas;
  Third, Header: Integer;
  I: TBoxPosition;
begin
  inherited;
  AWinControl := TWinControl(Self);
  ACanvas := TCanvas.Create;
  try
    ACanvas.Handle := GetDC(AWinControl.Handle);
    try
      //drawing part
      //draw divider lines
      Header := (Self.Font.Size*2);
      Third := trunc(Self.Width/3);
      ACanvas.MoveTo(Third, Header );
      ACanvas.LineTo(Third, Self.ClientHeight);
      ACanvas.MoveTo(Third*2,Header);
      ACanvas.LineTo(Third*2, Self.ClientHeight);
      Third := trunc((Self.Height-Header)/3);
      ACanvas.MoveTo(0, Third+Header);
      ACanvas.LineTo(Self.Width, Third+Header);
      ACanvas.MoveTo(0, (2*Third)+Header);
      ACanvas.LineTo(Self.ClientWidth, 2*Third+Header);
      // size and display cells
      for I := UL to LR do
      begin
        Third := trunc(Self.Width/3);
        Cells[I].Width := Third-4;
        case I of
          UL, CL, LL: Cells[I].Left := 2;
          UC, CC, LC: Cells[I].Left := Third+2;
          UR, CR, LR: Cells[I].Left := Third+Third+2;
        end;
        Third := trunc((Self.Height-Header)/3);
        Cells[I].Height := Third-4;
        case I of
          UL, UC, UR: Cells[I].Top := Header+2;
          CL, CC, CR: Cells[I].Top := Third+Header+2;
          LL, LC, LR: Cells[I].Top := Third+Third+Header+2;
        end;
      end;

    finally
      ReleaseDC(AWinControl.Handle, ACanvas.Handle);
      ACanvas.Handle := 0;
    end;
  finally
    ACanvas.Free;
  end;
end;


procedure TCustomKrimsky.SetCTData(const Value: TCBSCTGridData);
var I: TBoxPosition;
begin
  for I := low(TBoxPosition) to high(TBoxPosition) do
     Cells[I].CellData.CTData := Value;

end;

procedure TCustomKrimsky.SetCurrentCellData(Value: TKrimskyCellData);
begin
  FCurrentCellData.UpdateData(Value);
end;

procedure TCustomKrimsky.SetGridSize(const Value: Integer);
begin
  FGridSize := Value;
  Self.ClientHeight := FGridSize;
  Self.ClientWidth := FGridSize;
end;

procedure TCustomKrimsky.SetGridType(const Value: TCBSGridType);
var I: TBoxPosition;
begin
  case Value of
    CGTsc: Caption := 'SC Dist';
    CGTscprime: Caption := 'SC Near';
    CGTcc: Caption := 'CC Dist';
    CGTccprime: Caption := 'CC Near';
  end;

  if FGridType = Value then exit;

  FGridType := Value;
  for I := low(TBoxPosition) to high(TBoxPosition) do
     Cells[I].GridType := Value;
end;

{ TCustomKrimskyCell }

constructor TCustomKrimskyCell.Create(AOwner: TComponent; ACTData: TCBSCTGridData);
begin
  inherited Create(AOwner);
  if AOwner is TWinControl then
    Parent := TWinControl(AOwner);
  FCellData := TKrimskyCellData.Create(Self, ACTData);
//  randomize;
  VerticalDisplay := TCBSKrimskyDataDisplay.Create(Self);
  HorizontalDisplay := TCBSKrimskyDataDisplay.Create(Self);
  VerticalDisplay.Visible := False;
  HorizontalDisplay.Visible := False;
  VerticalLabel := TLabel.Create(Self);
  HorizontalLabel := TLabel.Create(Self);
  VerticalLabel.Parent := Self;
  HorizontalLabel.Parent := Self;
  VerticalLabel.Alignment := taCenter;
  HorizontalLabel.Alignment := taCenter;
  BevelOuter := bvNone;
  OnClick := DisplayClick;
  OnDblClick := DisplayClick;
  HorizontalDisplay.OnClick := DisplayClick;
  VerticalDisplay.OnClick := DisplayClick;
  HorizontalLabel.OnClick := DisplayClick;
  VerticalLabel.OnClick := DisplayClick;
  HorizontalDisplay.OnDblClick := DisplayClick;
  VerticalDisplay.OnDblClick := DisplayClick;
  HorizontalLabel.OnDblClick := DisplayClick;
  VerticalLabel.OnDblClick := DisplayClick;

  end;

destructor TCustomKrimskyCell.Destroy;
begin
  //FCellData.Free;
  inherited;
end;

procedure TCustomKrimskyCell.DisplayClick(Sender: TObject);
var EntryForm: TKrimskyDataEntryForm;
    ExitCode: Integer;
begin
  if not BoxIsSelected then
  begin
    BoxIsSelected := True;
    TCustomKrimsky(Parent).CellsSelect(BoxPosition);
    if IsEmpty then CellData := TCustomKrimsky(Parent).CurrentCellData;
    
  end
  else
  begin
    EntryForm := TKrimskyDataEntryForm.Create(nil);
    try
      with Self do
      begin
        EntryForm.GridType := GridType;
        EntryForm.VertDirection := CellData.Vertical.Direction;
        EntryForm.VertPrism := CellData.Vertical.Prism;
        EntryForm.HorizDirection := CellData.Horizontal.Direction;
        EntryForm.HorizPrism := CellData.Horizontal.Prism;
        ExitCode := EntryForm.ShowModal;
        if not (ExitCode = mrCancel) then
        begin
          CellData.Vertical.Direction := EntryForm.VertDirection;
          CellData.Vertical.Prism := EntryForm.VertPrism;
          CellData.Horizontal.Direction := EntryForm.HorizDirection;
          CellData.Horizontal.Prism := EntryForm.HorizPrism;
          TCustomKrimsky(Parent).CurrentCellData := CellData;
        end;
        if ExitCode = mrYesToAll then
        begin
          TCustomKrimsky(Parent).CopyToAll;
        end;
        if ExitCode = mrNoToAll then
        begin
          TCustomKrimsky(Parent).CopyToAll(False);
        end;

      end;
    finally
      FreeAndNil(EntryForm);
    end;
  end;
  Refresh;
end;

function TCustomKrimskyCell.GetBoxPosition: TBoxPosition;
begin
  Result := FCellData.BoxPosition;
end;

function TCustomKrimskyCell.GetIsEmpty: Boolean;
begin
  Result := ((CellData.Horizontal.KrimskyData = '') and (CellData.Vertical.KrimskyData = ''));
end;

procedure TCustomKrimskyCell.Paint;
begin
  inherited;
  if BoxIsSelected then Color := clHighlight else Color := TCustomKrimsky(Parent).Color;
  
  HorizontalDisplay.Width := Self.Width -4;
  HorizontalDisplay.Height := trunc((Self.Height-6)/2);
  HorizontalDisplay.Left := 2;
  HorizontalDisplay.Top := 2;
  VerticalDisplay.Width := HorizontalDisplay.Width;
  VerticalDisplay.Height := HorizontalDisplay.Height;
  VerticalDisplay.Left := HorizontalDisplay.Left;
  VerticalDisplay.Top := HorizontalDisplay.Height+4;
  VerticalDisplay.Caption := CellData.Vertical.KrimskyData;
  HorizontalDisplay.Caption := CellData.Horizontal.KrimskyData;
  HorizontalLabel.Width := Self.Width -4;
  HorizontalLabel.Height := trunc((Self.Height-6)/2);
  HorizontalLabel.Left := 2;
  HorizontalLabel.Top := 2;
  VerticalLabel.Width := HorizontalLabel.Width;
  VerticalLabel.Height := HorizontalLabel.Height;
  VerticalLabel.Left := HorizontalLabel.Left;
  VerticalLabel.Top := HorizontalLabel.Height+4;
  VerticalLabel.Caption := CellData.Vertical.KrimskyData;
  HorizontalLabel.Caption := CellData.Horizontal.KrimskyData;
end;

procedure TCustomKrimskyCell.SetCellData(Value: TKrimskyCellData);
begin
  FCellData.UpdateData(Value);
  VerticalDisplay.Caption := FCellData.Vertical.KrimskyData;
  HorizontalDisplay.Caption := FCellData.Horizontal.KrimskyData;
  VerticalLabel.Caption := FCellData.Vertical.KrimskyData;
  HorizontalLabel.Caption := FCellData.Horizontal.KrimskyData;
end;

procedure TCustomKrimskyCell.SetGridType(const Value: TCBSGridType);
begin
  FGridType := Value;
  if Assigned(FCellData) then
    FCellData.GridType := Value;
end;

procedure TCustomKrimskyCell.SetBoxPosition(const Value: TBoxPosition);
begin
  FCellData.BoxPosition := Value;
end;

procedure TCustomKrimskyCell.SetBoxIsSelected(const Value: Boolean);
begin
  FBoxIsSelected := Value;
end;

{ TCBSKrimskyDataPoint }

constructor TCBSKrimskyDataDisplay.Create(AOwner: TComponent);
begin
  inherited;
  if AOwner is TWincontrol then
    Parent := TWincontrol(AOwner);
  VerticalAlignment := taVerticalCenter;
//  OnClick := DisplayClick;
end;

destructor TCBSKrimskyDataDisplay.Destroy;
begin

  inherited;
end;

{ TCustomCTGrid }

procedure TCustomCTGrid.Change;
begin
  inherited;

end;

constructor TCustomCTGrid.Create(AOwner: TComponent);
var I: TCBSGridType;
begin
  inherited;
  MinimumGrid := 160;
  Top := 5;
  Left := 5;
  Visible := False;
  if AOwner is TWinControl then
     Parent := TWinControl(AOwner);
  FCTData := TCBSCTGridData.Create(Self);
  for I := low(TCBSGridType) to high(TCBSGridType) do
  begin
    Grids[I] := TCBSKrimskyGrid.Create(Self, FCTData);
    Grids[I].Color := Self.Color;
    Grids[I].Parent := Self;
    Grids[I].GridType := I;
  end;
  GridSize := MinimumGrid;
  GridOrientation := goHorizontal;
  VerticalAlignment := taAlignTop;
  Visible := True;
end;

destructor TCustomCTGrid.Destroy;
begin
  inherited;
end;

function TCustomCTGrid.GetColor: TColor;
begin
  Result := inherited Color;
end;

function TCustomCTGrid.GetDataField: Widestring;
begin
  Result := FCTData.DataField;
end;

function TCustomCTGrid.GetDataSource: TDataSource;
begin
 Result := FCTData.DataSource;
end;

procedure TCustomCTGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TCustomCTGrid.KeyPress(var Key: Char);
begin
  inherited;

end;

procedure TCustomCTGrid.Loaded;
begin
  inherited;

end;

procedure TCustomCTGrid.Paint;
var
  I: TCBSGridType;
  X: Integer;
begin
  inherited;
  case GridOrientation of
    goHorizontal:
    begin
      Height := GridSize + GridBorder + 16;
      Width := ((GridSize + GridBorder) * 4) + GridBorder;
    end;
    goVertical:
    begin
       Width := (GridSize + GridBorder *2);
       Height := ((GridSize + GridBorder) * 4) + GridBorder + 16;
    end;
    goSquare:
    begin
       Width := ((GridSize + GridBorder) * 2) + GridBorder;
       Height := ((GridSize + GridBorder) * 2) + GridBorder + 16;
    end; 
  end;
  X:=0;
  for I := low(TCBSGridType) to high(TCBSGridType) do
  begin
    if Assigned(Grids[I]) then
    begin
    case GridOrientation of
      goHorizontal:
      begin
        Grids[I].Top := 16;
        Grids[I].Left := GridBorder + (X * (GridSize + GridBorder));
      end;
      goVertical:
      begin
        Grids[I].Top := 16 + GridBorder + (X * (GridSize + GridBorder));
        Grids[I].Left := GridBorder;
      end;
      goSquare: ;
    end;
    end;
    Inc(X);
  end;
end;


procedure TCustomCTGrid.SetColor(const Value: TColor);
var I: TCBSGridType;
begin
  inherited Color := Value;
  for I := low(TCBSGridType) to high(TCBSGridType) do
    Grids[I].Color := Value;
end;

procedure TCustomCTGrid.SetCTData(const Value: TCBSCTGridData);
var I: TCBSGridType;
begin
  if FCTData = Value then exit;
  FCTData := Value;
  for I := low(TCBSGridType) to high(TCBSGridType) do
    Grids[I].CTData := Value;
end;

procedure TCustomCTGrid.SetDataField(const Value: Widestring);
begin
  FCTData.DataField := Value;
end;

procedure TCustomCTGrid.SetDataSource(const Value: TDataSource);
begin
  FCTData.DataSource := Value;
end;

procedure TCustomCTGrid.SetGridOrientation(const Value: TGridOrientation);
begin
  FGridOrientation := Value;
end;

procedure TCustomCTGrid.SetGridSize(const Value: Integer);
var
  I: TCBSGridType;
begin
  // Make sure that grid doesn't get too small
  if Value < MinimumGrid  then
    FGridSize := MinimumGrid
  else
    FGridSize := Value;
  for I := low(TCBSGridType) to high(TCBSGridType) do
    Grids[I].GridSize := FGridSize;

  Refresh;
end;

procedure TCustomCTGrid.SetMinimumGrid(const Value: Integer);
begin
  FMinimumGrid := Value;
end;

procedure TCustomCTGrid.UpdateData;
begin
  FCTData.UpdateData(Self);
end;

{ TDBKrimskyGrid }


end.
