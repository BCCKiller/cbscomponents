unit CheckCBSDefault;

interface
uses Classes, SysUtils, StrUtils, DB, adscnnct, adsdata, adsfunc, adstable, ace;
type
  TCBSDefaultType = (dtExam, dtPatient, dtFrame, dtContact);

  TDefaultCheck = class
  private
    DefaultList: TStringList;
  public
    constructor Create(DefaultType: TCBSDefaultType);
    destructor Destroy;
  end;

function DefaultValue(const DataSourceName,FieldName:String):String;
function IsDefaultValue(const DataSourceName,FieldName:String; const CurrentValue:String):Boolean;overload;
function IsDefaultValue(const DataSourceName,FieldName:String; const CurrentValue:Boolean):Boolean;overload;
//function GetDefault(const FieldName: String; Field: TField):Boolean;
//function GetDefaultValue(Connection: ADSHandle; Name:String):Boolean;
//function GetLiveConnection(ThisControl: TWinControl): ADSHandle;
//function GetExistingConnection(ThisControl :IDefaultCheck): ADSHandle;

implementation

var _ExamCheck: TDefaultCheck;
var _PatientCheck: TDefaultCheck;

function CheckSetup(const DataSourceName:String):Boolean;
begin
  Result := False;
  if (uppercase(trim(DataSourceName))='S_EXAM') then
  begin
    if not Assigned(_ExamCheck) then
      _ExamCheck := TDefaultCheck.Create(dtExam);
    Result := Assigned(_ExamCheck);
    exit;
  end;
end;

function DefaultValue(const DataSourceName,FieldName:String):String;
begin
  Result := '';
  if not CheckSetup(DataSourceName) then Exit;
end;

function IsDefaultValue(const DataSourceName,FieldName:String; const CurrentValue:String):Boolean;overload;
var CheckField, RetVal: String;
begin
  Result := False;
  if not CheckSetup(DataSourceName) then Exit;
  CheckField := uppercase(trim(FieldName));
  if uppercase(trim(DataSourceName)) = 'S_EXAM' then
    RetVal := _ExamCheck.DefaultList.Values[CheckField];
  CheckField := uppercase(trim(CurrentValue));
  Result := (CheckField = RetVal);
end;

function IsDefaultValue(const DataSourceName,FieldName:String; const CurrentValue:Boolean):Boolean;overload;
var CheckField, RetVal: String;
begin
  Result := False;
  if not CheckSetup(DataSourceName) then Exit;
  CheckField := uppercase(trim(FieldName));
  if uppercase(trim(DataSourceName)) = 'S_EXAM' then
    RetVal := _ExamCheck.DefaultList.Values[CheckField];
  if CurrentValue then CheckField := 'Y' else CheckField := 'N';
  Result := (CheckField = RetVal);
end;

{ TDefaultCheck }

constructor TDefaultCheck.Create(DefaultType: TCBSDefaultType) ;
var LookupQuery: TADSQuery;
begin
  Inherited Create;
  DefaultList := TStringList.Create;
  LookupQuery := TAdsQuery.Create(nil);
  try
    with LookupQuery do
    begin
      DatabaseName := 'CBSFiles';
      TableType := ttAdsCDX;
      with SQL do
      begin
        Clear;
        Add('Select name,"default","type" from Examflds');
        Add('where not "default" is null');
      end;
      Open;
      First;
      while not EOF do
      begin
        DefaultList.Add('ZZ'+uppercase(trim(FieldByName('Name').AsString)) + '=' + uppercase(trim(FieldByName('Default').AsString)));
        Next;
      end;
      Close;
    end;
  finally
    FreeAndNil(LookupQuery);
  end;

end;

destructor TDefaultCheck.destroy;
begin
  DefaultList.Free;
end;
{
Function GetDefault(const FieldName: String; Field: TField):Boolean;
var
  ThisName: string;
  DefaultValue : string;
  DefaultType: char;
  ThisQuery: TADSQuery;
begin
  Result := False;
  ThisQuery := TADSQuery.Create(nil);
  with ThisQuery do
    try
      DatabaseName := 'CBSFiles';
      SourceTableType := ttADSCDX;
      SQL.Clear;
      SQL.Add('Select examflds."default",examflds."type" from examflds');
      SQL.Add('where Name = :Name');
      ThisName := FieldName;
      if LeftStr(ThisName, 2) = 'ZZ' then
        ThisName := copy(ThisName, 3, length(ThisName));
      Close;
      ParamByName('Name').AsString := ThisName;
      Open;
      if RecordCount > 0 then
      begin
        DefaultValue := uppercase(FieldByName('Type').AsString);
        DefaultType := DefaultValue[1];
        DefaultValue := uppercase(FieldByName('Default').AsString);
        if (DefaultValue <> '') then
        case DefaultType of
          'C': if DefaultValue = uppercase(Field.AsString) then
                 Result := True;
          'L': begin
             if (DefaultValue = 'Y') and Field.AsBoolean then
               Result := True;
             if (DefaultValue = 'N') and not Field.AsBoolean then
               Result := True;

          end;
        end

      end;
      Close;
    finally
      FreeAndNil(ThisQuery);
    end;
end;
}
{
function GetDefaultValue(Connection: ADSHandle; Name:String): Boolean;
var
  RetString: array[0..30] of char;
  Bufferlength: Integer;
  SQLQuery: ADSHandle;
  FinalCursor: ADSHandle;
  ErrorCode: Integer;
begin
  // Prepare SQL
  ErrorCode := ADSCreateSQLStatement(Connection,@SQLQuery);
  ErrorCode := ADSStmtSetTableType(SQLQuery,ADS_CDX);
  ErrorCode := ADSPrepareSQL(SQLQuery,'select content from exam where examunique = :examunique');
  ErrorCode := ADSSetLong(SQLQuery,'examunique',128);
  // Execute SQL
  ErrorCode := ADSExecuteSQL(SQLQuery,@FinalCursor);
  // Get Result
  BufferLength := 31;
  ErrorCode := ADSGetString(FinalCursor,PAnsiChar(Name),@RetString,
                            @BufferLength,ADS_NONE);
  // force to say is not default
  Result := False;
end;
}
{
function GetLiveConnection(ThisControl: TWinControl): ADSHandle;
begin
  if ThisControl is IDefaultCheck then
    Result := GetExistingConnection(ThisControl as IDefaultCheck)
  else
    Result := GetLiveConnection(ThisControl);
end;
}
{
function GetExistingConnection(ThisControl: IDefaultCheck): Integer;
begin
  if ThisControl is tfrmDesign then
    Result := TfrmDesign(ThisControl).Connection
  else
    if ThisControl.Connection = 0 then
      Result := GetLiveConnection(ThisControl)
    else Result := ThisControl.Connection;
end;
}
end.
