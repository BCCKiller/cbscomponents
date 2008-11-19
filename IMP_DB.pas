unit IMP_DB;
interface
uses
  Windows,
  SysUtils,
  Classes,
  Variants,
  MaskUtils,
  SqlTimSt,
  FMTBcd,
  DB,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_DB;
implementation
function EUpdateError__GetContext(Self:EUpdateError):String;
begin
  result := Self.Context;
end;
function EUpdateError__GetErrorCode(Self:EUpdateError):Integer;
begin
  result := Self.ErrorCode;
end;
function EUpdateError__GetPreviousError(Self:EUpdateError):Integer;
begin
  result := Self.PreviousError;
end;
function EUpdateError__GetOriginalException(Self:EUpdateError):Exception;
begin
  result := Self.OriginalException;
end;
procedure TCustomConnection_Open1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomConnection(Self).Open();
end;
procedure TCustomConnection_Close(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomConnection(Self).Close();
end;
function TCustomConnection__GetConnected(Self:TCustomConnection):Boolean;
begin
  result := Self.Connected;
end;
procedure TCustomConnection__PutConnected(Self:TCustomConnection;const Value: Boolean);
begin
  Self.Connected := Value;
end;
function TCustomConnection__GetDataSets(Self:TCustomConnection;Index: Integer):TDataSet;
begin
  result := Self.DataSets[Index];
end;
function TCustomConnection__GetDataSetCount(Self:TCustomConnection):Integer;
begin
  result := Self.DataSetCount;
end;
function TCustomConnection__GetLoginPrompt(Self:TCustomConnection):Boolean;
begin
  result := Self.LoginPrompt;
end;
procedure TCustomConnection__PutLoginPrompt(Self:TCustomConnection;const Value: Boolean);
begin
  Self.LoginPrompt := Value;
end;
function TCustomConnection__GetAfterConnect(Self:TCustomConnection):TNotifyEvent;
begin
  result := Self.AfterConnect;
end;
procedure TCustomConnection__PutAfterConnect(Self:TCustomConnection;const Value: TNotifyEvent);
begin
  Self.AfterConnect := Value;
end;
function TCustomConnection__GetBeforeConnect(Self:TCustomConnection):TNotifyEvent;
begin
  result := Self.BeforeConnect;
end;
procedure TCustomConnection__PutBeforeConnect(Self:TCustomConnection;const Value: TNotifyEvent);
begin
  Self.BeforeConnect := Value;
end;
function TCustomConnection__GetAfterDisconnect(Self:TCustomConnection):TNotifyEvent;
begin
  result := Self.AfterDisconnect;
end;
procedure TCustomConnection__PutAfterDisconnect(Self:TCustomConnection;const Value: TNotifyEvent);
begin
  Self.AfterDisconnect := Value;
end;
function TCustomConnection__GetBeforeDisconnect(Self:TCustomConnection):TNotifyEvent;
begin
  result := Self.BeforeDisconnect;
end;
procedure TCustomConnection__PutBeforeDisconnect(Self:TCustomConnection;const Value: TNotifyEvent);
begin
  Self.BeforeDisconnect := Value;
end;
procedure TDefCollection_IndexOf(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TDefCollection(Self).IndexOf(Params[0].AsString);
end;
function TDefCollection__GetDataSet(Self:TDefCollection):TDataSet;
begin
  result := Self.DataSet;
end;
function TDefCollection__GetUpdated(Self:TDefCollection):Boolean;
begin
  result := Self.Updated;
end;
procedure TDefCollection__PutUpdated(Self:TDefCollection;const Value: Boolean);
begin
  Self.Updated := Value;
end;
procedure TFieldDef_HasChildDefs(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TFieldDef(Self).HasChildDefs();
end;
function TFieldDef__GetFieldClass(Self:TFieldDef):TFieldClass;
begin
  result := Self.FieldClass;
end;
function TFieldDef__GetFieldNo(Self:TFieldDef):Integer;
begin
  result := Self.FieldNo;
end;
procedure TFieldDef__PutFieldNo(Self:TFieldDef;const Value: Integer);
begin
  Self.FieldNo := Value;
end;
function TFieldDef__GetInternalCalcField(Self:TFieldDef):Boolean;
begin
  result := Self.InternalCalcField;
end;
procedure TFieldDef__PutInternalCalcField(Self:TFieldDef;const Value: Boolean);
begin
  Self.InternalCalcField := Value;
end;
function TFieldDef__GetParentDef(Self:TFieldDef):TFieldDef;
begin
  result := Self.ParentDef;
end;
function TFieldDef__GetRequired(Self:TFieldDef):Boolean;
begin
  result := Self.Required;
end;
procedure TFieldDef__PutRequired(Self:TFieldDef;const Value: Boolean);
begin
  Self.Required := Value;
end;
procedure TFieldDefs_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TFieldDefs(Self).Update();
end;
function TFieldDefs__GetHiddenFields(Self:TFieldDefs):Boolean;
begin
  result := Self.HiddenFields;
end;
procedure TFieldDefs__PutHiddenFields(Self:TFieldDefs;const Value: Boolean);
begin
  Self.HiddenFields := Value;
end;
function TFieldDefs__GetItems(Self:TFieldDefs;Index: Integer):TFieldDef;
begin
  result := Self.Items[Index];
end;
procedure TFieldDefs__PutItems(Self:TFieldDefs;Index: Integer;const Value: TFieldDef);
begin
  Self.Items[Index] := Value;
end;
function TFieldDefs__GetParentDef(Self:TFieldDefs):TFieldDef;
begin
  result := Self.ParentDef;
end;
function TIndexDef__GetFieldExpression(Self:TIndexDef):String;
begin
  result := Self.FieldExpression;
end;
procedure TIndexDefs_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TIndexDefs(Self).Update();
end;
function TIndexDefs__GetItems(Self:TIndexDefs;Index: Integer):TIndexDef;
begin
  result := Self.Items[Index];
end;
procedure TIndexDefs__PutItems(Self:TIndexDefs;Index: Integer;const Value: TIndexDef);
begin
  Self.Items[Index] := Value;
end;
procedure TFlatList_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TFlatList(Self).Update();
end;
function TFlatList__GetDataSet(Self:TFlatList):TDataSet;
begin
  result := Self.DataSet;
end;
function TFieldDefList__GetFieldDefs(Self:TFieldDefList;Index: Integer):TFieldDef;
begin
  result := Self.FieldDefs[Index];
end;
function TFieldList__GetFields(Self:TFieldList;Index: Integer):TField;
begin
  result := Self.Fields[Index];
end;
procedure TFieldsEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TFieldsEnumerator(Self).MoveNext();
end;
function TFieldsEnumerator__GetCurrent(Self:TFieldsEnumerator):TField;
begin
  result := Self.Current;
end;
procedure TFields_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TFields(Self).Clear();
end;
function TFields__GetCount(Self:TFields):Integer;
begin
  result := Self.Count;
end;
function TFields__GetDataSet(Self:TFields):TDataSet;
begin
  result := Self.DataSet;
end;
function TFields__GetFields(Self:TFields;Index: Integer):TField;
begin
  result := Self.Fields[Index];
end;
procedure TFields__PutFields(Self:TFields;Index: Integer;const Value: TField);
begin
  Self.Fields[Index] := Value;
end;
procedure TLookupList_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TLookupList(Self).Clear();
end;
procedure TField_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TField(Self).Clear();
end;
procedure TField_FocusControl(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TField(Self).FocusControl();
end;
procedure TField_HasParent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TField(Self).HasParent();
end;
procedure TField_IsBlob(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TField(Self).IsBlob();
end;
procedure TField_RefreshLookupList(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TField(Self).RefreshLookupList();
end;
function TField__GetAsBCD(Self:TField):TBcd;
begin
  result := Self.AsBCD;
end;
procedure TField__PutAsBCD(Self:TField;const Value: TBcd);
begin
  Self.AsBCD := Value;
end;
function TField__GetAsBoolean(Self:TField):Boolean;
begin
  result := Self.AsBoolean;
end;
procedure TField__PutAsBoolean(Self:TField;const Value: Boolean);
begin
  Self.AsBoolean := Value;
end;
function TField__GetAsCurrency(Self:TField):Currency;
begin
  result := Self.AsCurrency;
end;
procedure TField__PutAsCurrency(Self:TField;const Value: Currency);
begin
  Self.AsCurrency := Value;
end;
function TField__GetAsDateTime(Self:TField):TDateTime;
begin
  result := Self.AsDateTime;
end;
procedure TField__PutAsDateTime(Self:TField;const Value: TDateTime);
begin
  Self.AsDateTime := Value;
end;
function TField__GetAsSQLTimeStamp(Self:TField):TSQLTimeStamp;
begin
  result := Self.AsSQLTimeStamp;
end;
procedure TField__PutAsSQLTimeStamp(Self:TField;const Value: TSQLTimeStamp);
begin
  Self.AsSQLTimeStamp := Value;
end;
function TField__GetAsFloat(Self:TField):Double;
begin
  result := Self.AsFloat;
end;
procedure TField__PutAsFloat(Self:TField;const Value: Double);
begin
  Self.AsFloat := Value;
end;
function TField__GetAsInteger(Self:TField):Longint;
begin
  result := Self.AsInteger;
end;
procedure TField__PutAsInteger(Self:TField;const Value: Longint);
begin
  Self.AsInteger := Value;
end;
function TField__GetAsString(Self:TField):String;
begin
  result := Self.AsString;
end;
procedure TField__PutAsString(Self:TField;const Value: String);
begin
  Self.AsString := Value;
end;
function TField__GetAsVariant(Self:TField):Variant;
begin
  result := Self.AsVariant;
end;
procedure TField__PutAsVariant(Self:TField;const Value: Variant);
begin
  Self.AsVariant := Value;
end;
function TField__GetAttributeSet(Self:TField):String;
begin
  result := Self.AttributeSet;
end;
procedure TField__PutAttributeSet(Self:TField;const Value: String);
begin
  Self.AttributeSet := Value;
end;
function TField__GetCalculated(Self:TField):Boolean;
begin
  result := Self.Calculated;
end;
procedure TField__PutCalculated(Self:TField;const Value: Boolean);
begin
  Self.Calculated := Value;
end;
function TField__GetCanModify(Self:TField):Boolean;
begin
  result := Self.CanModify;
end;
function TField__GetCurValue(Self:TField):Variant;
begin
  result := Self.CurValue;
end;
function TField__GetDataSet(Self:TField):TDataSet;
begin
  result := Self.DataSet;
end;
procedure TField__PutDataSet(Self:TField;const Value: TDataSet);
begin
  Self.DataSet := Value;
end;
function TField__GetDataSize(Self:TField):Integer;
begin
  result := Self.DataSize;
end;
function TField__GetDataType(Self:TField):TFieldType;
begin
  result := Self.DataType;
end;
function TField__GetDisplayName(Self:TField):String;
begin
  result := Self.DisplayName;
end;
function TField__GetDisplayText(Self:TField):String;
begin
  result := Self.DisplayText;
end;
function TField__GetEditMask(Self:TField):TEditMask;
begin
  result := Self.EditMask;
end;
procedure TField__PutEditMask(Self:TField;const Value: TEditMask);
begin
  Self.EditMask := Value;
end;
function TField__GetEditMaskPtr(Self:TField):TEditMask;
begin
  result := Self.EditMaskPtr;
end;
function TField__GetFieldNo(Self:TField):Integer;
begin
  result := Self.FieldNo;
end;
function TField__GetFullName(Self:TField):String;
begin
  result := Self.FullName;
end;
function TField__GetIsIndexField(Self:TField):Boolean;
begin
  result := Self.IsIndexField;
end;
function TField__GetIsNull(Self:TField):Boolean;
begin
  result := Self.IsNull;
end;
function TField__GetLookup(Self:TField):Boolean;
begin
  result := Self.Lookup;
end;
procedure TField__PutLookup(Self:TField;const Value: Boolean);
begin
  Self.Lookup := Value;
end;
function TField__GetLookupList(Self:TField):TLookupList;
begin
  result := Self.LookupList;
end;
function TField__GetNewValue(Self:TField):Variant;
begin
  result := Self.NewValue;
end;
procedure TField__PutNewValue(Self:TField;const Value: Variant);
begin
  Self.NewValue := Value;
end;
function TField__GetOffset(Self:TField):Integer;
begin
  result := Self.Offset;
end;
function TField__GetOldValue(Self:TField):Variant;
begin
  result := Self.OldValue;
end;
function TField__GetParentField(Self:TField):TObjectField;
begin
  result := Self.ParentField;
end;
procedure TField__PutParentField(Self:TField;const Value: TObjectField);
begin
  Self.ParentField := Value;
end;
function TField__GetSize(Self:TField):Integer;
begin
  result := Self.Size;
end;
procedure TField__PutSize(Self:TField;const Value: Integer);
begin
  Self.Size := Value;
end;
function TField__GetText(Self:TField):String;
begin
  result := Self.Text;
end;
procedure TField__PutText(Self:TField;const Value: String);
begin
  Self.Text := Value;
end;
function TField__GetValidChars(Self:TField):TFieldChars;
begin
  result := Self.ValidChars;
end;
procedure TField__PutValidChars(Self:TField;const Value: TFieldChars);
begin
  Self.ValidChars := Value;
end;
function TField__GetValue(Self:TField):Variant;
begin
  result := Self.Value;
end;
procedure TField__PutValue(Self:TField;const Value: Variant);
begin
  Self.Value := Value;
end;
function TStringField__GetValue(Self:TStringField):String;
begin
  result := Self.Value;
end;
procedure TStringField__PutValue(Self:TStringField;const Value: String);
begin
  Self.Value := Value;
end;
function TWideStringField__GetValue(Self:TWideStringField):WideString;
begin
  result := Self.Value;
end;
procedure TWideStringField__PutValue(Self:TWideStringField;const Value: WideString);
begin
  Self.Value := Value;
end;
function TIntegerField__GetValue(Self:TIntegerField):Longint;
begin
  result := Self.Value;
end;
procedure TIntegerField__PutValue(Self:TIntegerField;const Value: Longint);
begin
  Self.Value := Value;
end;
function TLargeintField__GetAsLargeInt(Self:TLargeintField):LargeInt;
begin
  result := Self.AsLargeInt;
end;
procedure TLargeintField__PutAsLargeInt(Self:TLargeintField;const Value: LargeInt);
begin
  Self.AsLargeInt := Value;
end;
function TLargeintField__GetValue(Self:TLargeintField):Largeint;
begin
  result := Self.Value;
end;
procedure TLargeintField__PutValue(Self:TLargeintField;const Value: Largeint);
begin
  Self.Value := Value;
end;
function TFloatField__GetValue(Self:TFloatField):Double;
begin
  result := Self.Value;
end;
procedure TFloatField__PutValue(Self:TFloatField;const Value: Double);
begin
  Self.Value := Value;
end;
function TBooleanField__GetValue(Self:TBooleanField):Boolean;
begin
  result := Self.Value;
end;
procedure TBooleanField__PutValue(Self:TBooleanField;const Value: Boolean);
begin
  Self.Value := Value;
end;
function TDateTimeField__GetValue(Self:TDateTimeField):TDateTime;
begin
  result := Self.Value;
end;
procedure TDateTimeField__PutValue(Self:TDateTimeField;const Value: TDateTime);
begin
  Self.Value := Value;
end;
function TSQLTimeStampField__GetValue(Self:TSQLTimeStampField):TSQLTimeStamp;
begin
  result := Self.Value;
end;
procedure TSQLTimeStampField__PutValue(Self:TSQLTimeStampField;const Value: TSQLTimeStamp);
begin
  Self.Value := Value;
end;
function TBCDField__GetValue(Self:TBCDField):Currency;
begin
  result := Self.Value;
end;
procedure TBCDField__PutValue(Self:TBCDField;const Value: Currency);
begin
  Self.Value := Value;
end;
function TFMTBCDField__GetValue(Self:TFMTBCDField):TBcd;
begin
  result := Self.Value;
end;
procedure TFMTBCDField__PutValue(Self:TFMTBCDField;const Value: TBcd);
begin
  Self.Value := Value;
end;
procedure TBlobField_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TBlobField(Self).Clear();
end;
procedure TBlobField_IsBlob(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TBlobField(Self).IsBlob();
end;
procedure TBlobField_LoadFromFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TBlobField(Self).LoadFromFile(Params[0].AsString);
end;
procedure TBlobField_SaveToFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TBlobField(Self).SaveToFile(Params[0].AsString);
end;
function TBlobField__GetBlobSize(Self:TBlobField):Integer;
begin
  result := Self.BlobSize;
end;
function TBlobField__GetModified(Self:TBlobField):Boolean;
begin
  result := Self.Modified;
end;
procedure TBlobField__PutModified(Self:TBlobField;const Value: Boolean);
begin
  Self.Modified := Value;
end;
function TBlobField__GetValue(Self:TBlobField):String;
begin
  result := Self.Value;
end;
procedure TBlobField__PutValue(Self:TBlobField;const Value: String);
begin
  Self.Value := Value;
end;
function TBlobField__GetTransliterate(Self:TBlobField):Boolean;
begin
  result := Self.Transliterate;
end;
procedure TBlobField__PutTransliterate(Self:TBlobField;const Value: Boolean);
begin
  Self.Transliterate := Value;
end;
function TObjectField__GetFieldCount(Self:TObjectField):Integer;
begin
  result := Self.FieldCount;
end;
function TObjectField__GetFields(Self:TObjectField):TFields;
begin
  result := Self.Fields;
end;
function TObjectField__GetFieldValues(Self:TObjectField;Index: Integer):Variant;
begin
  result := Self.FieldValues[Index];
end;
procedure TObjectField__PutFieldValues(Self:TObjectField;Index: Integer;const Value: Variant);
begin
  Self.FieldValues[Index] := Value;
end;
function TObjectField__GetUnNamed(Self:TObjectField):Boolean;
begin
  result := Self.UnNamed;
end;
function TDataSetField__GetNestedDataSet(Self:TDataSetField):TDataSet;
begin
  result := Self.NestedDataSet;
end;
function TInterfaceField__GetValue(Self:TInterfaceField):IUnknown;
begin
  result := Self.Value;
end;
procedure TInterfaceField__PutValue(Self:TInterfaceField;const Value: IUnknown);
begin
  Self.Value := Value;
end;
function TIDispatchField__GetValue(Self:TIDispatchField):IDispatch;
begin
  result := Self.Value;
end;
procedure TIDispatchField__PutValue(Self:TIDispatchField;const Value: IDispatch);
begin
  Self.Value := Value;
end;
function TGuidField__GetAsGuid(Self:TGuidField):TGUID;
begin
  result := Self.AsGuid;
end;
procedure TGuidField__PutAsGuid(Self:TGuidField;const Value: TGUID);
begin
  Self.AsGuid := Value;
end;
function TAggregateField__GetHandle(Self:TAggregateField):Pointer;
begin
  result := Self.Handle;
end;
procedure TAggregateField__PutHandle(Self:TAggregateField;const Value: Pointer);
begin
  Self.Handle := Value;
end;
function TAggregateField__GetResultType(Self:TAggregateField):TFieldType;
begin
  result := Self.ResultType;
end;
procedure TAggregateField__PutResultType(Self:TAggregateField;const Value: TFieldType);
begin
  Self.ResultType := Value;
end;
procedure TDataLink_Edit(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataLink(Self).Edit();
end;
procedure TDataLink_UpdateRecord(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataLink(Self).UpdateRecord();
end;
function TDataLink__GetActive(Self:TDataLink):Boolean;
begin
  result := Self.Active;
end;
function TDataLink__GetActiveRecord(Self:TDataLink):Integer;
begin
  result := Self.ActiveRecord;
end;
procedure TDataLink__PutActiveRecord(Self:TDataLink;const Value: Integer);
begin
  Self.ActiveRecord := Value;
end;
function TDataLink__GetBOF(Self:TDataLink):Boolean;
begin
  result := Self.BOF;
end;
function TDataLink__GetBufferCount(Self:TDataLink):Integer;
begin
  result := Self.BufferCount;
end;
procedure TDataLink__PutBufferCount(Self:TDataLink;const Value: Integer);
begin
  Self.BufferCount := Value;
end;
function TDataLink__GetDataSet(Self:TDataLink):TDataSet;
begin
  result := Self.DataSet;
end;
function TDataLink__GetDataSource(Self:TDataLink):TDataSource;
begin
  result := Self.DataSource;
end;
procedure TDataLink__PutDataSource(Self:TDataLink;const Value: TDataSource);
begin
  Self.DataSource := Value;
end;
function TDataLink__GetDataSourceFixed(Self:TDataLink):Boolean;
begin
  result := Self.DataSourceFixed;
end;
procedure TDataLink__PutDataSourceFixed(Self:TDataLink;const Value: Boolean);
begin
  Self.DataSourceFixed := Value;
end;
function TDataLink__GetEditing(Self:TDataLink):Boolean;
begin
  result := Self.Editing;
end;
function TDataLink__GetEof(Self:TDataLink):Boolean;
begin
  result := Self.Eof;
end;
function TDataLink__GetReadOnly(Self:TDataLink):Boolean;
begin
  result := Self.ReadOnly;
end;
procedure TDataLink__PutReadOnly(Self:TDataLink;const Value: Boolean);
begin
  Self.ReadOnly := Value;
end;
function TDataLink__GetRecordCount(Self:TDataLink):Integer;
begin
  result := Self.RecordCount;
end;
function TDetailDataLink__GetDetailDataSet(Self:TDetailDataLink):TDataSet;
begin
  result := Self.DetailDataSet;
end;
function TMasterDataLink__GetFieldNames(Self:TMasterDataLink):String;
begin
  result := Self.FieldNames;
end;
procedure TMasterDataLink__PutFieldNames(Self:TMasterDataLink;const Value: String);
begin
  Self.FieldNames := Value;
end;
function TMasterDataLink__GetFields(Self:TMasterDataLink):TList;
begin
  result := Self.Fields;
end;
procedure TDataSource_Edit(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSource(Self).Edit();
end;
function TDataSource__GetState(Self:TDataSource):TDataSetState;
begin
  result := Self.State;
end;
procedure TDataSetDesigner_BeginDesign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSetDesigner(Self).BeginDesign();
end;
procedure TDataSetDesigner_EndDesign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSetDesigner(Self).EndDesign();
end;
function TDataSetDesigner__GetDataSet(Self:TDataSetDesigner):TDataSet;
begin
  result := Self.DataSet;
end;
procedure TCheckConstraint_GetDisplayName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TCheckConstraint(Self).GetDisplayName();
end;
function TCheckConstraints__GetItems(Self:TCheckConstraints;Index: Integer):TCheckConstraint;
begin
  result := Self.Items[Index];
end;
procedure TCheckConstraints__PutItems(Self:TCheckConstraints;Index: Integer;const Value: TCheckConstraint);
begin
  Self.Items[Index] := Value;
end;
procedure TParam_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TParam(Self).Clear();
end;
procedure TParam_GetDataSize(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TParam(Self).GetDataSize();
end;
function TParam__GetAsBCD(Self:TParam):Currency;
begin
  result := Self.AsBCD;
end;
procedure TParam__PutAsBCD(Self:TParam;const Value: Currency);
begin
  Self.AsBCD := Value;
end;
function TParam__GetAsFMTBCD(Self:TParam):TBcd;
begin
  result := Self.AsFMTBCD;
end;
procedure TParam__PutAsFMTBCD(Self:TParam;const Value: TBcd);
begin
  Self.AsFMTBCD := Value;
end;
function TParam__GetAsBlob(Self:TParam):TBlobData;
begin
  result := Self.AsBlob;
end;
procedure TParam__PutAsBlob(Self:TParam;const Value: TBlobData);
begin
  Self.AsBlob := Value;
end;
function TParam__GetAsBoolean(Self:TParam):Boolean;
begin
  result := Self.AsBoolean;
end;
procedure TParam__PutAsBoolean(Self:TParam;const Value: Boolean);
begin
  Self.AsBoolean := Value;
end;
function TParam__GetAsCurrency(Self:TParam):Currency;
begin
  result := Self.AsCurrency;
end;
procedure TParam__PutAsCurrency(Self:TParam;const Value: Currency);
begin
  Self.AsCurrency := Value;
end;
function TParam__GetAsDate(Self:TParam):TDateTime;
begin
  result := Self.AsDate;
end;
procedure TParam__PutAsDate(Self:TParam;const Value: TDateTime);
begin
  Self.AsDate := Value;
end;
function TParam__GetAsDateTime(Self:TParam):TDateTime;
begin
  result := Self.AsDateTime;
end;
procedure TParam__PutAsDateTime(Self:TParam;const Value: TDateTime);
begin
  Self.AsDateTime := Value;
end;
function TParam__GetAsFloat(Self:TParam):Double;
begin
  result := Self.AsFloat;
end;
procedure TParam__PutAsFloat(Self:TParam;const Value: Double);
begin
  Self.AsFloat := Value;
end;
function TParam__GetAsInteger(Self:TParam):LongInt;
begin
  result := Self.AsInteger;
end;
procedure TParam__PutAsInteger(Self:TParam;const Value: LongInt);
begin
  Self.AsInteger := Value;
end;
function TParam__GetAsSmallInt(Self:TParam):LongInt;
begin
  result := Self.AsSmallInt;
end;
procedure TParam__PutAsSmallInt(Self:TParam;const Value: LongInt);
begin
  Self.AsSmallInt := Value;
end;
function TParam__GetAsSQLTimeStamp(Self:TParam):TSQLTimeStamp;
begin
  result := Self.AsSQLTimeStamp;
end;
procedure TParam__PutAsSQLTimeStamp(Self:TParam;const Value: TSQLTimeStamp);
begin
  Self.AsSQLTimeStamp := Value;
end;
function TParam__GetAsMemo(Self:TParam):String;
begin
  result := Self.AsMemo;
end;
procedure TParam__PutAsMemo(Self:TParam;const Value: String);
begin
  Self.AsMemo := Value;
end;
function TParam__GetAsString(Self:TParam):String;
begin
  result := Self.AsString;
end;
procedure TParam__PutAsString(Self:TParam;const Value: String);
begin
  Self.AsString := Value;
end;
function TParam__GetAsTime(Self:TParam):TDateTime;
begin
  result := Self.AsTime;
end;
procedure TParam__PutAsTime(Self:TParam;const Value: TDateTime);
begin
  Self.AsTime := Value;
end;
function TParam__GetAsWord(Self:TParam):LongInt;
begin
  result := Self.AsWord;
end;
procedure TParam__PutAsWord(Self:TParam;const Value: LongInt);
begin
  Self.AsWord := Value;
end;
function TParam__GetBound(Self:TParam):Boolean;
begin
  result := Self.Bound;
end;
procedure TParam__PutBound(Self:TParam;const Value: Boolean);
begin
  Self.Bound := Value;
end;
function TParam__GetIsNull(Self:TParam):Boolean;
begin
  result := Self.IsNull;
end;
function TParam__GetNativeStr(Self:TParam):String;
begin
  result := Self.NativeStr;
end;
procedure TParam__PutNativeStr(Self:TParam;const Value: String);
begin
  Self.NativeStr := Value;
end;
function TParam__GetText(Self:TParam):String;
begin
  result := Self.Text;
end;
procedure TParam__PutText(Self:TParam;const Value: String);
begin
  Self.Text := Value;
end;
function TParams__GetItems(Self:TParams;Index: Integer):TParam;
begin
  result := Self.Items[Index];
end;
procedure TParams__PutItems(Self:TParams;Index: Integer;const Value: TParam);
begin
  Self.Items[Index] := Value;
end;
function TParams__GetParamValues(Self:TParams;const ParamName: string):Variant;
begin
  result := Self.ParamValues[ParamName];
end;
procedure TParams__PutParamValues(Self:TParams;const ParamName: string;const Value: Variant);
begin
  Self.ParamValues[ParamName] := Value;
end;
procedure TDataSet_Append(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Append();
end;
procedure TDataSet_Cancel(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Cancel();
end;
procedure TDataSet_CheckBrowseMode(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).CheckBrowseMode();
end;
procedure TDataSet_ClearFields(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).ClearFields();
end;
procedure TDataSet_Close(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Close();
end;
procedure TDataSet_ControlsDisabled(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).ControlsDisabled();
end;
procedure TDataSet_CursorPosChanged(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).CursorPosChanged();
end;
procedure TDataSet_Delete(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Delete();
end;
procedure TDataSet_DisableControls(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).DisableControls();
end;
procedure TDataSet_Edit(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Edit();
end;
procedure TDataSet_EnableControls(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).EnableControls();
end;
procedure TDataSet_FindFirst(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).FindFirst();
end;
procedure TDataSet_FindLast(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).FindLast();
end;
procedure TDataSet_FindNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).FindNext();
end;
procedure TDataSet_FindPrior(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).FindPrior();
end;
procedure TDataSet_First(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).First();
end;
procedure TDataSet_Insert(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Insert();
end;
procedure TDataSet_IsEmpty(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).IsEmpty();
end;
procedure TDataSet_IsSequenced(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDataSet(Self).IsSequenced();
end;
procedure TDataSet_Last(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Last();
end;
procedure TDataSet_Next(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Next();
end;
procedure TDataSet_Open(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Open();
end;
procedure TDataSet_Post(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Post();
end;
procedure TDataSet_Prior(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Prior();
end;
procedure TDataSet_Refresh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).Refresh();
end;
procedure TDataSet_UpdateCursorPos(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).UpdateCursorPos();
end;
procedure TDataSet_UpdateRecord(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataSet(Self).UpdateRecord();
end;
function TDataSet__GetAggFields(Self:TDataSet):TFields;
begin
  result := Self.AggFields;
end;
function TDataSet__GetBof(Self:TDataSet):Boolean;
begin
  result := Self.Bof;
end;
function TDataSet__GetBookmark(Self:TDataSet):TBookmarkStr;
begin
  result := Self.Bookmark;
end;
procedure TDataSet__PutBookmark(Self:TDataSet;const Value: TBookmarkStr);
begin
  Self.Bookmark := Value;
end;
function TDataSet__GetCanModify(Self:TDataSet):Boolean;
begin
  result := Self.CanModify;
end;
function TDataSet__GetDataSetField(Self:TDataSet):TDataSetField;
begin
  result := Self.DataSetField;
end;
procedure TDataSet__PutDataSetField(Self:TDataSet;const Value: TDataSetField);
begin
  Self.DataSetField := Value;
end;
function TDataSet__GetDataSource(Self:TDataSet):TDataSource;
begin
  result := Self.DataSource;
end;
function TDataSet__GetDefaultFields(Self:TDataSet):Boolean;
begin
  result := Self.DefaultFields;
end;
function TDataSet__GetDesigner(Self:TDataSet):TDataSetDesigner;
begin
  result := Self.Designer;
end;
function TDataSet__GetEof(Self:TDataSet):Boolean;
begin
  result := Self.Eof;
end;
function TDataSet__GetBlockReadSize(Self:TDataSet):Integer;
begin
  result := Self.BlockReadSize;
end;
procedure TDataSet__PutBlockReadSize(Self:TDataSet;const Value: Integer);
begin
  Self.BlockReadSize := Value;
end;
function TDataSet__GetFieldCount(Self:TDataSet):Integer;
begin
  result := Self.FieldCount;
end;
function TDataSet__GetFieldDefs(Self:TDataSet):TFieldDefs;
begin
  result := Self.FieldDefs;
end;
procedure TDataSet__PutFieldDefs(Self:TDataSet;const Value: TFieldDefs);
begin
  Self.FieldDefs := Value;
end;
function TDataSet__GetFieldDefList(Self:TDataSet):TFieldDefList;
begin
  result := Self.FieldDefList;
end;
function TDataSet__GetFields(Self:TDataSet):TFields;
begin
  result := Self.Fields;
end;
function TDataSet__GetFieldList(Self:TDataSet):TFieldList;
begin
  result := Self.FieldList;
end;
function TDataSet__GetFieldValues(Self:TDataSet;const FieldName: string):Variant;
begin
  result := Self.FieldValues[FieldName];
end;
procedure TDataSet__PutFieldValues(Self:TDataSet;const FieldName: string;const Value: Variant);
begin
  Self.FieldValues[FieldName] := Value;
end;
function TDataSet__GetFound(Self:TDataSet):Boolean;
begin
  result := Self.Found;
end;
function TDataSet__GetIsUniDirectional(Self:TDataSet):Boolean;
begin
  result := Self.IsUniDirectional;
end;
function TDataSet__GetModified(Self:TDataSet):Boolean;
begin
  result := Self.Modified;
end;
function TDataSet__GetObjectView(Self:TDataSet):Boolean;
begin
  result := Self.ObjectView;
end;
procedure TDataSet__PutObjectView(Self:TDataSet;const Value: Boolean);
begin
  Self.ObjectView := Value;
end;
function TDataSet__GetRecordCount(Self:TDataSet):Integer;
begin
  result := Self.RecordCount;
end;
function TDataSet__GetRecNo(Self:TDataSet):Integer;
begin
  result := Self.RecNo;
end;
procedure TDataSet__PutRecNo(Self:TDataSet;const Value: Integer);
begin
  Self.RecNo := Value;
end;
function TDataSet__GetRecordSize(Self:TDataSet):Word;
begin
  result := Self.RecordSize;
end;
function TDataSet__GetSparseArrays(Self:TDataSet):Boolean;
begin
  result := Self.SparseArrays;
end;
procedure TDataSet__PutSparseArrays(Self:TDataSet;const Value: Boolean);
begin
  Self.SparseArrays := Value;
end;
function TDataSet__GetState(Self:TDataSet):TDataSetState;
begin
  result := Self.State;
end;
function TDataSet__GetFilter(Self:TDataSet):String;
begin
  result := Self.Filter;
end;
procedure TDataSet__PutFilter(Self:TDataSet;const Value: String);
begin
  Self.Filter := Value;
end;
function TDataSet__GetFiltered(Self:TDataSet):Boolean;
begin
  result := Self.Filtered;
end;
procedure TDataSet__PutFiltered(Self:TDataSet;const Value: Boolean);
begin
  Self.Filtered := Value;
end;
function TDataSet__GetFilterOptions(Self:TDataSet):TFilterOptions;
begin
  result := Self.FilterOptions;
end;
procedure TDataSet__PutFilterOptions(Self:TDataSet;const Value: TFilterOptions);
begin
  Self.FilterOptions := Value;
end;
function TDataSet__GetActive(Self:TDataSet):Boolean;
begin
  result := Self.Active;
end;
procedure TDataSet__PutActive(Self:TDataSet;const Value: Boolean);
begin
  Self.Active := Value;
end;
function TDataSet__GetAutoCalcFields(Self:TDataSet):Boolean;
begin
  result := Self.AutoCalcFields;
end;
procedure TDataSet__PutAutoCalcFields(Self:TDataSet;const Value: Boolean);
begin
  Self.AutoCalcFields := Value;
end;
function TDataSet__GetBeforeOpen(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeOpen;
end;
procedure TDataSet__PutBeforeOpen(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeOpen := Value;
end;
function TDataSet__GetAfterOpen(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterOpen;
end;
procedure TDataSet__PutAfterOpen(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterOpen := Value;
end;
function TDataSet__GetBeforeClose(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeClose;
end;
procedure TDataSet__PutBeforeClose(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeClose := Value;
end;
function TDataSet__GetAfterClose(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterClose;
end;
procedure TDataSet__PutAfterClose(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterClose := Value;
end;
function TDataSet__GetBeforeInsert(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeInsert;
end;
procedure TDataSet__PutBeforeInsert(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeInsert := Value;
end;
function TDataSet__GetAfterInsert(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterInsert;
end;
procedure TDataSet__PutAfterInsert(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterInsert := Value;
end;
function TDataSet__GetBeforeEdit(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeEdit;
end;
procedure TDataSet__PutBeforeEdit(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeEdit := Value;
end;
function TDataSet__GetAfterEdit(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterEdit;
end;
procedure TDataSet__PutAfterEdit(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterEdit := Value;
end;
function TDataSet__GetBeforePost(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforePost;
end;
procedure TDataSet__PutBeforePost(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforePost := Value;
end;
function TDataSet__GetAfterPost(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterPost;
end;
procedure TDataSet__PutAfterPost(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterPost := Value;
end;
function TDataSet__GetBeforeCancel(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeCancel;
end;
procedure TDataSet__PutBeforeCancel(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeCancel := Value;
end;
function TDataSet__GetAfterCancel(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterCancel;
end;
procedure TDataSet__PutAfterCancel(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterCancel := Value;
end;
function TDataSet__GetBeforeDelete(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeDelete;
end;
procedure TDataSet__PutBeforeDelete(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeDelete := Value;
end;
function TDataSet__GetAfterDelete(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterDelete;
end;
procedure TDataSet__PutAfterDelete(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterDelete := Value;
end;
function TDataSet__GetBeforeScroll(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeScroll;
end;
procedure TDataSet__PutBeforeScroll(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeScroll := Value;
end;
function TDataSet__GetAfterScroll(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterScroll;
end;
procedure TDataSet__PutAfterScroll(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterScroll := Value;
end;
function TDataSet__GetBeforeRefresh(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.BeforeRefresh;
end;
procedure TDataSet__PutBeforeRefresh(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.BeforeRefresh := Value;
end;
function TDataSet__GetAfterRefresh(Self:TDataSet):TDataSetNotifyEvent;
begin
  result := Self.AfterRefresh;
end;
procedure TDataSet__PutAfterRefresh(Self:TDataSet;const Value: TDataSetNotifyEvent);
begin
  Self.AfterRefresh := Value;
end;
procedure RegisterIMP_DB;
var H: Integer;
begin
  H := RegisterNamespace('DB', -1);
  // Begin of class EUpdateError
  RegisterClassType(EUpdateError, H);
  RegisterMethod(EUpdateError,
       'constructor Create(NativeError, Context: string;      ErrCode, PrevError: Integer; E: Exception);',
       @EUpdateError.Create);
  RegisterMethod(EUpdateError,
       'destructor Destroy; override;',
       @EUpdateError.Destroy);
  RegisterMethod(EUpdateError,
       'function EUpdateError__GetContext(Self:EUpdateError):String;',
       @EUpdateError__GetContext, true);
  RegisterProperty(EUpdateError,
       'property Context:String read EUpdateError__GetContext;');
  RegisterMethod(EUpdateError,
       'function EUpdateError__GetErrorCode(Self:EUpdateError):Integer;',
       @EUpdateError__GetErrorCode, true);
  RegisterProperty(EUpdateError,
       'property ErrorCode:Integer read EUpdateError__GetErrorCode;');
  RegisterMethod(EUpdateError,
       'function EUpdateError__GetPreviousError(Self:EUpdateError):Integer;',
       @EUpdateError__GetPreviousError, true);
  RegisterProperty(EUpdateError,
       'property PreviousError:Integer read EUpdateError__GetPreviousError;');
  RegisterMethod(EUpdateError,
       'function EUpdateError__GetOriginalException(Self:EUpdateError):Exception;',
       @EUpdateError__GetOriginalException, true);
  RegisterProperty(EUpdateError,
       'property OriginalException:Exception read EUpdateError__GetOriginalException;');
  // End of class EUpdateError
  RegisterRTTIType(TypeInfo(TFieldType));
  RegisterRTTIType(TypeInfo(TDataSetState));
  RegisterRTTIType(TypeInfo(TDataEvent));
  RegisterRTTIType(TypeInfo(TUpdateStatus));
  RegisterRTTIType(TypeInfo(TUpdateStatusSet));
  RegisterRTTIType(TypeInfo(TUpdateAction));
  RegisterRTTIType(TypeInfo(TUpdateRecordTypes));
  RegisterRTTIType(TypeInfo(TUpdateMode));
  RegisterRTTIType(TypeInfo(TUpdateKind));
  // Begin of class TCustomConnection
  RegisterClassType(TCustomConnection, H);
  RegisterMethod(TCustomConnection,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomConnection.Create);
  RegisterMethod(TCustomConnection,
       'destructor Destroy; override;',
       @TCustomConnection.Destroy);
  RegisterStdMethodEx(TCustomConnection,'Open',TCustomConnection_Open1,0,[typeVARIANT]);
  RegisterStdMethodEx(TCustomConnection,'Close',TCustomConnection_Close,0,[typeVARIANT]);
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetConnected(Self:TCustomConnection):Boolean;',
       @TCustomConnection__GetConnected, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutConnected(Self:TCustomConnection;const Value: Boolean);',
       @TCustomConnection__PutConnected, true);
  RegisterProperty(TCustomConnection,
       'property Connected:Boolean read TCustomConnection__GetConnected write TCustomConnection__PutConnected;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetDataSets(Self:TCustomConnection;Index: Integer):TDataSet;',
       @TCustomConnection__GetDataSets, true);
  RegisterProperty(TCustomConnection,
       'property DataSets[Index: Integer]:TDataSet read TCustomConnection__GetDataSets;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetDataSetCount(Self:TCustomConnection):Integer;',
       @TCustomConnection__GetDataSetCount, true);
  RegisterProperty(TCustomConnection,
       'property DataSetCount:Integer read TCustomConnection__GetDataSetCount;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetLoginPrompt(Self:TCustomConnection):Boolean;',
       @TCustomConnection__GetLoginPrompt, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutLoginPrompt(Self:TCustomConnection;const Value: Boolean);',
       @TCustomConnection__PutLoginPrompt, true);
  RegisterProperty(TCustomConnection,
       'property LoginPrompt:Boolean read TCustomConnection__GetLoginPrompt write TCustomConnection__PutLoginPrompt;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetAfterConnect(Self:TCustomConnection):TNotifyEvent;',
       @TCustomConnection__GetAfterConnect, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutAfterConnect(Self:TCustomConnection;const Value: TNotifyEvent);',
       @TCustomConnection__PutAfterConnect, true);
  RegisterProperty(TCustomConnection,
       'property AfterConnect:TNotifyEvent read TCustomConnection__GetAfterConnect write TCustomConnection__PutAfterConnect;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetBeforeConnect(Self:TCustomConnection):TNotifyEvent;',
       @TCustomConnection__GetBeforeConnect, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutBeforeConnect(Self:TCustomConnection;const Value: TNotifyEvent);',
       @TCustomConnection__PutBeforeConnect, true);
  RegisterProperty(TCustomConnection,
       'property BeforeConnect:TNotifyEvent read TCustomConnection__GetBeforeConnect write TCustomConnection__PutBeforeConnect;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetAfterDisconnect(Self:TCustomConnection):TNotifyEvent;',
       @TCustomConnection__GetAfterDisconnect, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutAfterDisconnect(Self:TCustomConnection;const Value: TNotifyEvent);',
       @TCustomConnection__PutAfterDisconnect, true);
  RegisterProperty(TCustomConnection,
       'property AfterDisconnect:TNotifyEvent read TCustomConnection__GetAfterDisconnect write TCustomConnection__PutAfterDisconnect;');
  RegisterMethod(TCustomConnection,
       'function TCustomConnection__GetBeforeDisconnect(Self:TCustomConnection):TNotifyEvent;',
       @TCustomConnection__GetBeforeDisconnect, true);
  RegisterMethod(TCustomConnection,
       'procedure TCustomConnection__PutBeforeDisconnect(Self:TCustomConnection;const Value: TNotifyEvent);',
       @TCustomConnection__PutBeforeDisconnect, true);
  RegisterProperty(TCustomConnection,
       'property BeforeDisconnect:TNotifyEvent read TCustomConnection__GetBeforeDisconnect write TCustomConnection__PutBeforeDisconnect;');
  // End of class TCustomConnection
  // Begin of class TNamedItem
  RegisterClassType(TNamedItem, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TNamedItem
  // Begin of class TDefCollection
  RegisterClassType(TDefCollection, H);
  RegisterMethod(TDefCollection,
       'constructor Create(ADataSet: TDataSet; AOwner: TPersistent;      AClass: TCollectionItemClass);',
       @TDefCollection.Create);
  RegisterMethod(TDefCollection,
       'function Find(const AName: string): TNamedItem;',
       @TDefCollection.Find);
  RegisterMethod(TDefCollection,
       'procedure GetItemNames(List: TStrings);',
       @TDefCollection.GetItemNames);
  RegisterStdMethodEx(TDefCollection,'IndexOf',TDefCollection_IndexOf,1,[typeSTRING,typeINTEGER]);
  RegisterMethod(TDefCollection,
       'function TDefCollection__GetDataSet(Self:TDefCollection):TDataSet;',
       @TDefCollection__GetDataSet, true);
  RegisterProperty(TDefCollection,
       'property DataSet:TDataSet read TDefCollection__GetDataSet;');
  RegisterMethod(TDefCollection,
       'function TDefCollection__GetUpdated(Self:TDefCollection):Boolean;',
       @TDefCollection__GetUpdated, true);
  RegisterMethod(TDefCollection,
       'procedure TDefCollection__PutUpdated(Self:TDefCollection;const Value: Boolean);',
       @TDefCollection__PutUpdated, true);
  RegisterProperty(TDefCollection,
       'property Updated:Boolean read TDefCollection__GetUpdated write TDefCollection__PutUpdated;');
  // End of class TDefCollection
  RegisterRTTIType(TypeInfo(TFieldAttribute));
  RegisterRTTIType(TypeInfo(TFieldAttributes));
  // Begin of class TFieldDef
  RegisterClassType(TFieldDef, H);
  RegisterMethod(TFieldDef,
       'destructor Destroy; override;',
       @TFieldDef.Destroy);
  RegisterMethod(TFieldDef,
       'function AddChild: TFieldDef;',
       @TFieldDef.AddChild);
  RegisterMethod(TFieldDef,
       'procedure Assign(Source: TPersistent); override;',
       @TFieldDef.Assign);
  RegisterMethod(TFieldDef,
       'function CreateField(Owner: TComponent; ParentField: TObjectField = nil;      const FieldName: string = ''''; CreateChildren: Boolean = True): TField;',
       @TFieldDef.CreateField);
  RegisterStdMethodEx(TFieldDef,'HasChildDefs',TFieldDef_HasChildDefs,0,[typeBOOLEAN]);
  RegisterMethod(TFieldDef,
       'function TFieldDef__GetFieldClass(Self:TFieldDef):TFieldClass;',
       @TFieldDef__GetFieldClass, true);
  RegisterProperty(TFieldDef,
       'property FieldClass:TFieldClass read TFieldDef__GetFieldClass;');
  RegisterMethod(TFieldDef,
       'function TFieldDef__GetFieldNo(Self:TFieldDef):Integer;',
       @TFieldDef__GetFieldNo, true);
  RegisterMethod(TFieldDef,
       'procedure TFieldDef__PutFieldNo(Self:TFieldDef;const Value: Integer);',
       @TFieldDef__PutFieldNo, true);
  RegisterProperty(TFieldDef,
       'property FieldNo:Integer read TFieldDef__GetFieldNo write TFieldDef__PutFieldNo;');
  RegisterMethod(TFieldDef,
       'function TFieldDef__GetInternalCalcField(Self:TFieldDef):Boolean;',
       @TFieldDef__GetInternalCalcField, true);
  RegisterMethod(TFieldDef,
       'procedure TFieldDef__PutInternalCalcField(Self:TFieldDef;const Value: Boolean);',
       @TFieldDef__PutInternalCalcField, true);
  RegisterProperty(TFieldDef,
       'property InternalCalcField:Boolean read TFieldDef__GetInternalCalcField write TFieldDef__PutInternalCalcField;');
  RegisterMethod(TFieldDef,
       'function TFieldDef__GetParentDef(Self:TFieldDef):TFieldDef;',
       @TFieldDef__GetParentDef, true);
  RegisterProperty(TFieldDef,
       'property ParentDef:TFieldDef read TFieldDef__GetParentDef;');
  RegisterMethod(TFieldDef,
       'function TFieldDef__GetRequired(Self:TFieldDef):Boolean;',
       @TFieldDef__GetRequired, true);
  RegisterMethod(TFieldDef,
       'procedure TFieldDef__PutRequired(Self:TFieldDef;const Value: Boolean);',
       @TFieldDef__PutRequired, true);
  RegisterProperty(TFieldDef,
       'property Required:Boolean read TFieldDef__GetRequired write TFieldDef__PutRequired;');
  // End of class TFieldDef
  // Begin of class TFieldDefs
  RegisterClassType(TFieldDefs, H);
  RegisterMethod(TFieldDefs,
       'constructor Create(AOwner: TPersistent);',
       @TFieldDefs.Create);
  RegisterMethod(TFieldDefs,
       'function AddFieldDef: TFieldDef;',
       @TFieldDefs.AddFieldDef);
  RegisterMethod(TFieldDefs,
       'function Find(const Name: string): TFieldDef;',
       @TFieldDefs.Find);
  RegisterStdMethodEx(TFieldDefs,'Update',TFieldDefs_Update,0,[typeVARIANT]);
  RegisterMethod(TFieldDefs,
       'procedure Add(const Name: string; DataType: TFieldType; Size: Integer = 0;      Required: Boolean = False);',
       @TFieldDefs.Add);
  RegisterMethod(TFieldDefs,
       'function TFieldDefs__GetHiddenFields(Self:TFieldDefs):Boolean;',
       @TFieldDefs__GetHiddenFields, true);
  RegisterMethod(TFieldDefs,
       'procedure TFieldDefs__PutHiddenFields(Self:TFieldDefs;const Value: Boolean);',
       @TFieldDefs__PutHiddenFields, true);
  RegisterProperty(TFieldDefs,
       'property HiddenFields:Boolean read TFieldDefs__GetHiddenFields write TFieldDefs__PutHiddenFields;');
  RegisterMethod(TFieldDefs,
       'function TFieldDefs__GetItems(Self:TFieldDefs;Index: Integer):TFieldDef;',
       @TFieldDefs__GetItems, true);
  RegisterMethod(TFieldDefs,
       'procedure TFieldDefs__PutItems(Self:TFieldDefs;Index: Integer;const Value: TFieldDef);',
       @TFieldDefs__PutItems, true);
  RegisterProperty(TFieldDefs,
       'property Items[Index: Integer]:TFieldDef read TFieldDefs__GetItems write TFieldDefs__PutItems;default;');
  RegisterMethod(TFieldDefs,
       'function TFieldDefs__GetParentDef(Self:TFieldDefs):TFieldDef;',
       @TFieldDefs__GetParentDef, true);
  RegisterProperty(TFieldDefs,
       'property ParentDef:TFieldDef read TFieldDefs__GetParentDef;');
  // End of class TFieldDefs
  RegisterRTTIType(TypeInfo(TIndexOption));
  RegisterRTTIType(TypeInfo(TIndexOptions));
  // Begin of class TIndexDef
  RegisterClassType(TIndexDef, H);
  RegisterMethod(TIndexDef,
       'procedure Assign(ASource: TPersistent); override;',
       @TIndexDef.Assign);
  RegisterMethod(TIndexDef,
       'function TIndexDef__GetFieldExpression(Self:TIndexDef):String;',
       @TIndexDef__GetFieldExpression, true);
  RegisterProperty(TIndexDef,
       'property FieldExpression:String read TIndexDef__GetFieldExpression;');
  // End of class TIndexDef
  // Begin of class TIndexDefs
  RegisterClassType(TIndexDefs, H);
  RegisterMethod(TIndexDefs,
       'constructor Create(ADataSet: TDataSet);',
       @TIndexDefs.Create);
  RegisterMethod(TIndexDefs,
       'function AddIndexDef: TIndexDef;',
       @TIndexDefs.AddIndexDef);
  RegisterMethod(TIndexDefs,
       'function Find(const Name: string): TIndexDef;',
       @TIndexDefs.Find);
  RegisterStdMethodEx(TIndexDefs,'Update',TIndexDefs_Update,0,[typeVARIANT]);
  RegisterMethod(TIndexDefs,
       'function FindIndexForFields(const Fields: string): TIndexDef;',
       @TIndexDefs.FindIndexForFields);
  RegisterMethod(TIndexDefs,
       'function GetIndexForFields(const Fields: string;      CaseInsensitive: Boolean): TIndexDef;',
       @TIndexDefs.GetIndexForFields);
  RegisterMethod(TIndexDefs,
       'procedure Add(const Name, Fields: string; Options: TIndexOptions);',
       @TIndexDefs.Add);
  RegisterMethod(TIndexDefs,
       'function TIndexDefs__GetItems(Self:TIndexDefs;Index: Integer):TIndexDef;',
       @TIndexDefs__GetItems, true);
  RegisterMethod(TIndexDefs,
       'procedure TIndexDefs__PutItems(Self:TIndexDefs;Index: Integer;const Value: TIndexDef);',
       @TIndexDefs__PutItems, true);
  RegisterProperty(TIndexDefs,
       'property Items[Index: Integer]:TIndexDef read TIndexDefs__GetItems write TIndexDefs__PutItems;default;');
  // End of class TIndexDefs
  // Begin of class TFlatList
  RegisterClassType(TFlatList, H);
  RegisterMethod(TFlatList,
       'constructor Create(ADataSet: TDataSet);',
       @TFlatList.Create);
  RegisterStdMethodEx(TFlatList,'Update',TFlatList_Update,0,[typeVARIANT]);
  RegisterMethod(TFlatList,
       'function TFlatList__GetDataSet(Self:TFlatList):TDataSet;',
       @TFlatList__GetDataSet, true);
  RegisterProperty(TFlatList,
       'property DataSet:TDataSet read TFlatList__GetDataSet;');
  // End of class TFlatList
  // Begin of class TFieldDefList
  RegisterClassType(TFieldDefList, H);
  RegisterMethod(TFieldDefList,
       'function FieldByName(const Name: string): TFieldDef;',
       @TFieldDefList.FieldByName);
  RegisterMethod(TFieldDefList,
       'function Find(const Name: string): TFieldDef; reintroduce;',
       @TFieldDefList.Find);
  RegisterMethod(TFieldDefList,
       'function TFieldDefList__GetFieldDefs(Self:TFieldDefList;Index: Integer):TFieldDef;',
       @TFieldDefList__GetFieldDefs, true);
  RegisterProperty(TFieldDefList,
       'property FieldDefs[Index: Integer]:TFieldDef read TFieldDefList__GetFieldDefs;default;');
  RegisterMethod(TFieldDefList,
       'constructor Create(ADataSet: TDataSet);',
       @TFieldDefList.Create);
  // End of class TFieldDefList
  // Begin of class TFieldList
  RegisterClassType(TFieldList, H);
  RegisterMethod(TFieldList,
       'function FieldByName(const Name: string): TField;',
       @TFieldList.FieldByName);
  RegisterMethod(TFieldList,
       'function Find(const Name: string): TField; reintroduce;',
       @TFieldList.Find);
  RegisterMethod(TFieldList,
       'function TFieldList__GetFields(Self:TFieldList;Index: Integer):TField;',
       @TFieldList__GetFields, true);
  RegisterProperty(TFieldList,
       'property Fields[Index: Integer]:TField read TFieldList__GetFields;default;');
  RegisterMethod(TFieldList,
       'constructor Create(ADataSet: TDataSet);',
       @TFieldList.Create);
  // End of class TFieldList
  // Begin of class TFieldsEnumerator
  RegisterClassType(TFieldsEnumerator, H);
  RegisterMethod(TFieldsEnumerator,
       'constructor Create(AFields: TFields);',
       @TFieldsEnumerator.Create);
  RegisterMethod(TFieldsEnumerator,
       'function GetCurrent: TField;',
       @TFieldsEnumerator.GetCurrent);
  RegisterStdMethodEx(TFieldsEnumerator,'MoveNext',TFieldsEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TFieldsEnumerator,
       'function TFieldsEnumerator__GetCurrent(Self:TFieldsEnumerator):TField;',
       @TFieldsEnumerator__GetCurrent, true);
  RegisterProperty(TFieldsEnumerator,
       'property Current:TField read TFieldsEnumerator__GetCurrent;');
  // End of class TFieldsEnumerator
  RegisterRTTIType(TypeInfo(TFieldKind));
  RegisterRTTIType(TypeInfo(TFieldKinds));
  // Begin of class TFields
  RegisterClassType(TFields, H);
  RegisterMethod(TFields,
       'constructor Create(ADataSet: TDataSet);',
       @TFields.Create);
  RegisterMethod(TFields,
       'destructor Destroy; override;',
       @TFields.Destroy);
  RegisterMethod(TFields,
       'procedure Add(Field: TField);',
       @TFields.Add);
  RegisterMethod(TFields,
       'procedure CheckFieldName(const FieldName: string);',
       @TFields.CheckFieldName);
  RegisterMethod(TFields,
       'procedure CheckFieldNames(const FieldNames: string);',
       @TFields.CheckFieldNames);
  RegisterStdMethodEx(TFields,'Clear',TFields_Clear,0,[typeVARIANT]);
  RegisterMethod(TFields,
       'function FindField(const FieldName: string): TField;',
       @TFields.FindField);
  RegisterMethod(TFields,
       'function FieldByName(const FieldName: string): TField;',
       @TFields.FieldByName);
  RegisterMethod(TFields,
       'function FieldByNumber(FieldNo: Integer): TField;',
       @TFields.FieldByNumber);
  RegisterMethod(TFields,
       'function GetEnumerator: TFieldsEnumerator;',
       @TFields.GetEnumerator);
  RegisterMethod(TFields,
       'procedure GetFieldNames(List: TStrings);',
       @TFields.GetFieldNames);
  RegisterMethod(TFields,
       'function IndexOf(Field: TField): Integer;',
       @TFields.IndexOf);
  RegisterMethod(TFields,
       'procedure Remove(Field: TField);',
       @TFields.Remove);
  RegisterMethod(TFields,
       'function TFields__GetCount(Self:TFields):Integer;',
       @TFields__GetCount, true);
  RegisterProperty(TFields,
       'property Count:Integer read TFields__GetCount;');
  RegisterMethod(TFields,
       'function TFields__GetDataSet(Self:TFields):TDataSet;',
       @TFields__GetDataSet, true);
  RegisterProperty(TFields,
       'property DataSet:TDataSet read TFields__GetDataSet;');
  RegisterMethod(TFields,
       'function TFields__GetFields(Self:TFields;Index: Integer):TField;',
       @TFields__GetFields, true);
  RegisterMethod(TFields,
       'procedure TFields__PutFields(Self:TFields;Index: Integer;const Value: TField);',
       @TFields__PutFields, true);
  RegisterProperty(TFields,
       'property Fields[Index: Integer]:TField read TFields__GetFields write TFields__PutFields;default;');
  // End of class TFields
  RegisterRTTIType(TypeInfo(TProviderFlag));
  RegisterRTTIType(TypeInfo(TProviderFlags));
  RegisterRTTIType(TypeInfo(TFieldChars));
  RegisterRTTIType(TypeInfo(TAutoRefreshFlag));
  // Begin of class TLookupList
  RegisterClassType(TLookupList, H);
  RegisterMethod(TLookupList,
       'constructor Create;',
       @TLookupList.Create);
  RegisterMethod(TLookupList,
       'destructor Destroy; override;',
       @TLookupList.Destroy);
  RegisterMethod(TLookupList,
       'procedure Add(const AKey, AValue: Variant);',
       @TLookupList.Add);
  RegisterStdMethodEx(TLookupList,'Clear',TLookupList_Clear,0,[typeVARIANT]);
  RegisterMethod(TLookupList,
       'function ValueOfKey(const AKey: Variant): Variant;',
       @TLookupList.ValueOfKey);
  // End of class TLookupList
  // Begin of class TField
  RegisterClassType(TField, H);
  RegisterMethod(TField,
       'constructor Create(AOwner: TComponent); override;',
       @TField.Create);
  RegisterMethod(TField,
       'destructor Destroy; override;',
       @TField.Destroy);
  RegisterMethod(TField,
       'procedure Assign(Source: TPersistent); override;',
       @TField.Assign);
  RegisterMethod(TField,
       'procedure AssignValue(const Value: TVarRec);',
       @TField.AssignValue);
  RegisterStdMethodEx(TField,'Clear',TField_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TField,'FocusControl',TField_FocusControl,0,[typeVARIANT]);
  RegisterMethod(TField,
       'function GetData(Buffer: Pointer; NativeFormat: Boolean = True): Boolean;',
       @TField.GetData);
  RegisterMethod(TField,
       'function GetParentComponent: TComponent; override;',
       @TField.GetParentComponent);
  RegisterStdMethodEx(TField,'HasParent',TField_HasParent,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TField,'IsBlob',TField_IsBlob,0,[typeBOOLEAN]);
  RegisterMethod(TField,
       'function IsValidChar(InputChar: Char): Boolean; virtual;',
       @TField.IsValidChar);
  RegisterStdMethodEx(TField,'RefreshLookupList',TField_RefreshLookupList,0,[typeVARIANT]);
  RegisterMethod(TField,
       'procedure SetData(Buffer: Pointer; NativeFormat: Boolean = True);',
       @TField.SetData);
  RegisterMethod(TField,
       'procedure SetFieldType(Value: TFieldType); virtual;',
       @TField.SetFieldType);
  RegisterMethod(TField,
       'procedure SetParentComponent(AParent: TComponent); override;',
       @TField.SetParentComponent);
  RegisterMethod(TField,
       'procedure Validate(Buffer: Pointer);',
       @TField.Validate);
  RegisterMethod(TField,
       'function TField__GetAsBCD(Self:TField):TBcd;',
       @TField__GetAsBCD, true);
  RegisterMethod(TField,
       'procedure TField__PutAsBCD(Self:TField;const Value: TBcd);',
       @TField__PutAsBCD, true);
  RegisterProperty(TField,
       'property AsBCD:TBcd read TField__GetAsBCD write TField__PutAsBCD;');
  RegisterMethod(TField,
       'function TField__GetAsBoolean(Self:TField):Boolean;',
       @TField__GetAsBoolean, true);
  RegisterMethod(TField,
       'procedure TField__PutAsBoolean(Self:TField;const Value: Boolean);',
       @TField__PutAsBoolean, true);
  RegisterProperty(TField,
       'property AsBoolean:Boolean read TField__GetAsBoolean write TField__PutAsBoolean;');
  RegisterMethod(TField,
       'function TField__GetAsCurrency(Self:TField):Currency;',
       @TField__GetAsCurrency, true);
  RegisterMethod(TField,
       'procedure TField__PutAsCurrency(Self:TField;const Value: Currency);',
       @TField__PutAsCurrency, true);
  RegisterProperty(TField,
       'property AsCurrency:Currency read TField__GetAsCurrency write TField__PutAsCurrency;');
  RegisterMethod(TField,
       'function TField__GetAsDateTime(Self:TField):TDateTime;',
       @TField__GetAsDateTime, true);
  RegisterMethod(TField,
       'procedure TField__PutAsDateTime(Self:TField;const Value: TDateTime);',
       @TField__PutAsDateTime, true);
  RegisterProperty(TField,
       'property AsDateTime:TDateTime read TField__GetAsDateTime write TField__PutAsDateTime;');
  RegisterMethod(TField,
       'function TField__GetAsSQLTimeStamp(Self:TField):TSQLTimeStamp;',
       @TField__GetAsSQLTimeStamp, true);
  RegisterMethod(TField,
       'procedure TField__PutAsSQLTimeStamp(Self:TField;const Value: TSQLTimeStamp);',
       @TField__PutAsSQLTimeStamp, true);
  RegisterProperty(TField,
       'property AsSQLTimeStamp:TSQLTimeStamp read TField__GetAsSQLTimeStamp write TField__PutAsSQLTimeStamp;');
  RegisterMethod(TField,
       'function TField__GetAsFloat(Self:TField):Double;',
       @TField__GetAsFloat, true);
  RegisterMethod(TField,
       'procedure TField__PutAsFloat(Self:TField;const Value: Double);',
       @TField__PutAsFloat, true);
  RegisterProperty(TField,
       'property AsFloat:Double read TField__GetAsFloat write TField__PutAsFloat;');
  RegisterMethod(TField,
       'function TField__GetAsInteger(Self:TField):Longint;',
       @TField__GetAsInteger, true);
  RegisterMethod(TField,
       'procedure TField__PutAsInteger(Self:TField;const Value: Longint);',
       @TField__PutAsInteger, true);
  RegisterProperty(TField,
       'property AsInteger:Longint read TField__GetAsInteger write TField__PutAsInteger;');
  RegisterMethod(TField,
       'function TField__GetAsString(Self:TField):String;',
       @TField__GetAsString, true);
  RegisterMethod(TField,
       'procedure TField__PutAsString(Self:TField;const Value: String);',
       @TField__PutAsString, true);
  RegisterProperty(TField,
       'property AsString:String read TField__GetAsString write TField__PutAsString;');
  RegisterMethod(TField,
       'function TField__GetAsVariant(Self:TField):Variant;',
       @TField__GetAsVariant, true);
  RegisterMethod(TField,
       'procedure TField__PutAsVariant(Self:TField;const Value: Variant);',
       @TField__PutAsVariant, true);
  RegisterProperty(TField,
       'property AsVariant:Variant read TField__GetAsVariant write TField__PutAsVariant;');
  RegisterMethod(TField,
       'function TField__GetAttributeSet(Self:TField):String;',
       @TField__GetAttributeSet, true);
  RegisterMethod(TField,
       'procedure TField__PutAttributeSet(Self:TField;const Value: String);',
       @TField__PutAttributeSet, true);
  RegisterProperty(TField,
       'property AttributeSet:String read TField__GetAttributeSet write TField__PutAttributeSet;');
  RegisterMethod(TField,
       'function TField__GetCalculated(Self:TField):Boolean;',
       @TField__GetCalculated, true);
  RegisterMethod(TField,
       'procedure TField__PutCalculated(Self:TField;const Value: Boolean);',
       @TField__PutCalculated, true);
  RegisterProperty(TField,
       'property Calculated:Boolean read TField__GetCalculated write TField__PutCalculated;');
  RegisterMethod(TField,
       'function TField__GetCanModify(Self:TField):Boolean;',
       @TField__GetCanModify, true);
  RegisterProperty(TField,
       'property CanModify:Boolean read TField__GetCanModify;');
  RegisterMethod(TField,
       'function TField__GetCurValue(Self:TField):Variant;',
       @TField__GetCurValue, true);
  RegisterProperty(TField,
       'property CurValue:Variant read TField__GetCurValue;');
  RegisterMethod(TField,
       'function TField__GetDataSet(Self:TField):TDataSet;',
       @TField__GetDataSet, true);
  RegisterMethod(TField,
       'procedure TField__PutDataSet(Self:TField;const Value: TDataSet);',
       @TField__PutDataSet, true);
  RegisterProperty(TField,
       'property DataSet:TDataSet read TField__GetDataSet write TField__PutDataSet;');
  RegisterMethod(TField,
       'function TField__GetDataSize(Self:TField):Integer;',
       @TField__GetDataSize, true);
  RegisterProperty(TField,
       'property DataSize:Integer read TField__GetDataSize;');
  RegisterMethod(TField,
       'function TField__GetDataType(Self:TField):TFieldType;',
       @TField__GetDataType, true);
  RegisterProperty(TField,
       'property DataType:TFieldType read TField__GetDataType;');
  RegisterMethod(TField,
       'function TField__GetDisplayName(Self:TField):String;',
       @TField__GetDisplayName, true);
  RegisterProperty(TField,
       'property DisplayName:String read TField__GetDisplayName;');
  RegisterMethod(TField,
       'function TField__GetDisplayText(Self:TField):String;',
       @TField__GetDisplayText, true);
  RegisterProperty(TField,
       'property DisplayText:String read TField__GetDisplayText;');
  RegisterMethod(TField,
       'function TField__GetEditMask(Self:TField):TEditMask;',
       @TField__GetEditMask, true);
  RegisterMethod(TField,
       'procedure TField__PutEditMask(Self:TField;const Value: TEditMask);',
       @TField__PutEditMask, true);
  RegisterProperty(TField,
       'property EditMask:TEditMask read TField__GetEditMask write TField__PutEditMask;');
  RegisterMethod(TField,
       'function TField__GetEditMaskPtr(Self:TField):TEditMask;',
       @TField__GetEditMaskPtr, true);
  RegisterProperty(TField,
       'property EditMaskPtr:TEditMask read TField__GetEditMaskPtr;');
  RegisterMethod(TField,
       'function TField__GetFieldNo(Self:TField):Integer;',
       @TField__GetFieldNo, true);
  RegisterProperty(TField,
       'property FieldNo:Integer read TField__GetFieldNo;');
  RegisterMethod(TField,
       'function TField__GetFullName(Self:TField):String;',
       @TField__GetFullName, true);
  RegisterProperty(TField,
       'property FullName:String read TField__GetFullName;');
  RegisterMethod(TField,
       'function TField__GetIsIndexField(Self:TField):Boolean;',
       @TField__GetIsIndexField, true);
  RegisterProperty(TField,
       'property IsIndexField:Boolean read TField__GetIsIndexField;');
  RegisterMethod(TField,
       'function TField__GetIsNull(Self:TField):Boolean;',
       @TField__GetIsNull, true);
  RegisterProperty(TField,
       'property IsNull:Boolean read TField__GetIsNull;');
  RegisterMethod(TField,
       'function TField__GetLookup(Self:TField):Boolean;',
       @TField__GetLookup, true);
  RegisterMethod(TField,
       'procedure TField__PutLookup(Self:TField;const Value: Boolean);',
       @TField__PutLookup, true);
  RegisterProperty(TField,
       'property Lookup:Boolean read TField__GetLookup write TField__PutLookup;');
  RegisterMethod(TField,
       'function TField__GetLookupList(Self:TField):TLookupList;',
       @TField__GetLookupList, true);
  RegisterProperty(TField,
       'property LookupList:TLookupList read TField__GetLookupList;');
  RegisterMethod(TField,
       'function TField__GetNewValue(Self:TField):Variant;',
       @TField__GetNewValue, true);
  RegisterMethod(TField,
       'procedure TField__PutNewValue(Self:TField;const Value: Variant);',
       @TField__PutNewValue, true);
  RegisterProperty(TField,
       'property NewValue:Variant read TField__GetNewValue write TField__PutNewValue;');
  RegisterMethod(TField,
       'function TField__GetOffset(Self:TField):Integer;',
       @TField__GetOffset, true);
  RegisterProperty(TField,
       'property Offset:Integer read TField__GetOffset;');
  RegisterMethod(TField,
       'function TField__GetOldValue(Self:TField):Variant;',
       @TField__GetOldValue, true);
  RegisterProperty(TField,
       'property OldValue:Variant read TField__GetOldValue;');
  RegisterMethod(TField,
       'function TField__GetParentField(Self:TField):TObjectField;',
       @TField__GetParentField, true);
  RegisterMethod(TField,
       'procedure TField__PutParentField(Self:TField;const Value: TObjectField);',
       @TField__PutParentField, true);
  RegisterProperty(TField,
       'property ParentField:TObjectField read TField__GetParentField write TField__PutParentField;');
  RegisterMethod(TField,
       'function TField__GetSize(Self:TField):Integer;',
       @TField__GetSize, true);
  RegisterMethod(TField,
       'procedure TField__PutSize(Self:TField;const Value: Integer);',
       @TField__PutSize, true);
  RegisterProperty(TField,
       'property Size:Integer read TField__GetSize write TField__PutSize;');
  RegisterMethod(TField,
       'function TField__GetText(Self:TField):String;',
       @TField__GetText, true);
  RegisterMethod(TField,
       'procedure TField__PutText(Self:TField;const Value: String);',
       @TField__PutText, true);
  RegisterProperty(TField,
       'property Text:String read TField__GetText write TField__PutText;');
  RegisterMethod(TField,
       'function TField__GetValidChars(Self:TField):TFieldChars;',
       @TField__GetValidChars, true);
  RegisterMethod(TField,
       'procedure TField__PutValidChars(Self:TField;const Value: TFieldChars);',
       @TField__PutValidChars, true);
  RegisterProperty(TField,
       'property ValidChars:TFieldChars read TField__GetValidChars write TField__PutValidChars;');
  RegisterMethod(TField,
       'function TField__GetValue(Self:TField):Variant;',
       @TField__GetValue, true);
  RegisterMethod(TField,
       'procedure TField__PutValue(Self:TField;const Value: Variant);',
       @TField__PutValue, true);
  RegisterProperty(TField,
       'property Value:Variant read TField__GetValue write TField__PutValue;');
  // End of class TField
  // Begin of class TStringField
  RegisterClassType(TStringField, H);
  RegisterMethod(TStringField,
       'constructor Create(AOwner: TComponent); override;',
       @TStringField.Create);
  RegisterMethod(TStringField,
       'function TStringField__GetValue(Self:TStringField):String;',
       @TStringField__GetValue, true);
  RegisterMethod(TStringField,
       'procedure TStringField__PutValue(Self:TStringField;const Value: String);',
       @TStringField__PutValue, true);
  RegisterProperty(TStringField,
       'property Value:String read TStringField__GetValue write TStringField__PutValue;');
  // End of class TStringField
  // Begin of class TWideStringField
  RegisterClassType(TWideStringField, H);
  RegisterMethod(TWideStringField,
       'constructor Create(AOwner: TComponent); override;',
       @TWideStringField.Create);
  RegisterMethod(TWideStringField,
       'function TWideStringField__GetValue(Self:TWideStringField):WideString;',
       @TWideStringField__GetValue, true);
  RegisterMethod(TWideStringField,
       'procedure TWideStringField__PutValue(Self:TWideStringField;const Value: WideString);',
       @TWideStringField__PutValue, true);
  RegisterProperty(TWideStringField,
       'property Value:WideString read TWideStringField__GetValue write TWideStringField__PutValue;');
  // End of class TWideStringField
  // Begin of class TNumericField
  RegisterClassType(TNumericField, H);
  RegisterMethod(TNumericField,
       'constructor Create(AOwner: TComponent); override;',
       @TNumericField.Create);
  // End of class TNumericField
  // Begin of class TIntegerField
  RegisterClassType(TIntegerField, H);
  RegisterMethod(TIntegerField,
       'constructor Create(AOwner: TComponent); override;',
       @TIntegerField.Create);
  RegisterMethod(TIntegerField,
       'function TIntegerField__GetValue(Self:TIntegerField):Longint;',
       @TIntegerField__GetValue, true);
  RegisterMethod(TIntegerField,
       'procedure TIntegerField__PutValue(Self:TIntegerField;const Value: Longint);',
       @TIntegerField__PutValue, true);
  RegisterProperty(TIntegerField,
       'property Value:Longint read TIntegerField__GetValue write TIntegerField__PutValue;');
  // End of class TIntegerField
  // Begin of class TSmallintField
  RegisterClassType(TSmallintField, H);
  RegisterMethod(TSmallintField,
       'constructor Create(AOwner: TComponent); override;',
       @TSmallintField.Create);
  // End of class TSmallintField
  RegisterTypeAlias('Largeint','Int64');
  // Begin of class TLargeintField
  RegisterClassType(TLargeintField, H);
  RegisterMethod(TLargeintField,
       'constructor Create(AOwner: TComponent); override;',
       @TLargeintField.Create);
  RegisterMethod(TLargeintField,
       'function TLargeintField__GetAsLargeInt(Self:TLargeintField):LargeInt;',
       @TLargeintField__GetAsLargeInt, true);
  RegisterMethod(TLargeintField,
       'procedure TLargeintField__PutAsLargeInt(Self:TLargeintField;const Value: LargeInt);',
       @TLargeintField__PutAsLargeInt, true);
  RegisterProperty(TLargeintField,
       'property AsLargeInt:LargeInt read TLargeintField__GetAsLargeInt write TLargeintField__PutAsLargeInt;');
  RegisterMethod(TLargeintField,
       'function TLargeintField__GetValue(Self:TLargeintField):Largeint;',
       @TLargeintField__GetValue, true);
  RegisterMethod(TLargeintField,
       'procedure TLargeintField__PutValue(Self:TLargeintField;const Value: Largeint);',
       @TLargeintField__PutValue, true);
  RegisterProperty(TLargeintField,
       'property Value:Largeint read TLargeintField__GetValue write TLargeintField__PutValue;');
  // End of class TLargeintField
  // Begin of class TWordField
  RegisterClassType(TWordField, H);
  RegisterMethod(TWordField,
       'constructor Create(AOwner: TComponent); override;',
       @TWordField.Create);
  // End of class TWordField
  // Begin of class TAutoIncField
  RegisterClassType(TAutoIncField, H);
  RegisterMethod(TAutoIncField,
       'constructor Create(AOwner: TComponent); override;',
       @TAutoIncField.Create);
  // End of class TAutoIncField
  // Begin of class TFloatField
  RegisterClassType(TFloatField, H);
  RegisterMethod(TFloatField,
       'constructor Create(AOwner: TComponent); override;',
       @TFloatField.Create);
  RegisterMethod(TFloatField,
       'function TFloatField__GetValue(Self:TFloatField):Double;',
       @TFloatField__GetValue, true);
  RegisterMethod(TFloatField,
       'procedure TFloatField__PutValue(Self:TFloatField;const Value: Double);',
       @TFloatField__PutValue, true);
  RegisterProperty(TFloatField,
       'property Value:Double read TFloatField__GetValue write TFloatField__PutValue;');
  // End of class TFloatField
  // Begin of class TCurrencyField
  RegisterClassType(TCurrencyField, H);
  RegisterMethod(TCurrencyField,
       'constructor Create(AOwner: TComponent); override;',
       @TCurrencyField.Create);
  // End of class TCurrencyField
  // Begin of class TBooleanField
  RegisterClassType(TBooleanField, H);
  RegisterMethod(TBooleanField,
       'constructor Create(AOwner: TComponent); override;',
       @TBooleanField.Create);
  RegisterMethod(TBooleanField,
       'function TBooleanField__GetValue(Self:TBooleanField):Boolean;',
       @TBooleanField__GetValue, true);
  RegisterMethod(TBooleanField,
       'procedure TBooleanField__PutValue(Self:TBooleanField;const Value: Boolean);',
       @TBooleanField__PutValue, true);
  RegisterProperty(TBooleanField,
       'property Value:Boolean read TBooleanField__GetValue write TBooleanField__PutValue;');
  // End of class TBooleanField
  // Begin of class TDateTimeField
  RegisterClassType(TDateTimeField, H);
  RegisterMethod(TDateTimeField,
       'constructor Create(AOwner: TComponent); override;',
       @TDateTimeField.Create);
  RegisterMethod(TDateTimeField,
       'function TDateTimeField__GetValue(Self:TDateTimeField):TDateTime;',
       @TDateTimeField__GetValue, true);
  RegisterMethod(TDateTimeField,
       'procedure TDateTimeField__PutValue(Self:TDateTimeField;const Value: TDateTime);',
       @TDateTimeField__PutValue, true);
  RegisterProperty(TDateTimeField,
       'property Value:TDateTime read TDateTimeField__GetValue write TDateTimeField__PutValue;');
  // End of class TDateTimeField
  // Begin of class TSQLTimeStampField
  RegisterClassType(TSQLTimeStampField, H);
  RegisterMethod(TSQLTimeStampField,
       'constructor Create(AOwner: TComponent); override;',
       @TSQLTimeStampField.Create);
  RegisterMethod(TSQLTimeStampField,
       'function TSQLTimeStampField__GetValue(Self:TSQLTimeStampField):TSQLTimeStamp;',
       @TSQLTimeStampField__GetValue, true);
  RegisterMethod(TSQLTimeStampField,
       'procedure TSQLTimeStampField__PutValue(Self:TSQLTimeStampField;const Value: TSQLTimeStamp);',
       @TSQLTimeStampField__PutValue, true);
  RegisterProperty(TSQLTimeStampField,
       'property Value:TSQLTimeStamp read TSQLTimeStampField__GetValue write TSQLTimeStampField__PutValue;');
  // End of class TSQLTimeStampField
  // Begin of class TDateField
  RegisterClassType(TDateField, H);
  RegisterMethod(TDateField,
       'constructor Create(AOwner: TComponent); override;',
       @TDateField.Create);
  // End of class TDateField
  // Begin of class TTimeField
  RegisterClassType(TTimeField, H);
  RegisterMethod(TTimeField,
       'constructor Create(AOwner: TComponent); override;',
       @TTimeField.Create);
  // End of class TTimeField
  // Begin of class TBinaryField
  RegisterClassType(TBinaryField, H);
  RegisterMethod(TBinaryField,
       'constructor Create(AOwner: TComponent); override;',
       @TBinaryField.Create);
  // End of class TBinaryField
  // Begin of class TBytesField
  RegisterClassType(TBytesField, H);
  RegisterMethod(TBytesField,
       'constructor Create(AOwner: TComponent); override;',
       @TBytesField.Create);
  // End of class TBytesField
  // Begin of class TVarBytesField
  RegisterClassType(TVarBytesField, H);
  RegisterMethod(TVarBytesField,
       'constructor Create(AOwner: TComponent); override;',
       @TVarBytesField.Create);
  // End of class TVarBytesField
  // Begin of class TBCDField
  RegisterClassType(TBCDField, H);
  RegisterMethod(TBCDField,
       'constructor Create(AOwner: TComponent); override;',
       @TBCDField.Create);
  RegisterMethod(TBCDField,
       'function TBCDField__GetValue(Self:TBCDField):Currency;',
       @TBCDField__GetValue, true);
  RegisterMethod(TBCDField,
       'procedure TBCDField__PutValue(Self:TBCDField;const Value: Currency);',
       @TBCDField__PutValue, true);
  RegisterProperty(TBCDField,
       'property Value:Currency read TBCDField__GetValue write TBCDField__PutValue;');
  // End of class TBCDField
  // Begin of class TFMTBCDField
  RegisterClassType(TFMTBCDField, H);
  RegisterMethod(TFMTBCDField,
       'constructor Create(AOwner: TComponent); override;',
       @TFMTBCDField.Create);
  RegisterMethod(TFMTBCDField,
       'function TFMTBCDField__GetValue(Self:TFMTBCDField):TBcd;',
       @TFMTBCDField__GetValue, true);
  RegisterMethod(TFMTBCDField,
       'procedure TFMTBCDField__PutValue(Self:TFMTBCDField;const Value: TBcd);',
       @TFMTBCDField__PutValue, true);
  RegisterProperty(TFMTBCDField,
       'property Value:TBcd read TFMTBCDField__GetValue write TFMTBCDField__PutValue;');
  // End of class TFMTBCDField
  RegisterRTTIType(TypeInfo(TBlobType));
  // Begin of class TBlobField
  RegisterClassType(TBlobField, H);
  RegisterMethod(TBlobField,
       'constructor Create(AOwner: TComponent); override;',
       @TBlobField.Create);
  RegisterMethod(TBlobField,
       'procedure Assign(Source: TPersistent); override;',
       @TBlobField.Assign);
  RegisterStdMethodEx(TBlobField,'Clear',TBlobField_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TBlobField,'IsBlob',TBlobField_IsBlob,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TBlobField,'LoadFromFile',TBlobField_LoadFromFile,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TBlobField,
       'procedure LoadFromStream(Stream: TStream);',
       @TBlobField.LoadFromStream);
  RegisterStdMethodEx(TBlobField,'SaveToFile',TBlobField_SaveToFile,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TBlobField,
       'procedure SaveToStream(Stream: TStream);',
       @TBlobField.SaveToStream);
  RegisterMethod(TBlobField,
       'procedure SetFieldType(Value: TFieldType); override;',
       @TBlobField.SetFieldType);
  RegisterMethod(TBlobField,
       'function TBlobField__GetBlobSize(Self:TBlobField):Integer;',
       @TBlobField__GetBlobSize, true);
  RegisterProperty(TBlobField,
       'property BlobSize:Integer read TBlobField__GetBlobSize;');
  RegisterMethod(TBlobField,
       'function TBlobField__GetModified(Self:TBlobField):Boolean;',
       @TBlobField__GetModified, true);
  RegisterMethod(TBlobField,
       'procedure TBlobField__PutModified(Self:TBlobField;const Value: Boolean);',
       @TBlobField__PutModified, true);
  RegisterProperty(TBlobField,
       'property Modified:Boolean read TBlobField__GetModified write TBlobField__PutModified;');
  RegisterMethod(TBlobField,
       'function TBlobField__GetValue(Self:TBlobField):String;',
       @TBlobField__GetValue, true);
  RegisterMethod(TBlobField,
       'procedure TBlobField__PutValue(Self:TBlobField;const Value: String);',
       @TBlobField__PutValue, true);
  RegisterProperty(TBlobField,
       'property Value:String read TBlobField__GetValue write TBlobField__PutValue;');
  RegisterMethod(TBlobField,
       'function TBlobField__GetTransliterate(Self:TBlobField):Boolean;',
       @TBlobField__GetTransliterate, true);
  RegisterMethod(TBlobField,
       'procedure TBlobField__PutTransliterate(Self:TBlobField;const Value: Boolean);',
       @TBlobField__PutTransliterate, true);
  RegisterProperty(TBlobField,
       'property Transliterate:Boolean read TBlobField__GetTransliterate write TBlobField__PutTransliterate;');
  // End of class TBlobField
  // Begin of class TMemoField
  RegisterClassType(TMemoField, H);
  RegisterMethod(TMemoField,
       'constructor Create(AOwner: TComponent); override;',
       @TMemoField.Create);
  // End of class TMemoField
  // Begin of class TGraphicField
  RegisterClassType(TGraphicField, H);
  RegisterMethod(TGraphicField,
       'constructor Create(AOwner: TComponent); override;',
       @TGraphicField.Create);
  // End of class TGraphicField
  // Begin of class TObjectField
  RegisterClassType(TObjectField, H);
  RegisterMethod(TObjectField,
       'constructor Create(AOwner: TComponent); override;',
       @TObjectField.Create);
  RegisterMethod(TObjectField,
       'destructor Destroy; override;',
       @TObjectField.Destroy);
  RegisterMethod(TObjectField,
       'procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;',
       @TObjectField.GetChildren);
  RegisterMethod(TObjectField,
       'function TObjectField__GetFieldCount(Self:TObjectField):Integer;',
       @TObjectField__GetFieldCount, true);
  RegisterProperty(TObjectField,
       'property FieldCount:Integer read TObjectField__GetFieldCount;');
  RegisterMethod(TObjectField,
       'function TObjectField__GetFields(Self:TObjectField):TFields;',
       @TObjectField__GetFields, true);
  RegisterProperty(TObjectField,
       'property Fields:TFields read TObjectField__GetFields;');
  RegisterMethod(TObjectField,
       'function TObjectField__GetFieldValues(Self:TObjectField;Index: Integer):Variant;',
       @TObjectField__GetFieldValues, true);
  RegisterMethod(TObjectField,
       'procedure TObjectField__PutFieldValues(Self:TObjectField;Index: Integer;const Value: Variant);',
       @TObjectField__PutFieldValues, true);
  RegisterProperty(TObjectField,
       'property FieldValues[Index: Integer]:Variant read TObjectField__GetFieldValues write TObjectField__PutFieldValues;default;');
  RegisterMethod(TObjectField,
       'function TObjectField__GetUnNamed(Self:TObjectField):Boolean;',
       @TObjectField__GetUnNamed, true);
  RegisterProperty(TObjectField,
       'property UnNamed:Boolean read TObjectField__GetUnNamed;');
  // End of class TObjectField
  // Begin of class TADTField
  RegisterClassType(TADTField, H);
  RegisterMethod(TADTField,
       'constructor Create(AOwner: TComponent); override;',
       @TADTField.Create);
  // End of class TADTField
  // Begin of class TArrayField
  RegisterClassType(TArrayField, H);
  RegisterMethod(TArrayField,
       'constructor Create(AOwner: TComponent); override;',
       @TArrayField.Create);
  // End of class TArrayField
  // Begin of class TDataSetField
  RegisterClassType(TDataSetField, H);
  RegisterMethod(TDataSetField,
       'constructor Create(AOwner: TComponent); override;',
       @TDataSetField.Create);
  RegisterMethod(TDataSetField,
       'destructor Destroy; override;',
       @TDataSetField.Destroy);
  RegisterMethod(TDataSetField,
       'procedure Assign(Source: TPersistent); override;',
       @TDataSetField.Assign);
  RegisterMethod(TDataSetField,
       'function TDataSetField__GetNestedDataSet(Self:TDataSetField):TDataSet;',
       @TDataSetField__GetNestedDataSet, true);
  RegisterProperty(TDataSetField,
       'property NestedDataSet:TDataSet read TDataSetField__GetNestedDataSet;');
  // End of class TDataSetField
  // Begin of class TReferenceField
  RegisterClassType(TReferenceField, H);
  RegisterMethod(TReferenceField,
       'constructor Create(AOwner: TComponent); override;',
       @TReferenceField.Create);
  RegisterMethod(TReferenceField,
       'procedure Assign(Source: TPersistent); override;',
       @TReferenceField.Assign);
  // End of class TReferenceField
  // Begin of class TVariantField
  RegisterClassType(TVariantField, H);
  RegisterMethod(TVariantField,
       'constructor Create(AOwner: TComponent); override;',
       @TVariantField.Create);
  // End of class TVariantField
  // Begin of class TInterfaceField
  RegisterClassType(TInterfaceField, H);
  RegisterMethod(TInterfaceField,
       'constructor Create(AOwner: TComponent); override;',
       @TInterfaceField.Create);
  RegisterMethod(TInterfaceField,
       'function TInterfaceField__GetValue(Self:TInterfaceField):IUnknown;',
       @TInterfaceField__GetValue, true);
  RegisterMethod(TInterfaceField,
       'procedure TInterfaceField__PutValue(Self:TInterfaceField;const Value: IUnknown);',
       @TInterfaceField__PutValue, true);
  RegisterProperty(TInterfaceField,
       'property Value:IUnknown read TInterfaceField__GetValue write TInterfaceField__PutValue;');
  // End of class TInterfaceField
  // Begin of class TIDispatchField
  RegisterClassType(TIDispatchField, H);
  RegisterMethod(TIDispatchField,
       'constructor Create(AOwner: TComponent); override;',
       @TIDispatchField.Create);
  RegisterMethod(TIDispatchField,
       'function TIDispatchField__GetValue(Self:TIDispatchField):IDispatch;',
       @TIDispatchField__GetValue, true);
  RegisterMethod(TIDispatchField,
       'procedure TIDispatchField__PutValue(Self:TIDispatchField;const Value: IDispatch);',
       @TIDispatchField__PutValue, true);
  RegisterProperty(TIDispatchField,
       'property Value:IDispatch read TIDispatchField__GetValue write TIDispatchField__PutValue;');
  // End of class TIDispatchField
  // Begin of class TGuidField
  RegisterClassType(TGuidField, H);
  RegisterMethod(TGuidField,
       'constructor Create(AOwner: TComponent); override;',
       @TGuidField.Create);
  RegisterMethod(TGuidField,
       'function TGuidField__GetAsGuid(Self:TGuidField):TGUID;',
       @TGuidField__GetAsGuid, true);
  RegisterMethod(TGuidField,
       'procedure TGuidField__PutAsGuid(Self:TGuidField;const Value: TGUID);',
       @TGuidField__PutAsGuid, true);
  RegisterProperty(TGuidField,
       'property AsGuid:TGUID read TGuidField__GetAsGuid write TGuidField__PutAsGuid;');
  // End of class TGuidField
  // Begin of class TAggregateField
  RegisterClassType(TAggregateField, H);
  RegisterMethod(TAggregateField,
       'constructor Create(AOwner: TComponent); override;',
       @TAggregateField.Create);
  RegisterMethod(TAggregateField,
       'function TAggregateField__GetHandle(Self:TAggregateField):Pointer;',
       @TAggregateField__GetHandle, true);
  RegisterMethod(TAggregateField,
       'procedure TAggregateField__PutHandle(Self:TAggregateField;const Value: Pointer);',
       @TAggregateField__PutHandle, true);
  RegisterProperty(TAggregateField,
       'property Handle:Pointer read TAggregateField__GetHandle write TAggregateField__PutHandle;');
  RegisterMethod(TAggregateField,
       'function TAggregateField__GetResultType(Self:TAggregateField):TFieldType;',
       @TAggregateField__GetResultType, true);
  RegisterMethod(TAggregateField,
       'procedure TAggregateField__PutResultType(Self:TAggregateField;const Value: TFieldType);',
       @TAggregateField__PutResultType, true);
  RegisterProperty(TAggregateField,
       'property ResultType:TFieldType read TAggregateField__GetResultType write TAggregateField__PutResultType;');
  // End of class TAggregateField
  // Begin of class TDataLink
  RegisterClassType(TDataLink, H);
  RegisterMethod(TDataLink,
       'constructor Create;',
       @TDataLink.Create);
  RegisterMethod(TDataLink,
       'destructor Destroy; override;',
       @TDataLink.Destroy);
  RegisterStdMethodEx(TDataLink,'Edit',TDataLink_Edit,0,[typeBOOLEAN]);
  RegisterMethod(TDataLink,
       'function ExecuteAction(Action: TBasicAction): Boolean; dynamic;',
       @TDataLink.ExecuteAction);
  RegisterMethod(TDataLink,
       'function UpdateAction(Action: TBasicAction): Boolean; dynamic;',
       @TDataLink.UpdateAction);
  RegisterStdMethodEx(TDataLink,'UpdateRecord',TDataLink_UpdateRecord,0,[typeVARIANT]);
  RegisterMethod(TDataLink,
       'function TDataLink__GetActive(Self:TDataLink):Boolean;',
       @TDataLink__GetActive, true);
  RegisterProperty(TDataLink,
       'property Active:Boolean read TDataLink__GetActive;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetActiveRecord(Self:TDataLink):Integer;',
       @TDataLink__GetActiveRecord, true);
  RegisterMethod(TDataLink,
       'procedure TDataLink__PutActiveRecord(Self:TDataLink;const Value: Integer);',
       @TDataLink__PutActiveRecord, true);
  RegisterProperty(TDataLink,
       'property ActiveRecord:Integer read TDataLink__GetActiveRecord write TDataLink__PutActiveRecord;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetBOF(Self:TDataLink):Boolean;',
       @TDataLink__GetBOF, true);
  RegisterProperty(TDataLink,
       'property BOF:Boolean read TDataLink__GetBOF;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetBufferCount(Self:TDataLink):Integer;',
       @TDataLink__GetBufferCount, true);
  RegisterMethod(TDataLink,
       'procedure TDataLink__PutBufferCount(Self:TDataLink;const Value: Integer);',
       @TDataLink__PutBufferCount, true);
  RegisterProperty(TDataLink,
       'property BufferCount:Integer read TDataLink__GetBufferCount write TDataLink__PutBufferCount;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetDataSet(Self:TDataLink):TDataSet;',
       @TDataLink__GetDataSet, true);
  RegisterProperty(TDataLink,
       'property DataSet:TDataSet read TDataLink__GetDataSet;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetDataSource(Self:TDataLink):TDataSource;',
       @TDataLink__GetDataSource, true);
  RegisterMethod(TDataLink,
       'procedure TDataLink__PutDataSource(Self:TDataLink;const Value: TDataSource);',
       @TDataLink__PutDataSource, true);
  RegisterProperty(TDataLink,
       'property DataSource:TDataSource read TDataLink__GetDataSource write TDataLink__PutDataSource;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetDataSourceFixed(Self:TDataLink):Boolean;',
       @TDataLink__GetDataSourceFixed, true);
  RegisterMethod(TDataLink,
       'procedure TDataLink__PutDataSourceFixed(Self:TDataLink;const Value: Boolean);',
       @TDataLink__PutDataSourceFixed, true);
  RegisterProperty(TDataLink,
       'property DataSourceFixed:Boolean read TDataLink__GetDataSourceFixed write TDataLink__PutDataSourceFixed;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetEditing(Self:TDataLink):Boolean;',
       @TDataLink__GetEditing, true);
  RegisterProperty(TDataLink,
       'property Editing:Boolean read TDataLink__GetEditing;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetEof(Self:TDataLink):Boolean;',
       @TDataLink__GetEof, true);
  RegisterProperty(TDataLink,
       'property Eof:Boolean read TDataLink__GetEof;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetReadOnly(Self:TDataLink):Boolean;',
       @TDataLink__GetReadOnly, true);
  RegisterMethod(TDataLink,
       'procedure TDataLink__PutReadOnly(Self:TDataLink;const Value: Boolean);',
       @TDataLink__PutReadOnly, true);
  RegisterProperty(TDataLink,
       'property ReadOnly:Boolean read TDataLink__GetReadOnly write TDataLink__PutReadOnly;');
  RegisterMethod(TDataLink,
       'function TDataLink__GetRecordCount(Self:TDataLink):Integer;',
       @TDataLink__GetRecordCount, true);
  RegisterProperty(TDataLink,
       'property RecordCount:Integer read TDataLink__GetRecordCount;');
  // End of class TDataLink
  // Begin of class TDetailDataLink
  RegisterClassType(TDetailDataLink, H);
  RegisterMethod(TDetailDataLink,
       'function TDetailDataLink__GetDetailDataSet(Self:TDetailDataLink):TDataSet;',
       @TDetailDataLink__GetDetailDataSet, true);
  RegisterProperty(TDetailDataLink,
       'property DetailDataSet:TDataSet read TDetailDataLink__GetDetailDataSet;');
  RegisterMethod(TDetailDataLink,
       'constructor Create;',
       @TDetailDataLink.Create);
  // End of class TDetailDataLink
  // Begin of class TMasterDataLink
  RegisterClassType(TMasterDataLink, H);
  RegisterMethod(TMasterDataLink,
       'constructor Create(DataSet: TDataSet);',
       @TMasterDataLink.Create);
  RegisterMethod(TMasterDataLink,
       'destructor Destroy; override;',
       @TMasterDataLink.Destroy);
  RegisterMethod(TMasterDataLink,
       'function TMasterDataLink__GetFieldNames(Self:TMasterDataLink):String;',
       @TMasterDataLink__GetFieldNames, true);
  RegisterMethod(TMasterDataLink,
       'procedure TMasterDataLink__PutFieldNames(Self:TMasterDataLink;const Value: String);',
       @TMasterDataLink__PutFieldNames, true);
  RegisterProperty(TMasterDataLink,
       'property FieldNames:String read TMasterDataLink__GetFieldNames write TMasterDataLink__PutFieldNames;');
  RegisterMethod(TMasterDataLink,
       'function TMasterDataLink__GetFields(Self:TMasterDataLink):TList;',
       @TMasterDataLink__GetFields, true);
  RegisterProperty(TMasterDataLink,
       'property Fields:TList read TMasterDataLink__GetFields;');
  // End of class TMasterDataLink
  // Begin of class TDataSource
  RegisterClassType(TDataSource, H);
  RegisterMethod(TDataSource,
       'constructor Create(AOwner: TComponent); override;',
       @TDataSource.Create);
  RegisterMethod(TDataSource,
       'destructor Destroy; override;',
       @TDataSource.Destroy);
  RegisterStdMethodEx(TDataSource,'Edit',TDataSource_Edit,0,[typeVARIANT]);
  RegisterMethod(TDataSource,
       'function IsLinkedTo(DataSet: TDataSet): Boolean;',
       @TDataSource.IsLinkedTo);
  RegisterMethod(TDataSource,
       'function TDataSource__GetState(Self:TDataSource):TDataSetState;',
       @TDataSource__GetState, true);
  RegisterProperty(TDataSource,
       'property State:TDataSetState read TDataSource__GetState;');
  // End of class TDataSource
  // Begin of class TDataSetDesigner
  RegisterClassType(TDataSetDesigner, H);
  RegisterMethod(TDataSetDesigner,
       'constructor Create(DataSet: TDataSet);',
       @TDataSetDesigner.Create);
  RegisterMethod(TDataSetDesigner,
       'destructor Destroy; override;',
       @TDataSetDesigner.Destroy);
  RegisterStdMethodEx(TDataSetDesigner,'BeginDesign',TDataSetDesigner_BeginDesign,0,[typeVARIANT]);
  RegisterMethod(TDataSetDesigner,
       'procedure DataEvent(Event: TDataEvent; Info: Longint); virtual;',
       @TDataSetDesigner.DataEvent);
  RegisterStdMethodEx(TDataSetDesigner,'EndDesign',TDataSetDesigner_EndDesign,0,[typeVARIANT]);
  RegisterMethod(TDataSetDesigner,
       'function TDataSetDesigner__GetDataSet(Self:TDataSetDesigner):TDataSet;',
       @TDataSetDesigner__GetDataSet, true);
  RegisterProperty(TDataSetDesigner,
       'property DataSet:TDataSet read TDataSetDesigner__GetDataSet;');
  // End of class TDataSetDesigner
  // Begin of class TCheckConstraint
  RegisterClassType(TCheckConstraint, H);
  RegisterMethod(TCheckConstraint,
       'procedure Assign(Source: TPersistent); override;',
       @TCheckConstraint.Assign);
  RegisterStdMethodEx(TCheckConstraint,'GetDisplayName',TCheckConstraint_GetDisplayName,0,[typeSTRING]);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TCheckConstraint
  // Begin of class TCheckConstraints
  RegisterClassType(TCheckConstraints, H);
  RegisterMethod(TCheckConstraints,
       'constructor Create(Owner: TPersistent);',
       @TCheckConstraints.Create);
  RegisterMethod(TCheckConstraints,
       'function Add: TCheckConstraint;',
       @TCheckConstraints.Add);
  RegisterMethod(TCheckConstraints,
       'function TCheckConstraints__GetItems(Self:TCheckConstraints;Index: Integer):TCheckConstraint;',
       @TCheckConstraints__GetItems, true);
  RegisterMethod(TCheckConstraints,
       'procedure TCheckConstraints__PutItems(Self:TCheckConstraints;Index: Integer;const Value: TCheckConstraint);',
       @TCheckConstraints__PutItems, true);
  RegisterProperty(TCheckConstraints,
       'property Items[Index: Integer]:TCheckConstraint read TCheckConstraints__GetItems write TCheckConstraints__PutItems;default;');
  // End of class TCheckConstraints
  RegisterTypeAlias('TBlobData','string');
  RegisterRTTIType(TypeInfo(TParamType));
  RegisterRTTIType(TypeInfo(TParamTypes));
  // Begin of class TParam
  RegisterClassType(TParam, H);
  RegisterMethod(TParam,
       'procedure Assign(Source: TPersistent); override;',
       @TParam.Assign);
  RegisterMethod(TParam,
       'procedure AssignField(Field: TField);',
       @TParam.AssignField);
  RegisterMethod(TParam,
       'procedure AssignFieldValue(Field: TField; const Value: Variant);',
       @TParam.AssignFieldValue);
  RegisterStdMethodEx(TParam,'Clear',TParam_Clear,0,[typeVARIANT]);
  RegisterMethod(TParam,
       'procedure GetData(Buffer: Pointer);',
       @TParam.GetData);
  RegisterStdMethodEx(TParam,'GetDataSize',TParam_GetDataSize,0,[typeINTEGER]);
  RegisterMethod(TParam,
       'procedure LoadFromFile(const FileName: string; BlobType: TBlobType);',
       @TParam.LoadFromFile);
  RegisterMethod(TParam,
       'procedure LoadFromStream(Stream: TStream; BlobType: TBlobType);',
       @TParam.LoadFromStream);
  RegisterMethod(TParam,
       'procedure SetBlobData(Buffer: Pointer; Size: Integer);',
       @TParam.SetBlobData);
  RegisterMethod(TParam,
       'procedure SetData(Buffer: Pointer);',
       @TParam.SetData);
  RegisterMethod(TParam,
       'function TParam__GetAsBCD(Self:TParam):Currency;',
       @TParam__GetAsBCD, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsBCD(Self:TParam;const Value: Currency);',
       @TParam__PutAsBCD, true);
  RegisterProperty(TParam,
       'property AsBCD:Currency read TParam__GetAsBCD write TParam__PutAsBCD;');
  RegisterMethod(TParam,
       'function TParam__GetAsFMTBCD(Self:TParam):TBcd;',
       @TParam__GetAsFMTBCD, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsFMTBCD(Self:TParam;const Value: TBcd);',
       @TParam__PutAsFMTBCD, true);
  RegisterProperty(TParam,
       'property AsFMTBCD:TBcd read TParam__GetAsFMTBCD write TParam__PutAsFMTBCD;');
  RegisterMethod(TParam,
       'function TParam__GetAsBlob(Self:TParam):TBlobData;',
       @TParam__GetAsBlob, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsBlob(Self:TParam;const Value: TBlobData);',
       @TParam__PutAsBlob, true);
  RegisterProperty(TParam,
       'property AsBlob:TBlobData read TParam__GetAsBlob write TParam__PutAsBlob;');
  RegisterMethod(TParam,
       'function TParam__GetAsBoolean(Self:TParam):Boolean;',
       @TParam__GetAsBoolean, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsBoolean(Self:TParam;const Value: Boolean);',
       @TParam__PutAsBoolean, true);
  RegisterProperty(TParam,
       'property AsBoolean:Boolean read TParam__GetAsBoolean write TParam__PutAsBoolean;');
  RegisterMethod(TParam,
       'function TParam__GetAsCurrency(Self:TParam):Currency;',
       @TParam__GetAsCurrency, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsCurrency(Self:TParam;const Value: Currency);',
       @TParam__PutAsCurrency, true);
  RegisterProperty(TParam,
       'property AsCurrency:Currency read TParam__GetAsCurrency write TParam__PutAsCurrency;');
  RegisterMethod(TParam,
       'function TParam__GetAsDate(Self:TParam):TDateTime;',
       @TParam__GetAsDate, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsDate(Self:TParam;const Value: TDateTime);',
       @TParam__PutAsDate, true);
  RegisterProperty(TParam,
       'property AsDate:TDateTime read TParam__GetAsDate write TParam__PutAsDate;');
  RegisterMethod(TParam,
       'function TParam__GetAsDateTime(Self:TParam):TDateTime;',
       @TParam__GetAsDateTime, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsDateTime(Self:TParam;const Value: TDateTime);',
       @TParam__PutAsDateTime, true);
  RegisterProperty(TParam,
       'property AsDateTime:TDateTime read TParam__GetAsDateTime write TParam__PutAsDateTime;');
  RegisterMethod(TParam,
       'function TParam__GetAsFloat(Self:TParam):Double;',
       @TParam__GetAsFloat, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsFloat(Self:TParam;const Value: Double);',
       @TParam__PutAsFloat, true);
  RegisterProperty(TParam,
       'property AsFloat:Double read TParam__GetAsFloat write TParam__PutAsFloat;');
  RegisterMethod(TParam,
       'function TParam__GetAsInteger(Self:TParam):LongInt;',
       @TParam__GetAsInteger, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsInteger(Self:TParam;const Value: LongInt);',
       @TParam__PutAsInteger, true);
  RegisterProperty(TParam,
       'property AsInteger:LongInt read TParam__GetAsInteger write TParam__PutAsInteger;');
  RegisterMethod(TParam,
       'function TParam__GetAsSmallInt(Self:TParam):LongInt;',
       @TParam__GetAsSmallInt, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsSmallInt(Self:TParam;const Value: LongInt);',
       @TParam__PutAsSmallInt, true);
  RegisterProperty(TParam,
       'property AsSmallInt:LongInt read TParam__GetAsSmallInt write TParam__PutAsSmallInt;');
  RegisterMethod(TParam,
       'function TParam__GetAsSQLTimeStamp(Self:TParam):TSQLTimeStamp;',
       @TParam__GetAsSQLTimeStamp, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsSQLTimeStamp(Self:TParam;const Value: TSQLTimeStamp);',
       @TParam__PutAsSQLTimeStamp, true);
  RegisterProperty(TParam,
       'property AsSQLTimeStamp:TSQLTimeStamp read TParam__GetAsSQLTimeStamp write TParam__PutAsSQLTimeStamp;');
  RegisterMethod(TParam,
       'function TParam__GetAsMemo(Self:TParam):String;',
       @TParam__GetAsMemo, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsMemo(Self:TParam;const Value: String);',
       @TParam__PutAsMemo, true);
  RegisterProperty(TParam,
       'property AsMemo:String read TParam__GetAsMemo write TParam__PutAsMemo;');
  RegisterMethod(TParam,
       'function TParam__GetAsString(Self:TParam):String;',
       @TParam__GetAsString, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsString(Self:TParam;const Value: String);',
       @TParam__PutAsString, true);
  RegisterProperty(TParam,
       'property AsString:String read TParam__GetAsString write TParam__PutAsString;');
  RegisterMethod(TParam,
       'function TParam__GetAsTime(Self:TParam):TDateTime;',
       @TParam__GetAsTime, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsTime(Self:TParam;const Value: TDateTime);',
       @TParam__PutAsTime, true);
  RegisterProperty(TParam,
       'property AsTime:TDateTime read TParam__GetAsTime write TParam__PutAsTime;');
  RegisterMethod(TParam,
       'function TParam__GetAsWord(Self:TParam):LongInt;',
       @TParam__GetAsWord, true);
  RegisterMethod(TParam,
       'procedure TParam__PutAsWord(Self:TParam;const Value: LongInt);',
       @TParam__PutAsWord, true);
  RegisterProperty(TParam,
       'property AsWord:LongInt read TParam__GetAsWord write TParam__PutAsWord;');
  RegisterMethod(TParam,
       'function TParam__GetBound(Self:TParam):Boolean;',
       @TParam__GetBound, true);
  RegisterMethod(TParam,
       'procedure TParam__PutBound(Self:TParam;const Value: Boolean);',
       @TParam__PutBound, true);
  RegisterProperty(TParam,
       'property Bound:Boolean read TParam__GetBound write TParam__PutBound;');
  RegisterMethod(TParam,
       'function TParam__GetIsNull(Self:TParam):Boolean;',
       @TParam__GetIsNull, true);
  RegisterProperty(TParam,
       'property IsNull:Boolean read TParam__GetIsNull;');
  RegisterMethod(TParam,
       'function TParam__GetNativeStr(Self:TParam):String;',
       @TParam__GetNativeStr, true);
  RegisterMethod(TParam,
       'procedure TParam__PutNativeStr(Self:TParam;const Value: String);',
       @TParam__PutNativeStr, true);
  RegisterProperty(TParam,
       'property NativeStr:String read TParam__GetNativeStr write TParam__PutNativeStr;');
  RegisterMethod(TParam,
       'function TParam__GetText(Self:TParam):String;',
       @TParam__GetText, true);
  RegisterMethod(TParam,
       'procedure TParam__PutText(Self:TParam;const Value: String);',
       @TParam__PutText, true);
  RegisterProperty(TParam,
       'property Text:String read TParam__GetText write TParam__PutText;');
  // End of class TParam
  // Begin of class TParams
  RegisterClassType(TParams, H);
  RegisterMethod(TParams,
       'procedure AssignValues(Value: TParams);',
       @TParams.AssignValues);
  RegisterMethod(TParams,
       'procedure AddParam(Value: TParam);',
       @TParams.AddParam);
  RegisterMethod(TParams,
       'procedure RemoveParam(Value: TParam);',
       @TParams.RemoveParam);
  RegisterMethod(TParams,
       'function CreateParam(FldType: TFieldType; const ParamName: string;      ParamType: TParamType): TParam;',
       @TParams.CreateParam);
  RegisterMethod(TParams,
       'procedure GetParamList(List: TList; const ParamNames: string);',
       @TParams.GetParamList);
  RegisterMethod(TParams,
       'function IsEqual(Value: TParams): Boolean;',
       @TParams.IsEqual);
  RegisterMethod(TParams,
       'function ParseSQL(SQL: String; DoCreate: Boolean): String;',
       @TParams.ParseSQL);
  RegisterMethod(TParams,
       'function ParamByName(const Value: string): TParam;',
       @TParams.ParamByName);
  RegisterMethod(TParams,
       'function FindParam(const Value: string): TParam;',
       @TParams.FindParam);
  RegisterMethod(TParams,
       'function TParams__GetItems(Self:TParams;Index: Integer):TParam;',
       @TParams__GetItems, true);
  RegisterMethod(TParams,
       'procedure TParams__PutItems(Self:TParams;Index: Integer;const Value: TParam);',
       @TParams__PutItems, true);
  RegisterProperty(TParams,
       'property Items[Index: Integer]:TParam read TParams__GetItems write TParams__PutItems;default;');
  RegisterMethod(TParams,
       'function TParams__GetParamValues(Self:TParams;const ParamName: string):Variant;',
       @TParams__GetParamValues, true);
  RegisterMethod(TParams,
       'procedure TParams__PutParamValues(Self:TParams;const ParamName: string;const Value: Variant);',
       @TParams__PutParamValues, true);
  RegisterProperty(TParams,
       'property ParamValues[const ParamName: string]:Variant read TParams__GetParamValues write TParams__PutParamValues;');
  // End of class TParams
  // Begin of interface IProviderSupport
  RegisterInterfaceType('IProviderSupport',IProviderSupport,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSEndTransaction(Commit: Boolean);');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSExecute;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSExecuteStatement(const ASQL: string; AParams: TParams;      ResultSet: Pointer = nil): Integer;');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSGetAttributes(List: TList);');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetDefaultOrder: TIndexDef;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetKeyFields: string;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetParams: TParams;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetQuoteChar: string;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetTableName: string;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSGetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSInTransaction: Boolean;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSIsSQLBased: Boolean;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSIsSQLSupported: Boolean;');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSReset;');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSSetParams(AParams: TParams);');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSSetCommandText(const CommandText: string);');
  RegisterInterfaceMethod(IProviderSupport,
       'procedure PSStartTransaction;');
  RegisterInterfaceMethod(IProviderSupport,
       'function PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean;');
  // End of interface IProviderSupport
  RegisterTypeAlias('TBookmark','Pointer');
  RegisterTypeAlias('TBookmarkStr','string');
  RegisterRTTIType(TypeInfo(TBookmarkFlag));
  RegisterRTTIType(TypeInfo(TGetMode));
  RegisterRTTIType(TypeInfo(TGetResult));
  RegisterRTTIType(TypeInfo(TResyncMode));
  RegisterRTTIType(TypeInfo(TDataAction));
  RegisterRTTIType(TypeInfo(TBlobStreamMode));
  RegisterRTTIType(TypeInfo(TLocateOption));
  RegisterRTTIType(TypeInfo(TLocateOptions));
  RegisterRTTIType(TypeInfo(TFilterOption));
  RegisterRTTIType(TypeInfo(TFilterOptions));
  RegisterRTTIType(TypeInfo(TGroupPosInd));
  RegisterRTTIType(TypeInfo(TGroupPosInds));
  // Begin of class TDataSet
  RegisterClassType(TDataSet, H);
  RegisterMethod(TDataSet,
       'constructor Create(AOwner: TComponent); override;',
       @TDataSet.Create);
  RegisterMethod(TDataSet,
       'destructor Destroy; override;',
       @TDataSet.Destroy);
  RegisterMethod(TDataSet,
       'function ActiveBuffer: PChar;',
       @TDataSet.ActiveBuffer);
  RegisterStdMethodEx(TDataSet,'Append',TDataSet_Append,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'procedure AppendRecord(const Values: array of const);',
       @TDataSet.AppendRecord);
  RegisterMethod(TDataSet,
       'function BookmarkValid(Bookmark: TBookmark): Boolean; virtual;',
       @TDataSet.BookmarkValid);
  RegisterStdMethodEx(TDataSet,'Cancel',TDataSet_Cancel,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'CheckBrowseMode',TDataSet_CheckBrowseMode,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'ClearFields',TDataSet_ClearFields,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Close',TDataSet_Close,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'ControlsDisabled',TDataSet_ControlsDisabled,0,[typeBOOLEAN]);
  RegisterMethod(TDataSet,
       'function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer; virtual;',
       @TDataSet.CompareBookmarks);
  RegisterMethod(TDataSet,
       'function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; virtual;',
       @TDataSet.CreateBlobStream);
  RegisterStdMethodEx(TDataSet,'CursorPosChanged',TDataSet_CursorPosChanged,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Delete',TDataSet_Delete,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'DisableControls',TDataSet_DisableControls,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Edit',TDataSet_Edit,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'EnableControls',TDataSet_EnableControls,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'function FieldByName(const FieldName: string): TField;',
       @TDataSet.FieldByName);
  RegisterMethod(TDataSet,
       'function FindField(const FieldName: string): TField;',
       @TDataSet.FindField);
  RegisterStdMethodEx(TDataSet,'FindFirst',TDataSet_FindFirst,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TDataSet,'FindLast',TDataSet_FindLast,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TDataSet,'FindNext',TDataSet_FindNext,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TDataSet,'FindPrior',TDataSet_FindPrior,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TDataSet,'First',TDataSet_First,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'procedure FreeBookmark(Bookmark: TBookmark); virtual;',
       @TDataSet.FreeBookmark);
  RegisterMethod(TDataSet,
       'function GetBookmark: TBookmark; virtual;',
       @TDataSet.GetBookmark);
  RegisterMethod(TDataSet,
       'function GetCurrentRecord(Buffer: PChar): Boolean; virtual;',
       @TDataSet.GetCurrentRecord);
  RegisterMethod(TDataSet,
       'procedure GetDetailDataSets(List: TList); virtual;',
       @TDataSet.GetDetailDataSets);
  RegisterMethod(TDataSet,
       'procedure GetDetailLinkFields(MasterFields, DetailFields: TList); virtual;',
       @TDataSet.GetDetailLinkFields);
  RegisterMethod(TDataSet,
       'function GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData): Integer; virtual;',
       @TDataSet.GetBlobFieldData);
  RegisterMethod(TDataSet,
       'procedure GetFieldList(List: TList; const FieldNames: string);',
       @TDataSet.GetFieldList);
  RegisterMethod(TDataSet,
       'procedure GetFieldNames(List: TStrings); virtual;',
       @TDataSet.GetFieldNames);
  RegisterMethod(TDataSet,
       'procedure GotoBookmark(Bookmark: TBookmark);',
       @TDataSet.GotoBookmark);
  RegisterStdMethodEx(TDataSet,'Insert',TDataSet_Insert,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'procedure InsertRecord(const Values: array of const);',
       @TDataSet.InsertRecord);
  RegisterStdMethodEx(TDataSet,'IsEmpty',TDataSet_IsEmpty,0,[typeBOOLEAN]);
  RegisterMethod(TDataSet,
       'function IsLinkedTo(DataSource: TDataSource): Boolean;',
       @TDataSet.IsLinkedTo);
  RegisterStdMethodEx(TDataSet,'IsSequenced',TDataSet_IsSequenced,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TDataSet,'Last',TDataSet_Last,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'function Locate(const KeyFields: string; const KeyValues: Variant;      Options: TLocateOptions): Boolean; virtual;',
       @TDataSet.Locate);
  RegisterMethod(TDataSet,
       'function Lookup(const KeyFields: string; const KeyValues: Variant;      const ResultFields: string): Variant; virtual;',
       @TDataSet.Lookup);
  RegisterMethod(TDataSet,
       'function MoveBy(Distance: Integer): Integer;',
       @TDataSet.MoveBy);
  RegisterStdMethodEx(TDataSet,'Next',TDataSet_Next,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Open',TDataSet_Open,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Post',TDataSet_Post,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Prior',TDataSet_Prior,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'Refresh',TDataSet_Refresh,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'procedure Resync(Mode: TResyncMode); virtual;',
       @TDataSet.Resync);
  RegisterMethod(TDataSet,
       'procedure SetFields(const Values: array of const);',
       @TDataSet.SetFields);
  RegisterMethod(TDataSet,
       'function Translate(Src, Dest: PChar; ToOem: Boolean): Integer; virtual;',
       @TDataSet.Translate);
  RegisterStdMethodEx(TDataSet,'UpdateCursorPos',TDataSet_UpdateCursorPos,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataSet,'UpdateRecord',TDataSet_UpdateRecord,0,[typeVARIANT]);
  RegisterMethod(TDataSet,
       'function UpdateStatus: TUpdateStatus; virtual;',
       @TDataSet.UpdateStatus);
  RegisterMethod(TDataSet,
       'function TDataSet__GetAggFields(Self:TDataSet):TFields;',
       @TDataSet__GetAggFields, true);
  RegisterProperty(TDataSet,
       'property AggFields:TFields read TDataSet__GetAggFields;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBof(Self:TDataSet):Boolean;',
       @TDataSet__GetBof, true);
  RegisterProperty(TDataSet,
       'property Bof:Boolean read TDataSet__GetBof;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBookmark(Self:TDataSet):TBookmarkStr;',
       @TDataSet__GetBookmark, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBookmark(Self:TDataSet;const Value: TBookmarkStr);',
       @TDataSet__PutBookmark, true);
  RegisterProperty(TDataSet,
       'property Bookmark:TBookmarkStr read TDataSet__GetBookmark write TDataSet__PutBookmark;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetCanModify(Self:TDataSet):Boolean;',
       @TDataSet__GetCanModify, true);
  RegisterProperty(TDataSet,
       'property CanModify:Boolean read TDataSet__GetCanModify;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetDataSetField(Self:TDataSet):TDataSetField;',
       @TDataSet__GetDataSetField, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutDataSetField(Self:TDataSet;const Value: TDataSetField);',
       @TDataSet__PutDataSetField, true);
  RegisterProperty(TDataSet,
       'property DataSetField:TDataSetField read TDataSet__GetDataSetField write TDataSet__PutDataSetField;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetDataSource(Self:TDataSet):TDataSource;',
       @TDataSet__GetDataSource, true);
  RegisterProperty(TDataSet,
       'property DataSource:TDataSource read TDataSet__GetDataSource;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetDefaultFields(Self:TDataSet):Boolean;',
       @TDataSet__GetDefaultFields, true);
  RegisterProperty(TDataSet,
       'property DefaultFields:Boolean read TDataSet__GetDefaultFields;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetDesigner(Self:TDataSet):TDataSetDesigner;',
       @TDataSet__GetDesigner, true);
  RegisterProperty(TDataSet,
       'property Designer:TDataSetDesigner read TDataSet__GetDesigner;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetEof(Self:TDataSet):Boolean;',
       @TDataSet__GetEof, true);
  RegisterProperty(TDataSet,
       'property Eof:Boolean read TDataSet__GetEof;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBlockReadSize(Self:TDataSet):Integer;',
       @TDataSet__GetBlockReadSize, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBlockReadSize(Self:TDataSet;const Value: Integer);',
       @TDataSet__PutBlockReadSize, true);
  RegisterProperty(TDataSet,
       'property BlockReadSize:Integer read TDataSet__GetBlockReadSize write TDataSet__PutBlockReadSize;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFieldCount(Self:TDataSet):Integer;',
       @TDataSet__GetFieldCount, true);
  RegisterProperty(TDataSet,
       'property FieldCount:Integer read TDataSet__GetFieldCount;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFieldDefs(Self:TDataSet):TFieldDefs;',
       @TDataSet__GetFieldDefs, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutFieldDefs(Self:TDataSet;const Value: TFieldDefs);',
       @TDataSet__PutFieldDefs, true);
  RegisterProperty(TDataSet,
       'property FieldDefs:TFieldDefs read TDataSet__GetFieldDefs write TDataSet__PutFieldDefs;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFieldDefList(Self:TDataSet):TFieldDefList;',
       @TDataSet__GetFieldDefList, true);
  RegisterProperty(TDataSet,
       'property FieldDefList:TFieldDefList read TDataSet__GetFieldDefList;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFields(Self:TDataSet):TFields;',
       @TDataSet__GetFields, true);
  RegisterProperty(TDataSet,
       'property Fields:TFields read TDataSet__GetFields;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFieldList(Self:TDataSet):TFieldList;',
       @TDataSet__GetFieldList, true);
  RegisterProperty(TDataSet,
       'property FieldList:TFieldList read TDataSet__GetFieldList;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFieldValues(Self:TDataSet;const FieldName: string):Variant;',
       @TDataSet__GetFieldValues, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutFieldValues(Self:TDataSet;const FieldName: string;const Value: Variant);',
       @TDataSet__PutFieldValues, true);
  RegisterProperty(TDataSet,
       'property FieldValues[const FieldName: string]:Variant read TDataSet__GetFieldValues write TDataSet__PutFieldValues;default;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFound(Self:TDataSet):Boolean;',
       @TDataSet__GetFound, true);
  RegisterProperty(TDataSet,
       'property Found:Boolean read TDataSet__GetFound;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetIsUniDirectional(Self:TDataSet):Boolean;',
       @TDataSet__GetIsUniDirectional, true);
  RegisterProperty(TDataSet,
       'property IsUniDirectional:Boolean read TDataSet__GetIsUniDirectional;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetModified(Self:TDataSet):Boolean;',
       @TDataSet__GetModified, true);
  RegisterProperty(TDataSet,
       'property Modified:Boolean read TDataSet__GetModified;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetObjectView(Self:TDataSet):Boolean;',
       @TDataSet__GetObjectView, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutObjectView(Self:TDataSet;const Value: Boolean);',
       @TDataSet__PutObjectView, true);
  RegisterProperty(TDataSet,
       'property ObjectView:Boolean read TDataSet__GetObjectView write TDataSet__PutObjectView;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetRecordCount(Self:TDataSet):Integer;',
       @TDataSet__GetRecordCount, true);
  RegisterProperty(TDataSet,
       'property RecordCount:Integer read TDataSet__GetRecordCount;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetRecNo(Self:TDataSet):Integer;',
       @TDataSet__GetRecNo, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutRecNo(Self:TDataSet;const Value: Integer);',
       @TDataSet__PutRecNo, true);
  RegisterProperty(TDataSet,
       'property RecNo:Integer read TDataSet__GetRecNo write TDataSet__PutRecNo;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetRecordSize(Self:TDataSet):Word;',
       @TDataSet__GetRecordSize, true);
  RegisterProperty(TDataSet,
       'property RecordSize:Word read TDataSet__GetRecordSize;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetSparseArrays(Self:TDataSet):Boolean;',
       @TDataSet__GetSparseArrays, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutSparseArrays(Self:TDataSet;const Value: Boolean);',
       @TDataSet__PutSparseArrays, true);
  RegisterProperty(TDataSet,
       'property SparseArrays:Boolean read TDataSet__GetSparseArrays write TDataSet__PutSparseArrays;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetState(Self:TDataSet):TDataSetState;',
       @TDataSet__GetState, true);
  RegisterProperty(TDataSet,
       'property State:TDataSetState read TDataSet__GetState;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFilter(Self:TDataSet):String;',
       @TDataSet__GetFilter, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutFilter(Self:TDataSet;const Value: String);',
       @TDataSet__PutFilter, true);
  RegisterProperty(TDataSet,
       'property Filter:String read TDataSet__GetFilter write TDataSet__PutFilter;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFiltered(Self:TDataSet):Boolean;',
       @TDataSet__GetFiltered, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutFiltered(Self:TDataSet;const Value: Boolean);',
       @TDataSet__PutFiltered, true);
  RegisterProperty(TDataSet,
       'property Filtered:Boolean read TDataSet__GetFiltered write TDataSet__PutFiltered;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetFilterOptions(Self:TDataSet):TFilterOptions;',
       @TDataSet__GetFilterOptions, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutFilterOptions(Self:TDataSet;const Value: TFilterOptions);',
       @TDataSet__PutFilterOptions, true);
  RegisterProperty(TDataSet,
       'property FilterOptions:TFilterOptions read TDataSet__GetFilterOptions write TDataSet__PutFilterOptions;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetActive(Self:TDataSet):Boolean;',
       @TDataSet__GetActive, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutActive(Self:TDataSet;const Value: Boolean);',
       @TDataSet__PutActive, true);
  RegisterProperty(TDataSet,
       'property Active:Boolean read TDataSet__GetActive write TDataSet__PutActive;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAutoCalcFields(Self:TDataSet):Boolean;',
       @TDataSet__GetAutoCalcFields, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAutoCalcFields(Self:TDataSet;const Value: Boolean);',
       @TDataSet__PutAutoCalcFields, true);
  RegisterProperty(TDataSet,
       'property AutoCalcFields:Boolean read TDataSet__GetAutoCalcFields write TDataSet__PutAutoCalcFields;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeOpen(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeOpen, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeOpen(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeOpen, true);
  RegisterProperty(TDataSet,
       'property BeforeOpen:TDataSetNotifyEvent read TDataSet__GetBeforeOpen write TDataSet__PutBeforeOpen;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterOpen(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterOpen, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterOpen(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterOpen, true);
  RegisterProperty(TDataSet,
       'property AfterOpen:TDataSetNotifyEvent read TDataSet__GetAfterOpen write TDataSet__PutAfterOpen;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeClose(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeClose, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeClose(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeClose, true);
  RegisterProperty(TDataSet,
       'property BeforeClose:TDataSetNotifyEvent read TDataSet__GetBeforeClose write TDataSet__PutBeforeClose;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterClose(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterClose, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterClose(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterClose, true);
  RegisterProperty(TDataSet,
       'property AfterClose:TDataSetNotifyEvent read TDataSet__GetAfterClose write TDataSet__PutAfterClose;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeInsert(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeInsert, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeInsert(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeInsert, true);
  RegisterProperty(TDataSet,
       'property BeforeInsert:TDataSetNotifyEvent read TDataSet__GetBeforeInsert write TDataSet__PutBeforeInsert;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterInsert(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterInsert, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterInsert(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterInsert, true);
  RegisterProperty(TDataSet,
       'property AfterInsert:TDataSetNotifyEvent read TDataSet__GetAfterInsert write TDataSet__PutAfterInsert;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeEdit(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeEdit, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeEdit(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeEdit, true);
  RegisterProperty(TDataSet,
       'property BeforeEdit:TDataSetNotifyEvent read TDataSet__GetBeforeEdit write TDataSet__PutBeforeEdit;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterEdit(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterEdit, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterEdit(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterEdit, true);
  RegisterProperty(TDataSet,
       'property AfterEdit:TDataSetNotifyEvent read TDataSet__GetAfterEdit write TDataSet__PutAfterEdit;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforePost(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforePost, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforePost(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforePost, true);
  RegisterProperty(TDataSet,
       'property BeforePost:TDataSetNotifyEvent read TDataSet__GetBeforePost write TDataSet__PutBeforePost;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterPost(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterPost, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterPost(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterPost, true);
  RegisterProperty(TDataSet,
       'property AfterPost:TDataSetNotifyEvent read TDataSet__GetAfterPost write TDataSet__PutAfterPost;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeCancel(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeCancel, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeCancel(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeCancel, true);
  RegisterProperty(TDataSet,
       'property BeforeCancel:TDataSetNotifyEvent read TDataSet__GetBeforeCancel write TDataSet__PutBeforeCancel;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterCancel(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterCancel, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterCancel(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterCancel, true);
  RegisterProperty(TDataSet,
       'property AfterCancel:TDataSetNotifyEvent read TDataSet__GetAfterCancel write TDataSet__PutAfterCancel;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeDelete(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeDelete, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeDelete(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeDelete, true);
  RegisterProperty(TDataSet,
       'property BeforeDelete:TDataSetNotifyEvent read TDataSet__GetBeforeDelete write TDataSet__PutBeforeDelete;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterDelete(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterDelete, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterDelete(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterDelete, true);
  RegisterProperty(TDataSet,
       'property AfterDelete:TDataSetNotifyEvent read TDataSet__GetAfterDelete write TDataSet__PutAfterDelete;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeScroll(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeScroll, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeScroll(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeScroll, true);
  RegisterProperty(TDataSet,
       'property BeforeScroll:TDataSetNotifyEvent read TDataSet__GetBeforeScroll write TDataSet__PutBeforeScroll;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterScroll(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterScroll, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterScroll(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterScroll, true);
  RegisterProperty(TDataSet,
       'property AfterScroll:TDataSetNotifyEvent read TDataSet__GetAfterScroll write TDataSet__PutAfterScroll;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetBeforeRefresh(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetBeforeRefresh, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutBeforeRefresh(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutBeforeRefresh, true);
  RegisterProperty(TDataSet,
       'property BeforeRefresh:TDataSetNotifyEvent read TDataSet__GetBeforeRefresh write TDataSet__PutBeforeRefresh;');
  RegisterMethod(TDataSet,
       'function TDataSet__GetAfterRefresh(Self:TDataSet):TDataSetNotifyEvent;',
       @TDataSet__GetAfterRefresh, true);
  RegisterMethod(TDataSet,
       'procedure TDataSet__PutAfterRefresh(Self:TDataSet;const Value: TDataSetNotifyEvent);',
       @TDataSet__PutAfterRefresh, true);
  RegisterProperty(TDataSet,
       'property AfterRefresh:TDataSetNotifyEvent read TDataSet__GetAfterRefresh write TDataSet__PutAfterRefresh;');
  // End of class TDataSet
  RegisterTypeAlias('TDateTimeAlias','TDateTime');
  RegisterConstant('dsMaxStringSize', 8192, H);
  RegisterRTTIType(TypeInfo(TDBScreenCursor));
  // Begin of interface IDBScreen
  RegisterInterfaceType('IDBScreen',IDBScreen,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IDBScreen,
       'function GetCursor: TDBScreenCursor;');
  RegisterInterfaceMethod(IDBScreen,
       'procedure SetCursor(Cursor: TDBScreenCursor);');
  RegisterInterfaceProperty(IDBScreen,'property Cursor: TDBScreenCursor read GetCursor write SetCursor;');
  // End of interface IDBScreen
  // Begin of interface IDBApplication
  RegisterInterfaceType('IDBApplication',IDBApplication,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IDBApplication,
       'function GetTitle: string;');
  RegisterInterfaceMethod(IDBApplication,
       'procedure ProcessMessages;');
  RegisterInterfaceMethod(IDBApplication,
       'procedure SetTitle(const Value: string);');
  RegisterInterfaceProperty(IDBApplication,'property Title: string read GetTitle write SetTitle;');
  // End of interface IDBApplication
  // Begin of interface IDBSession
  RegisterInterfaceType('IDBSession',IDBSession,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IDBSession,
       'procedure AddPassword(const APassword: string);');
  RegisterInterfaceMethod(IDBSession,
       'procedure RemovePassword(const APassword: string);');
  RegisterInterfaceMethod(IDBSession,
       'procedure RemoveAllPasswords;');
  // End of interface IDBSession
  RegisterRoutine('function ExtractFieldName(const Fields: string; var Pos: Integer): string;', @ExtractFieldName, H);
  RegisterRoutine('procedure RegisterFields(const FieldClasses: array of TFieldClass);', @RegisterFields, H);
  RegisterRoutine('procedure DatabaseError(const Message: string; Component: TComponent = nil);', @DatabaseError, H);
  RegisterRoutine('procedure DatabaseErrorFmt(const Message: string; const Args: array of const;  Component: TComponent = nil);', @DatabaseErrorFmt, H);
  RegisterRoutine('procedure DisposeMem(var Buffer; Size: Integer);', @DisposeMem, H);
  RegisterRoutine('function BuffersEqual(Buf1, Buf2: Pointer; Size: Integer): Boolean;', @BuffersEqual, H);
  RegisterRoutine('function GetFieldProperty(DataSet: TDataSet; Control: TComponent;  const FieldName: string): TField;', @GetFieldProperty, H);
  RegisterRoutine('function VarTypeToDataType(VarType: Integer): TFieldType;', @VarTypeToDataType, H);
end;
initialization
  RegisterIMP_DB;
end.
