unit CBSComponents;

interface

uses Windows, Classes, Controls, Forms, SysUtils, Messages,
  DBCtrls, DBChart, Graphics, StdCtrls, ExtCtrls,
  Buttons, DB, adsdata, adsfunc, adstable, ComCtrls,
  Types, Mask, JvDBSpinEdit, Dialogs, JvDBRadioPanel,
  CBSDBCtrls, CBSGraphics, SmartFields, FormComponents,
  CBSPrintComponents, CBSKrimskyDisplay, CBSKrimsky, DBGrids, CBSExtComponents;
{$M+}

function GetPrinting(const ObjectName: String; Container: TControl):Boolean;

type

  THackControl = class(TControl);

  TCBSPageControl = class(TPageControl)
  published
    property AutoSize;
  end;
                                       
  TCBSPrintCheckbox = class(TCBSCustomPrintCheckbox)
  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
  end;

  TCBSPrintText = class(TCBSCustomPrintText)  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  public
    function IsPrinting: Boolean; override;
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
  end;

  TCBSPrintField = class(TCBSCustomPrintField)
  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
  end;

  TCBSPrintMemo = class(TCBSCustomPrintMemo)
  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
  end;
  TCBSPrintImage = class(TCBSCustomPrintImage)
  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
    property BorderStyle;
  end;

  TCBSPrintGrid = class(TCBSCustomPrintGrid)
  private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
    property DataSource;
    property FilterStatement;
  end;

  TCBSPrintPanel = class(TCBSCustomPrintPanel)
    private
    FCheckDefaultField: String;
    procedure SetCheckDefaultField(Value: String);
  published
    property CheckDefault: String read FCheckDefaultField write SetCheckDefaultField;
    property BorderStyle;
  end;

  TCBSPrintRx = class(TCBSCustomPrintRx);


type TStateColors = class(TComponent)
  private
    FFromForwardedFont: TFont;
    FFromNewFont: TFont;
    FFromDefaultFont: TFont;
    FFromTouchedFont: TFont;
    procedure SetFromDefaultFont(const Value: TFont);
    procedure SetFromForwardedFont(const Value: TFont);
    procedure SetFromNewFont(const Value: TFont);
    procedure SetFromTouchedFont(const Value: TFont);
public
  constructor Create(AOwner: TComponent);override;
  property FromDefaultFont: TFont read FFromDefaultFont write SetFromDefaultFont;
  property FromNewFont: TFont read FFromNewFont write SetFromNewFont;
  property FromForwardedFont: TFont read FFromForwardedFont write SetFromForwardedFont;
  property FromTouchedFont: TFont read FFromTouchedFont write SetFromTouchedFont;
end;

type TEditTool = (etDefaultOnly, etSlider, etNumPad);
type TEditTools = set of TEditTool;

type TCBSDocInfo = class(TPersistent)
private
  FTitle :String;
published
  property Title :String read FTitle write FTitle;
end;

type TInfoSource = (fromNew, fromForward, fromDefault, fromTouched);

type  TUpdateStatus = class(TPersistent)
  private
  FInfoSource: TInfoSource;
  FOnChangeInfoSource: TNotifyEvent;
  procedure SetInfoSource(const Value: TInfoSource);
  property OnChangeInfoSource: TNotifyEvent read FOnChangeInfoSource write FOnChangeInfoSource;
  procedure DoChangeInfoSource;virtual;
  procedure ChangeColor(Sender: TObject);
public
  property InfoSource: TInfoSource read FinfoSource write SetInfoSource;
end;


type TCBSDBNavigator = class(TDBNavigator);

type TCBSDBEdit = class(TDBEdit)
private
  FUpdateStatus :TUpdateStatus;
  FEditTool : TEditTool;
  FDocumentInfo : TCBSDocInfo;
  FSmartEvents: TSmartEvents;
    FFormatType: TFormatType;
  procedure SetDocumentInfo(const Value: TCBSDocInfo);
  procedure SetSmartEvents(const Value: TSmartEvents);
    procedure SetFormatType(const Value: TFormatType);
protected
  procedure Change; override;
  procedure KeyPress(var Key: Char); override;
