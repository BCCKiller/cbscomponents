unit PopupFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, Math, ExtCtrls;

const
  ConstantHeight = 0;
  ConstantWidth = 0;

  UM_INVALIDATEROW = WM_USER+321;


type

  TMultiSelectType = (mtcheckbox,mthighlight);

  TKeyboardSelectType = (ktAlpha, ktNumeric);

type  TCBSMagicGrid = class(TStringGrid)
  private
    FMultiSelect: Boolean;
    FMultiSelectType: TMultiSelectType;
    FKeyboardSelect: Boolean;
    FKeyboardSelectType: TKeyboardSelectType;
    FCheck, FNoCheck: TBitmap;
    SelectedStrings: TStringList;
    FStartItem: String;
    procedure LoadList(const Items: TStringList);
    procedure SetMultiSelectType(const Value: TMultiSelectType);
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetKeyboardSelect(const Value: Boolean);
    procedure SetKeyboardSelectType(const Value: TKeyboardSelectType);
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    procedure ClickGrid(Sender: TObject);
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure KeyPress(var Key: Char);override;
    procedure ToggleCheckbox(acol, arow: Integer);
    procedure SetReturnString(const Value: String);
    function GetReturnString: String;
    function RemoveBrackets(const Value: String): String;
    procedure SetStartItem(const Value: String);
    procedure Paint; override;
    procedure UnSelectItem(arow: Integer);
    procedure SelectItem(arow: Integer);
    procedure UpdateFromGrid(aRow: Integer; AddOnly: Boolean=False);
    procedure UpdateGrid(aRow: Integer);
    procedure SetGridRow;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure UpdateFromSelectedStrings;
    public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure SetGridSize(GridHeight,GridWidth:Integer); // if height or weight is 0, sets to col and row actual, otherwise sets to values, returns values
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property MultiSelectType: TMultiSelectType read FMultiSelectType write SetMultiSelectType default mtCheckBox;
    property KeyboardSelect: Boolean read FKeyboardSelect write SetKeyboardSelect;
    property KeyboardSelectType: TKeyboardSelectType read FKeyboardSelectType write SetKeyboardSelectType;
    property ReturnString: String read GetReturnString write SetReturnString;
    property OnMouseUp;
    property OnClick;
    property StartItem: String read FStartItem write SetStartItem;
    procedure FinalChoice;
  end;

type  TPopupstyle = (psCalendar,  psMultiCheck, psCalSelect);

type   TCBSMonthCalendar = class(TMonthCalendar)
    private
      property OnMouseUp;
    end;

type
  TDaysSelector = class(TRadioGroup)
  public
    constructor Create(AOwner: TComponent);override;
    function ChangeDate(StartDate: TDate):TDate;

  end;

type
  TPopupForm = class(TForm)
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FMultiSelect: Boolean;
    FReturnString: String;
    FReturnDate: TDate;
    FPopupStyle: TPopupStyle;
    FPopupMonthCalendar: TCBSMonthCalendar;
    FDaysSelector: TDaysSelector;
    FGrid: TCBSMagicGrid;
    FItems: TStringList;
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetReturnString(const Value: String);
    function GetReturnString: String;
    procedure SetReturnDate(const Value: TDate);
    procedure SetPopupStyle(const Value: TPopupStyle);
    procedure SetPopupMonthCalendar(const Value: TCBSMonthCalendar);
    procedure SetGrid(const Value: TCBSMagicGrid);
    procedure SetItems(const Value: TStringList);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure WMNCRBUTTONDOWN(var msg: TMessage);
    procedure SetDaysSelector(const Value: TDaysSelector);
    { Private declarations }
  public
    { Public declarations }
    procedure LoadItems(Items: TStringList);
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property PopupMonthCalendar: TCBSMonthCalendar read FPopupMonthCalendar write SetPopupMonthCalendar;
    property DaysSelector: TDaysSelector read FDaysSelector write SetDaysSelector;
    property Grid: TCBSMagicGrid read FGrid write SetGrid;
    property ReturnString: String read GetReturnString write SetReturnString;
    property ReturnDate: TDate read FReturnDate write SetReturnDate;
    property PopupStyle : TPopupStyle read FPopupStyle write SetPopupStyle;
    property Items: TStringList read FItems write SetItems;
end;

implementation

{$R *.DFM}

procedure TPopupForm.SetReturnString(const Value: String);
begin
  FReturnString := Value;
  if fPopupStyle = psMultiCheck then
    Grid.ReturnString := Value;
