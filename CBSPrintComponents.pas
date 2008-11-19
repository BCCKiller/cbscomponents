unit CBSPrintComponents;

interface
uses Windows, Classes, Controls, Messages, DB, DBCtrls, CBSGraphics,
DBGrids, ExtCtrls,StdCtrls, Forms, SysUtils, adscnnct, adsdata, adsfunc, adstable,
Graphics, GR32, GR32_Image, strutils, CheckCBSDefault, CBSExtComponents, jpeg;

type

  IPrintProperties = Interface
    ['{18BE250D-9C72-4622-902E-7CA056B7B5C7}']
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
    function IsPrinting: Boolean;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
  end;

  IDefaultCheck = Interface
    ['{7A9A53F5-3254-46B3-B1D0-9602DF5A16E5}']
    function IsDefault: Boolean;
//    function GetConnection: ADSHandle;
//    procedure SetConnection(Value: ADSHandle);
//    property Connection: ADSHandle read GetConnection write SetConnection;
  end;

  IDataAccess = interface
  ['{E15252CE-8814-4A11-8DED-FF6FFF1BEDF4}']
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure DataChange(Sender : TObject);
    property Field : TField read GetField;
    property DataSource : TDataSource
                    read GetDataSource
                    write SetDataSource;
    property DataField : string
                    read GetDataField
                    write SetDataField;
  end;

  TCBSCustomPrintText = class(TCustomLabel,IPrintProperties)
  private
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBreakBefore: Boolean;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
  public
    constructor Create(AOwner: TComponent);
    function IsPrinting: Boolean;virtual;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color nodefault;
    property Font;
    property WordWrap;
    property Top;
    property Left;
  end;

  TCBSCustomPrintField = class(TCustomEdit, IPrintProperties, IDataAccess, IDefaultCheck)
  private
    FDataLink: TFieldDataLink;
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBreakBefore: Boolean;
//    FConnection: ADSHandle;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure DataChange(Sender : TObject);
    property Field : TField read GetField;
//    function GetConnection: ADSHandle;
//    procedure SetConnection(Value: ADSHandle);
//    property Connection: ADSHandle read GetConnection write SetConnection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsDefault: Boolean;
    function IsPrinting: Boolean;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
    property AutoSize;
    property Color nodefault;
    property Font;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property DataField : string read GetDataField write SetDataField;
   end;

  TCBSCustomPrintCheckbox = class(TCustomCheckbox,IPrintProperties, IDataAccess, IDefaultCheck)
    private
    FDataLink: TFieldDataLink;
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBreakBefore: Boolean;
//    FConnection: ADSHandle;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure DataChange(Sender : TObject);
    property Field : TField read GetField;
//    function GetConnection: ADSHandle;
//    procedure SetConnection(Value: ADSHandle);
//    property Connection: ADSHandle read GetConnection write SetConnection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsDefault: Boolean;
    function IsPrinting: Boolean;
    property Checked;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default True;
    property Caption;
    property Color nodefault;
    property Font;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property DataField : string read GetDataField write SetDataField;
   end;


  TCBSCustomPrintMemo = class(TCustomMemo, IPrintProperties, IDataAccess)
  private
    FDataLink: TFieldDataLink;
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBreakBefore: Boolean;
//    FConnection: ADSHandle;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure DataChange(Sender : TObject);
    property Field : TField read GetField;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsPrinting: Boolean;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
    property Caption;
    property Color nodefault;
    property Font;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property DataField : string read GetDataField write SetDataField;
   end;

  TCBSCustomPrintImage = class(TCustomControl,IPrintProperties, IDataAccess)
  private
    FDataLink: TFieldDataLink;
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBorderStyle: TBorderStyle;
    FBreakBefore: Boolean;
    FPicture :TPicture;
    FPictureLoaded: Boolean;
    FBitMap :TBitMap32;
