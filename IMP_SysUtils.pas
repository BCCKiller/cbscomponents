unit IMP_SysUtils;
interface
uses
  Windows,
  SysConst,
  SysUtils,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_SysUtils;
implementation
function TLanguages__GetCount(Self:TLanguages):Integer;
begin
  result := Self.Count;
end;
function TLanguages__GetName(Self:TLanguages;Index: Integer):String;
begin
  result := Self.Name[Index];
end;
function TLanguages__GetNameFromLocaleID(Self:TLanguages;ID: LCID):String;
begin
  result := Self.NameFromLocaleID[ID];
end;
function TLanguages__GetNameFromLCID(Self:TLanguages;const ID: string):String;
begin
  result := Self.NameFromLCID[ID];
end;
function TLanguages__GetID(Self:TLanguages;Index: Integer):String;
begin
  result := Self.ID[Index];
end;
function TLanguages__GetLocaleID(Self:TLanguages;Index: Integer):LCID;
begin
  result := Self.LocaleID[Index];
end;
function TLanguages__GetExt(Self:TLanguages;Index: Integer):String;
begin
  result := Self.Ext[Index];
end;
function Exception__GetHelpContext(Self:Exception):Integer;
begin
  result := Self.HelpContext;
end;
procedure Exception__PutHelpContext(Self:Exception;const Value: Integer);
begin
  Self.HelpContext := Value;
end;
function Exception__GetMessage(Self:Exception):String;
begin
  result := Self.Message;
end;
procedure Exception__PutMessage(Self:Exception;const Value: String);
begin
  Self.Message := Value;