end;

procedure TPopupForm.WMNCRBUTTONDOWN(var msg: TMessage);
begin
  ModalResult := mrNo;
  msg.Result := 0;
  inherited;
end;

procedure TPopupForm.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
  if Assigned(FGrid) then
    FGrid.MultiSelect := FMultiSelect;
end;

procedure TPopupForm.FormCreate(Sender: TObject);
begin
  FItems := TStringList.Create;
  FItems.CaseSensitive := False;
  Brush.Style:=bsClear;
  BorderStyle:=bsNone;
  FReturnString := '';
end;

procedure TPopupForm.FormDblClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TPopupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNo then exit;
  case fPopupStyle of
  psCalendar:
  begin
    ReturnDate := FPopupMonthCalendar.Date;
  end;
  psCalSelect:
  begin
    ReturnDate := FDaysSelector.ChangeDate(FPopupMonthCalendar.Date);
  end;
  psMultiCheck:
  begin
    FReturnString := Grid.ReturnString;
  end;
  end;
end;

procedure TPopupForm.SetReturnDate(const Value: TDate);
begin
  FReturnDate := Value;
end;

procedure TPopupForm.SetPopupMonthCalendar(const Value: TCBSMonthCalendar);
begin

end;

procedure TPopupForm.SetPopupStyle(const Value: TPopupStyle);
begin
  FPopupStyle := Value;
  case fPopupStyle  of
    psCalendar: begin
      if not Assigned(FPopupMonthCalendar) then
        FPopupMonthCalendar := TCBSMonthCalendar.Create(Self);
      FPopupMonthCalendar.Parent := Self as TWinControl;
      FPopupMonthCalendar.Visible := False;
      FPopupMonthCalendar.OnDblClick := OnDblClick;
      FPopupMonthCalendar.OnMouseUp := OnMouseUp;
    end;
    psMultiCheck: begin
      if not Assigned(FGrid) then
        FGrid := TCBSMagicGrid.Create(Self);
      FGrid.Parent := Self as TWinControl;
      FGrid.Visible := False;
      FGrid.OnMouseUp := OnMouseUp;
      FGrid.OnDblClick := OnDblClick;
      FGrid.DefaultDrawing := True;
    end;
    psCalSelect: begin
      if not Assigned(FDaysSelector) then
         FDaysSelector := TDaysSelector.Create(Self);
      FDaysSelector.Parent := Self as TWinControl;
      FDaysSelector.Visible := False;
      FDaysSelector.OnClick := OnDblClick;
    end;
  end;
end;

procedure TPopupForm.FormShow(Sender: TObject);
var Corner: TPoint;
begin
  case fPopupStyle of
  psCalendar:
  begin
    FPopupMonthCalendar.Date := ReturnDate;
    ClientHeight := FPopupMonthCalendar.Height;
    ClientWidth := FPopupMonthCalendar.Width;
    FPopupMonthCalendar.Visible := True;
  end;
  psCalSelect:
  begin
    FPopupMonthCalendar.Date := ReturnDate;
    FDaysSelector.Height := FPopupMonthCalendar.Height;
    ClientHeight := max(FDaysSelector.Height, FPopupMonthCalendar.Height);
    ClientWidth := FPopupMonthCalendar.Width+FDaysSelector.Width;
    FPopupMonthCalendar.Left := FDaysSelector.Left + FDaysSelector.Width;
    FPopupMonthCalendar.Visible := True;
    FDaysSelector.Visible := True;
  end;
  psMultiCheck:
  begin
    Grid.SetGridSize(0,0);
    Grid.LoadList(Items);
    Grid.MultiSelect := FMultiSelect;
//    if Grid.MultiSelect then
//      Grid.Width := Grid.Width + Grid.ColWidths[1]; 
    Grid.Visible := True;
    Height := Grid.Height;
    //BorderStyle := bsToolWindow;
    //BorderWidth := Trunc(ConstantWidth/2);
    ClientHeight := Grid.Height;
    ClientWidth := Grid.Width;
    ClientHeight := Grid.Height+ConstantHeight;
    ClientWidth := Grid.Width+ConstantWidth;
    BorderWidth := ConstantWidth;
    Grid.SetFocus;
    //Caption := 'Enter|DblClick=Select --- Esc|RtClick=Cancel';
  end;
  end;
  //Adjust position for screen
  Corner := Point(ClientWidth,ClientHeight);
  Corner := Self.ClientToScreen(Corner);
  if Corner.Y > Screen.Height-50 then Corner.Y :=  Screen.Height-50;
  if Corner.X > Screen.Width then Corner.X := Screen.Width;
  Corner := Self.ScreenToClient(Corner);
  Top := Top + (Corner.Y - ClientHeight);
  Left := Left + (Corner.X - ClientWidth);
  Refresh;