//    FConnection: ADSHandle;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetPicture(Value: TPicture);
    procedure SetBitMap(Value: TBitMap32);
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure DataChange(Sender : TObject);
    procedure LoadCBSBitmap(Dataset: TDataSet;ImageField: TBlobField);
    function LoadCBSImage(RecordID: Integer):Boolean;
    property Field : TField read GetField;
//    function GetConnection: ADSHandle;
//    procedure SetConnection(Value: ADSHandle);
//    property Connection: ADSHandle read GetConnection write SetConnection;
  protected
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsNone;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //function IsDefault: Boolean;
    procedure GetPicture(var ThisPicture: TPicture);
    function IsPrinting: Boolean;
    procedure LoadPicture;
    property Picture: TPicture read FPicture write SetPicture;
    property BitMap: TBitMap32 read FBitMap write SetBitMap;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
    property Caption;
    property Color nodefault;
    property Font;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property DataField : string read GetDataField write SetDataField;
   end;

  TCBSCustomPrintGrid = class(TCustomCBSPrintGrid, IPrintProperties)
  private
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBorderStyle: TBorderStyle;
    FBreakBefore: Boolean;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    function IsPrinting: Boolean;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
    property Columns stored False; //StoreColumns;
    property RowCount stored False;
  end;

  TCBSCustomPrintPanel = class(TCustomPanel, IPrintProperties)
  private
    FBreakAfter: Boolean;
    FAlwaysPrint: Boolean;
    FBorderStyle: TBorderStyle;
    FBreakBefore: Boolean;
    FLineBefore: Boolean;
    procedure SetLineBefore(Value: Boolean);
    function GetLineBefore: Boolean;
    procedure SetBreakBefore(Value: Boolean);
    function GetBreakBefore: Boolean;
    procedure SetBreakAfter(Value: Boolean);
    function GetBreakAfter: Boolean;
    procedure SetAlwaysPrint(Value: Boolean);
    function GetAlwaysPrint: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    function IsPrinting: Boolean;
  published
    property LineBefore: Boolean read GetLineBefore write SetLineBefore;
    property BreakBefore: Boolean read GetBreakBefore write SetBreakBefore;
    property BreakAfter: Boolean read GetBreakAfter write SetBreakAfter default False;
    property AlwaysPrint: Boolean read GetAlwaysPrint write SetAlwaysPrint default False;
  end;
  TCBSCustomPrintRx = class(TCBSCustomPrintPanel);

implementation

uses ImageDataModule;

{ TCBSCustomPrintText }

function TCBSCustomPrintText.GetBreakAfter: Boolean;
begin
  Result := FBreakAfter;
end;

function TCBSCustomPrintText.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintText.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintText.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

constructor TCBSCustomPrintText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBreakAfter := False;
  FAlwaysPrint := False;
end;

procedure TCBSCustomPrintText.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintText.GetBreakBefore: Boolean;
begin
    Result := FBreakBefore;
end;

function TCBSCustomPrintText.IsPrinting: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintText.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintText.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintField }

constructor TCBSCustomPrintField.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
  FBreakAfter := False;
  FAlwaysPrint := False;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
end;

function TCBSCustomPrintField.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TCBSCustomPrintField.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TCBSCustomPrintField.GetBreakAfter: Boolean;
begin
  Result := FBreakAfter;
end;

procedure TCBSCustomPrintField.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TCBSCustomPrintField.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintField.DataChange(Sender: TObject);
begin
  Text := FDataLink.Field.AsString;
end;

procedure TCBSCustomPrintField.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCBSCustomPrintField.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintField.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintField.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

destructor TCBSCustomPrintField.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited;
end;

function TCBSCustomPrintField.IsDefault: Boolean;
begin
  Result := False;
  if Assigned(FDataLink) and Assigned(FDataLink.DataSource) then
  begin
  if Uppercase(trim(FDataLink.DataSource.Name)) = 'S_EXAM' then
    Result := IsDefaultValue(FDataLink.DataSource.Name,
    FdataLink.FieldName,
    Field.AsString)
  end;
