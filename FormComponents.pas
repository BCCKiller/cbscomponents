unit FormComponents;

interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,  StdCtrls,
  DB, DBCtrls,adsdata, adsfunc, adstable,
  DateUtils, math, StrUtils, PopupFormMain;

type

  TFormatType = (ftNormal, ftSphere, ftCylinder, ftPrism);

  TCustomDropDown = class(TDBComboBox)
  private
    FMultiSelect: Boolean;
    fPopup : TPopupForm;
    FPopupStyle: TPopupStyle;
    FItems: TStrings;
    FOnDropDown: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    procedure CustomPopup(Sender: TObject);
    procedure SetPopupStyle(const Value: TPopupStyle);
    function GetItems: TStrings;
    procedure SetItems(const Value: TStrings);
    procedure LoadItems;
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetOnDblClick(const Value: TNotifyEvent);
  protected
    procedure Change; override;
    procedure Dropdown; override;
    procedure DblClick; override;
    procedure RunPopup; virtual; abstract;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnDblClick: TNotifyEvent read FOnDblClick write SetOnDblClick;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
  public
    property PopupStyle: TPopupStyle read FPopupStyle write SetPopupStyle;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Replace Items of combobox with TStrings to avoid awkward dropdown
    property Items: TStrings read GetItems write SetItems;
//    property Items;
 end;

  TDBMultiCheckCombo = class(TCustomDropDown)
  private
    FStartItem: String;
    FFormatType: TFormatType;
    procedure SetStartItem(const Value: String);
    function TypeAheadLookup(const TypeAhead:String):String;
    procedure SetFormatType(const Value: TFormatType);
  protected
    procedure Change; override;
    procedure RunPopup; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
  public
    property StartItem: String read FStartItem write SetStartItem;
  published
    constructor Create(AOwner: TComponent); override;
    property Left;
    property Height;
    property Width;
    property Top;
    property OnDropDown;
    property OnDblClick;
    property MultiSelect;
    property FormatType: TFormatType read FFormatType write SetFormatType default ftNormal;
  end;

  TDBCalendarCombo = class(TCustomDropDown)
  private
    FDate: TDate;
    function  GetMasked: Boolean;
    procedure SetDate(const Value: TDate);
    procedure SetDateSelector(Value: Boolean);
    function GetDateSelector: Boolean;
  protected
    procedure KeyPress(var Key: Char); override;
    procedure RunPopup; override;
    property Date: TDate read FDate write SetDate;
    property DateSelectorOn: Boolean read GetDateSelector write SetDateSelector default false;

  public
    constructor Create(AOwner: TComponent); override;
end;

  implementation


{ TCustomDropDown }

procedure TCustomDropDown.Change;
var F: TField;
begin
    // Set edit to be no longer than field length
  if (MaxLength = 0) and Assigned(DataSource) then
  begin
    if Assigned(DataSource.DataSet) then
    begin
      F := DataSource.DataSet.FindField(DataField);
      if Assigned(F) and (F.DataType in [ftString, ftWideString]) then
      begin
        MaxLength := F.Size;
      end;
    end;
  end;
  inherited Change;
end;

procedure TCustomDropDown.DblClick;
begin
//  if not ((DataSource.State = dsEdit) or (DataSource.State = dsInsert)) then
//    exit;

  if Assigned(FOnDblClick) then FOnDblClick(Self) else
    DropDown;
end;

constructor TCustomDropDown.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
  TStringList(FItems).CaseSensitive := False;
end;

procedure TCustomDropDown.CustomPopup(Sender: TObject);
var StartPoint, EndPoint: TPoint;
begin
  if not Assigned(fPopup) then
    fPopup := TPopupForm.Create(nil);
  try
    fPopup.PopupStyle := fPopupStyle;
    FPopup.MultiSelect := FMultiSelect;
    with TWinControl(Sender) do
    begin
      StartPoint.Y := Height;
      StartPoint.X := 0;
      EndPoint := ClientToScreen(StartPoint);
    end;
    fPopup.Top := EndPoint.Y;
    fPopup.Left := EndPoint.X;
    RunPopup;
  finally
    fPopup.Free;
    fPopup := nil;
  end;
end;

destructor TCustomDropDown.Destroy;
begin
  FreeAndNil(FItems);
  inherited;
end;