end;

function TPopupForm.GetReturnString: String;
begin
  Result := FReturnString;
  if PopupStyle = psMultiCheck then
    Result := Grid.ReturnString;
end;

procedure TPopupForm.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RBUTTON  then
  begin
    ModalResult := mrNo;
    Key := 0;
  end;

  inherited;

end;

procedure TPopupForm.LoadItems(Items: TStringList);
var
  x: Integer;
begin
  FItems.Clear;
  for x := 0 to Items.Count - 1 do
    FItems.Add(Items[x]);
  if FPopupStyle = psMultiCheck then
    Grid.LoadList(FItems);
end;



procedure TPopupForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    ModalResult := mrNo;
  end;
  if Assigned(Grid) then Grid.KeyPress(Key);
  
end;

procedure TPopupForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    ModalResult := mrNo;
end;

procedure TPopupForm.FormDestroy(Sender: TObject);
begin
  FItems.Free;
//  UnHookWindowsHookEx(hkk);
end;

{ TCBSMagicGrid }

procedure TCBSMagicGrid.ClickGrid(Sender: TObject);
var
  pt: TPoint;
  aCol, aRow: Integer;
begin
  inherited;
  GetCursorPos( pt );
  pt:= ScreenToClient( pt );
  MouseToCell( pt.x, pt.y, aCol, aRow );
  If (aCol = 1) and (aRow >= fixedRows) Then Begin
    // click landed in a checkbox cell
    ToggleCheckbox( aCol, aRow );
  End;

end;

constructor TCBSMagicGrid.Create(AOwner: TComponent);
var
  bmp: TBitmap;
  x: Integer;
begin
  inherited;
  Onclick := ClickGrid;
  FCheck := TBitmap.Create;
  FNoCheck := TBitmap.Create;
  bmp:= TBitmap.create;
  SelectedStrings := TStringList.Create;
  try
    bmp.handle := LoadBitmap( 0, PChar(OBM_CHECKBOXES ));
    // bmp now has a 4x3 bitmap of divers state images
    // used by checkboxes and radiobuttons
    With FNoCheck Do Begin
      // the first subimage is the unchecked box
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect );
    End;
    With FCheck Do Begin
      // the second subimage is the checked box
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect(
        canvas.cliprect,
        bmp.canvas,
        rect( width, 0, 2*width, height ));
    End;
  finally
    bmp.free
  end;
  BorderStyle := bsNone;
//  BevelWidth := 1;
//  BevelKind := bkTile;
//  BevelInner := bvRaised;
//  BevelOuter := bvLowered;
  DefaultRowHeight := 18;
  DefaultColWidth := 12;
  FixedCols := 1;
  FixedColor := clFuchsia;
  GridLineWidth := 2;
  FixedRows := 0;
  ColCount := 3;
  RowCount := 26;
  ScrollBars := ssVertical;
  Options := Options - [ goFixedHorzLine, goHorzLine ];
  Options := Options + [ goFixedVertLine ];
  ColWidths[2] := 200;
  for x:= 0 to 25 do
    Cells[0,x] := CHR(65+x);
end;

destructor TCBSMagicGrid.Destroy;
begin
  FCheck.Free;
  FNoCheck.Free;
  SelectedStrings.Free;
  inherited;
end;

procedure TCBSMagicGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RBUTTON  then
  begin
    (Parent as TPopupForm).ModalResult := mrNo;
    Key := 0;
  end;
  inherited;
end;

procedure TCBSMagicGrid.KeyPress(var Key: Char);
var KeyToRow: Integer;
  I: Integer;
begin
  Case Key of
   #32:
     If MultiSelect then
       ToggleCheckbox( 1, row );
  'a'..'z', 'A'..'Z':
  begin
    if ('a' <= Key) and (Key <= 'z') then
      Key := Char(Integer(Key) - 32);