public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
published
  property FormatType: TFormatType read FFormatType write SetFormatType default ftNormal;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
  property EditTool: TEditTool read FEditTool write FEditTool default etDefaultOnly;
  property DocumentInfo :TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
end;

type TCBSLabel = class(TLabel)
end;

type TCBSDBDateTimePicker = class(TDBCalendarCombo)
private
    FNullText: String;
    FTime: TDateTime;
    FDropDownDate: TDate;
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
  constructor Create(AOwner: TComponent); override;
published
    property DropDownDate: TDate read FDropDownDate write FDropDownDate;
    property Time: TDateTime read FTime write FTime;
    property Left;
    property Height;
    property Width;
    property Top;
    property NullText: String read FNullText write FNullText;
    property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
    property DateSelectorOn;

end;
{private
  FDocumentInfo : TCBSDocInfo;
  procedure SetDocumentInfo(const Value: TCBSDocInfo);
  //procedure CNNotify(var Msg: TWMNotify); message CN_NOTIFY;

published
  constructor Create(AOwner: TComponent); override;
  property DocumentInfo: TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
end;
}
// type TCBSDBComboBox = class(TDBCombobox)
type TCBSDBComboBox = class(TDBMultiCheckCombo)
private
  FUpdateStatus :TUpdateStatus;
  FEditTool : TEditTool;
  FDocumentInfo: TCBSDocInfo;
  FSmartEvents: TSmartEvents;
  procedure SetDocumentInfo(const Value: TCBSDocInfo);
  procedure SetSmartEvents(const Value: TSmartEvents);
public
  constructor Create(AOwner: TComponent); override;
  property OnDropDown;
published
  property DocumentInfo: TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
  property EditTool: TEditTool read FEditTool write FEditTool default EtDefaultOnly;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSDBMemo = class(TDBMemo)
  private
  FUpdateStatus :TUpdateStatus;
  FDocumentInfo: TCBSDocInfo;
  FSmartEvents: TSmartEvents;
  procedure SetDocumentInfo(const Value: TCBSDocInfo);
  procedure SetSmartEvents(const Value: TSmartEvents);
public
  constructor Create(AOwner: TComponent); override;
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSButton = class(TButton)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;


type TCBSDBCheckbox = class(TMyDBCheckbox)
private
  FUpdateStatus :TUpdateStatus;
    FDocumentInfo: TCBSDocInfo;
    FSmartEvents: TSmartEvents;
    procedure SetDocumentInfo(const Value: TCBSDocInfo);
    procedure SetSmartEvents(const Value: TSmartEvents);
public
  constructor Create(AOwner: TComponent); override;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSDBLookupComboBox = class(TDBLookupComboBox)
private
  FUpdateStatus :TUpdateStatus;
    FDocumentInfo: TCBSDocInfo;
    FSmartEvents: TSmartEvents;
    procedure SetDocumentInfo(const Value: TCBSDocInfo);
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSDBChart = class(TDBChart)
private
  FUpdateStatus :TUpdateStatus;
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSDBRichEdit = class(TDBRichEdit)
private
  FUpdateStatus :TUpdateStatus;
    FDocumentInfo: TCBSDocInfo;
    FSmartEvents: TSmartEvents;
    procedure SetDocumentInfo(const Value: TCBSDocInfo);
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSPanel = class(TPanel)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSDBRadioGroup = class(TJvDBRadioPanel)
private
  FUpdateStatus :TUpdateStatus;
    FDocumentInfo: TCBSDocInfo;
    FSmartEvents: TSmartEvents;
    procedure SetDocumentInfo(const Value: TCBSDocInfo);
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
  property UpdateStatus: TUpdateStatus read FUpdateStatus write FUpdateStatus;
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;

end;

type TCBSSpinEdit = class(TJvDBSpinEdit)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;
{ TODO : Limit Spin button to numeric fields }

type TCBSDBSpinEdit = class(TCBSSpinEdit)
private
    FDocumentInfo: TCBSDocInfo;
    procedure SetDocumentInfo(const Value: TCBSDocInfo);
