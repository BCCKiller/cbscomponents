unit CBSBlankModule;

interface

uses
  SysUtils, Classes, adscnnct, DB, adsdata, adsfunc, adstable, CBSDataSources;

type
  TBaseScreenModule = class(TDataModule)
    FilesConnection: TAdsConnection;
    SetupBlankQuery: TAdsQuery;
    ToolsConnection: TAdsConnection;
  private
    FPatUnique: Integer;
    FScreenType: WideString;
    FKeyValue: Integer;
    FExamUnique: Integer;
    FActive: Boolean;
    FBillUnique: Integer;
    LoadedData: Boolean;
    TableName: String;
    TableKey: String;
    FApptUnique: Integer;
    FSpecUnique: Integer;
    FLensUnique: Integer;
    FClmUnique: Integer;
    FPatientInfo: WideString;
    procedure SetActive(const Value: Boolean);
    procedure SetBillUnique(const Value: Integer);
    procedure SetExamUnique(const Value: Integer);
    procedure SetKeyValue(const Value: Integer);
    procedure SetPatUnique(const Value: Integer);
    procedure SetScreenType(const Value: WideString);
    procedure ProcessDataSources;
    procedure SetParameters;
    procedure CloseData;
    procedure OpenData;
    function SetUniques: Boolean;
    function QueryPatUnique(ThisUnique: Integer): Integer;
    function QueryBillUnique: Integer;
    procedure SetApptUnique(const Value: Integer);
    procedure SetClmUnique(const Value: Integer);
    procedure SetLensUnique(const Value: Integer);
    procedure SetSpecUnique(const Value: Integer);
    procedure SetPatientInfo(const Value: WideString);
    { Private declarations }
  public
    { Public declarations }
    property Active: Boolean read FActive write SetActive;
    property KeyValue: Integer read FKeyValue write SetKeyValue;
    property ScreenType: WideString read FScreenType write SetScreenType;
    property ExamUnique: Integer read FExamUnique write SetExamUnique;
    property BillUnique: Integer read FBillUnique write SetBillUnique;
    property PatUnique: Integer read FPatUnique write SetPatUnique;
    property SpecUnique: Integer read FSpecUnique write SetSpecUnique;
    property LensUnique: Integer read FLensUnique write SetLensUnique;
    property ApptUnique: Integer read FApptUnique write SetApptUnique;
    property ClmUnique: Integer read FClmUnique write SetClmUnique;
    property PatientInfo: WideString read FPatientInfo write SetPatientInfo;
  end;

var
  BaseScreenModule: TBaseScreenModule;

implementation

{$R *.dfm}



{ TBaseScreenModule }

procedure TBaseScreenModule.SetPatientInfo(const Value: WideString);
begin
  FPatientInfo := Value;
end;

procedure TBaseScreenModule.SetPatUnique(const Value: Integer);
begin
  FPatUnique := Value;
end;

procedure TBaseScreenModule.SetScreenType(const Value: WideString);
begin
  FScreenType := UpperCase(Value);
  if FScreenType = 'F_EXAM' then
  begin
    TableKey := 'ExamUnique';
    TableName := 'EXAM';
  end;
  if FScreenType = 'F_SPECSCRN' then
  begin
    TableKey := 'specunique';
    TableName := 'FRAM_RX';
  end;
  if FScreenType = 'F_CLSCRN' then
  begin
    TableKey := 'lensunique';
    TableName := 'LENS_RX';
  end;
  if FScreenType = 'F_APPTEDIT' then
  begin
    TableKey := 'apptunique';
    TableName := 'APPT';
  end;
  if FScreenType = 'F_CLMSCRN' then
  begin
    TableKey := 'clmunique';
    TableName := 'CLAIM';
  end;

  if FScreenType = 'F_PATSCRN' then
  begin
    TableKey := 'patunique';
    TableName := 'PATIENT';
  end;
  if FScreenType = 'F_RESPSCRN' then
  begin
    TableKey := 'billunique';
    TableName := 'BILL';
  end;

end;

procedure TBaseScreenModule.SetKeyValue(const Value: Integer);
begin
  FKeyValue := Value;
end;

procedure TBaseScreenModule.SetExamUnique(const Value: Integer);
begin
  FExamUnique := Value;
end;

procedure TBaseScreenModule.SetActive(const Value: Boolean);
begin
  FActive := Value;
  ProcessDataSources;
end;

procedure TBaseScreenModule.SetBillUnique(const Value: Integer);
begin
  FBillUnique := Value;
end;

procedure TBaseScreenModule.ProcessDataSources;
begin
  if FActive then
  begin
//    ThisCreator := TCreateCBSData.Create(Self);
////    try
//
//    ThisCreator.DBFDatabase := MyDBFConnection.Name;
//    ThisCreator.ADTDatabase := MyADTConnection.Name;
//    ThisCreator.DBFDatabaseHandle := MyDBFConnection.Handle;
//    ThisCreator.ADTDatabaseHandle := MyADTConnection.Handle;
//    ThisCreator.SourceArea := Copy(FScreenType,3,30);
//    if ThisCreator.SourceArea = '' then ThisCreator.SourceArea := 'EXAM';
//    ThisCreator.RequestType := 'QUERY';
//    ThisCreator.TableDataType := 'DBF';
//    ThisCreator.DataSetOwner := Self;
//    ThisCreator.CreateSource;
//    LoadedData := True;
////    finally
////       FreeAndNil(ThisCreator);
////    end;
///
    LoadDataSources(Self);
    if SetUniques then
    begin
      SetParameters;
      OpenData;
    end;
  end
  else
    CloseData;