// look for letter in visible rows starting at top
    for I := TopRow to (TopRow+VisibleRowCount) - 1 do
      if Cells[0,I][1]= Key then
      begin
        KeyToRow := I;
        break;
      end;
    if KeyToRow < RowCount then
    begin
      Row := KeyToRow;
      ToggleCheckbox(1,KeyToRow);
      if not MultiSelect then
        (Parent as TPopupForm).ModalResult := mrYes;
    end;
  end;
  #27: (Parent as TPopupForm).ModalResult := mrNo;
  #13:
  begin
    UpdateFromGrid(Row,True);
    (Parent as TPopupForm).ModalResult := mrYes;
  end;
 End;
 Key := #0;
 inherited;
end;

procedure TCBSMagicGrid.LoadList(const Items: TStringList);
var x, GridHeight: Integer;
begin
  GridHeight := 0;
  for x := 0 to Items.Count - 1 do
  begin
    Cells[2,x] := Items[x];
    // Set up the alpha in the first column
    Cells[0,x] := CHR(65+(x mod 26));
    if x < 26 then
      GridHeight := GridHeight + RowHeights[x]{+GridLineWidth};
  end;
  RowCount := Items.Count;
  Height := GridHeight+(GridLineWidth);
end;


procedure TCBSMagicGrid.Paint;
var x,y: Integer;
begin
  inherited;
end;

function TCBSMagicGrid.RemoveBrackets(const Value: String): String;
var x: Integer;
    BetweenBrackets: Boolean;
begin
  Result := '';
  BetweenBrackets := False;
  for x:= 1 to Length(Value) do
  begin
    if not BetweenBrackets then
    begin
      if Value[x]='[' then
        BetweenBrackets := True
      else
        Result := Result + Value[x];

    end
    else
    if Value[x]=']' then
        BetweenBrackets := False;

  end;
  Result := Trim(Result);  
end;

function TCBSMagicGrid.SelectCell(ACol, ARow: Integer): Boolean;
begin
    If aCol = 1 Then
      Options := Options - [ goediting ]
    Else
      Options := Options + [ goediting ];
end;

procedure TCBSMagicGrid.SetKeyboardSelect(const Value: Boolean);
begin
  FKeyboardSelect := Value;
end;

procedure TCBSMagicGrid.SetKeyboardSelectType(const Value: TKeyboardSelectType);
begin
  FKeyboardSelectType := Value;
end;


procedure TCBSMagicGrid.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
  if FMultiSelect then
    ColWidths[1] := 18
  else
     ColWidths[1] := -1;
end;

procedure TCBSMagicGrid.SetMultiSelectType(const Value: TMultiSelectType);
begin
  FMultiSelectType := Value;
end;

procedure TCBSMagicGrid.SetReturnString(const Value: String);
procedure ParseDelimited(const sl : TStrings; const value : string; const delimiter : string) ;
var
   dx : integer;
   ns : string;
   txt : string;
   delta : integer;
begin
   delta := Length(delimiter) ;
   txt := value + delimiter;
   sl.BeginUpdate;
   sl.Clear;
   try
     while Length(txt) > 0 do
     begin
       dx := Pos(delimiter, txt) ;
       ns := Trim(Copy(txt,0,dx-1)) ;
       sl.Add(ns) ;
       txt := Copy(txt,dx+delta,MaxInt) ;
     end;
   finally
     sl.EndUpdate;
   end;
end;
var TempStrings: TStringList;
    x, SelectedIndex, SelectedRow: Integer;
    CheckString: String;
begin
  SelectedRow := 0;
  TempStrings := TStringList.Create;
  try
    //Parse the string
    ParseDelimited(TempStrings,Value,',');
    // Add any checked items in the Grid
    for x := 0 to RowCount - 1 do
      begin
        if Assigned(Objects[1,x]) then
        begin
          CheckString := RemoveBrackets(Cells[2,x]);
          SelectedIndex := TempStrings.IndexOf(CheckString);
          if SelectedIndex < 0 then   // if it is not there, add it
            TempStrings.Add(CheckString);
        end;
      end;
    // copy from Temp to the final
    for x := 0 to TempStrings.count - 1 do
      if SelectedStrings.IndexOf(TempStrings[x])<0 then
        SelectedStrings.Add(TempStrings[x]);

    UpdateFromSelectedStrings;
  finally
    TempStrings.Free;
  end;
  Row := SelectedRow;
end;


procedure TCBSMagicGrid.SetStartItem(const Value: String);
begin
  FStartItem := Trim(uppercase(Value));
  SetGridRow;
end;