published
  property DocumentInfo : TCBSDocInfo read FDocumentInfo write SetDocumentInfo;

end;

type TCBSBitBtn = class(TBitBtn)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
end;

type TCBSQuery = class(TDataSource)
protected
  FQuery :TADSQuery;
  FDataSource: TDataSource;
    function GetDataBase: String;
    procedure SetDatabase(const Value: String);
    function GetSQLSource: TStrings;
    procedure SetSQLSource(const Value: TStrings);
public
  constructor Create(AOwner: TComponent); override;
  property Query : TAdsQuery read FQuery write FQuery;
  property DataSource: TDataSource read FDataSource ;
published
  property Databasename : String read GetDataBase write SetDatabase;
  property SQLSource : TStrings read GetSQLSource write SetSQLSource;
end;

type TCBSDBGrid = class(TDBGrid)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
protected
  procedure Loaded; override;
public
   constructor Create(AOwner: TComponent); override;
    procedure Keydown(var Key: Word; Shift: TShiftState);override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);override;
published
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
  property OnDblClick;
  
end;

type TCBSFilterDBGrid = class(TCustomCBSDBGrid)
private
    FSmartEvents: TSmartEvents;
    procedure SetSmartEvents(const Value: TSmartEvents);
public
   constructor Create(AOwner: TComponent); override;
   procedure KeyDown(var Key: Word; Shift: TShiftState); override;
   procedure MouseDown(Button: TMouseButton; Shift: TShiftState;  X, Y: Integer); override;
   property Canvas;
   property SelectedRows;
 published
  property ReadOnly;
  property SmartEvents: TSmartEvents read FSmartEvents write SetSmartEvents;
  property LinkedDataSource;
  property LinkedDataKeyField;
  property FilterStatement;
  property CurrentPatientOnly;
  property CurrentExamOnly;
  property Color;
  property Columns stored False; //StoreColumns;
  property Font;
  property Options;
  property ParentBiDiMode;
  property ParentColor;
  property ParentCtl3D;
  property ParentFont;
  property ParentShowHint;
  property PopupMenu;
  property ShowHint;
  property TabOrder;
  property TabStop;
  property TitleFont;
  property Visible;
  property OnEnter;
  property OnExit;
  property OnDblClick;
end;

procedure RegisterCBSComponents;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CBS Tools',[TCBSDBDateTimePicker]);
  RegisterComponents('CBS Tools',[TCBSDBEdit, TCBSButton, TCBSBitBtn, TCBSDBCheckbox]);
  RegisterComponents('CBS Tools',[TCBSDBComboBox, TCBSDBImage, TCBSDBMemo ]);
  RegisterComponents('CBS Tools',[TCBSdbradioGroup, TCBSLabel, TCBSPanel, TCBSDBSpinEdit ]);
  RegisterComponents('CBS Tools',[TCBSDBGrid, TCBSFilterDBGrid, TCBSDBNavigator]);
  RegisterComponents('CBS Tools',[TCBSPrintText,TCBSPrintField,TCBSPrintMemo,TCBSPrintImage]);
  RegisterComponents('CBS Tools',[TCBSPrintGrid,TCBSPrintPanel,TCBSPrintRx, TCBSPrintCheckBox]);
  RegisterComponents('CBS Tools',[TCBSCTGrid]);

end;

procedure RegisterCBSComponents;
begin
  RegisterClasses([TCBSDBEdit, TCBSButton, TCBSBitBtn, TCBSDBChart, TCBSDBCheckbox]);
  RegisterClasses([TCBSDBComboBox, TCBSDBImage, TCBSDBMemo ]);
  RegisterClasses([TCBSdbradioGroup, TCBSLabel, TCBSPanel ]);
  RegisterClasses([TCBSDBSpinEdit, TEdit, TDBEdit, TDataSet, TADSTable, TDataSource]);
  RegisterClasses([TCBSDBGrid, TCBSFilterDBGrid, TCBSQuery, TCBSDBDateTimePicker, TCBSDBNavigator]);
  RegisterClasses([TImage]);
  RegisterClasses([TCBSPrintText,TCBSPrintField,TCBSPrintMemo,TCBSPrintImage]);
  RegisterClasses([TCBSPrintGrid,TCBSPrintPanel,TCBSPrintRx, TCBSPrintCheckBox]);
  RegisterClasses([TCBSCTGrid]);
