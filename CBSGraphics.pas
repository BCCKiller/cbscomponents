unit CBSGraphics;

interface
uses Windows, Clipbrd, Forms, Classes, GR32, GR32_Image, DB, DBCtrls,
     Graphics, Controls, Messages,
     adscnnct, adsdata, adsfunc, adstable, jpeg, sysutils, Dialogs;

type

  IReturnCodeReceiver = interface
  ['{50D63810-6753-4720-BBCE-ABAAC2850340}']
   procedure AddReturnCode(const Code: WideString);
  end;


  TReturnCodeManager = class(TInterfacedObject, IReturnCodeReceiver)
  private
   FMyStringList: TStrings;
  public
   constructor Create;
   destructor Destroy; override;
   procedure AddReturnCode(const Code: WideString);  // interface method
   property ReturnCodes: TStrings read FMyStringList;
  end;


TImageType = (itDrawing, itImage, itDocument);

IImageFieldInformation = interface
['{DC7CB3DA-ED43-485C-ACF6-50DCC34DC481}']
 function GetBaseImage: WideString;
 function GetDataField: WideString;
 function GetRecordUnique: Integer;
 function GetSourceScreen: WideString;
 property BaseImage: WideString read GetBaseImage;
 property DataField: WideString read GetDataField;
 property RecordUnique: Integer read GetRecordUnique;
 property SourceScreen: WideString read GetSourceScreen;
end;

TCustomCBSDBImage = class(TCustomControl, IImageFieldInformation)
private
    FBaseImage :WideString;
    FDataLink: TFieldDataLink;
    FBorderStyle: TBorderStyle;
    FPicture :TPicture;
    FBitMap :TBitMap32;
    FAutoDisplay: Boolean;
    FStretch: Boolean;
    FCenter: Boolean;
    FPictureLoaded: Boolean;
    FQuickDraw: Boolean;
    FImageType: TImageType;
    FRecordUnique: Integer;
    FSourceScreen: WideString;
    NonGraphic: TMemoryStream;
    FIsGraphic: Boolean;
    FImageExt: String;
    FImageDescription: String;
    procedure DataChange(Sender: TObject);
    function GetDataField: Widestring;
    function GetBaseImage: WideString;
    procedure SetBaseImage(Value: WideString);
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure PictureChanged(Sender: TObject);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetCenter(Value: Boolean);
    procedure SetDataField(const Value: Widestring);
    procedure SetDataSource(Value: TDataSource);
    procedure SetPicture(Value: TPicture);
    procedure SetBitMap(Value: TBitMap32);
    procedure SetReadOnly(Value: Boolean);
    procedure SetStretch(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMCopy(var Message: TMessage); message WM_COPY;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
    procedure LoadCBSBitmap(Dataset: TDataSet;ImageField: TBlobField);
    function LoadCBSImage(RecordID: Integer):Boolean;
    function GetRecordUnique: Integer;
    procedure SetRecordUnique(Value: Integer);
    function GetSourceScreen: WideString;
    procedure SetSourceScreen(Value: WideString);
    procedure CreateTextBitmap;
    procedure SetImageDescription(const Value: String);
    procedure SetImageExt(const Value: String);
    function GetIsGraphic: Boolean;
    procedure ClearAllImage;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; override;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Center: Boolean read FCenter write SetCenter default True;
    property ImageType: TImageType read FImageType write FImageType default itDrawing;
    property DataField: Widestring read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ParentColor default False;
    property BaseImage :WideString read GetBaseImage write SetBaseImage;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property QuickDraw: Boolean read FQuickDraw write FQuickDraw default True;
    property Stretch: Boolean read FStretch write SetStretch default True;
    procedure LoadFromBase(BaseImage: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    procedure LoadPicture;
    procedure LoadFromFile(const FileName: string);
    procedure PasteFromClipboard;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property Picture: TPicture read FPicture write SetPicture;
    property BitMap: TBitMap32 read FBitMap write SetBitMap;
    property RecordUnique: Integer read GetRecordUnique write SetRecordUnique default 0;
    property SourceScreen: WideString read GetSourceScreen write SetSourceScreen;
    property IsGraphic: Boolean read GetIsGraphic stored False;
    property ImageExt: String read FImageExt write SetImageExt;
    property ImageDescription: String read FImageDescription write SetImageDescription;
  end;

type pCustomCBSDBImage = ^TCustomCBSDBImage;


TCBSDBImage = class(TCustomCBSDBImage)
published
    property Align;
    property Anchors;
    property AutoDisplay default True;
    property BorderStyle default bsSingle;
    property Center default True;
    property Color;
    property Constraints;
    property Ctl3D;
    property ImageType default itDrawing;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property BaseImage;
    property ReadOnly default False;
    property QuickDraw default True;
    property ShowHint;
    property Stretch default True;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
end;

implementation
{ TCBSDBImage }
uses ImageDataModule;


procedure TCustomCBSDBImage.CMEnter(var Message: TCMEnter);
begin
  Invalidate; { Draw the focus marker }
  inherited;

end;

procedure TCustomCBSDBImage.CMExit(var Message: TCMExit);
begin
  try
    if Assigned(DataSource) and Assigned(DataSource.DataSet) and
       (DataSource.DataSet.State in [dsInsert, dsEdit]) then
      FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  Invalidate; { Erase the focus marker }
  inherited;

end;

procedure TCustomCBSDBImage.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TCustomCBSDBImage.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not FPictureLoaded then Invalidate;

end;

procedure TCustomCBSDBImage.CopyToClipboard;
begin
  if (Picture <> nil) and IsGraphic then Clipboard.Assign(Picture);

end;

constructor TCustomCBSDBImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque, csReplicatable];
  if not NewStyleControls then ControlStyle := ControlStyle + [csFramed];
  Width := 105;
  Height := 105;
  TabStop := True;
  FStretch := True;
  BaseImage := '';
  ParentColor := False;
  FPicture := TPicture.Create;
  FBitMap := TBitMap32.Create;
  FPicture.OnChange := PictureChanged;
  NonGraphic := TMemoryStream.Create;
  FBorderStyle := bsSingle;
  FAutoDisplay := True;
  FCenter := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FQuickDraw := True;

end;

procedure TCustomCBSDBImage.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else
        Style := Style or WS_BORDER;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;


end;

procedure TCustomCBSDBImage.CutToClipboard;
begin
  if (Picture <> nil) and IsGraphic then
    if FDataLink.Edit then
    begin
      CopyToClipboard;
      ClearAllImage
    end;

end;

procedure TCustomCBSDBImage.DataChange(Sender: TObject);
begin
  ClearAllImage;
  if FAutoDisplay then LoadPicture;

end;

destructor TCustomCBSDBImage.Destroy;
begin
  FPicture.Free;
  FBitMap.Free;
  NonGraphic.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TCustomCBSDBImage.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);