end;

procedure TCBSCustomPrintField.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintField.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintField.IsPrinting: Boolean;
begin
  if Text = '' then
    Result := False
  else
  begin
  if FAlwaysPrint then
    Result := True
  else
    Result := (not IsDefault);
  end;
end;
{
function TCBSCustomPrintField.GetConnection: ADSHandle;
begin
  FConnection := GetLiveConnection(Self);
  Result := FConnection;
end;

procedure TCBSCustomPrintField.SetConnection(Value: ADSHandle);
begin
  FConnection := Value;
end;
}
procedure TCBSCustomPrintField.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintField.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintCheckbox }

constructor TCBSCustomPrintCheckbox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBreakAfter := False;
  FAlwaysPrint := False;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
end;

function TCBSCustomPrintCheckbox.GetDataField: string;
begin
    Result := FDataLink.FieldName;
end;

function TCBSCustomPrintCheckbox.GetField: TField;
begin
     Result := FDataLink.Field;
end;

function TCBSCustomPrintCheckbox.GetBreakAfter: Boolean;
begin
  Result := FBreakAfter;
end;

procedure TCBSCustomPrintCheckbox.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TCBSCustomPrintCheckbox.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintCheckbox.DataChange(Sender: TObject);
begin
  Checked := FDataLink.Field.AsBoolean;
end;

procedure TCBSCustomPrintCheckbox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCBSCustomPrintCheckbox.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintCheckbox.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintCheckbox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

destructor TCBSCustomPrintCheckbox.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited;
end;

function TCBSCustomPrintCheckbox.IsDefault: Boolean;
begin
  Result := False;
  if Assigned(FDataLink) and Assigned(FDataLink.DataSource) then
  begin
  if Uppercase(trim(FDataLink.DataSource.Name)) = 'S_EXAM' then
    Result := IsDefaultValue(FDataLink.DataSource.Name,
    FdataLink.FieldName,
    Field.AsBoolean)
  end;
end;

procedure TCBSCustomPrintCheckbox.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintCheckbox.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintCheckbox.IsPrinting: Boolean;
begin
  if FAlwaysPrint then
    Result := True
  else
    Result := (not IsDefault);
end;

{
function TCBSCustomPrintCheckbox.GetConnection: ADSHandle;
begin
  Result := FConnection;
end;

procedure TCBSCustomPrintCheckbox.SetConnection(Value: ADSHandle);
begin

end;
}
procedure TCBSCustomPrintCheckbox.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintCheckbox.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintMemo }

constructor TCBSCustomPrintMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
  FBreakAfter := False;
  FBreakBefore := False;
  FAlwaysPrint := False;
  BorderStyle := bsNone;
end;

function TCBSCustomPrintMemo.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TCBSCustomPrintMemo.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TCBSCustomPrintMemo.GetBreakAfter: Boolean;
begin
   Result := FBreakAfter;
end;

procedure TCBSCustomPrintMemo.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TCBSCustomPrintMemo.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintMemo.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if FDataLink.Field.IsBlob then
    begin
      Lines.Text := FDataLink.Field.AsString;
    end
    else
      Text := FDataLink.Field.AsString;
  end
  else
    Text := '';
  if HandleAllocated then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);

end;

procedure TCBSCustomPrintMemo.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCBSCustomPrintMemo.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintMemo.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintMemo.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

destructor TCBSCustomPrintMemo.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited;
end;

procedure TCBSCustomPrintMemo.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintMemo.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintMemo.IsPrinting: Boolean;
begin
  Result := (Text <> '');
end;

procedure TCBSCustomPrintMemo.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintMemo.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintImage }

constructor TCBSCustomPrintImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
  FBreakAfter := False;
  FAlwaysPrint := False;
  BorderStyle := bsSingle;
  BorderWidth := 1;
  Color := clWhite;
  Height := 40;
  Width := 40;
  FPicture := TPicture.Create;
  FBitMap := TBitMap32.Create;