function TCBSMagicGrid.GetReturnString: String;
var
  x: Integer;
begin
// check against grid
  for x := 0 to RowCount - 1 do
    begin
      if Assigned(Objects[1,x]) then
      begin
        UpdateFromGrid(x);
      end;
    end;

// Add commas and return
  Result := '';
  for x := 0 to SelectedStrings.Count -1 do
  begin
    if Result = '' then
      Result := SelectedStrings[x]
    else
      if Length(SelectedStrings[x]) > 0 then
        Result := Result + ', '+SelectedStrings[x]
  end;
end;


procedure TPopupForm.SetDaysSelector(const Value: TDaysSelector);
begin
  FDaysSelector := Value;
end;

procedure TPopupForm.SetGrid(const Value: TCBSMagicGrid);
begin
  FGrid := Value;
end;

procedure TPopupForm.SetItems(const Value: TStringList);
begin
  FItems := Value;
  Grid.LoadList(Value);
  Height := Grid.Height;
end;

procedure TCBSMagicGrid.SetGridRow;
var I: Integer;
begin
  for I := 0 to RowCount - 1 do
    begin
      if uppercase(RemoveBrackets(Cells[2,I]))=StartItem then
      begin
        Row := I;
        exit;
      end;
    end;
  for I := 0 to RowCount - 1 do
    begin
      if uppercase(RemoveBrackets(Cells[2,I]))>StartItem then
      begin
        Row := max(0,I-1);
        exit;
      end;
    end;
end;

procedure TCBSMagicGrid.SetGridSize(GridHeight, GridWidth: Integer);
var I: Integer;
begin
//  GridWidth := 0;
//  GridHeight := 0;
  if GridHeight <= 0 then
    for I:=0 to RowCount -1 do
      GridHeight := GridHeight + Max(0,RowHeights[I]{+(GridLineWidth)});
  if GridWidth <= 0 then
    for I:=0 to ColCount -1 do
      GridWidth := GridWidth + Max(0,ColWidths[I]+GridLineWidth);
  Height := GridHeight+(2*GridLineWidth);// Add top and bottom line
  Width := GridWidth;

end;

procedure TCBSMagicGrid.UpdateGrid(aRow: Integer);
var CheckString: String;
    SelectedIndex: Integer;
begin
  CheckString := RemoveBrackets(Cells[2, aRow]);
  SelectedIndex := SelectedStrings.IndexOf(CheckString);
  // Row value Is in SelectedStrings and not checked
  if (SelectedIndex >= 0) and (Objects[1, aRow] = nil) then
    ToggleCheckBox(1, aRow);
  // Row value is NOT in SelectedString and IS checked
  if (SelectedIndex < 0) and (Assigned(Objects[1, aRow])) then
    ToggleCheckBox(1, aRow);
end;

procedure TCBSMagicGrid.UpdateFromGrid(aRow: Integer; AddOnly: Boolean=False);
var
  CheckString: string;
  SelectedIndex: Integer;
begin
  if AddOnly and (Objects[1, aRow] = nil) then ToggleCheckBox(1,aRow);
  
  CheckString := RemoveBrackets(Cells[2, aRow]);
  SelectedIndex := SelectedStrings.IndexOf(CheckString);
  // Row value Is in SelectedStrings and not checked
  if (SelectedIndex >= 0) and (Objects[1, aRow] = nil) then
    SelectedStrings.Delete(SelectedIndex);
  // Row value is NOT in SelectedString and IS checked
  if (SelectedIndex < 0) and (Assigned(Objects[1, aRow])) then
    SelectedStrings.Add(CheckString);
end;

procedure TCBSMagicGrid.SelectItem(arow: Integer);
var
  CheckString: string;
  SelectedIndex: Integer;
begin
  // check to see if the text is in Selected Strings
  CheckString := RemoveBrackets(Cells[2, aRow]);
  // if it is an empty string exit
  if CheckString = '' then exit;
  // See if the Checkstring is already part of either selected or sent
  SelectedIndex := SelectedStrings.IndexOf(CheckString);
  if SelectedIndex < 0 then
    // if it is not there, add it
    if FMultiSelect then
      SelectedStrings.Add(CheckString)
    else
    begin
      // if this should be added to  (,) sent through as last character
      if trim(SelectedStrings[pred(SelectedStrings.Count)])='' then
        SelectedStrings[pred(SelectedStrings.Count)] := CheckString
      else
      begin
        // Replace what was sent through
        SelectedStrings.Clear;
        SelectedStrings.Add(CheckString);
        // Clear Grid checks
        UpdateFromSelectedStrings;
      end;
    end;