end;

function TCustomCBSDBImage.GetDataField: Widestring;
begin
    Result := FDataLink.FieldName;
end;

function TCustomCBSDBImage.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCustomCBSDBImage.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TCustomCBSDBImage.GetReadOnly: Boolean;
begin
   Result := FDataLink.ReadOnly;
end;

procedure TCustomCBSDBImage.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_INSERT:
      if ssShift in Shift then PasteFromClipBoard else
        if ssCtrl in Shift then CopyToClipBoard;
    VK_DELETE:
      if ssShift in Shift then CutToClipBoard;
  end;

end;

procedure TCustomCBSDBImage.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    ^X: CutToClipBoard;
    ^C: CopyToClipBoard;
    ^V: PasteFromClipBoard;
    #13: LoadPicture;
    #27: FDataLink.Reset;
  end;

end;
procedure TCustomCBSDBImage.LoadCBSBitmap(Dataset: TDataSet;ImageField: TBlobField);
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

procedure TCustomCBSDBImage.LoadPicture;
var ImageField :TBlobField;
  ImageStream: TStream;
  CheckJPEG: Word;
  ThisJPEG :TJPEGImage;
  DataSet: TADSTable;
  ImageFile: TADSQuery;
  LookupID: Integer;
  ThisFieldType :TFieldType;
  CheckField: TField;