end;

function TCBSCustomPrintImage.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TCBSCustomPrintImage.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TCBSCustomPrintImage.GetBreakAfter: Boolean;
begin
   Result := FBreakAfter;
end;

procedure TCBSCustomPrintImage.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TCBSCustomPrintImage.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;
{
function TCBSCustomPrintImage.IsDefault: Boolean;
begin
  if FDataLink.DataSource.Name = 'S_EXAM' then
    Result := GetDefaultValue(Connection, FdataLink.FieldName)
  else
    Result := False;

//  Result := GetDefault(FdataLink.FieldName,FDataLink.Field);
end;
}
procedure TCBSCustomPrintImage.DataChange(Sender: TObject);
begin
  Picture := nil;
  LoadPicture;
end;

procedure TCBSCustomPrintImage.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCBSCustomPrintImage.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintImage.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintImage.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

destructor TCBSCustomPrintImage.Destroy;
begin
  FreeAndNil(FDataLink);
  FreeAndNil(FPicture);
  FreeAndNil(FBitMap);
  inherited;
end;

procedure TCBSCustomPrintImage.GetPicture(var ThisPicture: TPicture);
var ThisBitMap: TBitmap32;
  ImageField :TBlobField;
  DataSet: TADSTable;
  ImageFile: TADSQuery;
  LookupID: Integer;
  ThisFieldType :TFieldType;
begin
  // Check to be sure picture isn't already loaded and that there is something in Field
  if {not FPictureLoaded and} (Assigned(FDataLink.Field)) then
  begin
    ThisBitMap := TBitMap32.Create;
    ImageField := TBlobField.Create(nil);
    try
      ThisFieldType := FDataLink.Field.DataType;
      // pointing to a BLOB field
      if FDataLink.Field.IsBlob and not FDataLink.Field.IsNull then
      begin
        DataSet := FDataLink.DataSet as TADSTable;
        ImageField := DataSet.FieldByName(FDataLink.FieldName) as TBlobField;
        LoadCBSBitmap(DataSet,ImageField);
        ThisPicture.Assign(BitMap);
      end;
      if (FDataLink.Field is TIntegerField)
         or (FDataLink.Field is TFloatField) then
      begin
        LookupID := FDataLink.Field.AsInteger;
        if LookupID > 0 then
        begin
          ImageFile := TAdsQuery.Create(nil);
          try
            with ImageFile do
            begin
              DatabaseName := 'CBSTools';
              TableType := ttAdsADT;
              with SQL do
              begin
                Clear;
                Add('Select Image from ExamImag');
                Add('where ImagUnique = :OurLookup');
              end;
              ParamByName('OurLookup').AsInteger := LookupID;
              Open;
              if RecordCount > 0 then
              begin
                ImageField := (FieldByName('Image') as TBlobField);
                LoadCBSBitmap(ImageFile,ImageField);
                ThisPicture.Assign(BitMap);
                ImageField := nil;
              end;
            end;
          finally
            FreeAndNil(ImageFile);
          end;
        end;
      end;
    finally
      FreeAndNil(ImageField);
      FreeAndNil(ThisBitMap);
    end;
  end;
end;

procedure TCBSCustomPrintImage.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCBSCustomPrintImage.LoadCBSBitmap(Dataset: TDataSet;ImageField: TBlobField);
var
  BlobStream :TStream;
  DrawBit :TBitMap32;
  CheckJPEG: Word;
  ThisJPEG: TJPEGImage;
begin
  DrawBit := TBitMap32.Create;
  BlobStream := FDataLink.DataSet.CreateBlobStream(ImageField, bmRead);
  try
    BlobStream.Seek(0,sobeginning);
    BlobStream.Read(CheckJPEG,2);
    BlobStream.Seek(0,sobeginning);
    if (CheckJPEG = Word(55551)) then
    begin
      ThisJPEG := TJPEGImage.Create;
      try
        ThisJPEG.LoadFromStream(BlobStream);
        BitMap.Assign(ThisJPEG);
      finally
        ThisJPEG.Free;
      end;
    end
    else
    begin
      DrawBit.LoadFromStream(BlobStream);
      BitMap.Assign(DrawBit);
    end;
  finally
    DrawBit.Free;
    BlobStream.Free;
  end;