procedure TCustomDropDown.DropDown;
begin

  if not ((DataSource.State = dsEdit) or (DataSource.State = dsInsert)) then
  begin
    SendMessage(Self.Handle, CBN_CLOSEUP, 1, 0);
    exit;
  end;

  if Assigned(FOnDropDown) then FOnDropDown(Self) else CustomPopup(Self);

end;

function TCustomDropDown.GetItems: TStrings;
begin
  Result := FItems;
end;

procedure TCustomDropDown.LoadItems;
begin
  if FItems.Count > 0 then exit;
  // call the load utility
  if DataSource.Name = 'S_EXAM' then
  begin
  end;
end;

procedure TCustomDropDown.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TCustomDropDown.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
end;

procedure TCustomDropDown.SetOnDblClick(const Value: TNotifyEvent);
begin
  FOnDblClick := Value;
end;

procedure TCustomDropDown.SetPopupStyle(const Value: TPopupStyle);
begin
  FPopupStyle := Value;
end;

{ TDBCalendarCombo }

constructor TDBCalendarCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PopupStyle := psCalendar;
  // EditMask := '99/99/9999;1; ';
end;

function TDBCalendarCombo.GetDateSelector: Boolean;
begin
  if PopupStyle = psCalSelect  then Result := True else Result := False;

end;

function TDBCalendarCombo.GetMasked: Boolean;
begin
//  Result := EditMask <> '';
end;



procedure TDBCalendarCombo.KeyPress(var Key: Char);
// inline function to check for digit
function IsDigit(Test: char): Boolean;
begin
  Result := (Pos(Test,'0123456789')>0);
end;
// inline function to check for days in a given month
function IsGoodDay(Test:char; Month: String; Position:Integer):Boolean;
var MonthNumber: Integer;
    CheckStr1, CheckStr2: String;
begin
  MonthNumber := StrToInt(Month);
   CheckStr1 := '0123';
  case MonthNumber of
  1: CheckStr2 := '01';
  2: begin
     CheckStr1 := '012';
     end;
  3: CheckStr2 := '01';
  4: CheckStr2 := '0';
  5: CheckStr2 := '01';
  6: CheckStr2 := '0';
  7: CheckStr2 := '01';
  8: CheckStr2 := '01';
  9: CheckStr2 := '00';
  10:CheckStr2 := '01';
  11:CheckStr2 := '00';
  12:CheckStr2 := '01';
  end;
  if Position = 1 then
    Result := (pos(Test,CheckStr1)>0)
  else
    if Month[1] = '3' then
      Result := (pos(Test,CheckStr2)>0)
    else
      Result := IsDigit(Test);
end;
// inline function to check for likely date
function IsDateKeys(const TestStr: String):Boolean;
var x: Integer;
begin
  if Length(TestStr)>10 then
  begin
    Result := False;
    exit;
  end;
  Result := True;
  for x := 1 to Length(TestStr) do
  begin
    case x of
    1: Result := (pos(TestStr[x],'01')>0);
    2: begin
         if TestStr[1] = '0' then
           Result := IsDigit(TestStr[x])
         else
           Result := (pos(TestStr[x],'012')>0);
       end;
    3: Result := (TestStr[x]='/');
 { TODO : Change 4 and 5 to check for appropriate month/day combinations }
    4: Result := IsGoodDay(TestStr[x],TestStr[1]+TestStr[2],1);
    5: Result := IsGoodDay(TestStr[x],TestStr[1]+TestStr[2],2);
    6:  Result := (TestStr[x]='/');
    7:  Result := (pos(TestStr[x],'12')>0);
    8:  Result := IsDigit(TestStr[x]);
    9:  Result := IsDigit(TestStr[x]);
    10:  Result := IsDigit(TestStr[x]);
    end;
    if not Result then exit;
  end;
end;
// Here's where it is handled
begin
  if ReadOnly then Key := #0;

  if Key = Char(8) then
    Text := copy(Text,1,max(Length(Text)-1,0))
  else
    if (Key > Char(30)) and (not IsDateKeys(Text+Key)) then Key := #0;
  inherited KeyPress(Key);
end;

procedure TDBCalendarCombo.RunPopup;
// inline function
function IsDate(DateStr:String):Boolean;
var dt: TDate;
begin
  Result := True;
  try
    if Length(DateStr)<8 then
      Result := False
    else
      dt := StrToDate(DateStr);
  except
    Result := False;
  end;