begin
  ImageEXT := '';
  // Check to be sure picture isn't already loaded and that there is something in Field
  if not FPictureLoaded and (Assigned(FDataLink.Field)) then
  begin
    ImageField := TBlobField.Create(nil);
    try
      ThisFieldType := FDataLink.Field.DataType;
      // pointing to a BLOB field
      if FDataLink.Field.IsBlob then
      begin
        if not FDataLink.Field.IsNull then
        begin
          DataSet := FDataLink.DataSet as TADSTable;
          CheckField := DataSet.FindField('EXT');
          if Assigned(Checkfield) then
          begin
            ImageEXT :=  uppercase(CheckField.AsString);
          end;
          if isGraphic then
          begin
            if FDataLink.FieldName = 'PICTURE' then  //This is the patient picture in patient
              ImageEXT := 'JPG';
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
          end
          else //isn't a graphic
          begin
            CreateTextBitmap;
          end;
        end
        else
        begin
          ClearAllImage;
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
                Add('Select Image,EXT  from ExamImag');
                Add('where ImagUnique = :LookupID');
              end;
              ParamByName('LookupID').AsInteger := LookupID;
              Open;
              if RecordCount > 0 then
              begin
                ImageField := (FieldByName('Image') as TBlobField);
                ImageExt := FieldByname('EXT').AsString;
                LoadCBSBitmap(ImageFile,ImageField);
                Picture.Assign(BitMap);
                FPictureLoaded := True;
                ImageField := nil;
              end;
            end;
          finally
            ImageFile.Free;
          end;
        end;
      end;
    finally
      ImageField := nil;
      ImageField.Free;
    end;
  end
  else
  begin
    if RecordUnique > 0 then
      LoadCBSImage(RecordUnique)
    else
      if BaseImage<>'' then
        LoadFromBase(BaseImage);
  end;

end;

procedure TCustomCBSDBImage.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TCustomCBSDBImage.Paint;
var
  Size: TSize;
  R: TRect;
  S: string;
  DrawPict: TPicture;
  Form: TCustomForm;
  Pal: HPalette;
  DrawBase: Boolean;
begin
  with Canvas do
  begin
    Brush.Style := bsSolid;
    Brush.Color := Color;
    DrawPict := TPicture.Create;
    Pal := 0;
    try
    if not FPictureLoaded then
    // This looks up the default image
    begin
{ TODO : If not empty record, then load up from Image table }
      DrawBase := not (Assigned(Field) and not Field.IsNull);
      //DrawBase := True;
      if not DrawBase then
      begin
        if Field is TNumericField then
          DrawBase := LoadCBSImage(Field.AsInteger);
      end;
      if DrawBase and (BaseImage <> '') then
      begin
        LoadFromBase(BaseImage);
      end;
    end;
    DrawPict.Assign(BitMap);
    if Stretch then
    begin
      if (DrawPict.Graphic = nil) or DrawPict.Graphic.Empty then
        FillRect(ClientRect)
      else
        StretchDraw(ClientRect, DrawPict.Graphic)
    end
    else
    begin
      SetRect(R, 0, 0, DrawPict.Width, DrawPict.Height);
      if Center then OffsetRect(R, (ClientWidth - DrawPict.Width) div 2,
        (ClientHeight - DrawPict.Height) div 2);
      StretchDraw(R, DrawPict.Graphic);
      ExcludeClipRect(Handle, R.Left, R.Top, R.Right, R.Bottom);
      FillRect(ClientRect);
      SelectClipRgn(Handle, 0);
    end;
    finally
      DrawPict.Free;
    end;
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.ActiveControl = Self) and
      not (csDesigning in ComponentState) and
      not (csPaintCopy in ControlState) then
    begin
      Brush.Color := clWindowFrame;
      FrameRect(ClientRect);
    end;
  end;
end;

procedure TCustomCBSDBImage.PasteFromClipboard;
begin
   if Clipboard.HasFormat(CF_BITMAP) and FDataLink.Edit then
    Picture.Assign(Clipboard);

end;

procedure TCustomCBSDBImage.PictureChanged(Sender: TObject);
begin
  if FPictureLoaded then FDataLink.Modified;
  FPictureLoaded := True;
  Invalidate;

end;

procedure TCustomCBSDBImage.SetAutoDisplay(Value: Boolean);
begin
  if FAutoDisplay <> Value then
  begin
    FAutoDisplay := Value;
    if Value then LoadPicture;
  end;
end;

procedure TCustomCBSDBImage.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TCustomCBSDBImage.SetBitMap(Value: TBitMap32);
begin
  FBitMap.Assign(Value);
end;


procedure TCustomCBSDBImage.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomCBSDBImage.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
    FCenter := Value;
    Invalidate;
  end;