end;


//procedure TCBSCustomPrintImage.LoadCBSBitmap(Dataset: TDataSet;
//  ImageField: TBlobField);
//var
//  BlobStream :TStream;
//  DrawBit :TBitMap32;
//begin
//  DrawBit := TBitMap32.Create;
//  BlobStream := FDataLink.DataSet.CreateBlobStream(ImageField, bmRead);
//  try
//    DrawBit.LoadFromStream(BlobStream);
//    BitMap.Assign(DrawBit);
//  finally
//    FreeAndNil(DrawBit);
//    FreeAndNil(BlobStream);
//  end;
//end;

procedure TCBSCustomPrintImage.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintImage.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintImage.IsPrinting: Boolean;
begin
  if FAlwaysPrint then
    Result := True
  else
    if Assigned(FBitMap) then
    begin
      Result := not FBitMap.Empty;
    end
    else Result := False;
end;

procedure TCBSCustomPrintImage.LoadPicture;
var ImageField :TBlobField;
  DataSet: TADSTable;
  ImageFile: TADSQuery;
  LookupID: Integer;
  ImageStream: TStream;
  CheckJPEG: Word;
  ThisJPEG :TJPEGImage;
  ThisFieldType :TFieldType;
  CheckField: TField;
  IsGraphic: Boolean;
begin
  IsGraphic := True;
  // Check to be sure picture isn't already loaded and that there is somethign in Field
  if {not FPictureLoaded and} (Assigned(FDataLink.Field)) then
  begin
    ImageField := TBlobField.Create(nil);
    try
      ThisFieldType := FDataLink.Field.DataType;
      // pointing to a BLOB field
      if FDataLink.Field.IsBlob and not FDataLink.Field.IsNull then
      begin
        DataSet := FDataLink.DataSet as TADSTable;
        CheckField := DataSet.FindField('EXT');
        if Assigned(Checkfield) then
        begin
          if (CheckField.AsString = 'TXT') or
             (CheckField.AsString = 'PDF') or
             (CheckField.AsString = 'DOC') then IsGraphic := False;
        end;
        if isGraphic then
        begin
//          ImageField := DataSet.FieldByName(FDataLink.FieldName) as TBlobField;
//          Picture.Assign(ImageField);
//          LoadCBSBitmap(DataSet,ImageField);
//            if FDataLink.FieldName = 'PICTURE' then  //This is the patient picture in patient
//              ImageEXT := 'JPG';
//            begin
//              GetImageLib;
//            end;
//            else
//            begin
              // This is a different BLOB
              ImageField := DataSet.FieldByName(FDataLink.FieldName) as TBlobField;
              ImageStream := DataSet.CreateBlobStream(ImageField,bmread);
              ImageStream.Seek(0,sobeginning);
              ImageStream.Read(CheckJPEG,2);
              ImageStream.Seek(0,sobeginning);
              if (CheckJPEG = Word(55551)) then
              begin
                ThisJPEG := TJPEGImage.Create;
                try
                  ThisJPEG.LoadFromStream(ImageStream);
                  Picture.Assign(ThisJPEG);
                finally
                  ThisJPEG.Free
                end;
              end
              else
                Picture.Assign(ImageField);
              LoadCBSBitmap(DataSet,ImageField);
