unit IMP_Classes;
interface
uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  TypInfo,
  ActiveX,
  Classes,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_Classes;
implementation
procedure TListEnumerator_GetCurrent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsPointer := TListEnumerator(Self).GetCurrent();
end;
procedure TListEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TListEnumerator(Self).MoveNext();
end;
function TListEnumerator__GetCurrent(Self:TListEnumerator):Pointer;
begin
  result := Self.Current;
end;
procedure TList_Add(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TList(Self).Add(Params[0].AsPointer);
end;
procedure TList_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Clear();
end;
procedure TList_Delete(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Delete(Params[0].AsInteger);
end;
procedure TList_Error1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Error(Params[0].AsString,Params[1].AsInteger);
end;
procedure TList_Exchange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Exchange(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TList_Extract(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsPointer := TList(Self).Extract(Params[0].AsPointer);
end;
procedure TList_First(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsPointer := TList(Self).First();
end;
procedure TList_IndexOf(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TList(Self).IndexOf(Params[0].AsPointer);
end;
procedure TList_Insert(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Insert(Params[0].AsInteger,Params[1].AsPointer);
end;
procedure TList_Last(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsPointer := TList(Self).Last();
end;
procedure TList_Move(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Move(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TList_Remove(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TList(Self).Remove(Params[0].AsPointer);
end;
procedure TList_Pack(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TList(Self).Pack();
end;
function TList__GetCapacity(Self:TList):Integer;
begin
  result := Self.Capacity;
end;
procedure TList__PutCapacity(Self:TList;const Value: Integer);
begin
  Self.Capacity := Value;
end;
function TList__GetCount(Self:TList):Integer;
begin
  result := Self.Count;
end;
procedure TList__PutCount(Self:TList;const Value: Integer);
begin
  Self.Count := Value;
end;
function TList__GetItems(Self:TList;Index: Integer):Pointer;
begin
  result := Self.Items[Index];
end;
procedure TList__PutItems(Self:TList;Index: Integer;const Value: Pointer);
begin
  Self.Items[Index] := Value;
end;
function TList__GetList(Self:TList):PPointerList;
begin
  result := Self.List;
end;
procedure TThreadList_Add(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThreadList(Self).Add(Params[0].AsPointer);
end;
procedure TThreadList_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThreadList(Self).Clear();
end;
procedure TThreadList_Remove(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThreadList(Self).Remove(Params[0].AsPointer);
end;
procedure TThreadList_UnlockList(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThreadList(Self).UnlockList();
end;
function TThreadList__GetDuplicates(Self:TThreadList):TDuplicates;
begin
  result := Self.Duplicates;
end;
procedure TThreadList__PutDuplicates(Self:TThreadList;const Value: TDuplicates);
begin
  Self.Duplicates := Value;
end;
procedure TInterfaceListEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TInterfaceListEnumerator(Self).MoveNext();
end;
function TInterfaceListEnumerator__GetCurrent(Self:TInterfaceListEnumerator):IInterface;
begin
  result := Self.Current;
end;
procedure TInterfaceList_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfaceList(Self).Clear();
end;
procedure TInterfaceList_Delete(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfaceList(Self).Delete(Params[0].AsInteger);
end;
procedure TInterfaceList_Exchange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfaceList(Self).Exchange(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TInterfaceList_Lock(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfaceList(Self).Lock();
end;
procedure TInterfaceList_Unlock(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfaceList(Self).Unlock();
end;
function TInterfaceList__GetCapacity(Self:TInterfaceList):Integer;
begin
  result := Self.Capacity;
end;
procedure TInterfaceList__PutCapacity(Self:TInterfaceList;const Value: Integer);
begin
  Self.Capacity := Value;
end;
function TInterfaceList__GetCount(Self:TInterfaceList):Integer;
begin
  result := Self.Count;
end;
procedure TInterfaceList__PutCount(Self:TInterfaceList;const Value: Integer);
begin
  Self.Count := Value;
end;
function TInterfaceList__GetItems(Self:TInterfaceList;Index: Integer):IInterface;
begin
  result := Self.Items[Index];
end;
procedure TInterfaceList__PutItems(Self:TInterfaceList;Index: Integer;const Value: IInterface);
begin
  Self.Items[Index] := Value;
end;
procedure TBits_OpenBit(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TBits(Self).OpenBit();
end;
function TBits__GetBits(Self:TBits;Index: Integer):Boolean;
begin
  result := Self.Bits[Index];
end;
procedure TBits__PutBits(Self:TBits;Index: Integer;const Value: Boolean);
begin
  Self.Bits[Index] := Value;
end;
function TBits__GetSize(Self:TBits):Integer;
begin
  result := Self.Size;
end;
procedure TBits__PutSize(Self:TBits;const Value: Integer);
begin
  Self.Size := Value;
end;
procedure TPersistent_GetNamePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TPersistent(Self).GetNamePath();
end;
procedure TInterfacedPersistent_AfterConstruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TInterfacedPersistent(Self).AfterConstruction();
end;
procedure TRecall_Store(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TRecall(Self).Store();
end;
procedure TRecall_Forget(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TRecall(Self).Forget();
end;
function TRecall__GetReference(Self:TRecall):TPersistent;
begin
  result := Self.Reference;
end;
procedure TCollectionItem_GetNamePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TCollectionItem(Self).GetNamePath();
end;
function TCollectionItem__GetCollection(Self:TCollectionItem):TCollection;
begin
  result := Self.Collection;
end;
procedure TCollectionItem__PutCollection(Self:TCollectionItem;const Value: TCollection);
begin
  Self.Collection := Value;
end;
function TCollectionItem__GetID(Self:TCollectionItem):Integer;
begin
  result := Self.ID;
end;
function TCollectionItem__GetIndex(Self:TCollectionItem):Integer;
begin
  result := Self.Index;
end;
procedure TCollectionItem__PutIndex(Self:TCollectionItem;const Value: Integer);
begin
  Self.Index := Value;
end;
function TCollectionItem__GetDisplayName(Self:TCollectionItem):String;
begin
  result := Self.DisplayName;
end;
procedure TCollectionItem__PutDisplayName(Self:TCollectionItem;const Value: String);
begin
  Self.DisplayName := Value;
end;
procedure TCollectionEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TCollectionEnumerator(Self).MoveNext();
end;
function TCollectionEnumerator__GetCurrent(Self:TCollectionEnumerator):TCollectionItem;
begin
  result := Self.Current;
end;
procedure TCollection_BeginUpdate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCollection(Self).BeginUpdate();
end;
procedure TCollection_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCollection(Self).Clear();
end;
procedure TCollection_Delete(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCollection(Self).Delete(Params[0].AsInteger);
end;
procedure TCollection_EndUpdate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCollection(Self).EndUpdate();
end;
procedure TCollection_GetNamePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TCollection(Self).GetNamePath();
end;
function TCollection__GetCount(Self:TCollection):Integer;
begin
  result := Self.Count;
end;
function TCollection__GetItemClass(Self:TCollection):TCollectionItemClass;
begin
  result := Self.ItemClass;
end;
function TCollection__GetItems(Self:TCollection;Index: Integer):TCollectionItem;
begin
  result := Self.Items[Index];
end;
procedure TCollection__PutItems(Self:TCollection;Index: Integer;const Value: TCollectionItem);
begin
  Self.Items[Index] := Value;
end;
procedure TStringsEnumerator_GetCurrent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TStringsEnumerator(Self).GetCurrent();
end;
procedure TStringsEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TStringsEnumerator(Self).MoveNext();
end;
function TStringsEnumerator__GetCurrent(Self:TStringsEnumerator):String;
begin
  result := Self.Current;
end;
procedure TStrings_Add(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TStrings(Self).Add(Params[0].AsString);
end;
procedure TStrings_Append(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).Append(Params[0].AsString);
end;
procedure TStrings_BeginUpdate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).BeginUpdate();
end;
procedure TStrings_EndUpdate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).EndUpdate();
end;
procedure TStrings_Exchange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).Exchange(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TStrings_IndexOf(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TStrings(Self).IndexOf(Params[0].AsString);
end;
procedure TStrings_IndexOfName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TStrings(Self).IndexOfName(Params[0].AsString);
end;
procedure TStrings_LoadFromFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).LoadFromFile(Params[0].AsString);
end;
procedure TStrings_Move(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).Move(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TStrings_SaveToFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStrings(Self).SaveToFile(Params[0].AsString);
end;
function TStrings__GetCapacity(Self:TStrings):Integer;
begin
  result := Self.Capacity;
end;
procedure TStrings__PutCapacity(Self:TStrings;const Value: Integer);
begin
  Self.Capacity := Value;
end;
function TStrings__GetCommaText(Self:TStrings):String;
begin
  result := Self.CommaText;
end;
procedure TStrings__PutCommaText(Self:TStrings;const Value: String);
begin
  Self.CommaText := Value;
end;
function TStrings__GetCount(Self:TStrings):Integer;
begin
  result := Self.Count;
end;
function TStrings__GetDelimiter(Self:TStrings):Char;
begin
  result := Self.Delimiter;
end;
procedure TStrings__PutDelimiter(Self:TStrings;const Value: Char);
begin
  Self.Delimiter := Value;
end;
function TStrings__GetDelimitedText(Self:TStrings):String;
begin
  result := Self.DelimitedText;
end;
procedure TStrings__PutDelimitedText(Self:TStrings;const Value: String);
begin
  Self.DelimitedText := Value;
end;
function TStrings__GetLineBreak(Self:TStrings):String;
begin
  result := Self.LineBreak;
end;
procedure TStrings__PutLineBreak(Self:TStrings;const Value: String);
begin
  Self.LineBreak := Value;
end;
function TStrings__GetNames(Self:TStrings;Index: Integer):String;
begin
  result := Self.Names[Index];
end;
function TStrings__GetObjects(Self:TStrings;Index: Integer):TObject;
begin
  result := Self.Objects[Index];
end;
procedure TStrings__PutObjects(Self:TStrings;Index: Integer;const Value: TObject);
begin
  Self.Objects[Index] := Value;
end;
function TStrings__GetQuoteChar(Self:TStrings):Char;
begin
  result := Self.QuoteChar;
end;
procedure TStrings__PutQuoteChar(Self:TStrings;const Value: Char);
begin
  Self.QuoteChar := Value;
end;
function TStrings__GetValues(Self:TStrings;const Name: string):String;
begin
  result := Self.Values[Name];
end;
procedure TStrings__PutValues(Self:TStrings;const Name: string;const Value: String);
begin
  Self.Values[Name] := Value;
end;
function TStrings__GetValueFromIndex(Self:TStrings;Index: Integer):String;
begin
  result := Self.ValueFromIndex[Index];
end;
procedure TStrings__PutValueFromIndex(Self:TStrings;Index: Integer;const Value: String);
begin
  Self.ValueFromIndex[Index] := Value;
end;
function TStrings__GetNameValueSeparator(Self:TStrings):Char;
begin
  result := Self.NameValueSeparator;
end;
procedure TStrings__PutNameValueSeparator(Self:TStrings;const Value: Char);
begin
  Self.NameValueSeparator := Value;
end;
function TStrings__GetStrings(Self:TStrings;Index: Integer):String;
begin
  result := Self.Strings[Index];
end;
procedure TStrings__PutStrings(Self:TStrings;Index: Integer;const Value: String);
begin
  Self.Strings[Index] := Value;
end;
function TStrings__GetText(Self:TStrings):String;
begin
  result := Self.Text;
end;
procedure TStrings__PutText(Self:TStrings;const Value: String);
begin
  Self.Text := Value;
end;
function TStrings__GetStringsAdapter(Self:TStrings):IStringsAdapter;
begin
  result := Self.StringsAdapter;
end;
procedure TStrings__PutStringsAdapter(Self:TStrings;const Value: IStringsAdapter);
begin
  Self.StringsAdapter := Value;
end;
procedure TStringList_Add(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TStringList(Self).Add(Params[0].AsString);
end;
procedure TStringList_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringList(Self).Clear();
end;
procedure TStringList_Delete(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringList(Self).Delete(Params[0].AsInteger);
end;
procedure TStringList_Exchange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringList(Self).Exchange(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TStringList_IndexOf(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TStringList(Self).IndexOf(Params[0].AsString);
end;
procedure TStringList_Insert(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringList(Self).Insert(Params[0].AsInteger,Params[1].AsString);
end;
procedure TStringList_Sort(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringList(Self).Sort();
end;
function TStringList__GetDuplicates(Self:TStringList):TDuplicates;
begin
  result := Self.Duplicates;
end;
procedure TStringList__PutDuplicates(Self:TStringList;const Value: TDuplicates);
begin
  Self.Duplicates := Value;
end;
function TStringList__GetSorted(Self:TStringList):Boolean;
begin
  result := Self.Sorted;
end;
procedure TStringList__PutSorted(Self:TStringList;const Value: Boolean);
begin
  Self.Sorted := Value;
end;
function TStringList__GetCaseSensitive(Self:TStringList):Boolean;
begin
  result := Self.CaseSensitive;
end;
procedure TStringList__PutCaseSensitive(Self:TStringList;const Value: Boolean);
begin
  Self.CaseSensitive := Value;
end;
procedure TStream_Seek3(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TStream(Self).Seek(Params[0].PValue^,Params[1].PValue^);
end;
procedure TStream_FixupResourceHeader(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStream(Self).FixupResourceHeader(Params[0].AsInteger);
end;
procedure TStream_ReadResHeader(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStream(Self).ReadResHeader();
end;
function TStream__GetPosition(Self:TStream):Int64;
begin
  result := Self.Position;
end;
procedure TStream__PutPosition(Self:TStream;const Value: Int64);
begin
  Self.Position := Value;
end;
function TStream__GetSize(Self:TStream):Int64;
begin
  result := Self.Size;
end;
procedure TStream__PutSize(Self:TStream;const Value: Int64);
begin
  Self.Size := Value;
end;
function THandleStream__GetHandle(Self:THandleStream):Integer;
begin
  result := Self.Handle;
end;
procedure TCustomMemoryStream_Seek(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TCustomMemoryStream(Self).Seek(Params[0].PValue^,Params[1].PValue^);
end;
procedure TCustomMemoryStream_SaveToFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomMemoryStream(Self).SaveToFile(Params[0].AsString);
end;
function TCustomMemoryStream__GetMemory(Self:TCustomMemoryStream):Pointer;
begin
  result := Self.Memory;
end;
procedure TMemoryStream_Clear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMemoryStream(Self).Clear();
end;
procedure TMemoryStream_LoadFromFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMemoryStream(Self).LoadFromFile(Params[0].AsString);
end;
procedure TMemoryStream_SetSize(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMemoryStream(Self).SetSize(Params[0].PValue^);
end;
procedure TStringStream_ReadString(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TStringStream(Self).ReadString(Params[0].PValue^);
end;
procedure TStringStream_Seek(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TStringStream(Self).Seek(Params[0].PValue^,Params[1].PValue^);
end;
procedure TStringStream_WriteString(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TStringStream(Self).WriteString(Params[0].AsString);
end;
function TStringStream__GetDataString(Self:TStringStream):String;
begin
  result := Self.DataString;
end;
function TStreamAdapter__GetStream(Self:TStreamAdapter):TStream;
begin
  result := Self.Stream;
end;
function TStreamAdapter__GetStreamOwnership(Self:TStreamAdapter):TStreamOwnership;
begin
  result := Self.StreamOwnership;
end;
procedure TStreamAdapter__PutStreamOwnership(Self:TStreamAdapter;const Value: TStreamOwnership);
begin
  Self.StreamOwnership := Value;
end;
function TFiler__GetRoot(Self:TFiler):TComponent;
begin
  result := Self.Root;
end;
procedure TFiler__PutRoot(Self:TFiler;const Value: TComponent);
begin
  Self.Root := Value;
end;
function TFiler__GetLookupRoot(Self:TFiler):TComponent;
begin
  result := Self.LookupRoot;
end;
function TFiler__GetAncestor(Self:TFiler):TPersistent;
begin
  result := Self.Ancestor;
end;
procedure TFiler__PutAncestor(Self:TFiler;const Value: TPersistent);
begin
  Self.Ancestor := Value;
end;
function TFiler__GetIgnoreChildren(Self:TFiler):Boolean;
begin
  result := Self.IgnoreChildren;
end;
procedure TFiler__PutIgnoreChildren(Self:TFiler;const Value: Boolean);
begin
  Self.IgnoreChildren := Value;
end;
procedure TReader_BeginReferences(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).BeginReferences();
end;
procedure TReader_EndOfList(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TReader(Self).EndOfList();
end;
procedure TReader_EndReferences(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).EndReferences();
end;
procedure TReader_FixupReferences(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).FixupReferences();
end;
procedure TReader_FlushBuffer(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).FlushBuffer();
end;
procedure TReader_ReadBoolean(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TReader(Self).ReadBoolean();
end;
procedure TReader_ReadFloat(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := TReader(Self).ReadFloat();
end;
procedure TReader_ReadSingle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := TReader(Self).ReadSingle();
end;
procedure TReader_ReadDouble(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := TReader(Self).ReadDouble();
end;
procedure TReader_ReadIdent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TReader(Self).ReadIdent();
end;
procedure TReader_ReadInteger(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TReader(Self).ReadInteger();
end;
procedure TReader_ReadListBegin(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).ReadListBegin();
end;
procedure TReader_ReadListEnd(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).ReadListEnd();
end;
procedure TReader_ReadSignature(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).ReadSignature();
end;
procedure TReader_ReadStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TReader(Self).ReadStr();
end;
procedure TReader_ReadString(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TReader(Self).ReadString();
end;
procedure TReader_ReadVariant(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TReader(Self).ReadVariant();
end;
procedure TReader_SkipValue(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TReader(Self).SkipValue();
end;
function TReader__GetOwner(Self:TReader):TComponent;
begin
  result := Self.Owner;
end;
procedure TReader__PutOwner(Self:TReader;const Value: TComponent);
begin
  Self.Owner := Value;
end;
function TReader__GetParent(Self:TReader):TComponent;
begin
  result := Self.Parent;
end;
procedure TReader__PutParent(Self:TReader;const Value: TComponent);
begin
  Self.Parent := Value;
end;
function TReader__GetPosition(Self:TReader):Longint;
begin
  result := Self.Position;
end;
procedure TReader__PutPosition(Self:TReader;const Value: Longint);
begin
  Self.Position := Value;
end;
procedure TWriter_FlushBuffer(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).FlushBuffer();
end;
procedure TWriter_WriteBoolean(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteBoolean(Params[0].AsBoolean);
end;
procedure TWriter_WriteFloat(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteFloat(Params[0].AsDouble);
end;
procedure TWriter_WriteSingle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteSingle(Params[0].AsDouble);
end;
procedure TWriter_WriteDouble(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteDouble(Params[0].AsDouble);
end;
procedure TWriter_WriteIdent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteIdent(Params[0].AsString);
end;
procedure TWriter_WriteInteger7(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteInteger(Params[0].PValue^);
end;
procedure TWriter_WriteListBegin(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteListBegin();
end;
procedure TWriter_WriteListEnd(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteListEnd();
end;
procedure TWriter_WriteSignature(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteSignature();
end;
procedure TWriter_WriteStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteStr(Params[0].AsString);
end;
procedure TWriter_WriteString(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteString(Params[0].AsString);
end;
procedure TWriter_WriteVariant(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWriter(Self).WriteVariant(Params[0].PValue^);
end;
function TWriter__GetPosition(Self:TWriter):Longint;
begin
  result := Self.Position;
end;
procedure TWriter__PutPosition(Self:TWriter;const Value: Longint);
begin
  Self.Position := Value;
end;
function TWriter__GetRootAncestor(Self:TWriter):TComponent;
begin
  result := Self.RootAncestor;
end;
procedure TWriter__PutRootAncestor(Self:TWriter;const Value: TComponent);
begin
  Self.RootAncestor := Value;
end;
function TWriter__GetUseQualifiedNames(Self:TWriter):Boolean;
begin
  result := Self.UseQualifiedNames;
end;
procedure TWriter__PutUseQualifiedNames(Self:TWriter;const Value: Boolean);
begin
  Self.UseQualifiedNames := Value;
end;
procedure TParser_CheckTokenSymbol(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TParser(Self).CheckTokenSymbol(Params[0].AsString);
end;
procedure TParser_Error(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TParser(Self).Error(Params[0].AsString);
end;
procedure TParser_ErrorStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TParser(Self).ErrorStr(Params[0].AsString);
end;
procedure TParser_SourcePos(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TParser(Self).SourcePos();
end;
procedure TParser_TokenComponentIdent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TParser(Self).TokenComponentIdent();
end;
procedure TParser_TokenFloat(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := TParser(Self).TokenFloat();
end;
procedure TParser_TokenString(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TParser(Self).TokenString();
end;
procedure TParser_TokenSymbolIs(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TParser(Self).TokenSymbolIs(Params[0].AsString);
end;
function TParser__GetFloatType(Self:TParser):Char;
begin
  result := Self.FloatType;
end;
function TParser__GetSourceLine(Self:TParser):Integer;
begin
  result := Self.SourceLine;
end;
function TParser__GetLinePos(Self:TParser):Integer;
begin
  result := Self.LinePos;
end;
function TParser__GetToken(Self:TParser):Char;
begin
  result := Self.Token;
end;
procedure TThread_AfterConstruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThread(Self).AfterConstruction();
end;
procedure TThread_Resume(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThread(Self).Resume();
end;
procedure TThread_Suspend(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThread(Self).Suspend();
end;
procedure TThread_Terminate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TThread(Self).Terminate();
end;
function TThread__GetFatalException(Self:TThread):TObject;
begin
  result := Self.FatalException;
end;
function TThread__GetFreeOnTerminate(Self:TThread):Boolean;
begin
  result := Self.FreeOnTerminate;
end;
procedure TThread__PutFreeOnTerminate(Self:TThread;const Value: Boolean);
begin
  Self.FreeOnTerminate := Value;
end;
function TThread__GetHandle(Self:TThread):THandle;
begin
  result := Self.Handle;
end;
function TThread__GetPriority(Self:TThread):TThreadPriority;
begin
  result := Self.Priority;
end;
procedure TThread__PutPriority(Self:TThread;const Value: TThreadPriority);
begin
  Self.Priority := Value;
end;
function TThread__GetSuspended(Self:TThread):Boolean;
begin
  result := Self.Suspended;
end;
procedure TThread__PutSuspended(Self:TThread;const Value: Boolean);
begin
  Self.Suspended := Value;
end;
function TThread__GetThreadID(Self:TThread):THandle;
begin
  result := Self.ThreadID;
end;
procedure TComponentEnumerator_MoveNext(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TComponentEnumerator(Self).MoveNext();
end;
function TComponentEnumerator__GetCurrent(Self:TComponentEnumerator):TComponent;
begin
  result := Self.Current;
end;
procedure TComponent_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TComponent(Self).BeforeDestruction();
end;
procedure TComponent_DestroyComponents(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TComponent(Self).DestroyComponents();
end;
procedure TComponent_Destroying(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TComponent(Self).Destroying();
end;
procedure TComponent_FreeOnRelease(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TComponent(Self).FreeOnRelease();
end;
procedure TComponent_GetNamePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TComponent(Self).GetNamePath();
end;
procedure TComponent_HasParent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TComponent(Self).HasParent();
end;
procedure TComponent_SetSubComponent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TComponent(Self).SetSubComponent(Params[0].AsBoolean);
end;
function TComponent__GetComObject(Self:TComponent):IUnknown;
begin
  result := Self.ComObject;
end;
function TComponent__GetComponents(Self:TComponent;Index: Integer):TComponent;
begin
  result := Self.Components[Index];
end;
function TComponent__GetComponentCount(Self:TComponent):Integer;
begin
  result := Self.ComponentCount;
end;
function TComponent__GetComponentIndex(Self:TComponent):Integer;
begin
  result := Self.ComponentIndex;
end;
procedure TComponent__PutComponentIndex(Self:TComponent;const Value: Integer);
begin
  Self.ComponentIndex := Value;
end;
function TComponent__GetComponentState(Self:TComponent):TComponentState;
begin
  result := Self.ComponentState;
end;
function TComponent__GetComponentStyle(Self:TComponent):TComponentStyle;
begin
  result := Self.ComponentStyle;
end;
function TComponent__GetDesignInfo(Self:TComponent):Longint;
begin
  result := Self.DesignInfo;
end;
procedure TComponent__PutDesignInfo(Self:TComponent;const Value: Longint);
begin
  Self.DesignInfo := Value;
end;
function TComponent__GetOwner(Self:TComponent):TComponent;
begin
  result := Self.Owner;
end;
function TComponent__GetVCLComObject(Self:TComponent):Pointer;
begin
  result := Self.VCLComObject;
end;
procedure TComponent__PutVCLComObject(Self:TComponent;const Value: Pointer);
begin
  Self.VCLComObject := Value;
end;
procedure TBasicActionLink_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TBasicActionLink(Self).Update();
end;
function TBasicActionLink__GetAction(Self:TBasicActionLink):TBasicAction;
begin
  result := Self.Action;
end;
procedure TBasicActionLink__PutAction(Self:TBasicActionLink;const Value: TBasicAction);
begin
  Self.Action := Value;
end;
procedure TBasicAction_Execute(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TBasicAction(Self).Execute();
end;
procedure TBasicAction_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TBasicAction(Self).Update();
end;
function TBasicAction__GetActionComponent(Self:TBasicAction):TComponent;
begin
  result := Self.ActionComponent;
end;
procedure TBasicAction__PutActionComponent(Self:TBasicAction;const Value: TComponent);
begin
  Self.ActionComponent := Value;
end;
procedure TDataModule_AfterConstruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataModule(Self).AfterConstruction();
end;
procedure TDataModule_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDataModule(Self).BeforeDestruction();
end;
function TDataModule__GetDesignOffset(Self:TDataModule):TPoint;
begin
  result := Self.DesignOffset;
end;
procedure TDataModule__PutDesignOffset(Self:TDataModule;const Value: TPoint);
begin
  Self.DesignOffset := Value;
end;
function TDataModule__GetDesignSize(Self:TDataModule):TPoint;
begin
  result := Self.DesignSize;
end;
procedure TDataModule__PutDesignSize(Self:TDataModule;const Value: TPoint);
begin
  Self.DesignSize := Value;
end;
function PointsEqual11(const P1, P2: TPoint): Boolean; 
begin
  result := Classes.PointsEqual(P1,P2);
end;
function PointsEqual12(const P1, P2: TSmallPoint): Boolean; 
begin
  result := Classes.PointsEqual(P1,P2);
end;
procedure _InvalidPoint13(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Classes.InvalidPoint(Params[0].AsInteger,Params[1].AsInteger);
end;
function InvalidPoint14(const At: TPoint): Boolean; 
begin
  result := Classes.InvalidPoint(AT);
end;
function InvalidPoint15(const At: TSmallPoint): Boolean; 
begin
  result := Classes.InvalidPoint(AT);
end;
function Rect16(ALeft, ATop, ARight, ABottom: Integer): TRect; 
begin
  result := Classes.Rect(ALEFT,ATOP,ARIGHT,ABOTTOM);
end;
function Rect17(const ATopLeft, ABottomRight: TPoint): TRect; 
begin
  result := Classes.Rect(ATOPLEFT,ABOTTOMRIGHT);
end;
function ClassGroupOf18(AClass: TPersistentClass): TPersistentClass; 
begin
  result := Classes.ClassGroupOf(ACLASS);
end;
function ClassGroupOf19(Instance: TPersistent): TPersistentClass; 
begin
  result := Classes.ClassGroupOf(INSTANCE);
end;
procedure _IsUniqueGlobalComponentName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Classes.IsUniqueGlobalComponentName(Params[0].AsString);
end;
procedure _GlobalFixupReferences(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Classes.GlobalFixupReferences();
end;
procedure _BeginGlobalLoading(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Classes.BeginGlobalLoading();
end;
procedure _NotifyGlobalLoading(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Classes.NotifyGlobalLoading();
end;
procedure _EndGlobalLoading(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Classes.EndGlobalLoading();
end;
function GetUltimateOwner20(ACollectionItem: TCollectionItem): TPersistent; 
begin
  result := Classes.GetUltimateOwner(ACOLLECTIONITEM);
end;
function GetUltimateOwner21(ACollection: TCollection): TPersistent; 
begin
  result := Classes.GetUltimateOwner(ACOLLECTION);
end;
function GetUltimateOwner22(APersistent: TPersistent): TPersistent; 
begin
  result := Classes.GetUltimateOwner(APERSISTENT);
end;
procedure ObjectBinaryToText23(Input, Output: TStream); 
begin
  Classes.ObjectBinaryToText(INPUT,OUTPUT);
end;
procedure ObjectBinaryToText24(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); 
begin
  Classes.ObjectBinaryToText(INPUT,OUTPUT,ORIGINALFORMAT);
end;
procedure ObjectTextToBinary25(Input, Output: TStream); 
begin
  Classes.ObjectTextToBinary(INPUT,OUTPUT);
end;
procedure ObjectTextToBinary26(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); 
begin
  Classes.ObjectTextToBinary(INPUT,OUTPUT,ORIGINALFORMAT);
end;
procedure ObjectResourceToText27(Input, Output: TStream); 
begin
  Classes.ObjectResourceToText(INPUT,OUTPUT);
end;
procedure ObjectResourceToText28(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); 
begin
  Classes.ObjectResourceToText(INPUT,OUTPUT,ORIGINALFORMAT);
end;
procedure ObjectTextToResource29(Input, Output: TStream); 
begin
  Classes.ObjectTextToResource(INPUT,OUTPUT);
end;
procedure ObjectTextToResource30(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); 
begin
  Classes.ObjectTextToResource(INPUT,OUTPUT,ORIGINALFORMAT);
end;
procedure _FreeObjectInstance(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Classes.FreeObjectInstance(Params[0].AsPointer);
end;
procedure RegisterIMP_Classes;
var H: Integer;
begin
  H := RegisterNamespace('Classes', -1);
  RegisterConstant('soFromBeginning', 0, H);
  RegisterConstant('soFromCurrent', 1, H);
  RegisterConstant('soFromEnd', 2, H);
  RegisterRTTIType(TypeInfo(TSeekOrigin));
  RegisterConstant('fmCreate', $FFFF, H);
  RegisterConstant('scShift', $2000, H);
  RegisterConstant('scCtrl', $4000, H);
  RegisterConstant('scAlt', $8000, H);
  RegisterConstant('scNone', 0, H);
  RegisterRTTIType(TypeInfo(TAlignment));
  RegisterRTTIType(TypeInfo(TLeftRight));
  RegisterRTTIType(TypeInfo(TBiDiMode));
  RegisterRTTIType(TypeInfo(TVerticalAlignment));
  RegisterRTTIType(TypeInfo(TTopBottom));
  RegisterRTTIType(TypeInfo(TShiftState));
  RegisterRTTIType(TypeInfo(THelpContext));
  RegisterRTTIType(TypeInfo(THelpType));
  // Begin of class EFileStreamError
  RegisterClassType(EFileStreamError, H);
  RegisterMethod(EFileStreamError,
       'constructor Create(ResStringRec: PResStringRec; const FileName: string);',
       @EFileStreamError.Create);
  // End of class EFileStreamError
  RegisterRTTIType(TypeInfo(TDuplicates));
  RegisterRTTIType(TypeInfo(TListNotification));
  RegisterRTTIType(TypeInfo(TListAssignOp));
  // Begin of class TListEnumerator
  RegisterClassType(TListEnumerator, H);
  RegisterMethod(TListEnumerator,
       'constructor Create(AList: TList);',
       @TListEnumerator.Create);
  RegisterStdMethodEx(TListEnumerator,'GetCurrent',TListEnumerator_GetCurrent,0,[typePOINTER]);
  RegisterStdMethodEx(TListEnumerator,'MoveNext',TListEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TListEnumerator,
       'function TListEnumerator__GetCurrent(Self:TListEnumerator):Pointer;',
       @TListEnumerator__GetCurrent, true);
  RegisterProperty(TListEnumerator,
       'property Current:Pointer read TListEnumerator__GetCurrent;');
  // End of class TListEnumerator
  // Begin of class TList
  RegisterClassType(TList, H);
  RegisterMethod(TList,
       'destructor Destroy; override;',
       @TList.Destroy);
  RegisterStdMethodEx(TList,'Add',TList_Add,1,[typePOINTER,typeINTEGER]);
  RegisterStdMethodEx(TList,'Clear',TList_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TList,'Delete',TList_Delete,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TList,'Error',TList_Error1,2,[typeSTRING,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TList,'Exchange',TList_Exchange,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterMethod(TList,
       'function Expand: TList;',
       @TList.Expand);
  RegisterStdMethodEx(TList,'Extract',TList_Extract,1,[typePOINTER,typePOINTER]);
  RegisterStdMethodEx(TList,'First',TList_First,0,[typePOINTER]);
  RegisterMethod(TList,
       'function GetEnumerator: TListEnumerator;',
       @TList.GetEnumerator);
  RegisterStdMethodEx(TList,'IndexOf',TList_IndexOf,1,[typePOINTER,typeINTEGER]);
  RegisterStdMethodEx(TList,'Insert',TList_Insert,2,[typeINTEGER,typePOINTER,typeVARIANT]);
  RegisterStdMethodEx(TList,'Last',TList_Last,0,[typePOINTER]);
  RegisterStdMethodEx(TList,'Move',TList_Move,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TList,'Remove',TList_Remove,1,[typePOINTER,typeINTEGER]);
  RegisterStdMethodEx(TList,'Pack',TList_Pack,0,[typeVARIANT]);
  RegisterMethod(TList,
       'procedure Sort(Compare: TListSortCompare);',
       @TList.Sort);
  RegisterMethod(TList,
       'procedure Assign(ListA: TList; AOperator: TListAssignOp = laCopy; ListB: TList = nil);',
       @TList.Assign);
  RegisterMethod(TList,
       'function TList__GetCapacity(Self:TList):Integer;',
       @TList__GetCapacity, true);
  RegisterMethod(TList,
       'procedure TList__PutCapacity(Self:TList;const Value: Integer);',
       @TList__PutCapacity, true);
  RegisterProperty(TList,
       'property Capacity:Integer read TList__GetCapacity write TList__PutCapacity;');
  RegisterMethod(TList,
       'function TList__GetCount(Self:TList):Integer;',
       @TList__GetCount, true);
  RegisterMethod(TList,
       'procedure TList__PutCount(Self:TList;const Value: Integer);',
       @TList__PutCount, true);
  RegisterProperty(TList,
       'property Count:Integer read TList__GetCount write TList__PutCount;');
  RegisterMethod(TList,
       'function TList__GetItems(Self:TList;Index: Integer):Pointer;',
       @TList__GetItems, true);
  RegisterMethod(TList,
       'procedure TList__PutItems(Self:TList;Index: Integer;const Value: Pointer);',
       @TList__PutItems, true);
  RegisterProperty(TList,
       'property Items[Index: Integer]:Pointer read TList__GetItems write TList__PutItems;default;');
  RegisterMethod(TList,
       'function TList__GetList(Self:TList):PPointerList;',
       @TList__GetList, true);
  RegisterProperty(TList,
       'property List:PPointerList read TList__GetList;');
  RegisterMethod(TList,
       'constructor Create;',
       @TList.Create);
  // End of class TList
  // Begin of class TThreadList
  RegisterClassType(TThreadList, H);
  RegisterMethod(TThreadList,
       'constructor Create;',
       @TThreadList.Create);
  RegisterMethod(TThreadList,
       'destructor Destroy; override;',
       @TThreadList.Destroy);
  RegisterStdMethodEx(TThreadList,'Add',TThreadList_Add,1,[typePOINTER,typeVARIANT]);
  RegisterStdMethodEx(TThreadList,'Clear',TThreadList_Clear,0,[typeVARIANT]);
  RegisterMethod(TThreadList,
       'function  LockList: TList;',
       @TThreadList.LockList);
  RegisterStdMethodEx(TThreadList,'Remove',TThreadList_Remove,1,[typePOINTER,typeVARIANT]);
  RegisterStdMethodEx(TThreadList,'UnlockList',TThreadList_UnlockList,0,[typeVARIANT]);
  RegisterMethod(TThreadList,
       'function TThreadList__GetDuplicates(Self:TThreadList):TDuplicates;',
       @TThreadList__GetDuplicates, true);
  RegisterMethod(TThreadList,
       'procedure TThreadList__PutDuplicates(Self:TThreadList;const Value: TDuplicates);',
       @TThreadList__PutDuplicates, true);
  RegisterProperty(TThreadList,
       'property Duplicates:TDuplicates read TThreadList__GetDuplicates write TThreadList__PutDuplicates;');
  // End of class TThreadList
  // Begin of interface IInterfaceList
  RegisterInterfaceType('IInterfaceList',IInterfaceList,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IInterfaceList,
       'function Get(Index: Integer): IInterface;');
  RegisterInterfaceMethod(IInterfaceList,
       'function GetCapacity: Integer;');
  RegisterInterfaceMethod(IInterfaceList,
       'function GetCount: Integer;');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Put(Index: Integer; const Item: IInterface);');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure SetCapacity(NewCapacity: Integer);');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure SetCount(NewCount: Integer);');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Clear;');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Delete(Index: Integer);');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Exchange(Index1, Index2: Integer);');
  RegisterInterfaceMethod(IInterfaceList,
       'function First: IInterface;');
  RegisterInterfaceMethod(IInterfaceList,
       'function IndexOf(const Item: IInterface): Integer;');
  RegisterInterfaceMethod(IInterfaceList,
       'function Add(const Item: IInterface): Integer;');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Insert(Index: Integer; const Item: IInterface);');
  RegisterInterfaceMethod(IInterfaceList,
       'function Last: IInterface;');
  RegisterInterfaceMethod(IInterfaceList,
       'function Remove(const Item: IInterface): Integer;');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Lock;');
  RegisterInterfaceMethod(IInterfaceList,
       'procedure Unlock;');
  RegisterInterfaceProperty(IInterfaceList,'property Capacity: Integer read GetCapacity write SetCapacity;');
  RegisterInterfaceProperty(IInterfaceList,'property Count: Integer read GetCount write SetCount;');
  RegisterInterfaceProperty(IInterfaceList,'property Items[Index: Integer]: IInterface read Get write Put; default;');
  // End of interface IInterfaceList
  // Begin of class TInterfaceListEnumerator
  RegisterClassType(TInterfaceListEnumerator, H);
  RegisterMethod(TInterfaceListEnumerator,
       'constructor Create(AInterfaceList: TInterfaceList);',
       @TInterfaceListEnumerator.Create);
  RegisterMethod(TInterfaceListEnumerator,
       'function GetCurrent: IInterface;',
       @TInterfaceListEnumerator.GetCurrent);
  RegisterStdMethodEx(TInterfaceListEnumerator,'MoveNext',TInterfaceListEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TInterfaceListEnumerator,
       'function TInterfaceListEnumerator__GetCurrent(Self:TInterfaceListEnumerator):IInterface;',
       @TInterfaceListEnumerator__GetCurrent, true);
  RegisterProperty(TInterfaceListEnumerator,
       'property Current:IInterface read TInterfaceListEnumerator__GetCurrent;');
  // End of class TInterfaceListEnumerator
  // Begin of class TInterfaceList
  RegisterClassType(TInterfaceList, H);
  RegisterMethod(TInterfaceList,
       'constructor Create;',
       @TInterfaceList.Create);
  RegisterMethod(TInterfaceList,
       'destructor Destroy; override;',
       @TInterfaceList.Destroy);
  RegisterStdMethodEx(TInterfaceList,'Clear',TInterfaceList_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TInterfaceList,'Delete',TInterfaceList_Delete,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TInterfaceList,'Exchange',TInterfaceList_Exchange,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterMethod(TInterfaceList,
       'function Expand: TInterfaceList;',
       @TInterfaceList.Expand);
  RegisterMethod(TInterfaceList,
       'function First: IInterface;',
       @TInterfaceList.First);
  RegisterMethod(TInterfaceList,
       'function GetEnumerator: TInterfaceListEnumerator;',
       @TInterfaceList.GetEnumerator);
  RegisterMethod(TInterfaceList,
       'function IndexOf(const Item: IInterface): Integer;',
       @TInterfaceList.IndexOf);
  RegisterMethod(TInterfaceList,
       'function Add(const Item: IInterface): Integer;',
       @TInterfaceList.Add);
  RegisterMethod(TInterfaceList,
       'procedure Insert(Index: Integer; const Item: IInterface);',
       @TInterfaceList.Insert);
  RegisterMethod(TInterfaceList,
       'function Last: IInterface;',
       @TInterfaceList.Last);
  RegisterMethod(TInterfaceList,
       'function Remove(const Item: IInterface): Integer;',
       @TInterfaceList.Remove);
  RegisterStdMethodEx(TInterfaceList,'Lock',TInterfaceList_Lock,0,[typeVARIANT]);
  RegisterStdMethodEx(TInterfaceList,'Unlock',TInterfaceList_Unlock,0,[typeVARIANT]);
  RegisterMethod(TInterfaceList,
       'function TInterfaceList__GetCapacity(Self:TInterfaceList):Integer;',
       @TInterfaceList__GetCapacity, true);
  RegisterMethod(TInterfaceList,
       'procedure TInterfaceList__PutCapacity(Self:TInterfaceList;const Value: Integer);',
       @TInterfaceList__PutCapacity, true);
  RegisterProperty(TInterfaceList,
       'property Capacity:Integer read TInterfaceList__GetCapacity write TInterfaceList__PutCapacity;');
  RegisterMethod(TInterfaceList,
       'function TInterfaceList__GetCount(Self:TInterfaceList):Integer;',
       @TInterfaceList__GetCount, true);
  RegisterMethod(TInterfaceList,
       'procedure TInterfaceList__PutCount(Self:TInterfaceList;const Value: Integer);',
       @TInterfaceList__PutCount, true);
  RegisterProperty(TInterfaceList,
       'property Count:Integer read TInterfaceList__GetCount write TInterfaceList__PutCount;');
  RegisterMethod(TInterfaceList,
       'function TInterfaceList__GetItems(Self:TInterfaceList;Index: Integer):IInterface;',
       @TInterfaceList__GetItems, true);
  RegisterMethod(TInterfaceList,
       'procedure TInterfaceList__PutItems(Self:TInterfaceList;Index: Integer;const Value: IInterface);',
       @TInterfaceList__PutItems, true);
  RegisterProperty(TInterfaceList,
       'property Items[Index: Integer]:IInterface read TInterfaceList__GetItems write TInterfaceList__PutItems;default;');
  // End of class TInterfaceList
  // Begin of class TBits
  RegisterClassType(TBits, H);
  RegisterMethod(TBits,
       'destructor Destroy; override;',
       @TBits.Destroy);
  RegisterStdMethodEx(TBits,'OpenBit',TBits_OpenBit,0,[typeINTEGER]);
  RegisterMethod(TBits,
       'function TBits__GetBits(Self:TBits;Index: Integer):Boolean;',
       @TBits__GetBits, true);
  RegisterMethod(TBits,
       'procedure TBits__PutBits(Self:TBits;Index: Integer;const Value: Boolean);',
       @TBits__PutBits, true);
  RegisterProperty(TBits,
       'property Bits[Index: Integer]:Boolean read TBits__GetBits write TBits__PutBits;default;');
  RegisterMethod(TBits,
       'function TBits__GetSize(Self:TBits):Integer;',
       @TBits__GetSize, true);
  RegisterMethod(TBits,
       'procedure TBits__PutSize(Self:TBits;const Value: Integer);',
       @TBits__PutSize, true);
  RegisterProperty(TBits,
       'property Size:Integer read TBits__GetSize write TBits__PutSize;');
  RegisterMethod(TBits,
       'constructor Create;',
       @TBits.Create);
  // End of class TBits
  // Begin of class TPersistent
  RegisterClassType(TPersistent, H);
  RegisterMethod(TPersistent,
       'destructor Destroy; override;',
       @TPersistent.Destroy);
  RegisterMethod(TPersistent,
       'procedure Assign(Source: TPersistent); virtual;',
       @TPersistent.Assign);
  RegisterStdMethodEx(TPersistent,'GetNamePath',TPersistent_GetNamePath,0,[typeSTRING]);
  RegisterMethod(TPersistent,
       'constructor Create;',
       @TPersistent.Create);
  // End of class TPersistent
  // Begin of class TInterfacedPersistent
  RegisterClassType(TInterfacedPersistent, H);
  RegisterMethod(TInterfacedPersistent,
       'function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;',
       @TInterfacedPersistent.QueryInterface);
  RegisterStdMethodEx(TInterfacedPersistent,'AfterConstruction',TInterfacedPersistent_AfterConstruction,0,[typeVARIANT]);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TInterfacedPersistent
  // Begin of class TRecall
  RegisterClassType(TRecall, H);
  RegisterMethod(TRecall,
       'constructor Create(AStorage, AReference: TPersistent);',
       @TRecall.Create);
  RegisterMethod(TRecall,
       'destructor Destroy; override;',
       @TRecall.Destroy);
  RegisterStdMethodEx(TRecall,'Store',TRecall_Store,0,[typeVARIANT]);
  RegisterStdMethodEx(TRecall,'Forget',TRecall_Forget,0,[typeVARIANT]);
  RegisterMethod(TRecall,
       'function TRecall__GetReference(Self:TRecall):TPersistent;',
       @TRecall__GetReference, true);
  RegisterProperty(TRecall,
       'property Reference:TPersistent read TRecall__GetReference;');
  // End of class TRecall
  // Begin of class TCollectionItem
  RegisterClassType(TCollectionItem, H);
  RegisterMethod(TCollectionItem,
       'constructor Create(Collection: TCollection); virtual;',
       @TCollectionItem.Create);
  RegisterMethod(TCollectionItem,
       'destructor Destroy; override;',
       @TCollectionItem.Destroy);
  RegisterStdMethodEx(TCollectionItem,'GetNamePath',TCollectionItem_GetNamePath,0,[typeSTRING]);
  RegisterMethod(TCollectionItem,
       'function TCollectionItem__GetCollection(Self:TCollectionItem):TCollection;',
       @TCollectionItem__GetCollection, true);
  RegisterMethod(TCollectionItem,
       'procedure TCollectionItem__PutCollection(Self:TCollectionItem;const Value: TCollection);',
       @TCollectionItem__PutCollection, true);
  RegisterProperty(TCollectionItem,
       'property Collection:TCollection read TCollectionItem__GetCollection write TCollectionItem__PutCollection;');
  RegisterMethod(TCollectionItem,
       'function TCollectionItem__GetID(Self:TCollectionItem):Integer;',
       @TCollectionItem__GetID, true);
  RegisterProperty(TCollectionItem,
       'property ID:Integer read TCollectionItem__GetID;');
  RegisterMethod(TCollectionItem,
       'function TCollectionItem__GetIndex(Self:TCollectionItem):Integer;',
       @TCollectionItem__GetIndex, true);
  RegisterMethod(TCollectionItem,
       'procedure TCollectionItem__PutIndex(Self:TCollectionItem;const Value: Integer);',
       @TCollectionItem__PutIndex, true);
  RegisterProperty(TCollectionItem,
       'property Index:Integer read TCollectionItem__GetIndex write TCollectionItem__PutIndex;');
  RegisterMethod(TCollectionItem,
       'function TCollectionItem__GetDisplayName(Self:TCollectionItem):String;',
       @TCollectionItem__GetDisplayName, true);
  RegisterMethod(TCollectionItem,
       'procedure TCollectionItem__PutDisplayName(Self:TCollectionItem;const Value: String);',
       @TCollectionItem__PutDisplayName, true);
  RegisterProperty(TCollectionItem,
       'property DisplayName:String read TCollectionItem__GetDisplayName write TCollectionItem__PutDisplayName;');
  // End of class TCollectionItem
  RegisterRTTIType(TypeInfo(TCollectionNotification));
  // Begin of class TCollectionEnumerator
  RegisterClassType(TCollectionEnumerator, H);
  RegisterMethod(TCollectionEnumerator,
       'constructor Create(ACollection: TCollection);',
       @TCollectionEnumerator.Create);
  RegisterMethod(TCollectionEnumerator,
       'function GetCurrent: TCollectionItem;',
       @TCollectionEnumerator.GetCurrent);
  RegisterStdMethodEx(TCollectionEnumerator,'MoveNext',TCollectionEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TCollectionEnumerator,
       'function TCollectionEnumerator__GetCurrent(Self:TCollectionEnumerator):TCollectionItem;',
       @TCollectionEnumerator__GetCurrent, true);
  RegisterProperty(TCollectionEnumerator,
       'property Current:TCollectionItem read TCollectionEnumerator__GetCurrent;');
  // End of class TCollectionEnumerator
  // Begin of class TCollection
  RegisterClassType(TCollection, H);
  RegisterMethod(TCollection,
       'constructor Create(ItemClass: TCollectionItemClass);',
       @TCollection.Create);
  RegisterMethod(TCollection,
       'destructor Destroy; override;',
       @TCollection.Destroy);
  RegisterMethod(TCollection,
       'function Owner: TPersistent;',
       @TCollection.Owner);
  RegisterMethod(TCollection,
       'function Add: TCollectionItem;',
       @TCollection.Add);
  RegisterMethod(TCollection,
       'procedure Assign(Source: TPersistent); override;',
       @TCollection.Assign);
  RegisterStdMethodEx(TCollection,'BeginUpdate',TCollection_BeginUpdate,0,[typeVARIANT]);
  RegisterStdMethodEx(TCollection,'Clear',TCollection_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TCollection,'Delete',TCollection_Delete,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TCollection,'EndUpdate',TCollection_EndUpdate,0,[typeVARIANT]);
  RegisterMethod(TCollection,
       'function FindItemID(ID: Integer): TCollectionItem;',
       @TCollection.FindItemID);
  RegisterMethod(TCollection,
       'function GetEnumerator: TCollectionEnumerator;',
       @TCollection.GetEnumerator);
  RegisterStdMethodEx(TCollection,'GetNamePath',TCollection_GetNamePath,0,[typeSTRING]);
  RegisterMethod(TCollection,
       'function Insert(Index: Integer): TCollectionItem;',
       @TCollection.Insert);
  RegisterMethod(TCollection,
       'function TCollection__GetCount(Self:TCollection):Integer;',
       @TCollection__GetCount, true);
  RegisterProperty(TCollection,
       'property Count:Integer read TCollection__GetCount;');
  RegisterMethod(TCollection,
       'function TCollection__GetItemClass(Self:TCollection):TCollectionItemClass;',
       @TCollection__GetItemClass, true);
  RegisterProperty(TCollection,
       'property ItemClass:TCollectionItemClass read TCollection__GetItemClass;');
  RegisterMethod(TCollection,
       'function TCollection__GetItems(Self:TCollection;Index: Integer):TCollectionItem;',
       @TCollection__GetItems, true);
  RegisterMethod(TCollection,
       'procedure TCollection__PutItems(Self:TCollection;Index: Integer;const Value: TCollectionItem);',
       @TCollection__PutItems, true);
  RegisterProperty(TCollection,
       'property Items[Index: Integer]:TCollectionItem read TCollection__GetItems write TCollection__PutItems;');
  // End of class TCollection
  // Begin of class TOwnedCollection
  RegisterClassType(TOwnedCollection, H);
  RegisterMethod(TOwnedCollection,
       'constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);',
       @TOwnedCollection.Create);
  // End of class TOwnedCollection
  // Begin of interface IStringsAdapter
  RegisterInterfaceType('IStringsAdapter',IStringsAdapter,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IStringsAdapter,
       'procedure ReferenceStrings(S: TStrings);');
  RegisterInterfaceMethod(IStringsAdapter,
       'procedure ReleaseStrings;');
  // End of interface IStringsAdapter
  RegisterRTTIType(TypeInfo(TStringsDefined));
  // Begin of class TStringsEnumerator
  RegisterClassType(TStringsEnumerator, H);
  RegisterMethod(TStringsEnumerator,
       'constructor Create(AStrings: TStrings);',
       @TStringsEnumerator.Create);
  RegisterStdMethodEx(TStringsEnumerator,'GetCurrent',TStringsEnumerator_GetCurrent,0,[typeSTRING]);
  RegisterStdMethodEx(TStringsEnumerator,'MoveNext',TStringsEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TStringsEnumerator,
       'function TStringsEnumerator__GetCurrent(Self:TStringsEnumerator):String;',
       @TStringsEnumerator__GetCurrent, true);
  RegisterProperty(TStringsEnumerator,
       'property Current:String read TStringsEnumerator__GetCurrent;');
  // End of class TStringsEnumerator
  // Begin of class TStrings
  RegisterClassType(TStrings, H);
  RegisterMethod(TStrings,
       'destructor Destroy; override;',
       @TStrings.Destroy);
  RegisterStdMethodEx(TStrings,'Add',TStrings_Add,1,[typeSTRING,typeINTEGER]);
  RegisterMethod(TStrings,
       'function AddObject(const S: string; AObject: TObject): Integer; virtual;',
       @TStrings.AddObject);
  RegisterStdMethodEx(TStrings,'Append',TStrings_Append,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TStrings,
       'procedure AddStrings(Strings: TStrings); virtual;',
       @TStrings.AddStrings);
  RegisterMethod(TStrings,
       'procedure Assign(Source: TPersistent); override;',
       @TStrings.Assign);
  RegisterStdMethodEx(TStrings,'BeginUpdate',TStrings_BeginUpdate,0,[typeVARIANT]);
  RegisterStdMethodEx(TStrings,'EndUpdate',TStrings_EndUpdate,0,[typeVARIANT]);
  RegisterMethod(TStrings,
       'function Equals(Strings: TStrings): Boolean;',
       @TStrings.Equals);
  RegisterStdMethodEx(TStrings,'Exchange',TStrings_Exchange,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterMethod(TStrings,
       'function GetEnumerator: TStringsEnumerator;',
       @TStrings.GetEnumerator);
  RegisterMethod(TStrings,
       'function GetText: PChar; virtual;',
       @TStrings.GetText);
  RegisterStdMethodEx(TStrings,'IndexOf',TStrings_IndexOf,1,[typeSTRING,typeINTEGER]);
  RegisterStdMethodEx(TStrings,'IndexOfName',TStrings_IndexOfName,1,[typeSTRING,typeINTEGER]);
  RegisterMethod(TStrings,
       'function IndexOfObject(AObject: TObject): Integer; virtual;',
       @TStrings.IndexOfObject);
  RegisterMethod(TStrings,
       'procedure InsertObject(Index: Integer; const S: string;      AObject: TObject); virtual;',
       @TStrings.InsertObject);
  RegisterStdMethodEx(TStrings,'LoadFromFile',TStrings_LoadFromFile,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TStrings,
       'procedure LoadFromStream(Stream: TStream); virtual;',
       @TStrings.LoadFromStream);
  RegisterStdMethodEx(TStrings,'Move',TStrings_Move,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TStrings,'SaveToFile',TStrings_SaveToFile,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TStrings,
       'procedure SaveToStream(Stream: TStream); virtual;',
       @TStrings.SaveToStream);
  RegisterMethod(TStrings,
       'procedure SetText(Text: PChar); virtual;',
       @TStrings.SetText);
  RegisterMethod(TStrings,
       'function TStrings__GetCapacity(Self:TStrings):Integer;',
       @TStrings__GetCapacity, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutCapacity(Self:TStrings;const Value: Integer);',
       @TStrings__PutCapacity, true);
  RegisterProperty(TStrings,
       'property Capacity:Integer read TStrings__GetCapacity write TStrings__PutCapacity;');
  RegisterMethod(TStrings,
       'function TStrings__GetCommaText(Self:TStrings):String;',
       @TStrings__GetCommaText, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutCommaText(Self:TStrings;const Value: String);',
       @TStrings__PutCommaText, true);
  RegisterProperty(TStrings,
       'property CommaText:String read TStrings__GetCommaText write TStrings__PutCommaText;');
  RegisterMethod(TStrings,
       'function TStrings__GetCount(Self:TStrings):Integer;',
       @TStrings__GetCount, true);
  RegisterProperty(TStrings,
       'property Count:Integer read TStrings__GetCount;');
  RegisterMethod(TStrings,
       'function TStrings__GetDelimiter(Self:TStrings):Char;',
       @TStrings__GetDelimiter, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutDelimiter(Self:TStrings;const Value: Char);',
       @TStrings__PutDelimiter, true);
  RegisterProperty(TStrings,
       'property Delimiter:Char read TStrings__GetDelimiter write TStrings__PutDelimiter;');
  RegisterMethod(TStrings,
       'function TStrings__GetDelimitedText(Self:TStrings):String;',
       @TStrings__GetDelimitedText, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutDelimitedText(Self:TStrings;const Value: String);',
       @TStrings__PutDelimitedText, true);
  RegisterProperty(TStrings,
       'property DelimitedText:String read TStrings__GetDelimitedText write TStrings__PutDelimitedText;');
  RegisterMethod(TStrings,
       'function TStrings__GetLineBreak(Self:TStrings):String;',
       @TStrings__GetLineBreak, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutLineBreak(Self:TStrings;const Value: String);',
       @TStrings__PutLineBreak, true);
  RegisterProperty(TStrings,
       'property LineBreak:String read TStrings__GetLineBreak write TStrings__PutLineBreak;');
  RegisterMethod(TStrings,
       'function TStrings__GetNames(Self:TStrings;Index: Integer):String;',
       @TStrings__GetNames, true);
  RegisterProperty(TStrings,
       'property Names[Index: Integer]:String read TStrings__GetNames;');
  RegisterMethod(TStrings,
       'function TStrings__GetObjects(Self:TStrings;Index: Integer):TObject;',
       @TStrings__GetObjects, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutObjects(Self:TStrings;Index: Integer;const Value: TObject);',
       @TStrings__PutObjects, true);
  RegisterProperty(TStrings,
       'property Objects[Index: Integer]:TObject read TStrings__GetObjects write TStrings__PutObjects;');
  RegisterMethod(TStrings,
       'function TStrings__GetQuoteChar(Self:TStrings):Char;',
       @TStrings__GetQuoteChar, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutQuoteChar(Self:TStrings;const Value: Char);',
       @TStrings__PutQuoteChar, true);
  RegisterProperty(TStrings,
       'property QuoteChar:Char read TStrings__GetQuoteChar write TStrings__PutQuoteChar;');
  RegisterMethod(TStrings,
       'function TStrings__GetValues(Self:TStrings;const Name: string):String;',
       @TStrings__GetValues, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutValues(Self:TStrings;const Name: string;const Value: String);',
       @TStrings__PutValues, true);
  RegisterProperty(TStrings,
       'property Values[const Name: string]:String read TStrings__GetValues write TStrings__PutValues;');
  RegisterMethod(TStrings,
       'function TStrings__GetValueFromIndex(Self:TStrings;Index: Integer):String;',
       @TStrings__GetValueFromIndex, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutValueFromIndex(Self:TStrings;Index: Integer;const Value: String);',
       @TStrings__PutValueFromIndex, true);
  RegisterProperty(TStrings,
       'property ValueFromIndex[Index: Integer]:String read TStrings__GetValueFromIndex write TStrings__PutValueFromIndex;');
  RegisterMethod(TStrings,
       'function TStrings__GetNameValueSeparator(Self:TStrings):Char;',
       @TStrings__GetNameValueSeparator, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutNameValueSeparator(Self:TStrings;const Value: Char);',
       @TStrings__PutNameValueSeparator, true);
  RegisterProperty(TStrings,
       'property NameValueSeparator:Char read TStrings__GetNameValueSeparator write TStrings__PutNameValueSeparator;');
  RegisterMethod(TStrings,
       'function TStrings__GetStrings(Self:TStrings;Index: Integer):String;',
       @TStrings__GetStrings, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutStrings(Self:TStrings;Index: Integer;const Value: String);',
       @TStrings__PutStrings, true);
  RegisterProperty(TStrings,
       'property Strings[Index: Integer]:String read TStrings__GetStrings write TStrings__PutStrings;default;');
  RegisterMethod(TStrings,
       'function TStrings__GetText(Self:TStrings):String;',
       @TStrings__GetText, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutText(Self:TStrings;const Value: String);',
       @TStrings__PutText, true);
  RegisterProperty(TStrings,
       'property Text:String read TStrings__GetText write TStrings__PutText;');
  RegisterMethod(TStrings,
       'function TStrings__GetStringsAdapter(Self:TStrings):IStringsAdapter;',
       @TStrings__GetStringsAdapter, true);
  RegisterMethod(TStrings,
       'procedure TStrings__PutStringsAdapter(Self:TStrings;const Value: IStringsAdapter);',
       @TStrings__PutStringsAdapter, true);
  RegisterProperty(TStrings,
       'property StringsAdapter:IStringsAdapter read TStrings__GetStringsAdapter write TStrings__PutStringsAdapter;');
  RegisterMethod(TStrings,
       'constructor Create;',
       @TStrings.Create);
  // End of class TStrings
  // Begin of class TStringList
  RegisterClassType(TStringList, H);
  RegisterMethod(TStringList,
       'destructor Destroy; override;',
       @TStringList.Destroy);
  RegisterStdMethodEx(TStringList,'Add',TStringList_Add,1,[typeSTRING,typeINTEGER]);
  RegisterMethod(TStringList,
       'function AddObject(const S: string; AObject: TObject): Integer; override;',
       @TStringList.AddObject);
  RegisterStdMethodEx(TStringList,'Clear',TStringList_Clear,0,[typeVARIANT]);
  RegisterStdMethodEx(TStringList,'Delete',TStringList_Delete,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TStringList,'Exchange',TStringList_Exchange,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterMethod(TStringList,
       'function Find(const S: string; var Index: Integer): Boolean; virtual;',
       @TStringList.Find);
  RegisterStdMethodEx(TStringList,'IndexOf',TStringList_IndexOf,1,[typeSTRING,typeINTEGER]);
  RegisterStdMethodEx(TStringList,'Insert',TStringList_Insert,2,[typeINTEGER,typeSTRING,typeVARIANT]);
  RegisterMethod(TStringList,
       'procedure InsertObject(Index: Integer; const S: string;      AObject: TObject); override;',
       @TStringList.InsertObject);
  RegisterStdMethodEx(TStringList,'Sort',TStringList_Sort,0,[typeVARIANT]);
  RegisterMethod(TStringList,
       'procedure CustomSort(Compare: TStringListSortCompare); virtual;',
       @TStringList.CustomSort);
  RegisterMethod(TStringList,
       'function TStringList__GetDuplicates(Self:TStringList):TDuplicates;',
       @TStringList__GetDuplicates, true);
  RegisterMethod(TStringList,
       'procedure TStringList__PutDuplicates(Self:TStringList;const Value: TDuplicates);',
       @TStringList__PutDuplicates, true);
  RegisterProperty(TStringList,
       'property Duplicates:TDuplicates read TStringList__GetDuplicates write TStringList__PutDuplicates;');
  RegisterMethod(TStringList,
       'function TStringList__GetSorted(Self:TStringList):Boolean;',
       @TStringList__GetSorted, true);
  RegisterMethod(TStringList,
       'procedure TStringList__PutSorted(Self:TStringList;const Value: Boolean);',
       @TStringList__PutSorted, true);
  RegisterProperty(TStringList,
       'property Sorted:Boolean read TStringList__GetSorted write TStringList__PutSorted;');
  RegisterMethod(TStringList,
       'function TStringList__GetCaseSensitive(Self:TStringList):Boolean;',
       @TStringList__GetCaseSensitive, true);
  RegisterMethod(TStringList,
       'procedure TStringList__PutCaseSensitive(Self:TStringList;const Value: Boolean);',
       @TStringList__PutCaseSensitive, true);
  RegisterProperty(TStringList,
       'property CaseSensitive:Boolean read TStringList__GetCaseSensitive write TStringList__PutCaseSensitive;');
  RegisterMethod(TStringList,
       'constructor Create;',
       @TStringList.Create);
  // End of class TStringList
  // Begin of class TStream
  RegisterClassType(TStream, H);
  RegisterStdMethod(TStream,'Seek',TStream_Seek3,2);
  RegisterMethod(TStream,
       'procedure ReadBuffer(var Buffer; Count: Longint);',
       @TStream.ReadBuffer);
  RegisterMethod(TStream,
       'procedure WriteBuffer(const Buffer; Count: Longint);',
       @TStream.WriteBuffer);
  RegisterMethod(TStream,
       'function CopyFrom(Source: TStream; Count: Int64): Int64;',
       @TStream.CopyFrom);
  RegisterMethod(TStream,
       'function ReadComponent(Instance: TComponent): TComponent;',
       @TStream.ReadComponent);
  RegisterMethod(TStream,
       'function ReadComponentRes(Instance: TComponent): TComponent;',
       @TStream.ReadComponentRes);
  RegisterMethod(TStream,
       'procedure WriteComponent(Instance: TComponent);',
       @TStream.WriteComponent);
  RegisterMethod(TStream,
       'procedure WriteComponentRes(const ResName: string; Instance: TComponent);',
       @TStream.WriteComponentRes);
  RegisterMethod(TStream,
       'procedure WriteDescendent(Instance, Ancestor: TComponent);',
       @TStream.WriteDescendent);
  RegisterMethod(TStream,
       'procedure WriteDescendentRes(const ResName: string; Instance, Ancestor: TComponent);',
       @TStream.WriteDescendentRes);
  RegisterMethod(TStream,
       'procedure WriteResourceHeader(const ResName: string; out FixupInfo: Integer);',
       @TStream.WriteResourceHeader);
  RegisterStdMethodEx(TStream,'FixupResourceHeader',TStream_FixupResourceHeader,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TStream,'ReadResHeader',TStream_ReadResHeader,0,[typeVARIANT]);
  RegisterMethod(TStream,
       'function TStream__GetPosition(Self:TStream):Int64;',
       @TStream__GetPosition, true);
  RegisterMethod(TStream,
       'procedure TStream__PutPosition(Self:TStream;const Value: Int64);',
       @TStream__PutPosition, true);
  RegisterProperty(TStream,
       'property Position:Int64 read TStream__GetPosition write TStream__PutPosition;');
  RegisterMethod(TStream,
       'function TStream__GetSize(Self:TStream):Int64;',
       @TStream__GetSize, true);
  RegisterMethod(TStream,
       'procedure TStream__PutSize(Self:TStream;const Value: Int64);',
       @TStream__PutSize, true);
  RegisterProperty(TStream,
       'property Size:Int64 read TStream__GetSize write TStream__PutSize;');
  RegisterMethod(TStream,
       'constructor Create;',
       @TStream.Create);
  // End of class TStream
  // Begin of interface IStreamPersist
  RegisterInterfaceType('IStreamPersist',IStreamPersist,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IStreamPersist,
       'procedure LoadFromStream(Stream: TStream);');
  RegisterInterfaceMethod(IStreamPersist,
       'procedure SaveToStream(Stream: TStream);');
  // End of interface IStreamPersist
  // Begin of class THandleStream
  RegisterClassType(THandleStream, H);
  RegisterMethod(THandleStream,
       'constructor Create(AHandle: Integer);',
       @THandleStream.Create);
  RegisterMethod(THandleStream,
       'function Read(var Buffer; Count: Longint): Longint; override;',
       @THandleStream.Read);
  RegisterMethod(THandleStream,
       'function Write(const Buffer; Count: Longint): Longint; override;',
       @THandleStream.Write);
  RegisterMethod(THandleStream,
       'function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;',
       @THandleStream.Seek);
  RegisterMethod(THandleStream,
       'function THandleStream__GetHandle(Self:THandleStream):Integer;',
       @THandleStream__GetHandle, true);
  RegisterProperty(THandleStream,
       'property Handle:Integer read THandleStream__GetHandle;');
  // End of class THandleStream
  // Begin of class TFileStream
  RegisterClassType(TFileStream, H);
  RegisterMethod(TFileStream,
       'destructor Destroy; override;',
       @TFileStream.Destroy);
  // End of class TFileStream
  // Begin of class TCustomMemoryStream
  RegisterClassType(TCustomMemoryStream, H);
  RegisterMethod(TCustomMemoryStream,
       'function Read(var Buffer; Count: Longint): Longint; override;',
       @TCustomMemoryStream.Read);
  RegisterStdMethod(TCustomMemoryStream,'Seek',TCustomMemoryStream_Seek,2);
  RegisterMethod(TCustomMemoryStream,
       'procedure SaveToStream(Stream: TStream);',
       @TCustomMemoryStream.SaveToStream);
  RegisterStdMethodEx(TCustomMemoryStream,'SaveToFile',TCustomMemoryStream_SaveToFile,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TCustomMemoryStream,
       'function TCustomMemoryStream__GetMemory(Self:TCustomMemoryStream):Pointer;',
       @TCustomMemoryStream__GetMemory, true);
  RegisterProperty(TCustomMemoryStream,
       'property Memory:Pointer read TCustomMemoryStream__GetMemory;');
  RegisterMethod(TCustomMemoryStream,
       'constructor Create;',
       @TCustomMemoryStream.Create);
  // End of class TCustomMemoryStream
  // Begin of class TMemoryStream
  RegisterClassType(TMemoryStream, H);
  RegisterMethod(TMemoryStream,
       'destructor Destroy; override;',
       @TMemoryStream.Destroy);
  RegisterStdMethodEx(TMemoryStream,'Clear',TMemoryStream_Clear,0,[typeVARIANT]);
  RegisterMethod(TMemoryStream,
       'procedure LoadFromStream(Stream: TStream);',
       @TMemoryStream.LoadFromStream);
  RegisterStdMethodEx(TMemoryStream,'LoadFromFile',TMemoryStream_LoadFromFile,1,[typeSTRING,typeVARIANT]);
  RegisterStdMethod(TMemoryStream,'SetSize',TMemoryStream_SetSize,1);
  RegisterMethod(TMemoryStream,
       'function Write(const Buffer; Count: Longint): Longint; override;',
       @TMemoryStream.Write);
  RegisterMethod(TMemoryStream,
       'constructor Create;',
       @TMemoryStream.Create);
  // End of class TMemoryStream
  // Begin of class TStringStream
  RegisterClassType(TStringStream, H);
  RegisterMethod(TStringStream,
       'constructor Create(const AString: string);',
       @TStringStream.Create);
  RegisterMethod(TStringStream,
       'function Read(var Buffer; Count: Longint): Longint; override;',
       @TStringStream.Read);
  RegisterStdMethod(TStringStream,'ReadString',TStringStream_ReadString,1);
  RegisterStdMethod(TStringStream,'Seek',TStringStream_Seek,2);
  RegisterMethod(TStringStream,
       'function Write(const Buffer; Count: Longint): Longint; override;',
       @TStringStream.Write);
  RegisterStdMethodEx(TStringStream,'WriteString',TStringStream_WriteString,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TStringStream,
       'function TStringStream__GetDataString(Self:TStringStream):String;',
       @TStringStream__GetDataString, true);
  RegisterProperty(TStringStream,
       'property DataString:String read TStringStream__GetDataString;');
  // End of class TStringStream
  // Begin of class TResourceStream
  RegisterClassType(TResourceStream, H);
  RegisterMethod(TResourceStream,
       'constructor Create(Instance: THandle; const ResName: string; ResType: PChar);',
       @TResourceStream.Create);
  RegisterMethod(TResourceStream,
       'constructor CreateFromID(Instance: THandle; ResID: Integer; ResType: PChar);',
       @TResourceStream.CreateFromID);
  RegisterMethod(TResourceStream,
       'destructor Destroy; override;',
       @TResourceStream.Destroy);
  RegisterMethod(TResourceStream,
       'function Write(const Buffer; Count: Longint): Longint; override;',
       @TResourceStream.Write);
  // End of class TResourceStream
  RegisterRTTIType(TypeInfo(TStreamOwnership));
  // Begin of class TStreamAdapter
  RegisterClassType(TStreamAdapter, H);
  RegisterMethod(TStreamAdapter,
       'constructor Create(Stream: TStream; Ownership: TStreamOwnership = soReference);',
       @TStreamAdapter.Create);
  RegisterMethod(TStreamAdapter,
       'destructor Destroy; override;',
       @TStreamAdapter.Destroy);
  RegisterMethod(TStreamAdapter,
       'function Read(pv: Pointer; cb: Longint;      pcbRead: PLongint): HResult; virtual; stdcall;',
       @TStreamAdapter.Read);
  RegisterMethod(TStreamAdapter,
       'function Write(pv: Pointer; cb: Longint;      pcbWritten: PLongint): HResult; virtual; stdcall;',
       @TStreamAdapter.Write);
  RegisterMethod(TStreamAdapter,
       'function Seek(dlibMove: Largeint; dwOrigin: Longint;      out libNewPosition: Largeint): HResult; virtual; stdcall;',
       @TStreamAdapter.Seek);
  RegisterMethod(TStreamAdapter,
       'function SetSize(libNewSize: Largeint): HResult; virtual; stdcall;',
       @TStreamAdapter.SetSize);
  RegisterMethod(TStreamAdapter,
       'function CopyTo(stm: IStream; cb: Largeint; out cbRead: Largeint;      out cbWritten: Largeint): HResult; virtual; stdcall;',
       @TStreamAdapter.CopyTo);
  RegisterMethod(TStreamAdapter,
       'function Commit(grfCommitFlags: Longint): HResult; virtual; stdcall;',
       @TStreamAdapter.Commit);
  RegisterMethod(TStreamAdapter,
       'function Revert: HResult; virtual; stdcall;',
       @TStreamAdapter.Revert);
  RegisterMethod(TStreamAdapter,
       'function LockRegion(libOffset: Largeint; cb: Largeint;      dwLockType: Longint): HResult; virtual; stdcall;',
       @TStreamAdapter.LockRegion);
  RegisterMethod(TStreamAdapter,
       'function UnlockRegion(libOffset: Largeint; cb: Largeint;      dwLockType: Longint): HResult; virtual; stdcall;',
       @TStreamAdapter.UnlockRegion);
  RegisterMethod(TStreamAdapter,
       'function Stat(out statstg: TStatStg;      grfStatFlag: Longint): HResult; virtual; stdcall;',
       @TStreamAdapter.Stat);
  RegisterMethod(TStreamAdapter,
       'function Clone(out stm: IStream): HResult; virtual; stdcall;',
       @TStreamAdapter.Clone);
  RegisterMethod(TStreamAdapter,
       'function TStreamAdapter__GetStream(Self:TStreamAdapter):TStream;',
       @TStreamAdapter__GetStream, true);
  RegisterProperty(TStreamAdapter,
       'property Stream:TStream read TStreamAdapter__GetStream;');
  RegisterMethod(TStreamAdapter,
       'function TStreamAdapter__GetStreamOwnership(Self:TStreamAdapter):TStreamOwnership;',
       @TStreamAdapter__GetStreamOwnership, true);
  RegisterMethod(TStreamAdapter,
       'procedure TStreamAdapter__PutStreamOwnership(Self:TStreamAdapter;const Value: TStreamOwnership);',
       @TStreamAdapter__PutStreamOwnership, true);
  RegisterProperty(TStreamAdapter,
       'property StreamOwnership:TStreamOwnership read TStreamAdapter__GetStreamOwnership write TStreamAdapter__PutStreamOwnership;');
  // End of class TStreamAdapter
  // Begin of class TClassFinder
  RegisterClassType(TClassFinder, H);
  RegisterMethod(TClassFinder,
       'constructor Create(AClass: TPersistentClass = nil;      AIncludeActiveGroups: Boolean = False);',
       @TClassFinder.Create);
  RegisterMethod(TClassFinder,
       'destructor Destroy; override;',
       @TClassFinder.Destroy);
  RegisterMethod(TClassFinder,
       'function GetClass(const AClassName: string): TPersistentClass;',
       @TClassFinder.GetClass);
  RegisterMethod(TClassFinder,
       'procedure GetClasses(Proc: TGetClass);',
       @TClassFinder.GetClasses);
  // End of class TClassFinder
  RegisterRTTIType(TypeInfo(TValueType));
  RegisterRTTIType(TypeInfo(TFilerFlag));
  RegisterRTTIType(TypeInfo(TFilerFlags));
  // Begin of interface IInterfaceComponentReference
  RegisterInterfaceType('IInterfaceComponentReference',IInterfaceComponentReference,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IInterfaceComponentReference,
       'function GetComponent: TComponent;');
  // End of interface IInterfaceComponentReference
  // Begin of class TFiler
  RegisterClassType(TFiler, H);
  RegisterMethod(TFiler,
       'constructor Create(Stream: TStream; BufSize: Integer);',
       @TFiler.Create);
  RegisterMethod(TFiler,
       'destructor Destroy; override;',
       @TFiler.Destroy);
  RegisterMethod(TFiler,
       'function TFiler__GetRoot(Self:TFiler):TComponent;',
       @TFiler__GetRoot, true);
  RegisterMethod(TFiler,
       'procedure TFiler__PutRoot(Self:TFiler;const Value: TComponent);',
       @TFiler__PutRoot, true);
  RegisterProperty(TFiler,
       'property Root:TComponent read TFiler__GetRoot write TFiler__PutRoot;');
  RegisterMethod(TFiler,
       'function TFiler__GetLookupRoot(Self:TFiler):TComponent;',
       @TFiler__GetLookupRoot, true);
  RegisterProperty(TFiler,
       'property LookupRoot:TComponent read TFiler__GetLookupRoot;');
  RegisterMethod(TFiler,
       'function TFiler__GetAncestor(Self:TFiler):TPersistent;',
       @TFiler__GetAncestor, true);
  RegisterMethod(TFiler,
       'procedure TFiler__PutAncestor(Self:TFiler;const Value: TPersistent);',
       @TFiler__PutAncestor, true);
  RegisterProperty(TFiler,
       'property Ancestor:TPersistent read TFiler__GetAncestor write TFiler__PutAncestor;');
  RegisterMethod(TFiler,
       'function TFiler__GetIgnoreChildren(Self:TFiler):Boolean;',
       @TFiler__GetIgnoreChildren, true);
  RegisterMethod(TFiler,
       'procedure TFiler__PutIgnoreChildren(Self:TFiler;const Value: Boolean);',
       @TFiler__PutIgnoreChildren, true);
  RegisterProperty(TFiler,
       'property IgnoreChildren:Boolean read TFiler__GetIgnoreChildren write TFiler__PutIgnoreChildren;');
  // End of class TFiler
  // Begin of interface IVarStreamable
  RegisterInterfaceType('IVarStreamable',IVarStreamable,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IVarStreamable,
       'procedure StreamIn(var Dest: TVarData; const Stream: TStream);');
  RegisterInterfaceMethod(IVarStreamable,
       'procedure StreamOut(const Source: TVarData; const Stream: TStream);');
  // End of interface IVarStreamable
  // Begin of class TReader
  RegisterClassType(TReader, H);
  RegisterMethod(TReader,
       'destructor Destroy; override;',
       @TReader.Destroy);
  RegisterStdMethodEx(TReader,'BeginReferences',TReader_BeginReferences,0,[typeVARIANT]);
  RegisterMethod(TReader,
       'procedure CheckValue(Value: TValueType);',
       @TReader.CheckValue);
  RegisterMethod(TReader,
       'procedure DefineProperty(const Name: string;      ReadData: TReaderProc; WriteData: TWriterProc;      HasData: Boolean); override;',
       @TReader.DefineProperty);
  RegisterMethod(TReader,
       'procedure DefineBinaryProperty(const Name: string;      ReadData, WriteData: TStreamProc;      HasData: Boolean); override;',
       @TReader.DefineBinaryProperty);
  RegisterStdMethodEx(TReader,'EndOfList',TReader_EndOfList,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TReader,'EndReferences',TReader_EndReferences,0,[typeVARIANT]);
  RegisterStdMethodEx(TReader,'FixupReferences',TReader_FixupReferences,0,[typeVARIANT]);
  RegisterStdMethodEx(TReader,'FlushBuffer',TReader_FlushBuffer,0,[typeVARIANT]);
  RegisterMethod(TReader,
       'function NextValue: TValueType;',
       @TReader.NextValue);
  RegisterMethod(TReader,
       'procedure Read(var Buf; Count: Longint);',
       @TReader.Read);
  RegisterStdMethodEx(TReader,'ReadBoolean',TReader_ReadBoolean,0,[typeBOOLEAN]);
  RegisterMethod(TReader,
       'function ReadChar: Char;',
       @TReader.ReadChar);
  RegisterMethod(TReader,
       'function ReadWideChar: WideChar;',
       @TReader.ReadWideChar);
  RegisterMethod(TReader,
       'procedure ReadCollection(Collection: TCollection);',
       @TReader.ReadCollection);
  RegisterMethod(TReader,
       'function ReadComponent(Component: TComponent): TComponent;',
       @TReader.ReadComponent);
  RegisterMethod(TReader,
       'procedure ReadComponents(AOwner, AParent: TComponent;      Proc: TReadComponentsProc);',
       @TReader.ReadComponents);
  RegisterStdMethodEx(TReader,'ReadFloat',TReader_ReadFloat,0,[typeDOUBLE]);
  RegisterStdMethodEx(TReader,'ReadSingle',TReader_ReadSingle,0,[typeDOUBLE]);
  RegisterStdMethodEx(TReader,'ReadDouble',TReader_ReadDouble,0,[typeDOUBLE]);
  RegisterMethod(TReader,
       'function ReadCurrency: Currency;',
       @TReader.ReadCurrency);
  RegisterMethod(TReader,
       'function ReadDate: TDateTime;',
       @TReader.ReadDate);
  RegisterStdMethodEx(TReader,'ReadIdent',TReader_ReadIdent,0,[typeSTRING]);
  RegisterStdMethod(TReader,'ReadInteger',TReader_ReadInteger,0);
  RegisterMethod(TReader,
       'function ReadInt64: Int64;',
       @TReader.ReadInt64);
  RegisterStdMethodEx(TReader,'ReadListBegin',TReader_ReadListBegin,0,[typeVARIANT]);
  RegisterStdMethodEx(TReader,'ReadListEnd',TReader_ReadListEnd,0,[typeVARIANT]);
  RegisterMethod(TReader,
       'procedure ReadPrefix(var Flags: TFilerFlags; var AChildPos: Integer); virtual;',
       @TReader.ReadPrefix);
  RegisterMethod(TReader,
       'function ReadRootComponent(Root: TComponent): TComponent;',
       @TReader.ReadRootComponent);
  RegisterStdMethodEx(TReader,'ReadSignature',TReader_ReadSignature,0,[typeVARIANT]);
  RegisterStdMethodEx(TReader,'ReadStr',TReader_ReadStr,0,[typeSTRING]);
  RegisterStdMethodEx(TReader,'ReadString',TReader_ReadString,0,[typeSTRING]);
  RegisterMethod(TReader,
       'function ReadWideString: WideString;',
       @TReader.ReadWideString);
  RegisterMethod(TReader,
       'function ReadValue: TValueType;',
       @TReader.ReadValue);
  RegisterStdMethod(TReader,'ReadVariant',TReader_ReadVariant,0);
  RegisterMethod(TReader,
       'procedure CopyValue(Writer: TWriter);',
       @TReader.CopyValue);
  RegisterStdMethodEx(TReader,'SkipValue',TReader_SkipValue,0,[typeVARIANT]);
  RegisterMethod(TReader,
       'function TReader__GetOwner(Self:TReader):TComponent;',
       @TReader__GetOwner, true);
  RegisterMethod(TReader,
       'procedure TReader__PutOwner(Self:TReader;const Value: TComponent);',
       @TReader__PutOwner, true);
  RegisterProperty(TReader,
       'property Owner:TComponent read TReader__GetOwner write TReader__PutOwner;');
  RegisterMethod(TReader,
       'function TReader__GetParent(Self:TReader):TComponent;',
       @TReader__GetParent, true);
  RegisterMethod(TReader,
       'procedure TReader__PutParent(Self:TReader;const Value: TComponent);',
       @TReader__PutParent, true);
  RegisterProperty(TReader,
       'property Parent:TComponent read TReader__GetParent write TReader__PutParent;');
  RegisterMethod(TReader,
       'function TReader__GetPosition(Self:TReader):Longint;',
       @TReader__GetPosition, true);
  RegisterMethod(TReader,
       'procedure TReader__PutPosition(Self:TReader;const Value: Longint);',
       @TReader__PutPosition, true);
  RegisterProperty(TReader,
       'property Position:Longint read TReader__GetPosition write TReader__PutPosition;');
  RegisterMethod(TReader,
       'constructor Create(Stream: TStream; BufSize: Integer);',
       @TReader.Create);
  // End of class TReader
  // Begin of class TWriter
  RegisterClassType(TWriter, H);
  RegisterMethod(TWriter,
       'destructor Destroy; override;',
       @TWriter.Destroy);
  RegisterMethod(TWriter,
       'procedure DefineProperty(const Name: string;      ReadData: TReaderProc; WriteData: TWriterProc;      HasData: Boolean); override;',
       @TWriter.DefineProperty);
  RegisterMethod(TWriter,
       'procedure DefineBinaryProperty(const Name: string;      ReadData, WriteData: TStreamProc;      HasData: Boolean); override;',
       @TWriter.DefineBinaryProperty);
  RegisterStdMethodEx(TWriter,'FlushBuffer',TWriter_FlushBuffer,0,[typeVARIANT]);
  RegisterMethod(TWriter,
       'procedure Write(const Buf; Count: Longint);',
       @TWriter.Write);
  RegisterStdMethodEx(TWriter,'WriteBoolean',TWriter_WriteBoolean,1,[typeBOOLEAN,typeVARIANT]);
  RegisterMethod(TWriter,
       'procedure WriteCollection(Value: TCollection);',
       @TWriter.WriteCollection);
  RegisterMethod(TWriter,
       'procedure WriteComponent(Component: TComponent);',
       @TWriter.WriteComponent);
  RegisterMethod(TWriter,
       'procedure WriteChar(Value: Char);',
       @TWriter.WriteChar);
  RegisterMethod(TWriter,
       'procedure WriteWideChar(Value: WideChar);',
       @TWriter.WriteWideChar);
  RegisterMethod(TWriter,
       'procedure WriteDescendent(Root: TComponent; AAncestor: TComponent);',
       @TWriter.WriteDescendent);
  RegisterStdMethodEx(TWriter,'WriteFloat',TWriter_WriteFloat,1,[typeDOUBLE,typeVARIANT]);
  RegisterStdMethodEx(TWriter,'WriteSingle',TWriter_WriteSingle,1,[typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TWriter,'WriteDouble',TWriter_WriteDouble,1,[typeDOUBLE,typeVARIANT]);
  RegisterMethod(TWriter,
       'procedure WriteCurrency(const Value: Currency);',
       @TWriter.WriteCurrency);
  RegisterMethod(TWriter,
       'procedure WriteDate(const Value: TDateTime);',
       @TWriter.WriteDate);
  RegisterStdMethodEx(TWriter,'WriteIdent',TWriter_WriteIdent,1,[typeSTRING,typeVARIANT]);
  RegisterStdMethod(TWriter,'WriteInteger',TWriter_WriteInteger7,1);
  RegisterStdMethodEx(TWriter,'WriteListBegin',TWriter_WriteListBegin,0,[typeVARIANT]);
  RegisterStdMethodEx(TWriter,'WriteListEnd',TWriter_WriteListEnd,0,[typeVARIANT]);
  RegisterMethod(TWriter,
       'procedure WriteRootComponent(Root: TComponent);',
       @TWriter.WriteRootComponent);
  RegisterStdMethodEx(TWriter,'WriteSignature',TWriter_WriteSignature,0,[typeVARIANT]);
  RegisterStdMethodEx(TWriter,'WriteStr',TWriter_WriteStr,1,[typeSTRING,typeVARIANT]);
  RegisterStdMethodEx(TWriter,'WriteString',TWriter_WriteString,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TWriter,
       'procedure WriteWideString(const Value: WideString);',
       @TWriter.WriteWideString);
  RegisterStdMethod(TWriter,'WriteVariant',TWriter_WriteVariant,1);
  RegisterMethod(TWriter,
       'function TWriter__GetPosition(Self:TWriter):Longint;',
       @TWriter__GetPosition, true);
  RegisterMethod(TWriter,
       'procedure TWriter__PutPosition(Self:TWriter;const Value: Longint);',
       @TWriter__PutPosition, true);
  RegisterProperty(TWriter,
       'property Position:Longint read TWriter__GetPosition write TWriter__PutPosition;');
  RegisterMethod(TWriter,
       'function TWriter__GetRootAncestor(Self:TWriter):TComponent;',
       @TWriter__GetRootAncestor, true);
  RegisterMethod(TWriter,
       'procedure TWriter__PutRootAncestor(Self:TWriter;const Value: TComponent);',
       @TWriter__PutRootAncestor, true);
  RegisterProperty(TWriter,
       'property RootAncestor:TComponent read TWriter__GetRootAncestor write TWriter__PutRootAncestor;');
  RegisterMethod(TWriter,
       'function TWriter__GetUseQualifiedNames(Self:TWriter):Boolean;',
       @TWriter__GetUseQualifiedNames, true);
  RegisterMethod(TWriter,
       'procedure TWriter__PutUseQualifiedNames(Self:TWriter;const Value: Boolean);',
       @TWriter__PutUseQualifiedNames, true);
  RegisterProperty(TWriter,
       'property UseQualifiedNames:Boolean read TWriter__GetUseQualifiedNames write TWriter__PutUseQualifiedNames;');
  RegisterMethod(TWriter,
       'constructor Create(Stream: TStream; BufSize: Integer);',
       @TWriter.Create);
  // End of class TWriter
  // Begin of class TParser
  RegisterClassType(TParser, H);
  RegisterMethod(TParser,
       'constructor Create(Stream: TStream; AOnError: TParserErrorEvent = nil);',
       @TParser.Create);
  RegisterMethod(TParser,
       'destructor Destroy; override;',
       @TParser.Destroy);
  RegisterMethod(TParser,
       'procedure CheckToken(T: Char);',
       @TParser.CheckToken);
  RegisterStdMethodEx(TParser,'CheckTokenSymbol',TParser_CheckTokenSymbol,1,[typeSTRING,typeVARIANT]);
  RegisterStdMethodEx(TParser,'Error',TParser_Error,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TParser,
       'procedure ErrorFmt(const Ident: string; const Args: array of const);',
       @TParser.ErrorFmt);
  RegisterStdMethodEx(TParser,'ErrorStr',TParser_ErrorStr,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TParser,
       'procedure HexToBinary(Stream: TStream);',
       @TParser.HexToBinary);
  RegisterMethod(TParser,
       'function NextToken: Char;',
       @TParser.NextToken);
  RegisterStdMethod(TParser,'SourcePos',TParser_SourcePos,0);
  RegisterStdMethodEx(TParser,'TokenComponentIdent',TParser_TokenComponentIdent,0,[typeSTRING]);
  RegisterStdMethodEx(TParser,'TokenFloat',TParser_TokenFloat,0,[typeDOUBLE]);
  RegisterMethod(TParser,
       'function TokenInt: Int64;',
       @TParser.TokenInt);
  RegisterStdMethodEx(TParser,'TokenString',TParser_TokenString,0,[typeSTRING]);
  RegisterMethod(TParser,
       'function TokenWideString: WideString;',
       @TParser.TokenWideString);
  RegisterStdMethodEx(TParser,'TokenSymbolIs',TParser_TokenSymbolIs,1,[typeSTRING,typeBOOLEAN]);
  RegisterMethod(TParser,
       'function TParser__GetFloatType(Self:TParser):Char;',
       @TParser__GetFloatType, true);
  RegisterProperty(TParser,
       'property FloatType:Char read TParser__GetFloatType;');
  RegisterMethod(TParser,
       'function TParser__GetSourceLine(Self:TParser):Integer;',
       @TParser__GetSourceLine, true);
  RegisterProperty(TParser,
       'property SourceLine:Integer read TParser__GetSourceLine;');
  RegisterMethod(TParser,
       'function TParser__GetLinePos(Self:TParser):Integer;',
       @TParser__GetLinePos, true);
  RegisterProperty(TParser,
       'property LinePos:Integer read TParser__GetLinePos;');
  RegisterMethod(TParser,
       'function TParser__GetToken(Self:TParser):Char;',
       @TParser__GetToken, true);
  RegisterProperty(TParser,
       'property Token:Char read TParser__GetToken;');
  // End of class TParser
  RegisterRTTIType(TypeInfo(TThreadPriority));
  // Begin of class TThread
  RegisterClassType(TThread, H);
  RegisterMethod(TThread,
       'constructor Create(CreateSuspended: Boolean);',
       @TThread.Create);
  RegisterMethod(TThread,
       'destructor Destroy; override;',
       @TThread.Destroy);
  RegisterStdMethodEx(TThread,'AfterConstruction',TThread_AfterConstruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TThread,'Resume',TThread_Resume,0,[typeVARIANT]);
  RegisterStdMethodEx(TThread,'Suspend',TThread_Suspend,0,[typeVARIANT]);
  RegisterStdMethodEx(TThread,'Terminate',TThread_Terminate,0,[typeVARIANT]);
  RegisterMethod(TThread,
       'function WaitFor: LongWord;',
       @TThread.WaitFor);
  RegisterMethod(TThread,
       'procedure RemoveQueuedEvents(AThread: TThread; AMethod: TThreadMethod);',
       @TThread.RemoveQueuedEvents);
  RegisterMethod(TThread,
       'procedure StaticQueue(AThread: TThread; AMethod: TThreadMethod);',
       @TThread.StaticQueue);
  RegisterMethod(TThread,
       'procedure StaticSynchronize(AThread: TThread; AMethod: TThreadMethod);',
       @TThread.StaticSynchronize);
  RegisterMethod(TThread,
       'function TThread__GetFatalException(Self:TThread):TObject;',
       @TThread__GetFatalException, true);
  RegisterProperty(TThread,
       'property FatalException:TObject read TThread__GetFatalException;');
  RegisterMethod(TThread,
       'function TThread__GetFreeOnTerminate(Self:TThread):Boolean;',
       @TThread__GetFreeOnTerminate, true);
  RegisterMethod(TThread,
       'procedure TThread__PutFreeOnTerminate(Self:TThread;const Value: Boolean);',
       @TThread__PutFreeOnTerminate, true);
  RegisterProperty(TThread,
       'property FreeOnTerminate:Boolean read TThread__GetFreeOnTerminate write TThread__PutFreeOnTerminate;');
  RegisterMethod(TThread,
       'function TThread__GetHandle(Self:TThread):THandle;',
       @TThread__GetHandle, true);
  RegisterProperty(TThread,
       'property Handle:THandle read TThread__GetHandle;');
  RegisterMethod(TThread,
       'function TThread__GetPriority(Self:TThread):TThreadPriority;',
       @TThread__GetPriority, true);
  RegisterMethod(TThread,
       'procedure TThread__PutPriority(Self:TThread;const Value: TThreadPriority);',
       @TThread__PutPriority, true);
  RegisterProperty(TThread,
       'property Priority:TThreadPriority read TThread__GetPriority write TThread__PutPriority;');
  RegisterMethod(TThread,
       'function TThread__GetSuspended(Self:TThread):Boolean;',
       @TThread__GetSuspended, true);
  RegisterMethod(TThread,
       'procedure TThread__PutSuspended(Self:TThread;const Value: Boolean);',
       @TThread__PutSuspended, true);
  RegisterProperty(TThread,
       'property Suspended:Boolean read TThread__GetSuspended write TThread__PutSuspended;');
  RegisterMethod(TThread,
       'function TThread__GetThreadID(Self:TThread):THandle;',
       @TThread__GetThreadID, true);
  RegisterProperty(TThread,
       'property ThreadID:THandle read TThread__GetThreadID;');
  // End of class TThread
  // Begin of class TComponentEnumerator
  RegisterClassType(TComponentEnumerator, H);
  RegisterMethod(TComponentEnumerator,
       'constructor Create(AComponent: TComponent);',
       @TComponentEnumerator.Create);
  RegisterMethod(TComponentEnumerator,
       'function GetCurrent: TComponent;',
       @TComponentEnumerator.GetCurrent);
  RegisterStdMethodEx(TComponentEnumerator,'MoveNext',TComponentEnumerator_MoveNext,0,[typeBOOLEAN]);
  RegisterMethod(TComponentEnumerator,
       'function TComponentEnumerator__GetCurrent(Self:TComponentEnumerator):TComponent;',
       @TComponentEnumerator__GetCurrent, true);
  RegisterProperty(TComponentEnumerator,
       'property Current:TComponent read TComponentEnumerator__GetCurrent;');
  // End of class TComponentEnumerator
  RegisterRTTIType(TypeInfo(TOperation));
  RegisterRTTIType(TypeInfo(TComponentState));
  RegisterRTTIType(TypeInfo(TComponentStyle));
  RegisterTypeAlias('TComponentName','string');
  // Begin of interface IVCLComObject
  RegisterInterfaceType('IVCLComObject',IVCLComObject,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IVCLComObject,
       'function GetTypeInfoCount(out Count: Integer): HResult; stdcall;');
  RegisterInterfaceMethod(IVCLComObject,
       'function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;');
  RegisterInterfaceMethod(IVCLComObject,
       'function GetIDsOfNames(const IID: TGUID; Names: Pointer;      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;');
  RegisterInterfaceMethod(IVCLComObject,
       'function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;');
  RegisterInterfaceMethod(IVCLComObject,
       'function SafeCallException(ExceptObject: TObject;      ExceptAddr: Pointer): HResult;');
  RegisterInterfaceMethod(IVCLComObject,
       'procedure FreeOnRelease;');
  // End of interface IVCLComObject
  // Begin of interface IDesignerNotify
  RegisterInterfaceType('IDesignerNotify',IDesignerNotify,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IDesignerNotify,
       'procedure Modified;');
  RegisterInterfaceMethod(IDesignerNotify,
       'procedure Notification(AnObject: TPersistent; Operation: TOperation);');
  // End of interface IDesignerNotify
  // Begin of class TComponent
  RegisterClassType(TComponent, H);
  RegisterMethod(TComponent,
       'constructor Create(AOwner: TComponent); virtual;',
       @TComponent.Create);
  RegisterMethod(TComponent,
       'destructor Destroy; override;',
       @TComponent.Destroy);
  RegisterStdMethodEx(TComponent,'BeforeDestruction',TComponent_BeforeDestruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TComponent,'DestroyComponents',TComponent_DestroyComponents,0,[typeVARIANT]);
  RegisterStdMethodEx(TComponent,'Destroying',TComponent_Destroying,0,[typeVARIANT]);
  RegisterMethod(TComponent,
       'function ExecuteAction(Action: TBasicAction): Boolean; dynamic;',
       @TComponent.ExecuteAction);
  RegisterMethod(TComponent,
       'function FindComponent(const AName: string): TComponent;',
       @TComponent.FindComponent);
  RegisterMethod(TComponent,
       'procedure FreeNotification(AComponent: TComponent);',
       @TComponent.FreeNotification);
  RegisterMethod(TComponent,
       'procedure RemoveFreeNotification(AComponent: TComponent);',
       @TComponent.RemoveFreeNotification);
  RegisterStdMethodEx(TComponent,'FreeOnRelease',TComponent_FreeOnRelease,0,[typeVARIANT]);
  RegisterMethod(TComponent,
       'function GetEnumerator: TComponentEnumerator;',
       @TComponent.GetEnumerator);
  RegisterMethod(TComponent,
       'function GetParentComponent: TComponent; dynamic;',
       @TComponent.GetParentComponent);
  RegisterStdMethodEx(TComponent,'GetNamePath',TComponent_GetNamePath,0,[typeSTRING]);
  RegisterStdMethodEx(TComponent,'HasParent',TComponent_HasParent,0,[typeBOOLEAN]);
  RegisterMethod(TComponent,
       'procedure InsertComponent(AComponent: TComponent);',
       @TComponent.InsertComponent);
  RegisterMethod(TComponent,
       'procedure RemoveComponent(AComponent: TComponent);',
       @TComponent.RemoveComponent);
  RegisterStdMethodEx(TComponent,'SetSubComponent',TComponent_SetSubComponent,1,[typeBOOLEAN,typeVARIANT]);
  RegisterMethod(TComponent,
       'function SafeCallException(ExceptObject: TObject;      ExceptAddr: Pointer): HResult; override;',
       @TComponent.SafeCallException);
  RegisterMethod(TComponent,
       'function UpdateAction(Action: TBasicAction): Boolean; dynamic;',
       @TComponent.UpdateAction);
  RegisterMethod(TComponent,
       'function IsImplementorOf(const I: IInterface): Boolean;',
       @TComponent.IsImplementorOf);
  RegisterMethod(TComponent,
       'function ReferenceInterface(const I: IInterface; Operation: TOperation): Boolean;',
       @TComponent.ReferenceInterface);
  RegisterMethod(TComponent,
       'function TComponent__GetComObject(Self:TComponent):IUnknown;',
       @TComponent__GetComObject, true);
  RegisterProperty(TComponent,
       'property ComObject:IUnknown read TComponent__GetComObject;');
  RegisterMethod(TComponent,
       'function TComponent__GetComponents(Self:TComponent;Index: Integer):TComponent;',
       @TComponent__GetComponents, true);
  RegisterProperty(TComponent,
       'property Components[Index: Integer]:TComponent read TComponent__GetComponents;');
  RegisterMethod(TComponent,
       'function TComponent__GetComponentCount(Self:TComponent):Integer;',
       @TComponent__GetComponentCount, true);
  RegisterProperty(TComponent,
       'property ComponentCount:Integer read TComponent__GetComponentCount;');
  RegisterMethod(TComponent,
       'function TComponent__GetComponentIndex(Self:TComponent):Integer;',
       @TComponent__GetComponentIndex, true);
  RegisterMethod(TComponent,
       'procedure TComponent__PutComponentIndex(Self:TComponent;const Value: Integer);',
       @TComponent__PutComponentIndex, true);
  RegisterProperty(TComponent,
       'property ComponentIndex:Integer read TComponent__GetComponentIndex write TComponent__PutComponentIndex;');
  RegisterMethod(TComponent,
       'function TComponent__GetComponentState(Self:TComponent):TComponentState;',
       @TComponent__GetComponentState, true);
  RegisterProperty(TComponent,
       'property ComponentState:TComponentState read TComponent__GetComponentState;');
  RegisterMethod(TComponent,
       'function TComponent__GetComponentStyle(Self:TComponent):TComponentStyle;',
       @TComponent__GetComponentStyle, true);
  RegisterProperty(TComponent,
       'property ComponentStyle:TComponentStyle read TComponent__GetComponentStyle;');
  RegisterMethod(TComponent,
       'function TComponent__GetDesignInfo(Self:TComponent):Longint;',
       @TComponent__GetDesignInfo, true);
  RegisterMethod(TComponent,
       'procedure TComponent__PutDesignInfo(Self:TComponent;const Value: Longint);',
       @TComponent__PutDesignInfo, true);
  RegisterProperty(TComponent,
       'property DesignInfo:Longint read TComponent__GetDesignInfo write TComponent__PutDesignInfo;');
  RegisterMethod(TComponent,
       'function TComponent__GetOwner(Self:TComponent):TComponent;',
       @TComponent__GetOwner, true);
  RegisterProperty(TComponent,
       'property Owner:TComponent read TComponent__GetOwner;');
  RegisterMethod(TComponent,
       'function TComponent__GetVCLComObject(Self:TComponent):Pointer;',
       @TComponent__GetVCLComObject, true);
  RegisterMethod(TComponent,
       'procedure TComponent__PutVCLComObject(Self:TComponent;const Value: Pointer);',
       @TComponent__PutVCLComObject, true);
  RegisterProperty(TComponent,
       'property VCLComObject:Pointer read TComponent__GetVCLComObject write TComponent__PutVCLComObject;');
  // End of class TComponent
  // Begin of class TBasicActionLink
  RegisterClassType(TBasicActionLink, H);
  RegisterMethod(TBasicActionLink,
       'constructor Create(AClient: TObject); virtual;',
       @TBasicActionLink.Create);
  RegisterMethod(TBasicActionLink,
       'destructor Destroy; override;',
       @TBasicActionLink.Destroy);
  RegisterMethod(TBasicActionLink,
       'function Execute(AComponent: TComponent = nil): Boolean; virtual;',
       @TBasicActionLink.Execute);
  RegisterStdMethodEx(TBasicActionLink,'Update',TBasicActionLink_Update,0,[typeBOOLEAN]);
  RegisterMethod(TBasicActionLink,
       'function TBasicActionLink__GetAction(Self:TBasicActionLink):TBasicAction;',
       @TBasicActionLink__GetAction, true);
  RegisterMethod(TBasicActionLink,
       'procedure TBasicActionLink__PutAction(Self:TBasicActionLink;const Value: TBasicAction);',
       @TBasicActionLink__PutAction, true);
  RegisterProperty(TBasicActionLink,
       'property Action:TBasicAction read TBasicActionLink__GetAction write TBasicActionLink__PutAction;');
  // End of class TBasicActionLink
  // Begin of class TBasicAction
  RegisterClassType(TBasicAction, H);
  RegisterMethod(TBasicAction,
       'constructor Create(AOwner: TComponent); override;',
       @TBasicAction.Create);
  RegisterMethod(TBasicAction,
       'destructor Destroy; override;',
       @TBasicAction.Destroy);
  RegisterMethod(TBasicAction,
       'function HandlesTarget(Target: TObject): Boolean; virtual;',
       @TBasicAction.HandlesTarget);
  RegisterMethod(TBasicAction,
       'procedure UpdateTarget(Target: TObject); virtual;',
       @TBasicAction.UpdateTarget);
  RegisterMethod(TBasicAction,
       'procedure ExecuteTarget(Target: TObject); virtual;',
       @TBasicAction.ExecuteTarget);
  RegisterStdMethodEx(TBasicAction,'Execute',TBasicAction_Execute,0,[typeBOOLEAN]);
  RegisterMethod(TBasicAction,
       'procedure RegisterChanges(Value: TBasicActionLink);',
       @TBasicAction.RegisterChanges);
  RegisterMethod(TBasicAction,
       'procedure UnRegisterChanges(Value: TBasicActionLink);',
       @TBasicAction.UnRegisterChanges);
  RegisterStdMethodEx(TBasicAction,'Update',TBasicAction_Update,0,[typeBOOLEAN]);
  RegisterMethod(TBasicAction,
       'function TBasicAction__GetActionComponent(Self:TBasicAction):TComponent;',
       @TBasicAction__GetActionComponent, true);
  RegisterMethod(TBasicAction,
       'procedure TBasicAction__PutActionComponent(Self:TBasicAction;const Value: TComponent);',
       @TBasicAction__PutActionComponent, true);
  RegisterProperty(TBasicAction,
       'property ActionComponent:TComponent read TBasicAction__GetActionComponent write TBasicAction__PutActionComponent;');
  // End of class TBasicAction
  // Begin of class TDataModule
  RegisterClassType(TDataModule, H);
  RegisterMethod(TDataModule,
       'constructor Create(AOwner: TComponent); override;',
       @TDataModule.Create);
  RegisterMethod(TDataModule,
       'constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;',
       @TDataModule.CreateNew);
  RegisterMethod(TDataModule,
       'destructor Destroy; override;',
       @TDataModule.Destroy);
  RegisterStdMethodEx(TDataModule,'AfterConstruction',TDataModule_AfterConstruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TDataModule,'BeforeDestruction',TDataModule_BeforeDestruction,0,[typeVARIANT]);
  RegisterMethod(TDataModule,
       'function TDataModule__GetDesignOffset(Self:TDataModule):TPoint;',
       @TDataModule__GetDesignOffset, true);
  RegisterMethod(TDataModule,
       'procedure TDataModule__PutDesignOffset(Self:TDataModule;const Value: TPoint);',
       @TDataModule__PutDesignOffset, true);
  RegisterProperty(TDataModule,
       'property DesignOffset:TPoint read TDataModule__GetDesignOffset write TDataModule__PutDesignOffset;');
  RegisterMethod(TDataModule,
       'function TDataModule__GetDesignSize(Self:TDataModule):TPoint;',
       @TDataModule__GetDesignSize, true);
  RegisterMethod(TDataModule,
       'procedure TDataModule__PutDesignSize(Self:TDataModule;const Value: TPoint);',
       @TDataModule__PutDesignSize, true);
  RegisterProperty(TDataModule,
       'property DesignSize:TPoint read TDataModule__GetDesignSize write TDataModule__PutDesignSize;');
  // End of class TDataModule
  RegisterVariable('CurrentGroup', 'INTEGER',@CurrentGroup, H);
  RegisterRTTIType(TypeInfo(TActiveXRegType));
  RegisterRoutine('function Point(AX, AY: Integer): TPoint;', @Point, H);
  RegisterRoutine('function SmallPoint(AX, AY: SmallInt): TSmallPoint;', @SmallPoint, H);
  RegisterRoutine('function PointsEqual(const P1, P2: TPoint): Boolean; overload;', @PointsEqual11, H);
  RegisterRoutine('function PointsEqual(const P1, P2: TSmallPoint): Boolean; overload;', @PointsEqual12, H);
  RegisterStdRoutineEx('InvalidPoint', _InvalidPoint13,2,[typeINTEGER,typeINTEGER,typeBOOLEAN], H);
  RegisterRoutine('function InvalidPoint(const At: TPoint): Boolean; overload;', @InvalidPoint14, H);
  RegisterRoutine('function InvalidPoint(const At: TSmallPoint): Boolean; overload;', @InvalidPoint15, H);
  RegisterRoutine('function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect; overload;', @Rect16, H);
  RegisterRoutine('function Rect(const ATopLeft, ABottomRight: TPoint): TRect; overload;', @Rect17, H);
  RegisterRoutine('function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;', @Bounds, H);
  RegisterRoutine('procedure RegisterClass(AClass: TPersistentClass);', @RegisterClass, H);
  RegisterRoutine('procedure RegisterClasses(AClasses: array of TPersistentClass);', @RegisterClasses, H);
  RegisterRoutine('procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);', @RegisterClassAlias, H);
  RegisterRoutine('procedure UnRegisterClass(AClass: TPersistentClass);', @UnRegisterClass, H);
  RegisterRoutine('procedure UnRegisterClasses(AClasses: array of TPersistentClass);', @UnRegisterClasses, H);
  RegisterRoutine('procedure UnRegisterModuleClasses(Module: HMODULE);', @UnRegisterModuleClasses, H);
  RegisterRoutine('function FindClass(const ClassName: string): TPersistentClass;', @FindClass, H);
  RegisterRoutine('function GetClass(const AClassName: string): TPersistentClass;', @GetClass, H);
  RegisterRoutine('procedure StartClassGroup(AClass: TPersistentClass);', @StartClassGroup, H);
  RegisterRoutine('procedure GroupDescendentsWith(AClass, AClassGroup: TPersistentClass);', @GroupDescendentsWith, H);
  RegisterRoutine('function ActivateClassGroup(AClass: TPersistentClass): TPersistentClass;', @ActivateClassGroup, H);
  RegisterRoutine('function ActiveClassGroup: TPersistentClass;', @ActiveClassGroup, H);
  RegisterRoutine('function ClassGroupOf(AClass: TPersistentClass): TPersistentClass; overload;', @ClassGroupOf18, H);
  RegisterRoutine('function ClassGroupOf(Instance: TPersistent): TPersistentClass; overload;', @ClassGroupOf19, H);
  RegisterRoutine('procedure RegisterComponents(const Page: string;  const ComponentClasses: array of TComponentClass);', @RegisterComponents, H);
  RegisterRoutine('procedure RegisterNoIcon(const ComponentClasses: array of TComponentClass);', @RegisterNoIcon, H);
  RegisterRoutine('procedure RegisterNonActiveX(const ComponentClasses: array of TComponentClass;  AxRegType: TActiveXRegType);', @RegisterNonActiveX, H);
  RegisterRoutine('procedure RegisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;  AIntToIdent: TIntToIdent);', @RegisterIntegerConsts, H);
  RegisterRoutine('procedure UnregisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;  AIntToIdent: TIntToIdent);', @UnregisterIntegerConsts, H);
  RegisterRoutine('procedure RegisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);', @RegisterFindGlobalComponentProc, H);
  RegisterRoutine('procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);', @UnregisterFindGlobalComponentProc, H);
  RegisterRoutine('function FindGlobalComponent(const Name: string): TComponent;', @FindGlobalComponent, H);
  RegisterStdRoutineEx('IsUniqueGlobalComponentName', _IsUniqueGlobalComponentName,1,[typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function IdentToInt(const Ident: string; var Int: Longint; const Map: array of TIdentMapEntry): Boolean;', @IdentToInt, H);
  RegisterRoutine('function IntToIdent(Int: Longint; var Ident: string; const Map: array of TIdentMapEntry): Boolean;', @IntToIdent, H);
  RegisterRoutine('function FindIntToIdent(AIntegerType: Pointer): TIntToIdent;', @FindIntToIdent, H);
  RegisterRoutine('function FindIdentToInt(AIntegerType: Pointer): TIdentToInt;', @FindIdentToInt, H);
  RegisterRoutine('function InitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;', @InitInheritedComponent, H);
  RegisterRoutine('function InitComponentRes(const ResName: string; Instance: TComponent): Boolean;', @InitComponentRes, H);
  RegisterRoutine('function ReadComponentRes(const ResName: string; Instance: TComponent): TComponent;', @ReadComponentRes, H);
  RegisterRoutine('function ReadComponentResEx(HInstance: THandle; const ResName: string): TComponent;', @ReadComponentResEx, H);
  RegisterRoutine('function ReadComponentResFile(const FileName: string; Instance: TComponent): TComponent;', @ReadComponentResFile, H);
  RegisterRoutine('procedure WriteComponentResFile(const FileName: string; Instance: TComponent);', @WriteComponentResFile, H);
  RegisterStdRoutineEx('GlobalFixupReferences', _GlobalFixupReferences,0,[typeINTEGER], H);
  RegisterRoutine('procedure GetFixupReferenceNames(Root: TComponent; Names: TStrings);', @GetFixupReferenceNames, H);
  RegisterRoutine('procedure GetFixupInstanceNames(Root: TComponent;  const ReferenceRootName: string; Names: TStrings);', @GetFixupInstanceNames, H);
  RegisterRoutine('procedure RedirectFixupReferences(Root: TComponent; const OldRootName,  NewRootName: string);', @RedirectFixupReferences, H);
  RegisterRoutine('procedure RemoveFixupReferences(Root: TComponent; const RootName: string);', @RemoveFixupReferences, H);
  RegisterRoutine('procedure RemoveFixups(Instance: TPersistent);', @RemoveFixups, H);
  RegisterRoutine('function FindNestedComponent(Root: TComponent; const NamePath: string): TComponent;', @FindNestedComponent, H);
  RegisterStdRoutineEx('BeginGlobalLoading', _BeginGlobalLoading,0,[typeINTEGER], H);
  RegisterStdRoutineEx('NotifyGlobalLoading', _NotifyGlobalLoading,0,[typeINTEGER], H);
  RegisterStdRoutineEx('EndGlobalLoading', _EndGlobalLoading,0,[typeINTEGER], H);
  RegisterRoutine('function CollectionsEqual(C1, C2: TCollection; Owner1, Owner2: TComponent): Boolean;', @CollectionsEqual, H);
  RegisterRoutine('function GetUltimateOwner(ACollectionItem: TCollectionItem): TPersistent; overload;', @GetUltimateOwner20, H);
  RegisterRoutine('function GetUltimateOwner(ACollection: TCollection): TPersistent; overload;', @GetUltimateOwner21, H);
  RegisterRoutine('function GetUltimateOwner(APersistent: TPersistent): TPersistent; overload;', @GetUltimateOwner22, H);
  RegisterRTTIType(TypeInfo(TStreamOriginalFormat));
  RegisterRoutine('procedure ObjectBinaryToText(Input, Output: TStream); overload;', @ObjectBinaryToText23, H);
  RegisterRoutine('procedure ObjectBinaryToText(Input, Output: TStream;  var OriginalFormat: TStreamOriginalFormat); overload;', @ObjectBinaryToText24, H);
  RegisterRoutine('procedure ObjectTextToBinary(Input, Output: TStream); overload;', @ObjectTextToBinary25, H);
  RegisterRoutine('procedure ObjectTextToBinary(Input, Output: TStream;  var OriginalFormat: TStreamOriginalFormat); overload;', @ObjectTextToBinary26, H);
  RegisterRoutine('procedure ObjectResourceToText(Input, Output: TStream); overload;', @ObjectResourceToText27, H);
  RegisterRoutine('procedure ObjectResourceToText(Input, Output: TStream;  var OriginalFormat: TStreamOriginalFormat); overload;', @ObjectResourceToText28, H);
  RegisterRoutine('procedure ObjectTextToResource(Input, Output: TStream); overload;', @ObjectTextToResource29, H);
  RegisterRoutine('procedure ObjectTextToResource(Input, Output: TStream;  var OriginalFormat: TStreamOriginalFormat); overload;', @ObjectTextToResource30, H);
  RegisterRoutine('function TestStreamFormat(Stream: TStream): TStreamOriginalFormat;', @TestStreamFormat, H);
  RegisterRoutine('function LineStart(Buffer, BufPos: PChar): PChar;', @LineStart, H);
  RegisterRoutine('function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar;  Strings: TStrings): Integer;', @ExtractStrings, H);
  RegisterRoutine('procedure BinToHex(Buffer, Text: PChar; BufSize: Integer);', @BinToHex, H);
  RegisterRoutine('function HexToBin(Text, Buffer: PChar; BufSize: Integer): Integer;', @HexToBin, H);
  RegisterRoutine('function FindRootDesigner(Obj: TPersistent): IDesignerNotify;', @FindRootDesigner, H);
  RegisterRoutine('function CountGenerations(Ancestor, Descendent: TClass): Integer;', @CountGenerations, H);
  RegisterRoutine('function CheckSynchronize(Timeout: Integer = 0): Boolean;', @CheckSynchronize, H);
  RegisterVariable('SyncEvent', 'CARDINAL',@SyncEvent, H);
  RegisterRoutine('function MakeObjectInstance(Method: TWndMethod): Pointer;', @MakeObjectInstance, H);
  RegisterStdRoutineEx('FreeObjectInstance', _FreeObjectInstance,1,[typePOINTER,typeINTEGER], H);
  RegisterRoutine('function AllocateHWnd(Method: TWndMethod): HWND;', @AllocateHWnd, H);
  RegisterRoutine('procedure DeallocateHWnd(Wnd: HWND);', @DeallocateHWnd, H);
  RegisterRoutine('function AncestorIsValid(Ancestor: TPersistent; Root,  RootAncestor: TComponent): Boolean;', @AncestorIsValid, H);
  RegisterRoutine('function IsDefaultPropertyValue(Instance: TObject; PropInfo: PPropInfo;  OnGetLookupInfo: TGetLookupInfoEvent; Writer: TWriter = nil;  OnFindMethodName: TFindMethodNameEvent = nil): Boolean;', @IsDefaultPropertyValue, H);
end;
initialization
  RegisterIMP_Classes;
end.