end;

procedure TCustomCBSDBImage.SetDataField(const Value: Widestring);
begin
  FDataLink.FieldName := Value;
end;

procedure TCustomCBSDBImage.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCustomCBSDBImage.SetImageDescription(const Value: String);
begin
  FImageDescription := Value;
end;

procedure TCustomCBSDBImage.SetImageExt(const Value: String);
begin
  FImageExt := Value;
end;

procedure TCustomCBSDBImage.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TCustomCBSDBImage.SetStretch(Value: Boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Invalidate;
  end;

end;

function TCustomCBSDBImage.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);

end;

procedure TCustomCBSDBImage.ClearAllImage;
begin
  Picture.Assign(nil);
  BitMap.Assign(nil);
  NonGraphic.Clear;
  FPictureLoaded := False;
end;

function TCustomCBSDBImage.GetIsGraphic: Boolean;
begin
  // supported by TPicture 
  if (ImageEXT = 'JPG') or
     (ImageEXT = 'BMP') or
     (ImageEXT = 'JPE') or
     (ImageEXT = 'ICO') or
     (ImageEXT = 'GIF') or
     (ImageEXT = 'WMF')
  then
    Result := True
  else
    Result := False;
  if FDataLink.FieldName = 'PICTURE' then Result := True;
end;

procedure TCustomCBSDBImage.CreateTextBitmap;
var
  R: TRect;
  Size: tSIZE;
  S: string;
  TempBitmap: TBitmap;
begin
  TempBitmap := TBitmap.Create;
  try
    TempBitMap.Height := Self.Height;
    TempBitMap.Width := Self.Width;
    with TempBitMap.Canvas do
    begin
      Font:= Self.Font;
      S := ImageEXT + ' Image';
      S := '(' + S + ')';
      Size := TextExtent(S);
      R := ClientRect;
      TextRect(R, (R.Right - Size.cx) div 2, (R.Bottom - Size.cy) div 2, S);
    end;
    Bitmap.Assign(TempBitMap);
    Picture.Assign(TempBitMap);
    FPictureLoaded := True;

  finally
    TempBitMap.Free;
  end;
end;

procedure TCustomCBSDBImage.UpdateData(Sender: TObject);
var ImageStream: TStream;
    ImageAsJPG: TJPEGImage;
begin
  if FDataLink.Field.IsBlob then
  begin
    if  IsGraphic then
    begin
      if not (Picture = nil) then
      begin
        if (ImageEXT = 'JPG') then
        begin
          ImageAsJPG := TJPEGImage.Create;
          try
            ImageAsJPG.Assign(Picture);
            FDataLink.Field.Assign(ImageAsJPG);
          finally
            ImageAsJPG.Free;
          end;
        end
        else
          FDataLink.Field.Assign(Picture)
      end
      else
        FDataLink.Field.Clear;
    end
    else
    begin
      if  (not (NonGraphic = nil)) then
      begin
        ImageStream := FDataLink.DataSet.CreateBlobStream(FDataLink.Field, bmWrite);
        try
          NonGraphic.Seek(0,soFromBeginning);
          ImageStream.CopyFrom(NonGraphic,NonGraphic.Size);
        finally
          ImageStream.Free;
        end;
      end
      else
        FDataLink.Field.Clear;
    end;
  end;
end;

procedure TCustomCBSDBImage.WMCopy(var Message: TMessage);
begin
  CopyToClipboard;
end;

procedure TCustomCBSDBImage.WMCut(var Message: TMessage);
begin
  CutToClipboard;
end;

procedure TCustomCBSDBImage.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  LoadPicture;
  inherited;
end;

procedure TCustomCBSDBImage.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if TabStop and CanFocus then SetFocus;
  inherited;
end;

procedure TCustomCBSDBImage.WMPaste(var Message: TMessage);
begin
  PasteFromClipboard;
end;