//            end;

        end;
      end;
      if (FDataLink.Field is TIntegerField)
         or (FDataLink.Field is TFloatField) then
      begin
        LookupID := FDataLink.Field.AsInteger;
        if LookupID > 0 then
        begin
          ImageFile := TAdsQuery.Create(nil);
          try
            with ImageFile do
            begin
              DatabaseName := 'CBSTools';
              TableType := ttAdsADT;
              with SQL do
              begin
                Clear;
                Add('Select Image from ExamImag');
                Add('where ImagUnique = :OurLookup');
              end;
              ParamByName('OurLookup').AsInteger := LookupID;
              Open;
              if RecordCount > 0 then
              begin
                ImageField := (FieldByName('Image') as TBlobField);
                LoadCBSBitmap(ImageFile,ImageField);
                Picture.Assign(BitMap);
                FPictureLoaded := True;
                ImageField := nil;
              end;
            end;
          finally
            FreeAndNil(ImageFile);
          end;
        end;
      end;
    finally
      FreeAndNil(ImageField);
    end;
  end;
end;


procedure TCBSCustomPrintImage.SetPicture(Value: TPicture);
begin

end;

procedure TCBSCustomPrintImage.SetBitMap(Value: TBitMap32);
begin

end;

function TCBSCustomPrintImage.LoadCBSImage(RecordID: Integer): Boolean;
var ImageData: TImageData;
    ImageStream: TStream;
    ImageField: TField;
begin
  ImageData := TImageData.Create(Self);
  try
    Result := False;
    with ImageData.ExamImageTable do
    begin
      IndexName := 'PrimKey';
      Open;
      if FindKey([RecordID])then
      begin
        //Stream that blob
        ImageField := FieldByName('ImageData');
        ImageStream := CreateBlobStream(ImageField, bmRead);
        Bitmap.LoadFromStream(ImageStream);
        Result := Assigned(BitMap);
      end;
      Close;
    end;
  finally
    FreeAndNil(ImageData);
  end;
end;

{
function TCBSCustomPrintImage.GetConnection: ADSHandle;
begin
  Result := FConnection;
end;

procedure TCBSCustomPrintImage.SetConnection(Value: ADSHandle);
begin
  FConnection := Value;
end;
}
procedure TCBSCustomPrintImage.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintImage.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintPanel }

constructor TCBSCustomPrintPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBreakAfter := False;
  FBreakBefore := False;
  FAlwaysPrint := False;
  BorderStyle := bsNone;
end;

procedure TCBSCustomPrintPanel.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintPanel.GetBreakAfter: Boolean;
begin
   Result := FBreakAfter;
end;

function TCBSCustomPrintPanel.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintPanel.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintPanel.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintPanel.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintPanel.IsPrinting: Boolean;
begin
  Result := True;
end;

procedure TCBSCustomPrintPanel.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintPanel.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

{ TCBSCustomPrintGrid }

constructor TCBSCustomPrintGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBreakAfter := False;
  FBreakBefore := False;
  FAlwaysPrint := False;
  BorderStyle := bsNone;
end;

procedure TCBSCustomPrintGrid.SetBreakBefore(Value: Boolean);
begin
  FBreakBefore := Value;
end;

function TCBSCustomPrintGrid.GetBreakAfter: Boolean;
begin
   Result := FBreakAfter;
end;

function TCBSCustomPrintGrid.GetAlwaysPrint: Boolean;
begin
  Result := FAlwaysPrint;
end;

procedure TCBSCustomPrintGrid.SetBreakAfter(Value: Boolean);
begin
  FBreakAfter := Value;
end;

procedure TCBSCustomPrintGrid.SetAlwaysPrint(Value: Boolean);
begin
  FAlwaysPrint := Value;
end;

function TCBSCustomPrintGrid.GetBreakBefore: Boolean;
begin
  Result := FBreakBefore;
end;

function TCBSCustomPrintGrid.IsPrinting: Boolean;
begin
  Result := (DataSource.DataSet.RecordCount > 0);
end;

procedure TCBSCustomPrintGrid.SetLineBefore(Value: Boolean);
begin
  FLineBefore := Value;
end;

function TCBSCustomPrintGrid.GetLineBefore: Boolean;
begin
  Result := FLineBefore;
end;

end.