end;
procedure EHeapException_FreeInstance(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
EHeapException(Self).FreeInstance();
end;
procedure _GetFileVersion(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsCardinal := SysUtils.GetFileVersion(Params[0].AsString);
end;
procedure _UpperCase9(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.UpperCase(Params[0].AsString);
end;
function UpperCase10(const S: string; LocaleOptions: TLocaleOptions): string; 
begin
  result := SysUtils.UpperCase(S,LOCALEOPTIONS);
end;
procedure _LowerCase11(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.LowerCase(Params[0].AsString);
end;
function LowerCase12(const S: string; LocaleOptions: TLocaleOptions): string; 
begin
  result := SysUtils.LowerCase(S,LOCALEOPTIONS);
end;
procedure _CompareStr13(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.CompareStr(Params[0].AsString,Params[1].AsString);
end;
function CompareStr14(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; 
begin
  result := SysUtils.CompareStr(S1,S2,LOCALEOPTIONS);
end;
procedure _SameStr15(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.SameStr(Params[0].AsString,Params[1].AsString);
end;
function SameStr16(const S1, S2: string; LocaleOptions: TLocaleOptions): Boolean; 
begin
  result := SysUtils.SameStr(S1,S2,LOCALEOPTIONS);
end;
procedure _CompareMem(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.CompareMem(Params[0].AsPointer,Params[1].AsPointer,Params[2].AsInteger);
end;
procedure _CompareText17(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.CompareText(Params[0].AsString,Params[1].AsString);
end;
function CompareText18(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; 
begin
  result := SysUtils.CompareText(S1,S2,LOCALEOPTIONS);
end;
procedure _SameText19(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.SameText(Params[0].AsString,Params[1].AsString);
end;
function SameText20(const S1, S2: string; LocaleOptions: TLocaleOptions): Boolean; 
begin
  result := SysUtils.SameText(S1,S2,LOCALEOPTIONS);
end;
procedure _AnsiUpperCase(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.AnsiUpperCase(Params[0].AsString);
end;
procedure _AnsiLowerCase(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.AnsiLowerCase(Params[0].AsString);
end;
procedure _AnsiCompareStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.AnsiCompareStr(Params[0].AsString,Params[1].AsString);
end;
procedure _AnsiSameStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.AnsiSameStr(Params[0].AsString,Params[1].AsString);
end;
procedure _AnsiCompareText(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.AnsiCompareText(Params[0].AsString,Params[1].AsString);
end;
procedure _AnsiSameText(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.AnsiSameText(Params[0].AsString,Params[1].AsString);
end;
procedure _Trim21(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.Trim(Params[0].AsString);
end;
function Trim22(const S: WideString): WideString; 
begin
  result := SysUtils.Trim(S);
end;
procedure _TrimLeft23(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.TrimLeft(Params[0].AsString);
end;
function TrimLeft24(const S: WideString): WideString; 
begin
  result := SysUtils.TrimLeft(S);
end;
procedure _TrimRight25(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.TrimRight(Params[0].AsString);
end;
function TrimRight26(const S: WideString): WideString; 
begin
  result := SysUtils.TrimRight(S);
end;
procedure _QuotedStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.QuotedStr(Params[0].AsString);
end;
procedure _IntToStr27(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.IntToStr(Params[0].AsInteger);
end;
function IntToStr28(Value: Int64): string; 
begin
  result := SysUtils.IntToStr(VALUE);
end;
procedure _IntToHex29(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.IntToHex(Params[0].AsInteger,Params[1].AsInteger);
end;
function IntToHex30(Value: Int64; Digits: Integer): string; 
begin
  result := SysUtils.IntToHex(VALUE,DIGITS);
end;
procedure _StrToInt(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.StrToInt(Params[0].AsString);
end;
procedure _StrToIntDef(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.StrToIntDef(Params[0].AsString,Params[1].AsInteger);
end;
procedure _StrToBool(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.StrToBool(Params[0].AsString);
end;
procedure _StrToBoolDef(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.StrToBoolDef(Params[0].AsString,Params[1].AsBoolean);
end;
procedure _LoadStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.LoadStr(Params[0].AsInteger);
end;
procedure _FileCreate31(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileCreate(Params[0].AsString);
end;
procedure _FileCreate32(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileCreate(Params[0].AsString,Params[1].AsInteger);
end;
procedure _FileRead(MethodBody: TPAXMethodBody);
var
  Count, VT: Integer; V: Variant; S: String; P: Pointer;
begin
  with MethodBody do
  begin
    V := Params[1].AsVariant;
    P := Pointer(Integer(@V) + 8);
    Count := Params[2].AsVariant;
    VT := VarType(V);
    case VT of
      varString:
      begin
        P := AllocMem(Count + 1);
        FillChar(P^, Count + 1, 0);
        try
          Result.AsInteger := FileRead(Params[0].AsVariant, P^, Count);
        finally
          S := String(Pchar(P));
          FreeMem(P, Count + 1);
        end;
        Params[1].AsVariant := S;
      end;
      varVariant:
      begin
        Result.AsInteger := FileRead(Params[0].AsVariant, V, Count);
        Params[1].AsVariant := V;
      end;
      else
      begin
        Result.AsInteger := FileRead(Params[0].AsVariant, P^, Count);
        Params[1].AsVariant := V;
      end;
    end;
  end;
end;
procedure _FileWrite(MethodBody: TPAXMethodBody);
var
  Count, VT: Integer;  V: Variant;  I: Integer;  D: Double;  B: Boolean;  S: String;
begin
  with MethodBody do
  begin
    V := Params[1].AsVariant;
    Count := Params[2].AsVariant;
    VT := VarType(V);
    case VT of
      varInteger:
      begin
        I := V;
        Result.AsInteger := FileWrite(Params[0].AsVariant, I, Count);
      end;
      varDouble:
      begin
        D := V;
        Result.AsInteger := FileWrite(Params[0].AsVariant, D, Count);
      end;
      varBoolean:
      begin
        B := V;
        Result.AsInteger := FileWrite(Params[0].AsVariant, B, Count);
      end;
      varString:
      begin
        S := V;
        Result.AsInteger := FileWrite(Params[0].AsVariant, Pointer(S)^, Count);
      end;
      varVariant:
        Result.AsInteger := FileWrite(Params[0].AsVariant, V, Count);
    end;
  end;
end;
procedure _FileSeek33(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileSeek(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger);
end;
function FileSeek34(Handle: Integer; const Offset: Int64; Origin: Integer): Int64; 
begin
  result := SysUtils.FileSeek(HANDLE,OFFSET,ORIGIN);
end;
procedure _FileClose(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.FileClose(Params[0].AsInteger);
end;
procedure _FileAge35(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileAge(Params[0].AsString);
end;
function FileAge36(const FileName: string; out FileDateTime: TDateTime): Boolean; 
begin
  result := SysUtils.FileAge(FILENAME,FILEDATETIME);
end;
procedure _FileExists(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.FileExists(Params[0].AsString);
end;
procedure _DirectoryExists(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.DirectoryExists(Params[0].AsString);
end;
procedure _ForceDirectories(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.ForceDirectories(Params[0].AsString);
end;
procedure _FileGetDate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileGetDate(Params[0].AsInteger);
end;
procedure _FileSetDate37(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileSetDate(Params[0].AsString,Params[1].AsInteger);
end;
procedure _FileSetDate38(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileSetDate(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure _FileGetAttr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileGetAttr(Params[0].AsString);
end;
procedure _FileSetAttr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.FileSetAttr(Params[0].AsString,Params[1].AsInteger);
end;
procedure _FileIsReadOnly(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.FileIsReadOnly(Params[0].AsString);
end;
procedure _FileSetReadOnly(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.FileSetReadOnly(Params[0].AsString,Params[1].AsBoolean);
end;
procedure _DeleteFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.DeleteFile(Params[0].AsString);
end;
procedure _RenameFile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.RenameFile(Params[0].AsString,Params[1].AsString);
end;
procedure _IsAssembly(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.IsAssembly(Params[0].AsString);
end;
procedure _ChangeFileExt(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ChangeFileExt(Params[0].AsString,Params[1].AsString);
end;
procedure _ChangeFilePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ChangeFilePath(Params[0].AsString,Params[1].AsString);
end;
procedure _ExtractFilePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractFilePath(Params[0].AsString);
end;
procedure _ExtractFileDir(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractFileDir(Params[0].AsString);
end;
procedure _ExtractFileDrive(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractFileDrive(Params[0].AsString);
end;
procedure _ExtractFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractFileName(Params[0].AsString);
end;
procedure _ExtractFileExt(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractFileExt(Params[0].AsString);
end;
procedure _ExpandFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExpandFileName(Params[0].AsString);
end;
procedure _ExpandUNCFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExpandUNCFileName(Params[0].AsString);
end;
procedure _ExtractRelativePath(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractRelativePath(Params[0].AsString,Params[1].AsString);
end;
procedure _ExtractShortPathName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExtractShortPathName(Params[0].AsString);
end;
procedure _FileSearch(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.FileSearch(Params[0].AsString,Params[1].AsString);
end;
procedure _GetCurrentDir(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.GetCurrentDir();
end;
procedure _SetCurrentDir(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.SetCurrentDir(Params[0].AsString);
end;
procedure _CreateDir(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.CreateDir(Params[0].AsString);
end;
procedure _RemoveDir(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.RemoveDir(Params[0].AsString);
end;
function Format39(const Format: string;
  const Args: array of const): string; 
begin
  result := SysUtils.Format(FORMAT,ARGS);
end;
function Format40(const Format: string; const Args: array of const;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.Format(FORMAT,ARGS,FORMATSETTINGS);
end;
procedure FmtStr41(var Result: string; const Format: string;
  const Args: array of const); 
begin
  SysUtils.FmtStr(RESULT,FORMAT,ARGS);
end;
procedure FmtStr42(var Result: string; const Format: string;
  const Args: array of const; const FormatSettings: TFormatSettings); 
begin
  SysUtils.FmtStr(RESULT,FORMAT,ARGS,FORMATSETTINGS);
end;
function StrFmt43(Buffer, Format: PChar;
  const Args: array of const): PChar; 
begin
  result := SysUtils.StrFmt(BUFFER,FORMAT,ARGS);
end;
function StrFmt44(Buffer, Format: PChar; const Args: array of const;
  const FormatSettings: TFormatSettings): PChar; 
begin
  result := SysUtils.StrFmt(BUFFER,FORMAT,ARGS,FORMATSETTINGS);
end;
function StrLFmt45(Buffer: PChar; MaxBufLen: Cardinal; Format: PChar;
  const Args: array of const): PChar; 
begin
  result := SysUtils.StrLFmt(BUFFER,MAXBUFLEN,FORMAT,ARGS);
end;
function StrLFmt46(Buffer: PChar; MaxBufLen: Cardinal; Format: PChar;
  const Args: array of const;
  const FormatSettings: TFormatSettings): PChar; 
begin
  result := SysUtils.StrLFmt(BUFFER,MAXBUFLEN,FORMAT,ARGS,FORMATSETTINGS);
end;
function FormatBuf47(var Buffer; BufLen: Cardinal; const Format;
  FmtLen: Cardinal; const Args: array of const): Cardinal; 
begin
  result := SysUtils.FormatBuf(BUFFER,BUFLEN,FORMAT,FMTLEN,ARGS);
end;
function FormatBuf48(var Buffer; BufLen: Cardinal; const Format;
  FmtLen: Cardinal; const Args: array of const;
  const FormatSettings: TFormatSettings): Cardinal; 
begin
  result := SysUtils.FormatBuf(BUFFER,BUFLEN,FORMAT,FMTLEN,ARGS,FORMATSETTINGS);
end;
function WideFormat49(const Format: WideString;
  const Args: array of const): WideString; 
begin
  result := SysUtils.WideFormat(FORMAT,ARGS);
end;
function WideFormat50(const Format: WideString;
  const Args: array of const;
  const FormatSettings: TFormatSettings): WideString; 
begin
  result := SysUtils.WideFormat(FORMAT,ARGS,FORMATSETTINGS);
end;
procedure WideFmtStr51(var Result: WideString; const Format: WideString;
  const Args: array of const); 
begin
  SysUtils.WideFmtStr(RESULT,FORMAT,ARGS);
end;
procedure WideFmtStr52(var Result: WideString; const Format: WideString;
  const Args: array of const; const FormatSettings: TFormatSettings); 
begin
  SysUtils.WideFmtStr(RESULT,FORMAT,ARGS,FORMATSETTINGS);
end;
function WideFormatBuf53(var Buffer; BufLen: Cardinal; const Format;
  FmtLen: Cardinal; const Args: array of const): Cardinal; 
begin
  result := SysUtils.WideFormatBuf(BUFFER,BUFLEN,FORMAT,FMTLEN,ARGS);
end;
function WideFormatBuf54(var Buffer; BufLen: Cardinal; const Format;
  FmtLen: Cardinal; const Args: array of const;
  const FormatSettings: TFormatSettings): Cardinal; 
begin
  result := SysUtils.WideFormatBuf(BUFFER,BUFLEN,FORMAT,FMTLEN,ARGS,FORMATSETTINGS);
end;
procedure _FloatToStr55(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.FloatToStr(Params[0].AsDouble);
end;
function FloatToStr56(Value: Extended;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.FloatToStr(VALUE,FORMATSETTINGS);
end;
function CurrToStr57(Value: Currency): string; 
begin
  result := SysUtils.CurrToStr(VALUE);
end;
function CurrToStr58(Value: Currency;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.CurrToStr(VALUE,FORMATSETTINGS);
end;
function FloatToStrF59(Value: Extended; Format: TFloatFormat;
  Precision, Digits: Integer): string; 
begin
  result := SysUtils.FloatToStrF(VALUE,FORMAT,PRECISION,DIGITS);
end;
function FloatToStrF60(Value: Extended; Format: TFloatFormat;
  Precision, Digits: Integer;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.FloatToStrF(VALUE,FORMAT,PRECISION,DIGITS,FORMATSETTINGS);
end;
function CurrToStrF61(Value: Currency; Format: TFloatFormat;
  Digits: Integer): string; 
begin
  result := SysUtils.CurrToStrF(VALUE,FORMAT,DIGITS);
end;
function CurrToStrF62(Value: Currency; Format: TFloatFormat;
  Digits: Integer; const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.CurrToStrF(VALUE,FORMAT,DIGITS,FORMATSETTINGS);
end;
function FloatToText63(BufferArg: PChar; const Value; ValueType: TFloatValue;
  Format: TFloatFormat; Precision, Digits: Integer): Integer; 
begin
  result := SysUtils.FloatToText(BUFFERARG,VALUE,VALUETYPE,FORMAT,PRECISION,DIGITS);
end;
function FloatToText64(BufferArg: PChar; const Value; ValueType: TFloatValue;
  Format: TFloatFormat; Precision, Digits: Integer;
  const FormatSettings: TFormatSettings): Integer; 
begin
  result := SysUtils.FloatToText(BUFFERARG,VALUE,VALUETYPE,FORMAT,PRECISION,DIGITS,FORMATSETTINGS);
end;
procedure _FormatFloat65(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.FormatFloat(Params[0].AsString,Params[1].AsDouble);
end;
function FormatFloat66(const Format: string; Value: Extended;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.FormatFloat(FORMAT,VALUE,FORMATSETTINGS);
end;
function FormatCurr67(const Format: string; Value: Currency): string; 
begin
  result := SysUtils.FormatCurr(FORMAT,VALUE);
end;
function FormatCurr68(const Format: string; Value: Currency;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.FormatCurr(FORMAT,VALUE,FORMATSETTINGS);
end;
function FloatToTextFmt69(Buf: PChar; const Value; ValueType: TFloatValue;
  Format: PChar): Integer; 
begin
  result := SysUtils.FloatToTextFmt(BUF,VALUE,VALUETYPE,FORMAT);
end;
function FloatToTextFmt70(Buf: PChar; const Value; ValueType: TFloatValue;
  Format: PChar; const FormatSettings: TFormatSettings): Integer; 
begin
  result := SysUtils.FloatToTextFmt(BUF,VALUE,VALUETYPE,FORMAT,FORMATSETTINGS);
end;
procedure _StrToFloat71(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := SysUtils.StrToFloat(Params[0].AsString);
end;
function StrToFloat72(const S: string;
  const FormatSettings: TFormatSettings): Extended; 
begin
  result := SysUtils.StrToFloat(S,FORMATSETTINGS);
end;
procedure _StrToFloatDef73(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := SysUtils.StrToFloatDef(Params[0].AsString,Params[1].AsDouble);
end;
function StrToFloatDef74(const S: string; const Default: Extended;
  const FormatSettings: TFormatSettings): Extended; 
begin
  result := SysUtils.StrToFloatDef(S,DEFAULT,FORMATSETTINGS);
end;
function TryStrToFloat75(const S: string; out Value: Extended): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE);
end;
function TryStrToFloat76(const S: string; out Value: Extended;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE,FORMATSETTINGS);
end;
function TryStrToFloat77(const S: string; out Value: Double): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE);
end;
function TryStrToFloat78(const S: string; out Value: Double;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE,FORMATSETTINGS);
end;
function TryStrToFloat79(const S: string; out Value: Single): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE);
end;
function TryStrToFloat80(const S: string; out Value: Single;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToFloat(S,VALUE,FORMATSETTINGS);
end;
function StrToCurr81(const S: string): Currency; 
begin
  result := SysUtils.StrToCurr(S);
end;
function StrToCurr82(const S: string;
  const FormatSettings: TFormatSettings): Currency; 
begin
  result := SysUtils.StrToCurr(S,FORMATSETTINGS);
end;
function StrToCurrDef83(const S: string;
  const Default: Currency): Currency; 
begin
  result := SysUtils.StrToCurrDef(S,DEFAULT);
end;
function StrToCurrDef84(const S: string; const Default: Currency;
  const FormatSettings: TFormatSettings): Currency; 
begin
  result := SysUtils.StrToCurrDef(S,DEFAULT,FORMATSETTINGS);
end;
function TryStrToCurr85(const S: string; out Value: Currency): Boolean; 
begin
  result := SysUtils.TryStrToCurr(S,VALUE);
end;
function TryStrToCurr86(const S: string; out Value: Currency;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToCurr(S,VALUE,FORMATSETTINGS);
end;
function TextToFloat87(Buffer: PChar; var Value;
  ValueType: TFloatValue): Boolean; 
begin
  result := SysUtils.TextToFloat(BUFFER,VALUE,VALUETYPE);
end;
function TextToFloat88(Buffer: PChar; var Value; ValueType: TFloatValue;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TextToFloat(BUFFER,VALUE,VALUETYPE,FORMATSETTINGS);
end;
procedure _CurrentYear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := SysUtils.CurrentYear();
end;
procedure _IsLeapYear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.IsLeapYear(Params[0].PValue^);
end;
function DateToStr89(const DateTime: TDateTime): string; 
begin
  result := SysUtils.DateToStr(DATETIME);
end;
function DateToStr90(const DateTime: TDateTime;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.DateToStr(DATETIME,FORMATSETTINGS);
end;
function TimeToStr91(const DateTime: TDateTime): string; 
begin
  result := SysUtils.TimeToStr(DATETIME);
end;
function TimeToStr92(const DateTime: TDateTime;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.TimeToStr(DATETIME,FORMATSETTINGS);
end;
function DateTimeToStr93(const DateTime: TDateTime): string; 
begin
  result := SysUtils.DateTimeToStr(DATETIME);
end;
function DateTimeToStr94(const DateTime: TDateTime;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.DateTimeToStr(DATETIME,FORMATSETTINGS);
end;
function StrToDate95(const S: string): TDateTime; 
begin
  result := SysUtils.StrToDate(S);
end;
function StrToDate96(const S: string;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToDate(S,FORMATSETTINGS);
end;
function StrToDateDef97(const S: string;
  const Default: TDateTime): TDateTime; 
begin
  result := SysUtils.StrToDateDef(S,DEFAULT);
end;
function StrToDateDef98(const S: string; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToDateDef(S,DEFAULT,FORMATSETTINGS);
end;
function TryStrToDate99(const S: string; out Value: TDateTime): Boolean; 
begin
  result := SysUtils.TryStrToDate(S,VALUE);
end;
function TryStrToDate100(const S: string; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToDate(S,VALUE,FORMATSETTINGS);
end;
function StrToTime101(const S: string): TDateTime; 
begin
  result := SysUtils.StrToTime(S);
end;
function StrToTime102(const S: string;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToTime(S,FORMATSETTINGS);
end;
function StrToTimeDef103(const S: string;
  const Default: TDateTime): TDateTime; 
begin
  result := SysUtils.StrToTimeDef(S,DEFAULT);
end;
function StrToTimeDef104(const S: string; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToTimeDef(S,DEFAULT,FORMATSETTINGS);
end;
function TryStrToTime105(const S: string; out Value: TDateTime): Boolean; 
begin
  result := SysUtils.TryStrToTime(S,VALUE);
end;
function TryStrToTime106(const S: string; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToTime(S,VALUE,FORMATSETTINGS);
end;
function StrToDateTime107(const S: string): TDateTime; 
begin
  result := SysUtils.StrToDateTime(S);
end;
function StrToDateTime108(const S: string;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToDateTime(S,FORMATSETTINGS);
end;
function StrToDateTimeDef109(const S: string;
  const Default: TDateTime): TDateTime; 
begin
  result := SysUtils.StrToDateTimeDef(S,DEFAULT);
end;
function StrToDateTimeDef110(const S: string; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime; 
begin
  result := SysUtils.StrToDateTimeDef(S,DEFAULT,FORMATSETTINGS);
end;
function TryStrToDateTime111(const S: string;
  out Value: TDateTime): Boolean; 
begin
  result := SysUtils.TryStrToDateTime(S,VALUE);
end;
function TryStrToDateTime112(const S: string; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean; 
begin
  result := SysUtils.TryStrToDateTime(S,VALUE,FORMATSETTINGS);
end;
function FormatDateTime113(const Format: string;
  DateTime: TDateTime): string; 
begin
  result := SysUtils.FormatDateTime(FORMAT,DATETIME);
end;
function FormatDateTime114(const Format: string; DateTime: TDateTime;
  const FormatSettings: TFormatSettings): string; 
begin
  result := SysUtils.FormatDateTime(FORMAT,DATETIME,FORMATSETTINGS);
end;
procedure DateTimeToString115(var Result: string; const Format: string;
  DateTime: TDateTime); 
begin
  SysUtils.DateTimeToString(RESULT,FORMAT,DATETIME);
end;
procedure DateTimeToString116(var Result: string; const Format: string;
  DateTime: TDateTime; const FormatSettings: TFormatSettings); 
begin
  SysUtils.DateTimeToString(RESULT,FORMAT,DATETIME,FORMATSETTINGS);
end;
procedure _SysErrorMessage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.SysErrorMessage(Params[0].AsInteger);
end;
procedure _GetLocaleStr(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.GetLocaleStr(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsString);
end;
procedure _GetFormatSettings(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.GetFormatSettings();
end;
procedure _Abort(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.Abort();
end;
procedure _OutOfMemoryError(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.OutOfMemoryError();
end;
procedure _Beep(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.Beep();
end;
procedure _ByteToCharLen(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.ByteToCharLen(Params[0].AsString,Params[1].AsInteger);
end;
procedure _CharToByteLen(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.CharToByteLen(Params[0].AsString,Params[1].AsInteger);
end;
procedure _ByteToCharIndex(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.ByteToCharIndex(Params[0].AsString,Params[1].AsInteger);
end;
procedure _CharToByteIndex(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.CharToByteIndex(Params[0].AsString,Params[1].AsInteger);
end;
procedure _CharLength(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.CharLength(Params[0].AsString,Params[1].AsInteger);
end;
procedure _NextCharIndex(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.NextCharIndex(Params[0].AsString,Params[1].AsInteger);
end;
procedure _IsPathDelimiter(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.IsPathDelimiter(Params[0].AsString,Params[1].AsInteger);
end;
procedure _IsDelimiter(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.IsDelimiter(Params[0].AsString,Params[1].AsString,Params[2].AsInteger);
end;
procedure _IncludeTrailingPathDelimiter(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.IncludeTrailingPathDelimiter(Params[0].AsString);
end;
procedure _IncludeTrailingBackslash(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.IncludeTrailingBackslash(Params[0].AsString);
end;
procedure _ExcludeTrailingPathDelimiter(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExcludeTrailingPathDelimiter(Params[0].AsString);
end;
procedure _ExcludeTrailingBackslash(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.ExcludeTrailingBackslash(Params[0].AsString);
end;
procedure _LastDelimiter(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.LastDelimiter(Params[0].AsString,Params[1].AsString);
end;
procedure _AnsiCompareFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.AnsiCompareFileName(Params[0].AsString,Params[1].AsString);
end;
procedure _SameFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.SameFileName(Params[0].AsString,Params[1].AsString);
end;
procedure _AnsiLowerCaseFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.AnsiLowerCaseFileName(Params[0].AsString);
end;
procedure _AnsiUpperCaseFileName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.AnsiUpperCaseFileName(Params[0].AsString);
end;
procedure _AnsiPos(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := SysUtils.AnsiPos(Params[0].AsString,Params[1].AsString);
end;
procedure _StringReplace(MethodBody: TPAXMethodBody);
var
  Flags: TReplaceFlags;
begin
  with MethodBody do
  begin
    Flags := [];
    result.AsString := StringReplace(Params[0].AsString, Params[1].AsString, Params[2].AsString, Flags);
  end;
end;
function WrapText117(const Line, BreakStr: string; const BreakChars: TSysCharSet;
  MaxCol: Integer): string; 
begin
  result := SysUtils.WrapText(LINE,BREAKSTR,BREAKCHARS,MAXCOL);
end;
function WrapText118(const Line: string; MaxCol: Integer = 45): string; 
begin
  result := SysUtils.WrapText(LINE,MAXCOL);
end;
function FindCmdLineSwitch119(const Switch: string; const Chars: TSysCharSet;
  IgnoreCase: Boolean): Boolean; 
begin
  result := SysUtils.FindCmdLineSwitch(SWITCH,CHARS,IGNORECASE);
end;
procedure _FindCmdLineSwitch120(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.FindCmdLineSwitch(Params[0].AsString);
end;
procedure _FindCmdLineSwitch121(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.FindCmdLineSwitch(Params[0].AsString,Params[1].AsBoolean);
end;
function Supports122(const Instance: IInterface; const IID: TGUID; out Intf): Boolean; 
begin
  result := SysUtils.Supports(INSTANCE,IID,INTF);
end;
function Supports123(const Instance: TObject; const IID: TGUID; out Intf): Boolean; 
begin
  result := SysUtils.Supports(INSTANCE,IID,INTF);
end;
function Supports124(const Instance: IInterface; const IID: TGUID): Boolean; 
begin
  result := SysUtils.Supports(INSTANCE,IID);
end;
function Supports125(const Instance: TObject; const IID: TGUID): Boolean; 
begin
  result := SysUtils.Supports(INSTANCE,IID);
end;
function Supports126(const AClass: TClass; const IID: TGUID): Boolean; 
begin
  result := SysUtils.Supports(ACLASS,IID);
end;
function LoadPackage127(const Name: string): HMODULE; 
begin
  result := SysUtils.LoadPackage(NAME);
end;
function LoadPackage128(const Name: string; AValidatePackage: TValidatePackageProc): HMODULE; 
begin
  result := SysUtils.LoadPackage(NAME,AVALIDATEPACKAGE);
end;
procedure InitializePackage129(Module: HMODULE); 
begin
  SysUtils.InitializePackage(MODULE);
end;
procedure InitializePackage130(Module: HMODULE; AValidatePackage: TValidatePackageProc); 
begin
  SysUtils.InitializePackage(MODULE,AVALIDATEPACKAGE);
end;
procedure _RaiseLastOSError131(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.RaiseLastOSError();
end;
procedure _RaiseLastOSError132(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.RaiseLastOSError(Params[0].AsInteger);
end;
procedure _RaiseLastWin32Error(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.RaiseLastWin32Error();
end;
procedure _CallTerminateProcs(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := SysUtils.CallTerminateProcs();
end;
procedure _RCS(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.RCS();
end;
procedure _RPR(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
SysUtils.RPR();
end;
procedure TSimpleRWSync_BeginRead(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TSimpleRWSync(Self).BeginRead();
end;
procedure TSimpleRWSync_EndRead(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TSimpleRWSync(Self).EndRead();
end;
procedure TSimpleRWSync_BeginWrite(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TSimpleRWSync(Self).BeginWrite();
end;
procedure TSimpleRWSync_EndWrite(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TSimpleRWSync(Self).EndWrite();
end;
procedure TMultiReadExclusiveWriteSynchronizer_BeginRead(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMultiReadExclusiveWriteSynchronizer(Self).BeginRead();
end;
procedure TMultiReadExclusiveWriteSynchronizer_EndRead(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMultiReadExclusiveWriteSynchronizer(Self).EndRead();
end;
procedure TMultiReadExclusiveWriteSynchronizer_BeginWrite(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TMultiReadExclusiveWriteSynchronizer(Self).BeginWrite();
end;
procedure TMultiReadExclusiveWriteSynchronizer_EndWrite(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMultiReadExclusiveWriteSynchronizer(Self).EndWrite();
end;
function TMultiReadExclusiveWriteSynchronizer__GetRevisionLevel(Self:TMultiReadExclusiveWriteSynchronizer):Cardinal;
begin
  result := Self.RevisionLevel;
end;
procedure _GetEnvironmentVariable133(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := SysUtils.GetEnvironmentVariable(Params[0].AsString);
end;
procedure RegisterIMP_SysUtils;
var H: Integer;
begin
  H := RegisterNamespace('SysUtils', -1);
  RegisterConstant('fmOpenRead', $0000, H);
  RegisterConstant('fmOpenWrite', $0001, H);
  RegisterConstant('fmOpenReadWrite', $0002, H);
  RegisterConstant('fmShareExclusive', $0010, H);
  RegisterConstant('fmShareDenyWrite', $0020, H);
  RegisterConstant('fmShareDenyNone', $0040, H);
  RegisterConstant('faDirectory', $00000010, H);
  RegisterConstant('faAnyFile', $0000003F, H);
  RegisterConstant('HoursPerDay', 24, H);
  RegisterConstant('MinsPerHour', 60, H);
  RegisterConstant('SecsPerMin', 60, H);
  RegisterConstant('MSecsPerSec', 1000, H);
  RegisterConstant('DateDelta', 693594, H);
  RegisterConstant('UnixDateDelta', 25569, H);
  RegisterRTTIType(TypeInfo(TSysCharSet));
//  RegisterRTTIType(TypeInfo(TIntegerSet));
  RegisterTypeAlias('TProcedure','procedure');
  RegisterTypeAlias('TFileName','string');
  RegisterRTTIType(TypeInfo(TFloatValue));
  RegisterRTTIType(TypeInfo(TFloatFormat));
  RegisterRTTIType(TypeInfo(TMbcsByteType));
  // Begin of class TLanguages
  RegisterClassType(TLanguages, H);
  RegisterMethod(TLanguages,
       'constructor Create;',
       @TLanguages.Create);
  RegisterMethod(TLanguages,
       'function IndexOf(ID: LCID): Integer;',
       @TLanguages.IndexOf);
  RegisterMethod(TLanguages,
       'function TLanguages__GetCount(Self:TLanguages):Integer;',
       @TLanguages__GetCount, true);
  RegisterProperty(TLanguages,
       'property Count:Integer read TLanguages__GetCount;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetName(Self:TLanguages;Index: Integer):String;',
       @TLanguages__GetName, true);
  RegisterProperty(TLanguages,
       'property Name[Index: Integer]:String read TLanguages__GetName;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetNameFromLocaleID(Self:TLanguages;ID: LCID):String;',
       @TLanguages__GetNameFromLocaleID, true);
  RegisterProperty(TLanguages,
       'property NameFromLocaleID[ID: LCID]:String read TLanguages__GetNameFromLocaleID;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetNameFromLCID(Self:TLanguages;const ID: string):String;',
       @TLanguages__GetNameFromLCID, true);
  RegisterProperty(TLanguages,
       'property NameFromLCID[const ID: string]:String read TLanguages__GetNameFromLCID;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetID(Self:TLanguages;Index: Integer):String;',
       @TLanguages__GetID, true);
  RegisterProperty(TLanguages,
       'property ID[Index: Integer]:String read TLanguages__GetID;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetLocaleID(Self:TLanguages;Index: Integer):LCID;',
       @TLanguages__GetLocaleID, true);
  RegisterProperty(TLanguages,
       'property LocaleID[Index: Integer]:LCID read TLanguages__GetLocaleID;');
  RegisterMethod(TLanguages,
       'function TLanguages__GetExt(Self:TLanguages;Index: Integer):String;',
       @TLanguages__GetExt, true);
  RegisterProperty(TLanguages,
       'property Ext[Index: Integer]:String read TLanguages__GetExt;');
  // End of class TLanguages
  // Begin of class Exception
  RegisterClassType(Exception, H);
  RegisterMethod(Exception,
       'constructor Create(const Msg: string);',
       @Exception.Create);
  RegisterMethod(Exception,
       'constructor CreateFmt(const Msg: string; const Args: array of const);',
       @Exception.CreateFmt);
  RegisterMethod(Exception,
       'constructor CreateHelp(const Msg: string; AHelpContext: Integer);',
       @Exception.CreateHelp);
  RegisterMethod(Exception,
       'constructor CreateFmtHelp(const Msg: string; const Args: array of const;      AHelpContext: Integer);',
       @Exception.CreateFmtHelp);
  RegisterMethod(Exception,
       'function Exception__GetHelpContext(Self:Exception):Integer;',
       @Exception__GetHelpContext, true);
  RegisterMethod(Exception,
       'procedure Exception__PutHelpContext(Self:Exception;const Value: Integer);',
       @Exception__PutHelpContext, true);
  RegisterProperty(Exception,
       'property HelpContext:Integer read Exception__GetHelpContext write Exception__PutHelpContext;');
  RegisterMethod(Exception,
       'function Exception__GetMessage(Self:Exception):String;',
       @Exception__GetMessage, true);
  RegisterMethod(Exception,
       'procedure Exception__PutMessage(Self:Exception;const Value: String);',
       @Exception__PutMessage, true);
  RegisterProperty(Exception,
       'property Message:String read Exception__GetMessage write Exception__PutMessage;');
  // End of class Exception
  // Begin of class EHeapException
  RegisterClassType(EHeapException, H);
  RegisterStdMethodEx(EHeapException,'FreeInstance',EHeapException_FreeInstance,0,[typeVARIANT]);
  RegisterMethod(EHeapException,
       'constructor Create(const Msg: string);',
       @EHeapException.Create);
  // End of class EHeapException
  // Begin of class EInOutError
  RegisterClassType(EInOutError, H);
  RegisterMethod(EInOutError,
       'constructor Create(const Msg: string);',
       @EInOutError.Create);
  // End of class EInOutError
  // Begin of class EExternal
  RegisterClassType(EExternal, H);
  RegisterMethod(EExternal,
       'constructor Create(const Msg: string);',
       @EExternal.Create);
  // End of class EExternal
  // Begin of class EStackOverflow
  RegisterClassType(EStackOverflow, H);
  RegisterMethod(EStackOverflow,
       'constructor Create(const Msg: string);',
       @EStackOverflow.Create);
  // End of class EStackOverflow
  // Begin of class EAbstractError
  RegisterClassType(EAbstractError, H);
  RegisterMethod(EAbstractError,
       'constructor Create(const Msg: string);',
       @EAbstractError.Create);
  // End of class EAbstractError
  // Begin of class EOSError
  RegisterClassType(EOSError, H);
  RegisterMethod(EOSError,
       'constructor Create(const Msg: string);',
       @EOSError.Create);
  // End of class EOSError
  // Begin of class EWin32Error
  RegisterClassType(EWin32Error, H);
  RegisterMethod(EWin32Error,
       'constructor Create(const Msg: string);',
       @EWin32Error.Create);
  // End of class EWin32Error
  RegisterVariable('EmptyStr', 'STRING',@EmptyStr, H);
  RegisterVariable('Win32Platform', 'INTEGER',@Win32Platform, H);
  RegisterVariable('Win32MajorVersion', 'INTEGER',@Win32MajorVersion, H);
  RegisterVariable('Win32MinorVersion', 'INTEGER',@Win32MinorVersion, H);
  RegisterVariable('Win32BuildNumber', 'INTEGER',@Win32BuildNumber, H);
  RegisterVariable('Win32CSDVersion', 'STRING',@Win32CSDVersion, H);
  RegisterRoutine('function CheckWin32Version(AMajor: Integer; AMinor: Integer = 0): Boolean;', @CheckWin32Version, H);
  RegisterStdRoutineEx('GetFileVersion', _GetFileVersion,1,[typeSTRING,typeCARDINAL], H);
  RegisterVariable('CurrencyString', 'STRING',@CurrencyString, H);
  RegisterVariable('CurrencyFormat', 'BYTE',@CurrencyFormat, H);
  RegisterVariable('NegCurrFormat', 'BYTE',@NegCurrFormat, H);
  RegisterVariable('ThousandSeparator', 'CHAR',@ThousandSeparator, H);
  RegisterVariable('DecimalSeparator', 'CHAR',@DecimalSeparator, H);
  RegisterVariable('CurrencyDecimals', 'BYTE',@CurrencyDecimals, H);
  RegisterVariable('DateSeparator', 'CHAR',@DateSeparator, H);
  RegisterVariable('ShortDateFormat', 'STRING',@ShortDateFormat, H);
  RegisterVariable('LongDateFormat', 'STRING',@LongDateFormat, H);
  RegisterVariable('TimeSeparator', 'CHAR',@TimeSeparator, H);
  RegisterVariable('TimeAMString', 'STRING',@TimeAMString, H);
  RegisterVariable('TimePMString', 'STRING',@TimePMString, H);
  RegisterVariable('ShortTimeFormat', 'STRING',@ShortTimeFormat, H);
  RegisterVariable('LongTimeFormat', 'STRING',@LongTimeFormat, H);
  RegisterVariable('TwoDigitYearCenturyWindow', 'WORD',@TwoDigitYearCenturyWindow, H);
  RegisterVariable('ListSeparator', 'CHAR',@ListSeparator, H);
  RegisterRTTIType(TypeInfo(TLocaleOptions));
  RegisterConstant('MaxEraCount', 7, H);
  RegisterConstant('PathDelim', '\', H);
  RegisterConstant('DriveDelim', ':', H);
  RegisterConstant('PathSep', ';', H);
  RegisterRoutine('function Languages: TLanguages;', @Languages, H);
  RegisterRoutine('procedure AddExitProc(Proc: TProcedure);', @AddExitProc, H);
  RegisterRoutine('function NewStr(const S: string): PString; deprecated;', @NewStr, H);
  RegisterRoutine('procedure DisposeStr(P: PString); deprecated;', @DisposeStr, H);
  RegisterRoutine('procedure AssignStr(var P: PString; const S: string); deprecated;', @AssignStr, H);
  RegisterRoutine('procedure AppendStr(var Dest: string; const S: string); deprecated;', @AppendStr, H);
  RegisterStdRoutineEx('UpperCase', _UpperCase9,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function UpperCase(const S: string; LocaleOptions: TLocaleOptions): string; overload;', @UpperCase10, H);
  RegisterStdRoutineEx('LowerCase', _LowerCase11,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function LowerCase(const S: string; LocaleOptions: TLocaleOptions): string; overload;', @LowerCase12, H);
  RegisterStdRoutineEx('CompareStr', _CompareStr13,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterRoutine('function CompareStr(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; overload;', @CompareStr14, H);
  RegisterStdRoutineEx('SameStr', _SameStr15,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function SameStr(const S1, S2: string; LocaleOptions: TLocaleOptions): Boolean; overload;', @SameStr16, H);
  RegisterStdRoutineEx('CompareMem', _CompareMem,3,[typePOINTER,typePOINTER,typeINTEGER,typeBOOLEAN], H);
  RegisterStdRoutineEx('CompareText', _CompareText17,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterRoutine('function CompareText(const S1, S2: string; LocaleOptions: TLocaleOptions): Integer; overload;', @CompareText18, H);
  RegisterStdRoutineEx('SameText', _SameText19,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function SameText(const S1, S2: string; LocaleOptions: TLocaleOptions): Boolean; overload;', @SameText20, H);
  RegisterStdRoutineEx('AnsiUpperCase', _AnsiUpperCase,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('AnsiLowerCase', _AnsiLowerCase,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('AnsiCompareStr', _AnsiCompareStr,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('AnsiSameStr', _AnsiSameStr,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('AnsiCompareText', _AnsiCompareText,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('AnsiSameText', _AnsiSameText,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function AnsiStrComp(S1, S2: PChar): Integer;', @AnsiStrComp, H);
  RegisterRoutine('function AnsiStrIComp(S1, S2: PChar): Integer;', @AnsiStrIComp, H);
  RegisterRoutine('function AnsiStrLComp(S1, S2: PChar; MaxLen: Cardinal): Integer;', @AnsiStrLComp, H);
  RegisterRoutine('function AnsiStrLIComp(S1, S2: PChar; MaxLen: Cardinal): Integer;', @AnsiStrLIComp, H);
  RegisterRoutine('function AnsiStrLower(Str: PChar): PChar;', @AnsiStrLower, H);
  RegisterRoutine('function AnsiStrUpper(Str: PChar): PChar;', @AnsiStrUpper, H);
  RegisterRoutine('function AnsiLastChar(const S: string): PChar;', @AnsiLastChar, H);
  RegisterRoutine('function AnsiStrLastChar(P: PChar): PChar;', @AnsiStrLastChar, H);
  RegisterRoutine('function WideUpperCase(const S: WideString): WideString;', @WideUpperCase, H);
  RegisterRoutine('function WideLowerCase(const S: WideString): WideString;', @WideLowerCase, H);
  RegisterRoutine('function WideCompareStr(const S1, S2: WideString): Integer;', @WideCompareStr, H);
  RegisterRoutine('function WideSameStr(const S1, S2: WideString): Boolean;', @WideSameStr, H);
  RegisterRoutine('function WideCompareText(const S1, S2: WideString): Integer;', @WideCompareText, H);
  RegisterRoutine('function WideSameText(const S1, S2: WideString): Boolean;', @WideSameText, H);
  RegisterStdRoutineEx('Trim', _Trim21,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function Trim(const S: WideString): WideString; overload;', @Trim22, H);
  RegisterStdRoutineEx('TrimLeft', _TrimLeft23,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function TrimLeft(const S: WideString): WideString; overload;', @TrimLeft24, H);
  RegisterStdRoutineEx('TrimRight', _TrimRight25,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function TrimRight(const S: WideString): WideString; overload;', @TrimRight26, H);
  RegisterStdRoutineEx('QuotedStr', _QuotedStr,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('function AnsiQuotedStr(const S: string; Quote: Char): string;', @AnsiQuotedStr, H);
  RegisterRoutine('function AnsiExtractQuotedStr(var Src: PChar; Quote: Char): string;', @AnsiExtractQuotedStr, H);
  RegisterRoutine('function AnsiDequotedStr(const S: string; AQuote: Char): string;', @AnsiDequotedStr, H);
  RegisterRoutine('function IsValidIdent(const Ident: string; AllowDots: Boolean = False): Boolean;', @IsValidIdent, H);
  RegisterStdRoutineEx('IntToStr', _IntToStr27,1,[typeINTEGER,typeSTRING], H);
  RegisterRoutine('function IntToStr(Value: Int64): string; overload;', @IntToStr28, H);
  RegisterStdRoutineEx('IntToHex', _IntToHex29,2,[typeINTEGER,typeINTEGER,typeSTRING], H);
  RegisterRoutine('function IntToHex(Value: Int64; Digits: Integer): string; overload;', @IntToHex30, H);
  RegisterStdRoutineEx('StrToInt', _StrToInt,1,[typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('StrToIntDef', _StrToIntDef,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function TryStrToInt(const S: string; out Value: Integer): Boolean;', @TryStrToInt, H);
  RegisterRoutine('function StrToInt64(const S: string): Int64;', @StrToInt64, H);
  RegisterRoutine('function StrToInt64Def(const S: string; const Default: Int64): Int64;', @StrToInt64Def, H);
  RegisterRoutine('function TryStrToInt64(const S: string; out Value: Int64): Boolean;', @TryStrToInt64, H);
  RegisterConstant('DefaultTrueBoolStr', 'True', H);
  RegisterConstant('DefaultFalseBoolStr', 'False', H);
  RegisterStdRoutineEx('StrToBool', _StrToBool,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('StrToBoolDef', _StrToBoolDef,2,[typeSTRING,typeBOOLEAN,typeBOOLEAN], H);
  RegisterRoutine('function TryStrToBool(const S: string; out Value: Boolean): Boolean;', @TryStrToBool, H);
  RegisterRoutine('function BoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;', @BoolToStr, H);
  RegisterStdRoutineEx('LoadStr', _LoadStr,1,[typeINTEGER,typeSTRING], H);
  RegisterRoutine('function FmtLoadStr(Ident: Integer; const Args: array of const): string;', @FmtLoadStr, H);
  RegisterRoutine('function FileOpen(const FileName: string; Mode: LongWord): Integer;', @FileOpen, H);
  RegisterStdRoutineEx('FileCreate', _FileCreate31,1,[typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('FileCreate', _FileCreate32,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutine('FileRead', _FileRead, 3, H);
  RegisterStdRoutine('FileWrite', _FileWrite, 3, H);
  RegisterStdRoutineEx('FileSeek', _FileSeek33,3,[typeINTEGER,typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function FileSeek(Handle: Integer; const Offset: Int64; Origin: Integer): Int64; overload;', @FileSeek34, H);
  RegisterStdRoutineEx('FileClose', _FileClose,1,[typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('FileAge', _FileAge35,1,[typeSTRING,typeINTEGER], H);
  RegisterRoutine('function FileAge(const FileName: string; out FileDateTime: TDateTime): Boolean; overload;', @FileAge36, H);
  RegisterStdRoutineEx('FileExists', _FileExists,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('DirectoryExists', _DirectoryExists,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('ForceDirectories', _ForceDirectories,1,[typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function FindFirst(const Path: string; Attr: Integer;  var F: TSearchRec): Integer;', @FindFirst, H);
  RegisterRoutine('function FindNext(var F: TSearchRec): Integer;', @FindNext, H);
  RegisterRoutine('procedure FindClose(var F: TSearchRec);', @FindClose, H);
  RegisterStdRoutineEx('FileGetDate', _FileGetDate,1,[typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('FileSetDate', _FileSetDate37,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('FileSetDate', _FileSetDate38,2,[typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('FileGetAttr', _FileGetAttr,1,[typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('FileSetAttr', _FileSetAttr,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('FileIsReadOnly', _FileIsReadOnly,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('FileSetReadOnly', _FileSetReadOnly,2,[typeSTRING,typeBOOLEAN,typeBOOLEAN], H);
  RegisterStdRoutineEx('DeleteFile', _DeleteFile,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('RenameFile', _RenameFile,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('IsAssembly', _IsAssembly,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('ChangeFileExt', _ChangeFileExt,2,[typeSTRING,typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ChangeFilePath', _ChangeFilePath,2,[typeSTRING,typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractFilePath', _ExtractFilePath,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractFileDir', _ExtractFileDir,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractFileDrive', _ExtractFileDrive,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractFileName', _ExtractFileName,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractFileExt', _ExtractFileExt,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExpandFileName', _ExpandFileName,1,[typeSTRING,typeSTRING], H);
  RegisterRTTIType(TypeInfo(TFilenameCaseMatch));
  RegisterRoutine('function ExpandFileNameCase(const FileName: string;  out MatchFound: TFilenameCaseMatch): string;', @ExpandFileNameCase, H);
  RegisterStdRoutineEx('ExpandUNCFileName', _ExpandUNCFileName,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractRelativePath', _ExtractRelativePath,2,[typeSTRING,typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExtractShortPathName', _ExtractShortPathName,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('FileSearch', _FileSearch,2,[typeSTRING,typeSTRING,typeSTRING], H);
  RegisterRoutine('function DiskFree(Drive: Byte): Int64;', @DiskFree, H);
  RegisterRoutine('function DiskSize(Drive: Byte): Int64;', @DiskSize, H);
  RegisterRoutine('function FileDateToDateTime(FileDate: Integer): TDateTime;', @FileDateToDateTime, H);
  RegisterRoutine('function DateTimeToFileDate(DateTime: TDateTime): Integer;', @DateTimeToFileDate, H);
  RegisterStdRoutineEx('GetCurrentDir', _GetCurrentDir,0,[typeSTRING], H);
  RegisterStdRoutineEx('SetCurrentDir', _SetCurrentDir,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('CreateDir', _CreateDir,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('RemoveDir', _RemoveDir,1,[typeSTRING,typeBOOLEAN], H);
  RegisterRoutine('function StrLen(const Str: PChar): Cardinal;', @StrLen, H);
  RegisterRoutine('function StrEnd(const Str: PChar): PChar;', @StrEnd, H);
  RegisterRoutine('function StrMove(Dest: PChar; const Source: PChar; Count: Cardinal): PChar;', @StrMove, H);
  RegisterRoutine('function StrCopy(Dest: PChar; const Source: PChar): PChar;', @StrCopy, H);
  RegisterRoutine('function StrECopy(Dest:PChar; const Source: PChar): PChar;', @StrECopy, H);
  RegisterRoutine('function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar;', @StrLCopy, H);
  RegisterRoutine('function StrPCopy(Dest: PChar; const Source: string): PChar;', @StrPCopy, H);
  RegisterRoutine('function StrPLCopy(Dest: PChar; const Source: string;  MaxLen: Cardinal): PChar;', @StrPLCopy, H);
  RegisterRoutine('function StrCat(Dest: PChar; const Source: PChar): PChar;', @StrCat, H);
  RegisterRoutine('function StrLCat(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar;', @StrLCat, H);
  RegisterRoutine('function StrComp(const Str1, Str2: PChar): Integer;', @StrComp, H);
  RegisterRoutine('function StrIComp(const Str1, Str2: PChar): Integer;', @StrIComp, H);
  RegisterRoutine('function StrLComp(const Str1, Str2: PChar; MaxLen: Cardinal): Integer;', @StrLComp, H);
  RegisterRoutine('function StrLIComp(const Str1, Str2: PChar; MaxLen: Cardinal): Integer;', @StrLIComp, H);
  RegisterRoutine('function StrScan(const Str: PChar; Chr: Char): PChar;', @StrScan, H);
  RegisterRoutine('function StrRScan(const Str: PChar; Chr: Char): PChar;', @StrRScan, H);
  RegisterRoutine('function StrPos(const Str1, Str2: PChar): PChar;', @StrPos, H);
  RegisterRoutine('function StrUpper(Str: PChar): PChar;', @StrUpper, H);
  RegisterRoutine('function StrLower(Str: PChar): PChar;', @StrLower, H);
  RegisterRoutine('function StrPas(const Str: PChar): string;', @StrPas, H);
  RegisterRoutine('function StrAlloc(Size: Cardinal): PChar;', @StrAlloc, H);
  RegisterRoutine('function StrBufSize(const Str: PChar): Cardinal;', @StrBufSize, H);
  RegisterRoutine('function StrNew(const Str: PChar): PChar;', @StrNew, H);
  RegisterRoutine('procedure StrDispose(Str: PChar);', @StrDispose, H);
  RegisterRoutine('function Format(const Format: string;  const Args: array of const): string; overload;', @Format39, H);
  RegisterRoutine('function Format(const Format: string; const Args: array of const;  const FormatSettings: TFormatSettings): string; overload;', @Format40, H);
  RegisterRoutine('procedure FmtStr(var Result: string; const Format: string;  const Args: array of const); overload;', @FmtStr41, H);
  RegisterRoutine('procedure FmtStr(var Result: string; const Format: string;  const Args: array of const; const FormatSettings: TFormatSettings); overload;', @FmtStr42, H);
  RegisterRoutine('function StrFmt(Buffer, Format: PChar;  const Args: array of const): PChar; overload;', @StrFmt43, H);
  RegisterRoutine('function StrFmt(Buffer, Format: PChar; const Args: array of const;  const FormatSettings: TFormatSettings): PChar; overload;', @StrFmt44, H);
  RegisterRoutine('function StrLFmt(Buffer: PChar; MaxBufLen: Cardinal; Format: PChar;  const Args: array of const): PChar; overload;', @StrLFmt45, H);
  RegisterRoutine('function StrLFmt(Buffer: PChar; MaxBufLen: Cardinal; Format: PChar;  const Args: array of const;  const FormatSettings: TFormatSettings): PChar; overload;', @StrLFmt46, H);
  RegisterRoutine('function FormatBuf(var Buffer; BufLen: Cardinal; const Format;  FmtLen: Cardinal; const Args: array of const): Cardinal; overload;', @FormatBuf47, H);
  RegisterRoutine('function FormatBuf(var Buffer; BufLen: Cardinal; const Format;  FmtLen: Cardinal; const Args: array of const;  const FormatSettings: TFormatSettings): Cardinal; overload;', @FormatBuf48, H);
  RegisterRoutine('function WideFormat(const Format: WideString;  const Args: array of const): WideString; overload;', @WideFormat49, H);
  RegisterRoutine('function WideFormat(const Format: WideString;  const Args: array of const;  const FormatSettings: TFormatSettings): WideString; overload;', @WideFormat50, H);
  RegisterRoutine('procedure WideFmtStr(var Result: WideString; const Format: WideString;  const Args: array of const); overload;', @WideFmtStr51, H);
  RegisterRoutine('procedure WideFmtStr(var Result: WideString; const Format: WideString;  const Args: array of const; const FormatSettings: TFormatSettings); overload;', @WideFmtStr52, H);
  RegisterRoutine('function WideFormatBuf(var Buffer; BufLen: Cardinal; const Format;  FmtLen: Cardinal; const Args: array of const): Cardinal; overload;', @WideFormatBuf53, H);
  RegisterRoutine('function WideFormatBuf(var Buffer; BufLen: Cardinal; const Format;  FmtLen: Cardinal; const Args: array of const;  const FormatSettings: TFormatSettings): Cardinal; overload;', @WideFormatBuf54, H);
  RegisterStdRoutineEx('FloatToStr', _FloatToStr55,1,[typeDOUBLE,typeSTRING], H);
  RegisterRoutine('function FloatToStr(Value: Extended;  const FormatSettings: TFormatSettings): string; overload;', @FloatToStr56, H);
  RegisterRoutine('function CurrToStr(Value: Currency): string; overload;', @CurrToStr57, H);
  RegisterRoutine('function CurrToStr(Value: Currency;  const FormatSettings: TFormatSettings): string; overload;', @CurrToStr58, H);
  RegisterRoutine('function FloatToCurr(const Value: Extended): Currency;', @FloatToCurr, H);
  RegisterRoutine('function TryFloatToCurr(const Value: Extended; out AResult: Currency): Boolean;', @TryFloatToCurr, H);
  RegisterRoutine('function FloatToStrF(Value: Extended; Format: TFloatFormat;  Precision, Digits: Integer): string; overload;', @FloatToStrF59, H);
  RegisterRoutine('function FloatToStrF(Value: Extended; Format: TFloatFormat;  Precision, Digits: Integer;  const FormatSettings: TFormatSettings): string; overload;', @FloatToStrF60, H);
  RegisterRoutine('function CurrToStrF(Value: Currency; Format: TFloatFormat;  Digits: Integer): string; overload;', @CurrToStrF61, H);
  RegisterRoutine('function CurrToStrF(Value: Currency; Format: TFloatFormat;  Digits: Integer; const FormatSettings: TFormatSettings): string; overload;', @CurrToStrF62, H);
  RegisterRoutine('function FloatToText(BufferArg: PChar; const Value; ValueType: TFloatValue;  Format: TFloatFormat; Precision, Digits: Integer): Integer; overload;', @FloatToText63, H);
  RegisterRoutine('function FloatToText(BufferArg: PChar; const Value; ValueType: TFloatValue;  Format: TFloatFormat; Precision, Digits: Integer;  const FormatSettings: TFormatSettings): Integer; overload;', @FloatToText64, H);
  RegisterStdRoutineEx('FormatFloat', _FormatFloat65,2,[typeSTRING,typeDOUBLE,typeSTRING], H);
  RegisterRoutine('function FormatFloat(const Format: string; Value: Extended;  const FormatSettings: TFormatSettings): string; overload;', @FormatFloat66, H);
  RegisterRoutine('function FormatCurr(const Format: string; Value: Currency): string; overload;', @FormatCurr67, H);
  RegisterRoutine('function FormatCurr(const Format: string; Value: Currency;  const FormatSettings: TFormatSettings): string; overload;', @FormatCurr68, H);
  RegisterRoutine('function FloatToTextFmt(Buf: PChar; const Value; ValueType: TFloatValue;  Format: PChar): Integer; overload;', @FloatToTextFmt69, H);
  RegisterRoutine('function FloatToTextFmt(Buf: PChar; const Value; ValueType: TFloatValue;  Format: PChar; const FormatSettings: TFormatSettings): Integer; overload;', @FloatToTextFmt70, H);
  RegisterStdRoutineEx('StrToFloat', _StrToFloat71,1,[typeSTRING,typeDOUBLE], H);
  RegisterRoutine('function StrToFloat(const S: string;  const FormatSettings: TFormatSettings): Extended; overload;', @StrToFloat72, H);
  RegisterStdRoutineEx('StrToFloatDef', _StrToFloatDef73,2,[typeSTRING,typeDOUBLE,typeDOUBLE], H);
  RegisterRoutine('function StrToFloatDef(const S: string; const Default: Extended;  const FormatSettings: TFormatSettings): Extended; overload;', @StrToFloatDef74, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Extended): Boolean; overload;', @TryStrToFloat75, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Extended;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToFloat76, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Double): Boolean; overload;', @TryStrToFloat77, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Double;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToFloat78, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Single): Boolean; overload;', @TryStrToFloat79, H);
  RegisterRoutine('function TryStrToFloat(const S: string; out Value: Single;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToFloat80, H);
  RegisterRoutine('function StrToCurr(const S: string): Currency; overload;', @StrToCurr81, H);
  RegisterRoutine('function StrToCurr(const S: string;  const FormatSettings: TFormatSettings): Currency; overload;', @StrToCurr82, H);
  RegisterRoutine('function StrToCurrDef(const S: string;  const Default: Currency): Currency; overload;', @StrToCurrDef83, H);
  RegisterRoutine('function StrToCurrDef(const S: string; const Default: Currency;  const FormatSettings: TFormatSettings): Currency; overload;', @StrToCurrDef84, H);
  RegisterRoutine('function TryStrToCurr(const S: string; out Value: Currency): Boolean; overload;', @TryStrToCurr85, H);
  RegisterRoutine('function TryStrToCurr(const S: string; out Value: Currency;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToCurr86, H);
  RegisterRoutine('function TextToFloat(Buffer: PChar; var Value;  ValueType: TFloatValue): Boolean; overload;', @TextToFloat87, H);
  RegisterRoutine('function TextToFloat(Buffer: PChar; var Value; ValueType: TFloatValue;  const FormatSettings: TFormatSettings): Boolean; overload;', @TextToFloat88, H);
  RegisterRoutine('procedure FloatToDecimal(var Result: TFloatRec; const Value;  ValueType: TFloatValue; Precision, Decimals: Integer);', @FloatToDecimal, H);
  RegisterRoutine('function DateTimeToTimeStamp(DateTime: TDateTime): TTimeStamp;', @DateTimeToTimeStamp, H);
  RegisterRoutine('function TimeStampToDateTime(const TimeStamp: TTimeStamp): TDateTime;', @TimeStampToDateTime, H);
  RegisterRoutine('function MSecsToTimeStamp(MSecs: Comp): TTimeStamp;', @MSecsToTimeStamp, H);
  RegisterRoutine('function TimeStampToMSecs(const TimeStamp: TTimeStamp): Comp;', @TimeStampToMSecs, H);
  RegisterRoutine('function EncodeDate(Year, Month, Day: Word): TDateTime;', @EncodeDate, H);
  RegisterRoutine('function EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime;', @EncodeTime, H);
  RegisterRoutine('function TryEncodeDate(Year, Month, Day: Word; out Date: TDateTime): Boolean;', @TryEncodeDate, H);
  RegisterRoutine('function TryEncodeTime(Hour, Min, Sec, MSec: Word; out Time: TDateTime): Boolean;', @TryEncodeTime, H);
  RegisterRoutine('procedure DecodeDate(const DateTime: TDateTime; var Year, Month, Day: Word);', @DecodeDate, H);
  RegisterRoutine('function DecodeDateFully(const DateTime: TDateTime; var Year, Month, Day,  DOW: Word): Boolean;', @DecodeDateFully, H);
  RegisterRoutine('procedure DecodeTime(const DateTime: TDateTime; var Hour, Min, Sec, MSec: Word);', @DecodeTime, H);
  RegisterRoutine('procedure DateTimeToSystemTime(const DateTime: TDateTime; var SystemTime: TSystemTime);', @DateTimeToSystemTime, H);
  RegisterRoutine('function SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime;', @SystemTimeToDateTime, H);
  RegisterRoutine('function DayOfWeek(const DateTime: TDateTime): Word;', @DayOfWeek, H);
  RegisterRoutine('function Date: TDateTime;', @Date, H);
  RegisterRoutine('function Time: TDateTime;', @Time, H);
  RegisterRoutine('function GetTime: TDateTime;', @GetTime, H);
  RegisterRoutine('function Now: TDateTime;', @Now, H);
  RegisterStdRoutine('CurrentYear', _CurrentYear,0, H);
  RegisterRoutine('function IncMonth(const DateTime: TDateTime; NumberOfMonths: Integer = 1): TDateTime;', @IncMonth, H);
  RegisterRoutine('procedure IncAMonth(var Year, Month, Day: Word; NumberOfMonths: Integer = 1);', @IncAMonth, H);
  RegisterRoutine('procedure ReplaceTime(var DateTime: TDateTime; const NewTime: TDateTime);', @ReplaceTime, H);
  RegisterRoutine('procedure ReplaceDate(var DateTime: TDateTime; const NewDate: TDateTime);', @ReplaceDate, H);
  RegisterStdRoutine('IsLeapYear', _IsLeapYear,1, H);
  RegisterRoutine('function DateToStr(const DateTime: TDateTime): string; overload;', @DateToStr89, H);
  RegisterRoutine('function DateToStr(const DateTime: TDateTime;  const FormatSettings: TFormatSettings): string; overload;', @DateToStr90, H);
  RegisterRoutine('function TimeToStr(const DateTime: TDateTime): string; overload;', @TimeToStr91, H);
  RegisterRoutine('function TimeToStr(const DateTime: TDateTime;  const FormatSettings: TFormatSettings): string; overload;', @TimeToStr92, H);
  RegisterRoutine('function DateTimeToStr(const DateTime: TDateTime): string; overload;', @DateTimeToStr93, H);
  RegisterRoutine('function DateTimeToStr(const DateTime: TDateTime;  const FormatSettings: TFormatSettings): string; overload;', @DateTimeToStr94, H);
  RegisterRoutine('function StrToDate(const S: string): TDateTime; overload;', @StrToDate95, H);
  RegisterRoutine('function StrToDate(const S: string;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToDate96, H);
  RegisterRoutine('function StrToDateDef(const S: string;  const Default: TDateTime): TDateTime; overload;', @StrToDateDef97, H);
  RegisterRoutine('function StrToDateDef(const S: string; const Default: TDateTime;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToDateDef98, H);
  RegisterRoutine('function TryStrToDate(const S: string; out Value: TDateTime): Boolean; overload;', @TryStrToDate99, H);
  RegisterRoutine('function TryStrToDate(const S: string; out Value: TDateTime;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToDate100, H);
  RegisterRoutine('function StrToTime(const S: string): TDateTime; overload;', @StrToTime101, H);
  RegisterRoutine('function StrToTime(const S: string;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToTime102, H);
  RegisterRoutine('function StrToTimeDef(const S: string;  const Default: TDateTime): TDateTime; overload;', @StrToTimeDef103, H);
  RegisterRoutine('function StrToTimeDef(const S: string; const Default: TDateTime;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToTimeDef104, H);
  RegisterRoutine('function TryStrToTime(const S: string; out Value: TDateTime): Boolean; overload;', @TryStrToTime105, H);
  RegisterRoutine('function TryStrToTime(const S: string; out Value: TDateTime;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToTime106, H);
  RegisterRoutine('function StrToDateTime(const S: string): TDateTime; overload;', @StrToDateTime107, H);
  RegisterRoutine('function StrToDateTime(const S: string;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToDateTime108, H);
  RegisterRoutine('function StrToDateTimeDef(const S: string;  const Default: TDateTime): TDateTime; overload;', @StrToDateTimeDef109, H);
  RegisterRoutine('function StrToDateTimeDef(const S: string; const Default: TDateTime;  const FormatSettings: TFormatSettings): TDateTime; overload;', @StrToDateTimeDef110, H);
  RegisterRoutine('function TryStrToDateTime(const S: string;  out Value: TDateTime): Boolean; overload;', @TryStrToDateTime111, H);
  RegisterRoutine('function TryStrToDateTime(const S: string; out Value: TDateTime;  const FormatSettings: TFormatSettings): Boolean; overload;', @TryStrToDateTime112, H);
  RegisterRoutine('function FormatDateTime(const Format: string;  DateTime: TDateTime): string; overload;', @FormatDateTime113, H);
  RegisterRoutine('function FormatDateTime(const Format: string; DateTime: TDateTime;  const FormatSettings: TFormatSettings): string; overload;', @FormatDateTime114, H);
  RegisterRoutine('procedure DateTimeToString(var Result: string; const Format: string;  DateTime: TDateTime); overload;', @DateTimeToString115, H);
  RegisterRoutine('procedure DateTimeToString(var Result: string; const Format: string;  DateTime: TDateTime; const FormatSettings: TFormatSettings); overload;', @DateTimeToString116, H);
  RegisterConstant('MaxDateTime: TDateTime', 2958465.99999, H);
  RegisterRoutine('function FloatToDateTime(const Value: Extended): TDateTime;', @FloatToDateTime, H);
  RegisterRoutine('function TryFloatToDateTime(const Value: Extended; out AResult: TDateTime): Boolean;', @TryFloatToDateTime, H);
  RegisterStdRoutineEx('SysErrorMessage', _SysErrorMessage,1,[typeINTEGER,typeSTRING], H);
  RegisterStdRoutineEx('GetLocaleStr', _GetLocaleStr,3,[typeINTEGER,typeINTEGER,typeSTRING,typeSTRING], H);
  RegisterRoutine('function GetLocaleChar(Locale, LocaleType: Integer; Default: Char): Char;', @GetLocaleChar, H);
  RegisterStdRoutineEx('GetFormatSettings', _GetFormatSettings,0,[typeINTEGER], H);
  RegisterRoutine('procedure GetLocaleFormatSettings(LCID: Integer;  var FormatSettings: TFormatSettings);', @GetLocaleFormatSettings, H);
  RegisterRoutine('function GetModuleName(Module: HMODULE): string;', @GetModuleName, H);
  RegisterRoutine('function ExceptionErrorMessage(ExceptObject: TObject; ExceptAddr: Pointer;  Buffer: PChar; Size: Integer): Integer;', @ExceptionErrorMessage, H);
  RegisterRoutine('procedure ShowException(ExceptObject: TObject; ExceptAddr: Pointer);', @ShowException, H);
  RegisterStdRoutineEx('Abort', _Abort,0,[typeINTEGER], H);
  RegisterStdRoutineEx('OutOfMemoryError', _OutOfMemoryError,0,[typeINTEGER], H);
  RegisterStdRoutineEx('Beep', _Beep,0,[typeINTEGER], H);
  RegisterRoutine('function ByteType(const S: string; Index: Integer): TMbcsByteType;', @ByteType, H);
  RegisterRoutine('function StrByteType(Str: PChar; Index: Cardinal): TMbcsByteType;', @StrByteType, H);
  RegisterStdRoutineEx('ByteToCharLen', _ByteToCharLen,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('CharToByteLen', _CharToByteLen,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('ByteToCharIndex', _ByteToCharIndex,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('CharToByteIndex', _CharToByteIndex,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function StrCharLength(const Str: PChar): Integer;', @StrCharLength, H);
  RegisterRoutine('function StrNextChar(const Str: PChar): PChar;', @StrNextChar, H);
  RegisterStdRoutineEx('CharLength', _CharLength,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('NextCharIndex', _NextCharIndex,2,[typeSTRING,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('IsPathDelimiter', _IsPathDelimiter,2,[typeSTRING,typeINTEGER,typeBOOLEAN], H);
  RegisterStdRoutineEx('IsDelimiter', _IsDelimiter,3,[typeSTRING,typeSTRING,typeINTEGER,typeBOOLEAN], H);
  RegisterStdRoutineEx('IncludeTrailingPathDelimiter', _IncludeTrailingPathDelimiter,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('IncludeTrailingBackslash', _IncludeTrailingBackslash,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExcludeTrailingPathDelimiter', _ExcludeTrailingPathDelimiter,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('ExcludeTrailingBackslash', _ExcludeTrailingBackslash,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('LastDelimiter', _LastDelimiter,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('AnsiCompareFileName', _AnsiCompareFileName,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterStdRoutineEx('SameFileName', _SameFileName,2,[typeSTRING,typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('AnsiLowerCaseFileName', _AnsiLowerCaseFileName,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('AnsiUpperCaseFileName', _AnsiUpperCaseFileName,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('AnsiPos', _AnsiPos,2,[typeSTRING,typeSTRING,typeINTEGER], H);
  RegisterRoutine('function AnsiStrPos(Str, SubStr: PChar): PChar;', @AnsiStrPos, H);
  RegisterRoutine('function AnsiStrRScan(Str: PChar; Chr: Char): PChar;', @AnsiStrRScan, H);
  RegisterRoutine('function AnsiStrScan(Str: PChar; Chr: Char): PChar;', @AnsiStrScan, H);
  RegisterRTTIType(TypeInfo(TReplaceFlags));
  RegisterConstant('rfReplaceAll', rfReplaceAll, H);
  RegisterConstant('rfIgnoreCase', rfIgnoreCase, H);
  RegisterStdRoutine('StringReplace', _StringReplace, 4, H);
  RegisterRoutine('function WrapText(const Line, BreakStr: string; const BreakChars: TSysCharSet;  MaxCol: Integer): string; overload;', @WrapText117, H);
  RegisterRoutine('function WrapText(const Line: string; MaxCol: Integer = 45): string; overload;', @WrapText118, H);
  RegisterRoutine('function FindCmdLineSwitch(const Switch: string; const Chars: TSysCharSet;  IgnoreCase: Boolean): Boolean; overload;', @FindCmdLineSwitch119, H);
  RegisterStdRoutineEx('FindCmdLineSwitch', _FindCmdLineSwitch120,1,[typeSTRING,typeBOOLEAN], H);
  RegisterStdRoutineEx('FindCmdLineSwitch', _FindCmdLineSwitch121,2,[typeSTRING,typeBOOLEAN,typeBOOLEAN], H);
  RegisterRoutine('procedure FreeAndNil(var Obj);', @FreeAndNil, H);
  RegisterRoutine('function Supports(const Instance: IInterface; const IID: TGUID; out Intf): Boolean; overload;', @Supports122, H);
  RegisterRoutine('function Supports(const Instance: TObject; const IID: TGUID; out Intf): Boolean; overload;', @Supports123, H);
  RegisterRoutine('function Supports(const Instance: IInterface; const IID: TGUID): Boolean; overload;', @Supports124, H);
  RegisterRoutine('function Supports(const Instance: TObject; const IID: TGUID): Boolean; overload;', @Supports125, H);
  RegisterRoutine('function Supports(const AClass: TClass; const IID: TGUID): Boolean; overload;', @Supports126, H);
  RegisterRoutine('function StringToGUID(const S: string): TGUID;', @StringToGUID, H);
  RegisterRoutine('function GUIDToString(const GUID: TGUID): string;', @GUIDToString, H);
  RegisterConstant('pfNeverBuild', $00000001, H);
  RegisterConstant('pfDesignOnly', $00000002, H);
  RegisterConstant('pfRunOnly', $00000004, H);
  RegisterConstant('pfIgnoreDupUnits', $00000008, H);
  RegisterInt64Constant('pfModuleTypeMask', $C0000000, H);
  RegisterConstant('pfExeModule', $00000000, H);
  RegisterConstant('pfPackageModule', $40000000, H);
  RegisterConstant('pfProducerMask', $0C000000, H);
  RegisterConstant('pfV3Produced', $00000000, H);
  RegisterConstant('pfProducerUndefined', $04000000, H);
  RegisterConstant('pfBCB4Produced', $08000000, H);
  RegisterConstant('pfDelphi4Produced', $0C000000, H);
  RegisterInt64Constant('pfLibraryModule', $80000000, H);
  RegisterConstant('pfConsumerMask', $00F00000, H);
  RegisterConstant('pfConsumerCompat', $00000000, H);
  RegisterConstant('pfConsumerDelphi', $00100000, H);
  RegisterConstant('pfConsumerBCB', $00200000, H);
  RegisterConstant('ufMainUnit', $01, H);
  RegisterConstant('ufPackageUnit', $02, H);
  RegisterConstant('ufWeakUnit', $04, H);
  RegisterConstant('ufOrgWeakUnit', $08, H);
  RegisterConstant('ufImplicitUnit', $10, H);
  RegisterRTTIType(TypeInfo(TNameType));
  RegisterRoutine('function LoadPackage(const Name: string): HMODULE; overload;', @LoadPackage127, H);
  RegisterRoutine('function LoadPackage(const Name: string; AValidatePackage: TValidatePackageProc): HMODULE; overload;', @LoadPackage128, H);
  RegisterRoutine('procedure UnloadPackage(Module: HMODULE);', @UnloadPackage, H);
  RegisterRoutine('procedure GetPackageInfo(Module: HMODULE; Param: Pointer; var Flags: Integer;  InfoProc: TPackageInfoProc);', @GetPackageInfo, H);
  RegisterRoutine('function GetPackageDescription(ModuleName: PChar): string;', @GetPackageDescription, H);
  RegisterRoutine('procedure InitializePackage(Module: HMODULE); overload;', @InitializePackage129, H);
  RegisterRoutine('procedure InitializePackage(Module: HMODULE; AValidatePackage: TValidatePackageProc); overload;', @InitializePackage130, H);
  RegisterRoutine('procedure FinalizePackage(Module: HMODULE);', @FinalizePackage, H);
  RegisterStdRoutineEx('RaiseLastOSError', _RaiseLastOSError131,0,[typeINTEGER], H);
  RegisterStdRoutineEx('RaiseLastOSError', _RaiseLastOSError132,1,[typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('RaiseLastWin32Error', _RaiseLastWin32Error,0,[typeINTEGER], H);
  RegisterRoutine('function Win32Check(RetVal: BOOL): BOOL;', @Win32Check, H);
  RegisterTypeAlias('TTerminateProc','function: Boolean');
  RegisterRoutine('procedure AddTerminateProc(TermProc: TTerminateProc);', @AddTerminateProc, H);
  RegisterStdRoutineEx('CallTerminateProcs', _CallTerminateProcs,0,[typeBOOLEAN], H);
  RegisterRoutine('function GDAL: LongWord;', @GDAL, H);
  RegisterStdRoutineEx('RCS', _RCS,0,[typeINTEGER], H);
  RegisterStdRoutineEx('RPR', _RPR,0,[typeINTEGER], H);
  RegisterVariable('HexDisplayPrefix', 'STRING',@HexDisplayPrefix, H);
  RegisterRoutine('function SafeLoadLibrary(const FileName: string;  ErrorMode: UINT = SEM_NOOPENFILEERRORBOX): HMODULE;', @SafeLoadLibrary, H);
  // Begin of interface IReadWriteSync
  RegisterInterfaceType('IReadWriteSync',IReadWriteSync,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IReadWriteSync,
       'procedure BeginRead;');
  RegisterInterfaceMethod(IReadWriteSync,
       'procedure EndRead;');
  RegisterInterfaceMethod(IReadWriteSync,
       'function BeginWrite: Boolean;');
  RegisterInterfaceMethod(IReadWriteSync,
       'procedure EndWrite;');
  // End of interface IReadWriteSync
  // Begin of class TSimpleRWSync
  RegisterClassType(TSimpleRWSync, H);
  RegisterMethod(TSimpleRWSync,
       'constructor Create;',
       @TSimpleRWSync.Create);
  RegisterMethod(TSimpleRWSync,
       'destructor Destroy; override;',
       @TSimpleRWSync.Destroy);
  RegisterStdMethodEx(TSimpleRWSync,'BeginRead',TSimpleRWSync_BeginRead,0,[typeVARIANT]);
  RegisterStdMethodEx(TSimpleRWSync,'EndRead',TSimpleRWSync_EndRead,0,[typeVARIANT]);
  RegisterStdMethodEx(TSimpleRWSync,'BeginWrite',TSimpleRWSync_BeginWrite,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TSimpleRWSync,'EndWrite',TSimpleRWSync_EndWrite,0,[typeVARIANT]);
  // End of class TSimpleRWSync
  // Begin of class TThreadLocalCounter
  RegisterClassType(TThreadLocalCounter, H);
  RegisterMethod(TThreadLocalCounter,
       'destructor Destroy; override;',
       @TThreadLocalCounter.Destroy);
  RegisterMethod(TThreadLocalCounter,
       'procedure Open(var Thread: PThreadInfo);',
       @TThreadLocalCounter.Open);
  RegisterMethod(TThreadLocalCounter,
       'procedure Delete(var Thread: PThreadInfo);',
       @TThreadLocalCounter.Delete);
  RegisterMethod(TThreadLocalCounter,
       'procedure Close(var Thread: PThreadInfo);',
       @TThreadLocalCounter.Close);
  RegisterMethod(TThreadLocalCounter,
       'constructor Create;',
       @TThreadLocalCounter.Create);
  // End of class TThreadLocalCounter
  // Begin of class TMultiReadExclusiveWriteSynchronizer
  RegisterClassType(TMultiReadExclusiveWriteSynchronizer, H);
  RegisterMethod(TMultiReadExclusiveWriteSynchronizer,
       'constructor Create;',
       @TMultiReadExclusiveWriteSynchronizer.Create);
  RegisterMethod(TMultiReadExclusiveWriteSynchronizer,
       'destructor Destroy; override;',
       @TMultiReadExclusiveWriteSynchronizer.Destroy);
  RegisterStdMethodEx(TMultiReadExclusiveWriteSynchronizer,'BeginRead',TMultiReadExclusiveWriteSynchronizer_BeginRead,0,[typeVARIANT]);
  RegisterStdMethodEx(TMultiReadExclusiveWriteSynchronizer,'EndRead',TMultiReadExclusiveWriteSynchronizer_EndRead,0,[typeVARIANT]);
  RegisterStdMethodEx(TMultiReadExclusiveWriteSynchronizer,'BeginWrite',TMultiReadExclusiveWriteSynchronizer_BeginWrite,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TMultiReadExclusiveWriteSynchronizer,'EndWrite',TMultiReadExclusiveWriteSynchronizer_EndWrite,0,[typeVARIANT]);
  RegisterMethod(TMultiReadExclusiveWriteSynchronizer,
       'function TMultiReadExclusiveWriteSynchronizer__GetRevisionLevel(Self:TMultiReadExclusiveWriteSynchronizer):Cardinal;',
       @TMultiReadExclusiveWriteSynchronizer__GetRevisionLevel, true);
  RegisterProperty(TMultiReadExclusiveWriteSynchronizer,
       'property RevisionLevel:Cardinal read TMultiReadExclusiveWriteSynchronizer__GetRevisionLevel;');
  // End of class TMultiReadExclusiveWriteSynchronizer
  RegisterTypeAlias('TMREWSync','TMultiReadExclusiveWriteSynchronizer');
  RegisterStdRoutineEx('GetEnvironmentVariable', _GetEnvironmentVariable133,1,[typeSTRING,typeSTRING], H);
end;
initialization
  RegisterIMP_SysUtils;
end.