end;


{ TCBSQuery }


constructor TCBSQuery.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := TADSQuery.Create(AOwner);
  FDataSource := TDataSource.Create(AOwner);
  FDataSource.DataSet := FQuery;
end;

function TCBSQuery.GetDataBase: String;
begin
  Result := FQuery.DatabaseName;
end;



procedure TCBSQuery.SetDatabase(const Value: String);
begin
  if not (FQuery.DatabaseName = Value) then
    FQuery.DatabaseName := Value;
end;

function TCBSQuery.GetSQLSource: TStrings;
begin
  Result := FQuery.SQL;
end;

procedure TCBSQuery.SetSQLSource(const Value: TStrings);
begin
 if not (FQuery.SQL = Value) then
   FQuery.SQL := Value;
end;

{ TCBSDBEdit }

procedure TCBSDBEdit.Change;
var F: TField;
begin
  inherited;
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

end;

constructor TCBSDBEdit.Create(AOwner: TComponent);
begin
  try
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit];
  except
    DataField := '';
  end;
end;



destructor TCBSDBEdit.Destroy;
begin
  FSmartEvents.Destroy;
  inherited;
end;

procedure TCBSDBEdit.KeyPress(var Key: Char);
procedure CheckFormat;
  var I: Integer;
      SaveText: String;
      SaveReal: Real;
      Error: Integer;
      StartPos, EndPos: DWord;
      AdjustPosition, AtEnd: Boolean;
  begin
    // only allow numericals
    if (pos(Key,'-+.1234567890') = 0) then
    begin
      Key := #0;
      exit;
    end;
    AdjustPosition := False;
    AtEnd := False;
    // Get any selected text positioning
    SendMessage(Handle, EM_GETSEL, Integer(@StartPos), Integer(@EndPos));
    //Dump any selected text
    SaveText := copy(Text,1,StartPos)+copy(Text,EndPos+1,Length(Text));
    if (Key = '-') and (pos('-',SaveText)=0) then exit; //allow one .
    if Key = '-' then //discard additional
    begin
      Key := #0;
      exit;
    end;
    if (Key = '.') and (pos('.',SaveText)=0) then exit; //allow one .
    if Key = '.' then //discard additional
    begin
      Key := #0;
      exit;
    end;
    //Insert the Key at the position of the cursor
    SaveText := copy(Text,1,StartPos)+Key+copy(Text,EndPos+1,Length(Text));
    //prep for the addition of the plus or minus
    AdjustPosition := (pos(SaveText[1],'-+')=0);
    //if we're at the end, make sure we finish at the end
    if StartPos = Length(Text) then AtEnd := True;
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
          SaveText := FormatFloat('"+"#0.##;"-"#0.##',SaveReal);
        end;
        ftPrism:
        begin
          if Abs(SaveReal) >=100 then
          begin
            Key := #0;
            exit;
          end;
          SaveText := FormatFloat('##0.##',SaveReal);
        end;
      end;
      Text := SaveText;
      //Determine cursor position
      if AtEnd then
        StartPos := Length(Text)
      else
      begin
        //We've added a character so move one to the right
        Inc(StartPos);
        //We've added the plus or minus so move another to the right
        if AdjustPosition then Inc(StartPos);
      end;
      SendMessage(Handle, EM_SETSEL, 0, MakeLParam(StartPos, StartPos));
    end;
    // No matter what, if we got this far, we are dumping the keystroke
    Key := #0;
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
end;



procedure TCBSDBEdit.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBEdit.SetFormatType(const Value: TFormatType);
begin
  FFormatType := Value;
end;

procedure TCBSDBEdit.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents.Assign(Value);
end;

{ TCBSDBComboBox }

constructor TCBSDBComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit];

end;

procedure TCBSDBComboBox.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBComboBox.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBMemo }

constructor TCBSDBMemo.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit, seDblClick];
end;

