unit CBSDataFiles;

interface

uses
  SysUtils, Classes, DB, adsdata, adsfunc, adstable, adscnnct,
  StrUtils, Dialogs;

type
  TCreateCBSData = class(TDataModule)
    CreateTool: TAdsConnection;
    CreateQuery: TAdsQuery;
    FieldNameQuery: TAdsQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FDataSetOwner: TComponent;
    FADTDatabase: String;
    FDBFDatabase: String;
    FRequestType: String;
    FTableDataType: String;
    FSourceArea: String;
    FPatUnique: Integer;
    FExamUnique: Integer;
    FBillUnique: Integer;
    FSQLText: TStringList;
    FTableName: String;
    FDataSourceName: String;
    FRequestLive: Boolean;
    FFilterString: TStringList;
    FOpenSource: Boolean;
    FKeyType: String;
    FKeyValue: Integer;
    FSpecUnique: Integer;
    FLensUnique: Integer;
    FApptUnique: Integer;
    FClmUnique: Integer;
    FDBFDatabaseHandle: Integer;
    FADTDatabaseHandle: Integer;
    procedure SetADTDatabase(const Value: String);
    procedure SetDBFDatabase(const Value: String);
    procedure SetOwner(const Value: TComponent);
    procedure SetRequestType(const Value: String);
    procedure SetTableDataType(const Value: String);
    function CheckSetup: Integer;
    function CreateDataSources: Integer;
    procedure SetupSQL(CreateDS:Boolean=True);
    procedure SetSourceArea(const Value: String);
    function CreateNewDataSet(SetType: String): TDataSet;
    procedure SetBillUnique(const Value: Integer);
    procedure SetExamUnique(const Value: Integer);
    procedure SetPatUnique(const Value: Integer);
    procedure SetSQLText(const Value: TStringList);
    procedure SetDataSourceName(const Value: String);
    procedure SetFilterString(const Value: TStringList);
    procedure SetOpenSource(const Value: Boolean);
    procedure SetRequestLive(const Value: Boolean);
    procedure SetTableName(const Value: String);
    procedure SetLensUnique(const Value: Integer);
    procedure SetSpecUnique(const Value: Integer);
    procedure SetApptUnique(const Value: Integer);
    procedure SetClmUnique(const Value: Integer);
    procedure SetADTDatabaseHandle(const Value: Integer);
    procedure SetDBFDatabaseHandle(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    function CreateSource(const SentSource: String='';SentTableDataType: String='';SentRequestType:String=''):Integer;
    function SaveSource: Integer;
    property DataSetOwner: TComponent read FDataSetOwner write SetOwner;
    property ADTDatabase: String read FADTDatabase write SetADTDatabase;
    property DBFDatabase: String read FDBFDatabase write SetDBFDatabase;
    property ADTDatabaseHandle: Integer read FADTDatabaseHandle write SetADTDatabaseHandle;
    property DBFDatabaseHandle: Integer read FDBFDatabaseHandle write SetDBFDatabaseHandle;
    property TableDataType: String read FTableDataType write SetTableDataType;
    property RequestType: String read FRequestType write SetRequestType;
    property SourceArea: String read FSourceArea write SetSourceArea;
    property PatUnique: Integer read FPatUnique write SetPatUnique;
    property BillUnique: Integer read FBillUnique write SetBillUnique;
    property ExamUnique: Integer read FExamUnique write SetExamUnique;
    property LensUnique: Integer read FLensUnique write SetLensUnique;
    property SpecUnique: Integer read FSpecUnique write SetSpecUnique;
    property SQLText: TStringList read FSQLText write SetSQLText;
    property DataSourceName: String read FDataSourceName write SetDataSourceName;
    property TableName: String read FTableName write SetTableName;
    property RequestLive: Boolean read FRequestLive write SetRequestLive;
    property FilterString: TStringList read FFilterString write SetFilterString;
    property OpenSource: Boolean read FOpenSource write SetOpenSource;
    property ApptUnique: Integer read FApptUnique write SetApptUnique;
    property ClmUnique: Integer read FClmUnique write SetClmUnique;
  end;

var
  CreateCBSData: TCreateCBSData;

implementation

{$R *.dfm}

{ TCreateCBSData }
function TCreateCBSData.SaveSource: Integer;
  var x: Integer;
begin
  SetupSQL(False);
  with CreateQuery do
  begin
    Close;
    for x := 0 to ParamCount -1 do
    begin
      if Params[x].Name = 'TableDataType' then
        Params[x].AsString := TableDataType;
      if Params[x].Name = 'RequestType' then
        Params[x].AsString := RequestType;
      if Params[x].Name = 'SourceArea' then
        Params[x].AsString := SourceArea;
      if Params[x].Name = 'SQLText' then
        Params[x].AsString := SQLText.Text;
      if Params[x].Name = 'DataSourceName' then
        Params[x].AsString := DataSourceName;
      if Params[x].Name = 'TableName' then
        Params[x].AsString := TableName;
      if Params[x].Name = 'RequestLive' then
        Params[x].AsBoolean := RequestLive;
      if Params[x].Name = 'FilterString' then
        Params[x].AsString := FilterString.Text;
      if Params[x].Name = 'OpenSource' then
        Params[x].AsBoolean := OpenSource;
    end;
    ExecSQL;
  end;
end;

function TCreateCBSData.CreateSource(const SentSource: String='';SentTableDataType: String='';SentRequestType:String=''): Integer;
begin
  if SentSource <> '' then SourceArea := SentSource;
  if SentTableDataType <> '' then TableDataType := SentTableDataType;
  if SentRequestType <> '' then RequestType := SentRequestType;
  Result := CheckSetup;
  if Result > 0 then exit;
  Result := CreateDataSources;
end;

function TCreateCBSData.CheckSetup: Integer;
{  Checks for missing setup and returns additive numeric result based on
   the following
   Owner =1
   Database=2
   TableDataType=4
   RequestType=8   }

begin
   Result := 0;
   if not Assigned(FDataSetOwner) then Result := Result + 1;
   if (FDBFDatabase = '') and (FADTDatabase = '') then Result := Result + 2;
   if FTableDataType = '' then Result := Result + 4;
   if FRequestType = '' then Result := Result + 8;
end;

function TCreateCBSData.CreateDataSources: Integer;
var ThisDataSource: TDataSource;
begin
  SetupSQL;
  with CreateQuery do
  begin
    Open;
    First;
    while not Eof do
    begin
      ThisDataSource := TDataSource.Create(FDataSetOwner);
      ThisDataSource.Name := FieldByName('DataSourceName').AsString;
      ThisDataSource.DataSet := CreateNewDataSet(FieldByName('RequestType').AsString);
      Next;
    end;
  end;

end;

procedure TCreateCBSData.SetupSQL(CreateDS:Boolean=True);
var ConditionAdded: Boolean;
begin
  if CreateDS then
  begin
    ConditionAdded := False;
    with CreateQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DataSources');
      if FSourceArea <> '' then
      begin
        SQL.Add('where SourceArea = :SourceArea');
        ParamByName('SourceArea').AsString := FSourceArea;
        ConditionAdded := True;
      end;
      if FTableDataType <> '' then
      begin
        SQL.Add(ifthen(ConditionAdded,'and ','where ')+'TableType = :TableDataType');
        ParamByName('TableDataType').AsString := FTableDataType;
        ConditionAdded := True;
      end;
      if FRequestType <> '' then
      begin
        SQL.Add(ifthen(ConditionAdded,'and ','where ')+'RequestType = :RequestType');
        ParamByName('RequestType').AsString := FRequestType;
        ConditionAdded := True;
      end;
    end;
  end
  else
  begin
    with CreateQuery do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add('Insert into DataSources');
        Add('(DataSourceName,SourceArea,RequestType,TableType,');
        Add('TableName,RequestLive,SQLText,Filter,OpenSource)');
        Add('VALUES');
        Add('(:DataSourceName,:SourceArea,:RequestType,:TableDataType,');
        Add(':TableName,:RequestLive,:SQLText,:FilterString,:OpenSource)');
      end;
    end;
  end;

end;

function TCreateCBSData.CreateNewDataSet(SetType: String): TDataSet;
var ThisQuery: TADSQuery;
    ThisTable: TADSTable;
    x: Integer;
    I: Integer;
begin
  { TODO : Add code to check if dataset already exists }
  if uppercase(SetType) = 'QUERY' then
  begin
    ThisQuery := TADSQuery.Create(FDataSetOwner);
    ThisQuery.Name := CreateQuery.FieldByName('DataSourceName').AsString+'_1';
    { TODO : Pull the following code once we have a dataset that contains age }
    if uppercase(LeftStr(ThisQuery.Name,9)) = 'S_PATIENT' then
    begin
      with FieldNameQuery do
      begin
        DatabaseName := FDBFDatabase;
        SourceTableType := ttADSCdx;
        with SQL do
        begin
          Clear;
          Add('Select * from Patient');
        end;
        Open;
        ThisQuery.SQL.Clear;
        ThisQuery.SQL.Add('Select');
        // get all the field names
        for I := 0 to Fields.Count-1 do
          ThisQuery.SQL.Add(Fields[I].FieldName+', ');
        Close;
      end;
      ThisQuery.SQL.Add('TimeStampDiff(SQL_TSI_YEAR,Convert(birth,SQL_TIMESTAMP),Now())');
      ThisQuery.SQL.Add('- IIF(DayOfYear(Birth)>DayOfYear(Now()),1,0) as age');
      ThisQuery.SQL.Add('from patient');
      ThisQuery.SQL.Add('where PatUnique = :PatUnique');
    end
    else
    // end code to pull
      ThisQuery.SQL.Assign(CreateQuery.FieldByName('SQLText'));

    ThisQuery.RequestLive := CreateQuery.FieldByName('RequestLive').AsBoolean;
    if CreateQuery.FieldByName('TableType').AsString = 'ADT' then
    begin
      ThisQuery.DatabaseName := FADTDatabase;
      ThisQuery.SourceTableType := ttADSAdt
    end
    else
    begin
    ThisQuery.DatabaseName := FDBFDatabase;
    ThisQuery.SourceTableType := ttADSCdx;
    end;
    for x := 0 to ThisQuery.ParamCount -1 do
    begin
      if ThisQuery.Params[x].Name = 'PatUnique' then
        ThisQuery.Params[x].AsInteger := PatUnique;
      if ThisQuery.Params[x].Name = 'BillUnique' then
        ThisQuery.Params[x].AsInteger := BillUnique;
      if ThisQuery.Params[x].Name = 'ExamUnique' then
        ThisQuery.Params[x].AsInteger := ExamUnique;
      if ThisQuery.Params[x].Name = 'SpecUnique' then
        ThisQuery.Params[x].AsInteger := SpecUnique;
      if ThisQuery.Params[x].Name = 'LensUnique' then
        ThisQuery.Params[x].AsInteger := LensUnique;
    end;
    Result := ThisQuery;
  end
  else
  begin

  end;
end;

procedure TCreateCBSData.SetSourceArea(const Value: String);
begin
  FSourceArea := Value;
end;

procedure TCreateCBSData.SetPatUnique(const Value: Integer);
begin
  FPatUnique := Value;
end;

procedure TCreateCBSData.SetExamUnique(const Value: Integer);
begin
  FExamUnique := Value;
end;

procedure TCreateCBSData.SetBillUnique(const Value: Integer);
begin
  FBillUnique := Value;
end;

procedure TCreateCBSData.SetSQLText(const Value: TStringList);
begin
  FSQLText := Value;
end;

procedure TCreateCBSData.DataModuleCreate(Sender: TObject);
begin
  FSQLText := TStringList.Create;
  FFilterString := TStringList.Create;
  FSpecUnique := 0;
  FExamUnique := 0;
  FPatUnique := 0;
  FBillUnique := 0;
  FLensUnique := 0;
  FApptUnique := 0;
  FClmUnique := 0;
end;

procedure TCreateCBSData.DataModuleDestroy(Sender: TObject);
begin
  FDataSetOwner := nil;
  FreeAndNil(FSQLText);
  FreeAndNil(FFilterString);
end;


procedure TCreateCBSData.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

procedure TCreateCBSData.SetDataSourceName(const Value: String);
begin
  FDataSourceName := Value;
end;

procedure TCreateCBSData.SetRequestLive(const Value: Boolean);
begin
  FRequestLive := Value;
end;

procedure TCreateCBSData.SetFilterString(const Value: TStringList);
begin
  FFilterString := Value;
end;

procedure TCreateCBSData.SetOpenSource(const Value: Boolean);
begin
  FOpenSource := Value;
end;

procedure TCreateCBSData.SetOwner(const Value: TComponent);
begin
  FDataSetOwner := Value;
end;

procedure TCreateCBSData.SetADTDatabase(const Value: String);
begin
  FADTDatabase := Value;
end;
procedure TCreateCBSData.SetADTDatabaseHandle(const Value: Integer);
begin
  FADTDatabaseHandle := Value;
end;

procedure TCreateCBSData.SetDBFDatabase(const Value: String);
begin
  FDBFDatabase := Value;
end;

procedure TCreateCBSData.SetDBFDatabaseHandle(const Value: Integer);
begin
  FDBFDatabaseHandle := Value;
end;

procedure TCreateCBSData.SetRequestType(const Value: String);
begin
  FRequestType := Value;
end;

procedure TCreateCBSData.SetTableDataType(const Value: String);
begin
  FTableDataType := Value;
end;

procedure TCreateCBSData.SetSpecUnique(const Value: Integer);
begin
  FSpecUnique := Value;
end;

procedure TCreateCBSData.SetLensUnique(const Value: Integer);
begin
  FLensUnique := Value;
end;

procedure TCreateCBSData.SetApptUnique(const Value: Integer);
begin
  FApptUnique := Value;
end;

procedure TCreateCBSData.SetClmUnique(const Value: Integer);
begin
  FClmUnique := Value;
end;

end.