end;
var popBack: Integer;
begin
  if Readonly then Exit;
  if IsDate(Text) then
    fPopup.ReturnDate := StrToDate(Text)
  else
    fPopup.ReturnDate := Today;
  PopBack := fPopup.ShowModal;
  if PopBack = mrYes then
  begin
    Text := FormatDateTime('mm/dd/yyyy',fPopup.ReturnDate);
    Field.AsString := Text;
  end;
end;

procedure TDBCalendarCombo.SetDate(const Value: TDate);
begin
  FDate := Value;
  if ((DataSource.State = dsEdit) or (DataSource.State = dsInsert)) then
    DataSource.DataSet.FieldByName(DataField).AsDateTime := Value;
end;

procedure TDBCalendarCombo.SetDateSelector(Value: Boolean);
begin
  if Value then
    PopupStyle := psCalSelect
  else
    PopupStyle := psCalendar;

end;

{ TDBMultiClickCombo }

procedure TDBMultiCheckCombo.Change;
  function LeadPlus(NumericString: String): String;
  begin
  end;

begin
  inherited;
end;

constructor TDBMultiCheckCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PopupStyle := psMultiCheck;
  FMultiSelect := False;
  StartItem := '0.00';
end;


procedure TDBMultiCheckCombo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not ((DataSource.State = dsEdit) or (DataSource.State = dsInsert)) then
    Key := 0;
  case Key of
    VK_F7:
    begin
      DropDown;
      Key := 0;
    end;
  end;
  inherited;
end;

procedure TDBMultiCheckCombo.KeyPress(var Key: Char);

  procedure CheckFormat;
  var I: Integer;
      SaveText: String;
      SaveReal: Real;
      Error: Integer;
      StartPos, EndPos: DWord;
      AdjustStartPos: Integer;
  begin
    // only allow numericals
    if (pos(Key,'-+.1234567890') = 0) then
    begin
      Key := #0;
      exit;
    end;
    // Get any selected text positioning
    SendMessage(Handle, CB_GETEDITSEL, Integer(@StartPos), Integer(@EndPos));
    //Dump any selected text
    SaveText := copy(Text,1,StartPos)+copy(Text,EndPos+1,Length(Text));
    //allow one -, + or . at starting position
    if (Key in ['-','.','+']) and (StartPos=0) and (pos(Key,SaveText)=0) then exit;
    if Key in ['-','.','+'] then //discard additional
    begin
      //.point is hit and we are to the left of the decimal point
      if (Key = '.') and (StartPos < pos('.',Text)) then
      begin
        StartPos :=  pos('.',Text);
        //move cursor to right of decimal point
        SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(StartPos, StartPos));
      end;
      Key := #0;
      exit;
    end;
    //Insert the Key at the position of the cursor
    SaveText := copy(Text,1,StartPos)+Key+copy(Text,EndPos+1,Length(Text));
    //Convert the value to a numeric
    Val(SaveText,SaveReal,Error);
//    if Error <> 0 then StripNonNumber;
    //Only do the formatting if the value is a numeric
    if Error = 0 then
    begin
      Case FFormatType of
        ftSphere, ftCylinder:
        begin
          if Abs(SaveReal) >=100 then
          begin
            Key := #0;
            exit;
          end;
          SaveText := FormatFloat('"+"#0.00;"-"#0.00',SaveReal);
        end;
        ftPrism:
        begin
          if Abs(SaveReal) >=100 then
          begin
            Key := #0;
            exit;
          end;
          SaveText := FormatFloat('##0.00',SaveReal);
        end;
      end;
      SendMessage(Handle, CB_SETCURSEL, -1, 0);
      // Adjust StartPos based on inserted characters to left of decimal
      if pos('.',Text)=0 then
        //if there wasn't a . then position to the left of the decimal in new Text
        AdjustStartPos := pos('.',SaveText)-1
      else
        AdjustStartPos := pos('.',SaveText)-pos('.',Text);

      StartPos := StartPos+AdjustStartPos;
      Text := SaveText;
      SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(StartPos, StartPos));
    end;
    // No matter what, if we got this far, we are dumping the keystroke
    Key := #0;
  end;

  function HasSelectedText(var StartPos, EndPos: DWORD): Boolean;
  begin
    if Style in [csDropDown, csSimple] then
    begin
      SendMessage(Handle, CB_GETEDITSEL, Integer(@StartPos), Integer(@EndPos));
      Result := EndPos > StartPos;
    end
    else
      Result := False;
  end;
  procedure DeleteSelectedText;
  var
    StartPos, EndPos: DWORD;
    OldText: String;
  begin
    OldText := Text;
    SendMessage(Handle, CB_GETEDITSEL, Integer(@StartPos), Integer(@EndPos));
    Delete(OldText, StartPos + 1, EndPos - StartPos);
    SendMessage(Handle, CB_SETCURSEL, -1, 0);
    Text := OldText;
    SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(StartPos, StartPos));
  end;