procedure TCBSDBMemo.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBMemo.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSButton }

constructor TCBSButton.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seClick];

end;


procedure TCBSButton.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBCheckbox }

constructor TCBSDBCheckbox.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seClick];
end;

procedure TCBSDBCheckbox.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBCheckbox.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBLookupComboBox }

constructor TCBSDBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit];
  Refresh;
end;

procedure TCBSDBLookupComboBox.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBLookupComboBox.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBChart }

constructor TCBSDBChart.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit,seDblClick];

end;

procedure TCBSDBChart.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBRichEdit }

constructor TCBSDBRichEdit.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit];
end;

procedure TCBSDBRichEdit.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBRichEdit.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSPanel }

constructor TCBSPanel.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seDblClick];

end;

procedure TCBSPanel.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBRadioGroup }

constructor TCBSDBRadioGroup.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit,seClick];
end;

procedure TCBSDBRadioGroup.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

procedure TCBSDBRadioGroup.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSSpinEdit }

constructor TCBSSpinEdit.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seEnter,seExit];
end;

procedure TCBSSpinEdit.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSBitBtn }

constructor TCBSBitBtn.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seClick];
end;

procedure TCBSBitBtn.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBGrid }

constructor TCBSDBGrid.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seGridLoad];
end;

procedure TCBSDBGrid.Keydown(var Key: Word; Shift: TShiftState);
begin
if NOT (DataSource.DataSet.State in dsEditModes)
    then inherited;
end;

procedure TCBSDBGrid.Loaded;
begin
  inherited;
  Columns.State := csCustomized;
end;

procedure TCBSDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin

if not (Assigned(DataSource) and Assigned(DataSource.DataSet)) then  exit;

if NOT (DataSource.DataSet.State in dsEditModes)
    then
begin
  inherited MouseDown(Button, Shift, X, Y);
end;
end;

procedure TCBSDBGrid.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TUpdateStatus }

procedure TUpdateStatus.ChangeColor(Sender: TObject);
begin
  THackControl(Sender).Color := clBlue;
end;

procedure TUpdateStatus.DoChangeInfoSource;
begin
  if Assigned(FOnChangeInfoSource) then
    FOnChangeInfoSource(Self)
  else
    ChangeColor(Self);
end;

procedure TUpdateStatus.SetInfoSource(const Value: TInfoSource);
begin
  if FInfoSource <> Value then
  begin
    FInfoSource := Value;
    DoChangeInfoSource;
  end;
end;

{ TCBSDBDateTimePicker }
{
procedure TCBSDBDateTimePicker.CNNotify(var Msg: TWMNotify);

function IsBlankSysTime(const St: TSystemTime): Boolean;
begin
  with St do
    Result := (wYear = 0) and (wMonth = 0) and
      (wDayOfWeek = 0) and (wDay = 0) and
      (wHour = 0) and (wMinute = 0) and
      (wSecond = 0) and (wMilliseconds = 0);
end;
procedure SetCalendarStyle(AHandle: THandle; Value: Integer; UseStyle: Boolean);
var
  Style: Integer;
begin
  if AHandle <> 0 then
  begin
    Style := GetWindowLong(AHandle, GWL_STYLE);
    if UseStyle then
      Style := Style or Value
    else
      Style := Style and not Value;
    SetWindowLong(AHandle, GWL_STYLE, Style);
  end;
end;
}
{procedure UpdateCalendar(CalHandle: THandle);
begin
  if CalHandle <> 0 then
  begin
    SetCalendarStyle(CalHandle,MCS_WEEKNUMBERS, WeekNumbers);
    SetCalendarStyle(CalHandle,MCS_NOTODAY, not ShowToday);
    SetCalendarStyle(CalHandle,MCS_NOTODAYCIRCLE, not ShowTodayCircle);
  end;
end;

var
  ACal: THandle;
  St: TSystemTime;
  Dt: TDateTime;
  AllowChange: Boolean;

begin
  case Msg.NMHdr^.code of
    DTN_DROPDOWN:
      begin
        inherited;
        ACal := DateTime_GetMonthCal(Handle);
        UpdateCalendar(ACal);
//        if CheckNullValue and (ACal <> 0) then
//        begin
          DateTimeToSystemTime(DropDownDate, St);
          if not IsBlankSysTime(St) then
            MonthCal_SetCurSel(ACal, St);
//        end;
        SendMessage(Acal,WM_PAINT,0,0);
      end;
    end;
  inherited;

end;
}
{constructor TCBSDBDateTimePicker.Create(AOwner: TComponent);
begin
  inherited;
  Kind := dtkDate;
  NullDate := StrToDate('12/30/1899');
  NullText := '  /  /    ';
  DropDownDate := date;
end;

procedure TCBSDBDateTimePicker.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;
}
{ TCBSDBSpinEdit }