end;

procedure TCBSMagicGrid.UnSelectItem(arow: Integer);
var
  CheckString: string;
  SelectedIndex: Integer;
begin
  // check to see if the text is in Selected Strings
  CheckString := RemoveBrackets(Cells[2, aRow]);
  SelectedIndex := SelectedStrings.IndexOf(CheckString);
  if SelectedIndex >= 0 then
    // if it is there, delete
    SelectedStrings.Delete(SelectedIndex);
end;

procedure TCBSMagicGrid.ToggleCheckbox(acol, arow: Integer);
begin
  If aCol = 1 Then
  begin
      If Assigned( Objects[aCol, aRow] ) Then
      begin //was checked...uncheck it
        Objects[aCol, aRow] := Nil;
        UnSelectItem(aRow);
      end
      Else
      begin //was unchecked...check it
        Objects[aCol, aRow] := Pointer(1);
        SelectItem(arow);
      end;
    InvalidateCell( aCol, aRow );
  End;
end;

procedure TCBSMagicGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  inherited;
  If not ( gdFixed In AState ) Then
  Begin
    if (aCol = 1) then
    begin
      With Canvas Do Begin
        brush.color := $E0E0E0;
        // checkboxes look better on a non-white background
        Fillrect( Arect );
        // listbox state is encoded by the Objects property
        If Assigned(Objects[aCol, aRow]) Then
          Draw( (Arect.right + Arect.left - FCheck.width) div 2,
                (Arect.bottom + Arect.top - FCheck.height) div 2,
                FCheck )
        Else
          Draw( (Arect.right + Arect.left - FNoCheck.width) div 2,
                (Arect.bottom + Arect.top - FNoCheck.height) div 2,
                FNoCheck )
      End;
    end
    else
    begin
      if aCol = 0 then Canvas.Font.Style := [fsBold] else Canvas.Font.Style := [];
      if Row = aRow then
      begin
        With Canvas do
        begin
          Brush.Color := clBlue;
          Brush.Style := bsSolid;
          FillRect( ARect );
          Font.Color := clWhite;
          TextRect( ARect, ARect.Left+2, ARect.Top+2, Cells[acol, arow]);
        end;
      end;
      Canvas.Brush := Brush;
    end;
  End;
  EditorMode := False;
//  InvalidateGrid;
end;

procedure TCBSMagicGrid.FinalChoice;
begin
  if Row >=0 then
    UpdateFromGrid(Row,True);
end;

procedure TCBSMagicGrid.UpdateFromSelectedStrings;
var
  x: Integer;
begin
  // Update checks in Grid
  for x := 0 to RowCount - 1 do
  begin
    UpdateGrid(x);
  end;
end;

{ TDaysSelector }

function TDaysSelector.ChangeDate(StartDate: TDate): TDate;
  var DaysToAdd: Integer;
begin
  DaysToAdd := 0;
  case ItemIndex of
    0: DaysToAdd := 7;
    1: DaysToAdd := 14;
    2: DaysToAdd := 21;
    3: DaysToAdd := 30;
    4: DaysToAdd := 60;
    5: DaysToAdd := 90;
    6: DaysToAdd := 120;
    7: DaysToAdd := 150;
    8: DaysToAdd := 180;
    9: DaysToAdd := 210;
    10: DaysToAdd := 240;
    11: DaysToAdd := 270;
    12: DaysToAdd := 300;
    13: DaysToAdd := 330;
    14: DaysToAdd := 365;
    15: DaysToAdd := 730;
  end;
  Result := Date + DaysToAdd;
end;

constructor TDaysSelector.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Parent := AOwner as TWincontrol;
  Color := clWindow;
  Columns := 2;
  Width := 160;
  Caption := '';
  Ctl3D := False;
  Items.Add('1 week');
  Items.Add('2 weeks');
  Items.Add('3 weeks');
  Items.Add('1 month');
  Items.Add('2 months');
  Items.Add('3 months');
  Items.Add('4 months');
  Items.Add('5 months');
  Items.Add('6 months');
  Items.Add('7 months');
  Items.Add('8 months');
  Items.Add('9 months');
  Items.Add('10 months');
  Items.Add('11 months');
  Items.Add('1 year');
  Items.Add('2 years');
end;

end.