var
  StartPos: DWORD;
  EndPos: DWORD;
  SaveText: String;
  F: TField;
begin
  if not ((DataSource.State = dsEdit) or (DataSource.State = dsInsert)) then
  begin
    Key := #0;
    exit;
  end;
    // Set edit to be no longer than field length
  if (MaxLength = 0) and Assigned(DataSource) then
  begin
    if Assigned(DataSource.DataSet) then
    begin
      F := DataSource.DataSet.FindField(DataField);
      if Assigned(F) and (F.DataType in [ftString, ftWideString]) then
      begin
        MaxLength := F.Size;
      end;
    end;
  end;

  Case Key of
  'a'..'z': if Length(Text)=0 then Key := Char(Integer(Key) - 32); //capitalize first chars
  End;
  // This is here rather than earlier so the key can be capped first
  inherited KeyPress(Key);

  if not (FFormatType = ftNormal) then  CheckFormat;

  if (Ord(Key)>31) then
  begin
    // Save all unselected text
    if HasSelectedText(StartPos, EndPos) then
      SaveText := Copy(Text, 1, StartPos) + Key +Copy(Text,EndPos+1)
    else
    //~DJ This is the spot to fix.  Puts at the end rather than insertion point
      SaveText := Copy(Text, 1, StartPos) + Key +Copy(Text,StartPos+1);
    if (MaxLength > 0) and (Length(SaveText)>MaxLength) then
    begin
      //Check to be sure new text isn't too long
      Key := #0;
      exit;
    end;
    if AutoComplete then
    begin
      //Lookup the SaveText and store in Text
       Text := TypeAheadLookup(SaveText);
       //Limit Text size to Field Size if defined
       if (MaxLength > 0) then
         Text := copy(Text,1,MaxLength);
       if Text = SaveText then
         SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(StartPos+1, StartPos+1))
       else
        //Select all text that is not part of SaveText
        SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Length(SaveText), Length(Text)));
    end
    else
    begin
      //not AutoComplete, just save
      Text := SaveText;
    end;
    // All the work is done
    Key := #0;
    Change;
  end;
end;

procedure TDBMultiCheckCombo.RunPopup;
var PopBack: Integer;
    TempStringList: TStringList;
begin
  if Readonly then Exit;
  if Items.Count = 0 then
  begin
    Application.MessageBox('Selected drop down table is empty','Information',MB_OK);
    Exit;
  end;

  TempStringList := TStringList.Create;
  try
    TempStringList.Assign(Items);
    //fPopup.LoadItems(Items as TStringList);
    fPopup.LoadItems(TempStringList);
    fPopup.ReturnString := Text;
    fPopup.Grid.MultiSelect := Self.MultiSelect;
    fPopup.Grid.StartItem := StartItem;
    PopBack := fPopup.ShowModal;
    if PopBack = mrYes then
    begin
      fPopup.Grid.FinalChoice;
      Text := fPopup.ReturnString;
      Field.AsString := Text;
    end;
  finally
    TempStringList.Free;
  end;
end;

procedure TDBMultiCheckCombo.SetFormatType(const Value: TFormatType);
begin
  FFormatType := Value;
end;

procedure TDBMultiCheckCombo.SetStartItem(const Value: String);
Function IsNumeric(s: String) : Boolean;
  VAR
    Code: Integer;
    Value: Double;
BEGIN
  val(s, Value, Code);
  Result := (Code = 0)
END;
begin
  FStartItem := Value;
  // Handle problem of leading - going to -0.25
  if (leftstr(Value,1) = '-') and IsNumeric(Value) then
    if ABS(StrToCurr(Value))<0.125 then FStartItem := '0.00';

end;

function TDBMultiCheckCombo.TypeAheadLookup(const TypeAhead: String): String;
var
  I: Integer;
begin
  Result := TypeAhead;
  for I := 0 to FItems.Count - 1 do
  begin
    if (uppercase(TypeAhead) = uppercase(copy(FItems[I],1,Length(TypeAhead)))) then
    begin
      Result := Fitems[I];
      break;
    end;
  end;
end;

end.