procedure TCBSDBSpinEdit.SetDocumentInfo(const Value: TCBSDocInfo);
begin
  FDocumentInfo := Value;
end;

{ TStateColors }

procedure TStateColors.SetFromForwardedFont(const Value: TFont);
begin
  FFromForwardedFont := Value;
end;

procedure TStateColors.SetFromNewFont(const Value: TFont);
begin
  FFromNewFont := Value;
end;

procedure TStateColors.SetFromDefaultFont(const Value: TFont);
begin
  FFromDefaultFont := Value;
end;

procedure TStateColors.SetFromTouchedFont(const Value: TFont);
begin
  FFromTouchedFont := Value;
end;

constructor TStateColors.Create(AOwner: TComponent);
begin
  inherited;
  FFromForwardedFont := TFont.Create;
  FFromNewFont := TFont.create;
  FFromDefaultFont := TFont.create;
  FFromTouchedFont := TFont.create;

end;

{ TCBSDBDateTimePicker }

constructor TCBSDBDateTimePicker.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(Self);
  FSmartEvents.ShowEvents := [seEnter, seExit];
end;

procedure TCBSDBDateTimePicker.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

{ TCBSDBReportText }


{ TCBSPrintCheckbox }

procedure TCBSPrintCheckbox.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;
end;

{ TCBSPrintImage }

procedure TCBSPrintImage.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;
end;

{ TCBSPrintText }

function TCBSPrintText.IsPrinting: Boolean;
begin
  Result := inherited IsPrinting;
  if not Result and (FCheckDefaultField <> '') then
    Result := GetPrinting(FCheckDefaultField,Self.Parent as TWinControl);
end;

procedure TCBSPrintText.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;

end;

{ TCBSPrintField }

procedure TCBSPrintField.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;

end;

{ TCBSPrintMemo }

procedure TCBSPrintMemo.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;

end;

function GetPrinting(const ObjectName: String; Container: TControl):Boolean;
var ThisControl: IPrintProperties;
begin
  if Supports(Container.FindComponent(ObjectName),IPrintProperties,ThisControl) then
    Result := ThisControl.IsPrinting
  else
    Result := True;
end;

{ TCBSPrintGrid }

procedure TCBSPrintGrid.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;
end;

{ TCBSPrintPanel }

procedure TCBSPrintPanel.SetCheckDefaultField(Value: String);
begin
  FCheckDefaultField := Value;
end;

{ TCBSFilterDBGrid }

constructor TCBSFilterDBGrid.Create(AOwner: TComponent);
begin
  inherited;
  FSmartEvents := TSmartEvents.Create(AOwner);
  FSmartEvents.ShowEvents := [seGridLoad];
  Columns.State := csCustomized;
end;

procedure TCBSFilterDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
if not (Assigned(LinkedDataSource) and Assigned(LinkedDataSource.DataSet)) then  exit;

if NOT (LinkedDataSource.DataSet.State in dsEditModes)
    then inherited;
end;

procedure TCBSFilterDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
if not (Assigned(LinkedDataSource) and Assigned(LinkedDataSource.DataSet)) then  exit;

if NOT (LinkedDataSource.DataSet.State in dsEditModes)
    then inherited;

end;

procedure TCBSFilterDBGrid.SetSmartEvents(const Value: TSmartEvents);
begin
  FSmartEvents := Value;
end;

end.