procedure TCustomCBSDBImage.WMSize(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

function TCustomCBSDBImage.LoadCBSImage(RecordID: Integer): Boolean;
var ImageData: TImageData;
    ImageStream: TStream;
    ImageField: TField;
    CheckJPEG: Word;
    ThisJPEG: TJPEGImage;
begin
  ImageData := TImageData.Create(nil);
  try
    Result := False;
    with ImageData.ExamImageTable do
    begin
      IndexName := 'ImagUnique';
      Open;
      if FindKey([RecordID])then
      begin
        //Stream that blob
        ImageEXT := uppercase(FieldByName('EXT').AsString);
        ImageDescription := FieldByName('DESC').AsString;
        ImageField := FieldByName('Image');
        ImageStream := CreateBlobStream(ImageField, bmRead);
        if IsGraphic then
        begin
          ImageStream.Seek(0,sobeginning);
          ImageStream.Read(CheckJPEG,2);
          ImageStream.Seek(0,sobeginning);
          if (CheckJPEG = Word(55551)) then
          begin
            ThisJPEG := TJPEGImage.Create;
            try
              ThisJPEG.LoadFromStream(ImageStream);
              BitMap.Assign(ThisJPEG);
            finally
              ThisJPEG.Free;
            end;
          end
          else
            Bitmap.LoadFromStream(ImageStream);
        end
        else
        begin
          CreateTextBitmap;
        end;
        Result := Assigned(BitMap);
        NonGraphic.LoadFromStream(ImageStream);
      end;
      Close;
    end;
  finally
    ImageData.Free;
  end;
end;

function TCustomCBSDBImage.GetBaseImage: WideString;
begin
  Result := FBaseImage;
end;

procedure TReturnCodeManager.AddReturnCode(const Code: WideString);
begin
 FMyStringList.Add(Code);
end;

constructor TReturnCodeManager.Create;
begin
  FMyStringList := TStringList.Create;
end;

destructor TReturnCodeManager.Destroy;
begin
  FMyStringList.Free;

  inherited;
end;

procedure TCustomCBSDBImage.SetBaseImage(Value: WideString);
begin
  FBaseImage := Value;
end;

procedure TCustomCBSDBImage.SetRecordUnique(Value: Integer);
begin
  FRecordUnique := Value;
end;

function TCustomCBSDBImage.GetRecordUnique: Integer;
begin
  Result := FRecordUnique;
end;

procedure TCustomCBSDBImage.LoadFromFile(const FileName: string);
begin
  ImageEXT := copy(uppercase(ExtractFileExt(FileName)),1,3);
  if IsGraphic then
    Picture.LoadFromFile(FileName)
  else
  begin
    NonGraphic.LoadFromFile(FileName);
  end;
end;

procedure TCustomCBSDBImage.SetSourceScreen(Value: WideString);
begin
  FSourceScreen := Value;
end;

function TCustomCBSDBImage.GetSourceScreen: WideString;
begin
  Result := FSourceScreen;
end;

//procedure TCustomCBSDBImage.GetImageLib(Temp: String='JPG');
//var
//   Stream       :  TMemoryStream;
//   TempBitmap       :  TBitmap;
//   Cursor       :  hCursor;
//   Dith         :  Integer;
//   ReadRes      :  Integer;
//   P            :  Pointer;
//
//begin
// if Temp = 'JPG' then begin
//   Stream:=TMemoryStream.Create;
//   TempBitmap:=TBitmap.Create;
//   try
//     ImageEXT := Temp;
//     ReadRes := 8;
//     Dith := 0;
//     TBlobField(FDataLink.Field).SaveToStream(Stream);
//     if JPGblob(Stream.Memory,
//                    Stream.Size,
//                    ReadRes,
//                    Dith,
//                    TempBitmap,
//                    Longint(Self),
//                    ProgressCall) then
//     begin
//        if Assigned(TempBitmap) then
//        begin
//          Picture.Assign(TempBitmap);
//          FBitMap.Assign(TempBitmap);
//          FPictureLoaded := True;
//          NonGraphic.Clear;
//        end
//       else
//       begin
//        ClearAllImage;
//       end;
//     end
//     else
//     begin
//        ClearAllImage;
//     end;
//   finally
//     TempBitmap.free;
//     Stream.Free;
//   end;
// end;
//end;

procedure TCustomCBSDBImage.LoadFromBase(BaseImage: String);
begin
   if FileExists(BaseImage+'.bmp') then
      BitMap.LoadFromFile(BaseImage+'.bmp')
    else
    if FileExists(BaseImage+'.jpg') then
      BitMap.LoadFromFile(BaseImage+'.jpg')
    else
//      BitMap.LoadFromFile('blank.jpg');
      CreateTextBitMap;
end;

end.