end;

procedure TBaseScreenModule.OpenData;
var x: Integer;
begin
  for x:= 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[x] is TDataSet then
    begin
      TDataSet(Self.Components[x]).Open;
      if copy(uppercase(TDataSet(Self.Components[x]).Name),1,9) = 'S_PATIENT' then
          PatientInfo := '#'+TDataSet(Self.Components[x]).FieldByName('BillUnique').AsWideString+ ' '+
                             TDataSet(Self.Components[x]).FieldByName('Last').AsWideString + ', '+
                             TDataSet(Self.Components[x]).FieldByName('First').AsWideString + ' ' +
                             TDataSet(Self.Components[x]).FieldByName('MI').AsWideString
    end;
  end;
end;


procedure TBaseScreenModule.CloseData;
var x: Integer;
begin
  for x:= 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[x] is TDataSet then
      TDataSet(Self.Components[x]).Close;
  end;
end;


procedure TBaseScreenModule.SetParameters;
var x, y: Integer;
begin
  for x:= 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[x] is TADSQuery then
    begin
      with Self.Components[x] as TADSQuery do
      begin
        Close;
        for y := 0 to ParamCount - 1 do
        begin
          if Params[y].Name = 'PatUnique' then
            Params[y].AsInteger := PatUnique;
          if Params[y].Name = 'BillUnique' then
            Params[y].AsInteger := BillUnique;
          if Params[y].Name = 'ExamUnique' then
            Params[y].AsInteger := ExamUnique;
          if Params[y].Name = 'SpecUnique' then
            Params[y].AsInteger := SpecUnique;
          if Params[y].Name = 'LensUnique' then
            Params[y].AsInteger := LensUnique;
          if Params[y].Name = 'ApptUnique' then
            Params[y].AsInteger := ApptUnique;
          if Params[y].Name = 'ClmUnique' then
            Params[y].AsInteger := ClmUnique;
        end;
      end;
    end;
  end;
end;


function TBaseScreenModule.SetUniques: Boolean;
var StartUnique: Integer;
begin
  // This sets the needed uniques from Keyvalue and ScreenType
  // Reset to 0 to avoid a wrong lookup
  Result := False;
  ExamUnique := 0;
  PatUnique := 0;
  BillUnique := 0;
  ClmUnique := 0;
  ApptUnique := 0;
  SpecUnique := 0;
  LensUnique := 0;
  if KeyValue = 0 then exit;
{ TODO :
The following is incomplete.   Will work for F_Exam, F_patscrn and everything
 else defaults to bill.... }
  if ScreenType = 'F_EXAM' then
    ExamUnique := KeyValue;
  if ScreenType = 'F_SPECSCRN' then
    specunique := KeyValue;
  if ScreenType = 'F_CLSCRN' then
    lensunique := KeyValue;
  if ScreenType = 'F_APPTEDIT' then
    apptunique := KeyValue;
  if ScreenType = 'F_CLMSCRN' then
    clmunique := KeyValue;

  if ScreenType = 'F_PATSCRN' then
    patunique := KeyValue;
  if ScreenType = 'F_RESPSCRN' then
    billunique := KeyValue;

 if PatUnique = 0 then
    PatUnique := QueryPatUnique(KeyValue);
  if PatUnique <> 0 then
    BillUnique := QueryBillUnique;
  Result := (PatUnique <> 0) or
            (BillUnique <> 0);
end;

function TBaseScreenModule.QueryBillUnique: Integer;
begin
  Result := 0;
  with SetupBlankQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select BillUnique from patient');
      Add('where patunique = :PatUnique');
    end;
    ParamByName('PatUnique').AsInteger := PatUnique;
    Open;
    if RecordCount <> 0 then
      Result := FieldByName('BillUnique').AsInteger;
    Close;
  end;
end;

function TBaseScreenModule.QueryPatUnique(ThisUnique: Integer): Integer;
begin
  Result := 0;
  with SetupBlankQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select patunique from '+TableName);
      Add('where '+TableKey+' = :Thisunique');
    end;
    ParamByName('Thisunique').AsInteger := ThisUnique;
    Open;
    if RecordCount <> 0 then
      Result := FieldByName('Patunique').AsInteger;
    Close;
  end;
end;

procedure TBaseScreenModule.SetApptUnique(const Value: Integer);
begin
  FApptUnique := Value;
end;

procedure TBaseScreenModule.SetSpecUnique(const Value: Integer);
begin
  FSpecUnique := Value;
end;

procedure TBaseScreenModule.SetLensUnique(const Value: Integer);
begin
  FLensUnique := Value;
end;

procedure TBaseScreenModule.SetClmUnique(const Value: Integer);
begin
  FClmUnique := Value;
end;

end.
