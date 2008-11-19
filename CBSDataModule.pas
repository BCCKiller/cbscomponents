unit CBSDataModule;

interface

uses
  SysUtils, Classes, adscnnct, DB, adsdata, adsfunc, adstable;

type
  TBaseScreenModule = class(TDataModule)
    ExamTable: TAdsTable;
    S_EXAMSURG: TDataSource;
    S_EXAM: TDataSource;
    S_EXAMALGY: TDataSource;
    ExamALGTable: TAdsTable;
    ExamALRTTable: TAdsTable;
    S_EXAMALRT: TDataSource;
    ExamCLTable: TAdsTable;
    S_EXAMCL: TDataSource;
    ExamDiagTable: TAdsTable;
    S_EXAMDIAG: TDataSource;
    ExamImagTable: TAdsTable;
    S_EXAMIMAG: TDataSource;
    ExamIOPTable: TAdsTable;
    S_EXAMIOP: TDataSource;
    ExamMedTable: TAdsTable;
    S_EXAMMED: TDataSource;
    ExamRefrTable: TAdsTable;
    S_EXAMREFR: TDataSource;
    ExamSurgTable: TAdsTable;
    ExamApptTable: TAdsTable;
    S_ExamAppt: TDataSource;
    ExamCompTable: TAdsTable;
    S_ExamComp: TDataSource;
    CompulinkConnection: TAdsConnection;
    Pat_TodoTable: TAdsTable;
    patrecaltable: TAdsTable;
    patRefTable: TAdsTable;
    AlertTable: TAdsTable;
    S_Pat_ToDo: TDataSource;
    S_PatRecal: TDataSource;
    S_PatRef: TDataSource;
    s_alert: TDataSource;
    LttrhistTable: TAdsTable;
    S_LttrHist: TDataSource;
    ExamTestTable: TAdsTable;
    PatientTable: TAdsTable;
    BillTable: TAdsTable;
    fram_rxTable: TAdsTable;
    Lens_RxTable: TAdsTable;
    DocumentTable: TAdsTable;
    PatTrackTable: TAdsTable;
    InsuredTable: TAdsTable;
    Log_apptTable: TAdsTable;
    LogToDoTable: TAdsTable;
    CollectTable: TAdsTable;
    S_examtest: TDataSource;
    s_patient: TDataSource;
    S_Bill: TDataSource;
    S_Fram_RX: TDataSource;
    S_Lens_RX: TDataSource;
    S_Document: TDataSource;
    S_pattrack: TDataSource;
    s_insured: TDataSource;
    S_logappt: TDataSource;
    S_LogToDo: TDataSource;
    S_Collect: TDataSource;
    claimtable: TAdsTable;
    S_claim: TDataSource;
    ApptHistTable: TAdsTable;
    S_ApptHist: TDataSource;
    LogTrackTable: TAdsTable;
    S_LOGTRACK: TDataSource;
    AdsConnection1: TAdsConnection;
    CollectQuery: TAdsQuery;
    ExamQuery: TAdsQuery;
    ExamALGQuery: TAdsQuery;
    ExamALRTQuery: TAdsQuery;
    ExamCLQuery: TAdsQuery;
    ExamDiagQuery: TAdsQuery;
    ExamImagQuery: TAdsQuery;
    ExamIOPQuery: TAdsQuery;
    ExamMedQuery: TAdsQuery;
    ExamRefrQuery: TAdsQuery;
    ExamSurgQuery: TAdsQuery;
    ExamApptQuery: TAdsQuery;
    ExamCompQuery: TAdsQuery;
    Pat_TodoQuery: TAdsQuery;
    patrecalQuery: TAdsQuery;
    patRefQuery: TAdsQuery;
    AlertQuery: TAdsQuery;
    LttrhistQuery: TAdsQuery;
    ExamTestQuery: TAdsQuery;
    PatientQuery: TAdsQuery;
    BillQuery: TAdsQuery;
    fram_rxQuery: TAdsQuery;
    Lens_RxQuery: TAdsQuery;
    DocumentQuery: TAdsQuery;
    PatTrackQuery: TAdsQuery;
    InsuredQuery: TAdsQuery;
    Log_apptQuery: TAdsQuery;
    LogToDoQuery: TAdsQuery;
    claimQuery: TAdsQuery;
    ApptHistQuery: TAdsQuery;
    LogTrackQuery: TAdsQuery;
    ExamImag3Query: TAdsQuery;
    Examimag2Query: TAdsQuery;
    S_EXAMIMAG2: TDataSource;
    S_EXAMIMAG3: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FActive: Boolean;
    FKeyValue: Integer;
    FScreenType: WideString;
    FExamUnique: Integer;
    FBillUnique: Integer;
    FPatUnique: Integer;
    procedure SetActive(const Value: Boolean);
    procedure SetKeyValue(const Value: Integer);
    procedure SetScreenType(const Value: WideString);
    procedure ProcessTables;
    procedure SetExamUnique(const Value: Integer);
    procedure SetBillUnique(const Value: Integer);
    procedure SetPatUnique(const Value: Integer);
    procedure CloseData;
    procedure OpenData;
    { Private declarations }
  public
    { Public declarations }
    property Active: Boolean read FActive write SetActive;
    property KeyValue: Integer read FKeyValue write SetKeyValue;
    property ScreenType: WideString read FScreenType write SetScreenType;
    property ExamUnique: Integer read FExamUnique write SetExamUnique;
    property BillUnique: Integer read FBillUnique write SetBillUnique;
    property PatUnique: Integer read FPatUnique write SetPatUnique;
  end;

var
  BaseScreenModule: TBaseScreenModule;

implementation

{$R *.dfm}

{ TBaseScreenModule }

procedure TBaseScreenModule.ProcessTables;
begin
  if FActive then
  begin
    if not ExamUnique > 0 then
    begin
      // raise exam error;
      exit;
    end;
    ExamQuery.Close;
    ExamQuery.ParamByName('ExamUnique').AsInteger := ExamUnique;
    ExamQuery.Open;
    PatUnique := ExamQuery.FieldByName('PatUnique').AsInteger;
    PatientQuery.Close;
    PatientQuery.ParamByName('PatUnique').AsInteger := PatUnique;
    PatientQuery.Open;
    BillUnique := PatientQuery.FieldByName('BillUnique').AsInteger;
    {$Include LoadQuery.txt}
    OpenData;
   end
   else
     CloseData;
end;

procedure TBaseScreenModule.SetActive(const Value: Boolean);
begin
  FActive := Value;
  ProcessTables;
end;

procedure TBaseScreenModule.SetKeyValue(const Value: Integer);
begin
  FKeyValue := Value;
  ExamUnique := FKeyValue;
end;

procedure TBaseScreenModule.SetScreenType(const Value: WideString);
begin
  FScreenType := Value;
end;

procedure TBaseScreenModule.DataModuleDestroy(Sender: TObject);
begin
  CloseData;
end;

procedure TBaseScreenModule.DataModuleCreate(Sender: TObject);
begin
  {$INCLUDE SetupQuery.txt}
end;

procedure TBaseScreenModule.SetExamUnique(const Value: Integer);
begin
  FExamUnique := Value;
end;

procedure TBaseScreenModule.SetBillUnique(const Value: Integer);
begin
  FBillUnique := Value;
end;

procedure TBaseScreenModule.SetPatUnique(const Value: Integer);
begin
  FPatUnique := Value;
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

procedure TBaseScreenModule.OpenData;
var x: Integer;
begin
  for x:= 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[x] is TADSQuery then
      TADSQuery(Self.Components[x]).Open;
  end;
end;

end.
