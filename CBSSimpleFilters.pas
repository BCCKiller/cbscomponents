unit CBSDBFilters;

interface
uses Classes, Windows, Controls, SysUtils, DBGrids, adsdata, adsfunc, adstable, DB, DBCtrls;

type

TCustomCBSDBGrid = class(TDBGrid)
private
  FFilterStatement: TStringList;
//  /// <summary>Contains original datasource and key field </summary>
  FLinkedDataLink: TFieldDataLink;
  /// <summary>ADSQuery that creates the filtered dataset</summary>
  BaseSQL: TAdsQuery;
  BaseDataSource: TDataSource;
  CurrentUnique: Integer;
  FCurrentExamOnly: Boolean;
  FCurrentPatientOnly: Boolean;
  FExam: Integer;
  FPatient: Integer;
  FRefreshGrid: Boolean;
  procedure SetFilterStatement(const Value: TStringList);
  function GetLinkedDataField: WideString;
  procedure SetLinkedDataField(const Value: WideString);
  procedure OutsideDataChange(Sender: TObject);overload;
  procedure OutsideDataChange(Sender: TObject; Field: TField);overload;

  procedure SetBaseData(Value: TADSTable);overload;
  procedure SetBaseData(Value: TADSQuery);overload;
  procedure UpdateSQL;
  procedure SetCurrentExamOnly(const Value: Boolean);
  procedure SetCurrentPatientOnly(const Value: Boolean);
  procedure SetExam(const Value: Integer);
  procedure SetPatient(const Value: Integer);
  function GetLinkedDataSource: TDataSource;
  procedure SetLinkedDataSource(const Value: TDataSource);
  procedure SetRefreshGrid(const Value: Boolean);
  property RefreshGrid: Boolean read FRefreshGrid write SetRefreshGrid;
  procedure MoveLinkedPointer;
protected
  procedure Paint; override;
  procedure Loaded; override;
  procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  property FilterStatement: TStringList read FFilterStatement write SetFilterStatement;
  // Linked Datasource ties to the unfiltered datasource
  property LinkedDataSource: TDataSource read GetLinkedDataSource write SetLinkedDataSource;
  property LinkedDataKeyField: WideString read GetLinkedDataField write SetLinkedDataField;
  property CurrentPatientOnly: Boolean read FCurrentPatientOnly write SetCurrentPatientOnly default True;
  property CurrentExamOnly: Boolean read FCurrentExamOnly write SetCurrentExamOnly default False;
public
  property Patient: Integer read FPatient write SetPatient;
  property Exam: Integer read FExam write SetExam;
  property ReadOnly;
  constructor Create(AOwner: TComponent);override;
  destructor Destroy;override;
end;

TCustomCBSPrintGrid = class(TCustomCBSDBGrid);

implementation

{ TCustomCBSDBGrid }

constructor TCustomCBSDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
    FFilterStatement := TStringList.Create;
    FLinkedDataLink := TFieldDataLink.Create;
    FLinkedDataLink.Control := Self;
//    FLinkedDataLink.OnDataChange := OutsideDataChange;
//    FLinkedDataLink.OnUpdateData := OutsideDataChange;
    FLinkedDataLink.OnEditingChange := OutsideDataChange;

    BaseSQL := TADSQuery.Create(Self);
    DataSource.DataSet := BaseSQL;
    ReadOnly := True;
    CurrentUnique := 0;
    FCurrentPatientOnly := True;
    FCurrentExamOnly := False;
    FPatient := 0;
    FExam := 0;
    FRefreshGrid := False;
    Self.Options := Self.Options - [dgIndicator,dgAlwaysShowSelection];
end;

procedure TCustomCBSDBGrid.OutsideDataChange(Sender: TObject);
var KeyValue: Integer;
   KeyField: TField;
begin

  if FLinkedDataLink.DataSource.DataSet.FindField('patunique')<>nil then
    Patient := FLinkedDataLink.DataSource.DataSet.FieldByName('patunique').AsInteger;
  if FLinkedDataLink.DataSource.DataSet.FindField('examunique')<>nil then
    Exam := FLinkedDataLink.DataSource.DataSet.FieldByName('examunique').AsInteger;

 // if FLinkedDataLink.FieldName = '' then exit;
  if not Assigned(inherited DataSource) then exit;
  if not (FLinkedDataLink.DataSource.State = dsBrowse) then exit;

//  KeyField := FLinkedDataLink.DataSource.DataSet.FindField(FLinkedDataLink.FieldName);
//  if not Assigned(KeyField) then exit;
//
//  KeyValue := Keyfield.AsInteger;
  if not FLinkedDataLink.DataSource.DataSet.Active then
    FLinkedDataLink.DataSource.DataSet.Open;
  RefreshGrid := True;
  Invalidate;
end;

destructor TCustomCBSDBGrid.Destroy;
begin
  FreeAndNil(FFilterStatement);
  FLinkedDataLink.OnDataChange := nil;
  FreeAndNil(FLinkedDataLink);
  inherited;
end;

function TCustomCBSDBGrid.GetLinkedDataField: WideString;
begin
  Result := FLinkedDataLink.FieldName;
end;


function TCustomCBSDBGrid.GetLinkedDataSource: TDataSource;
begin
  Result := FLinkedDataLink.DataSource;
end;

procedure TCustomCBSDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not (FLinkedDataLink.DataSource.State = dsBrowse) then exit;

  inherited;
  if (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_END, VK_HOME, VK_PRIOR, VK_NEXT]) then
    MoveLinkedPointer;

end;

procedure TCustomCBSDBGrid.Loaded;
begin
  inherited;
end;

procedure TCustomCBSDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if not (FLinkedDataLink.DataSource.State in [dsBrowse, dsInactive]) then exit;

  inherited;
  MoveLinkedPointer;
end;

procedure TCustomCBSDBGrid.MoveLinkedPointer;
var KeyValue: Integer;
   KeyField: TField;
   RecordNum: Integer;
begin
  RecordNum := 0;
  // This means that there is no unique key
  if FLinkedDataLink.FieldName = '' then RecordNum := BaseSQL.RecNo;

  if not Assigned(inherited DataSource) then exit;
  if RecordNum > 0 then
  begin
    TADSTable(FLinkedDataLink.DataSource.DataSet).AdsGotoRecord(RecordNum);
  end
  else
  begin
    KeyField := inherited DataSource.DataSet.FindField(FLinkedDataLink.FieldName);
    if not Assigned(KeyField) then exit;

    KeyValue := Keyfield.AsInteger;
    if not FLinkedDataLink.DataSource.DataSet.Active then
      FLinkedDataLink.DataSource.DataSet.Open;

    FLinkedDataLink.DataSource.DataSet.Locate(FLinkedDataLink.FieldName,KeyValue,[]);
  end;
end;

procedure TCustomCBSDBGrid.OutsideDataChange(Sender: TObject; Field: TField);
begin
  OutSideDataChange(Sender);
end;

procedure TCustomCBSDBGrid.Paint;
begin
  if RefreshGrid then UpdateSQL;
  RefreshGrid := False;
  inherited;
end;

procedure TCustomCBSDBGrid.SetBaseData(Value: TADSTable);

function FileBase(FileName: String):String;
begin
  if pos('.',FileName)>0 then
    Result := uppercase(copy(Filename,1,pos('.',FileName)-1))
  else
    Result := uppercase(FileName);
end;

function BuildStatement(const StringToAdd:String; var WhereStarted: Boolean):String;
begin
  if StringToAdd = ''  then
    Result := StringToAdd
  else
  begin
    if WhereStarted then
      Result := 'and '+StringToAdd
    else
    begin
      Result := 'where '+StringToAdd;
      WhereStarted := True;
    end;
  end;
end;

var WhereStarted: Boolean;
begin
  WhereStarted := False;
  // Set up SQL based on filter
  with BaseSQL do
  begin
    Close;
    DatabaseName := Value.DatabaseName;
    TableType := Value.TableType;
      SQL.Clear;
      SQL.Add('select * from '+FileBase(Value.TableName) );
      SQL.Add(BuildStatement(FFilterStatement.Text, WhereStarted));
      if FCurrentPatientOnly then
      begin
        SQL.Add(BuildStatement('patunique = :patunique', WhereStarted));
      end;
      if FCurrentExamOnly then
      begin
        SQL.Add(BuildStatement('examunique = :examunique', WhereStarted));
      end;
      // Load starting values
      if Value.FindField('patunique')<>nil then
         Patient := Value.FieldByName('patunique').AsInteger;
      if Value.FindField('examunique')<>nil then
         Exam := Value.FieldByName('examunique').AsInteger;
    // Trap for errors
    try
      Open;
    except
      nil;
    end;
  end;
  DataSource.DataSet := BaseSQL;
end;

procedure TCustomCBSDBGrid.SetBaseData(Value: TADSQuery);
begin
  with BaseSQL do
  begin
    close;
    DatabaseName := Value.DatabaseName;
    TableType := Value.TableType;
    with SQL do
    begin
      Clear;
      Text := Value.SQL.Text;
      Add('and '+FFilterStatement.Text);
    end;
    Params := Value.Params;
    open;
  end;
  DataSource.DataSet := BaseSQL;
end;

procedure TCustomCBSDBGrid.SetCurrentExamOnly(const Value: Boolean);
begin
  FCurrentExamOnly := Value;
end;

procedure TCustomCBSDBGrid.SetCurrentPatientOnly(const Value: Boolean);
begin
  FCurrentPatientOnly := Value;
end;

procedure TCustomCBSDBGrid.SetLinkedDataField(const Value: WideString);
begin
  FLinkedDataLink.FieldName := Value;

end;

procedure TCustomCBSDBGrid.SetLinkedDataSource(const Value: TDataSource);
begin
  if Value <> FLinkedDataLink.DataSource then
  begin
    FLinkedDataLink.DataSource := Value;
//    FLinkedDataLink.DataSource.OnDataChange := OutsideDataChange;
    if Assigned(Value.DataSet) then
    begin
      if Value.DataSet is TADSTable then
        SetBaseData(Value.DataSet as TADSTable);
      if Value.DataSet is TADSQuery then
        SetBaseData(Value.DataSet as TADSQuery);
    end;
  end;
end;


procedure TCustomCBSDBGrid.SetExam(const Value: Integer);
begin
  if FExam = Value then exit;
  FExam := Value;
  RefreshGrid := True;
  Refresh;
end;

procedure TCustomCBSDBGrid.SetFilterStatement(const Value: TStringList);
begin
  // Clear out datakeyfield if there is no filter
  if Value.Text = '' then LinkedDataKeyField := '';

  FFilterStatement := Value;
end;

procedure TCustomCBSDBGrid.SetPatient(const Value: Integer);
begin
  if FPatient = Value then exit;
  FPatient := Value;
  RefreshGrid := True;
  Refresh;
end;

procedure TCustomCBSDBGrid.SetRefreshGrid(const Value: Boolean);
begin
  FRefreshGrid := Value;
end;

procedure TCustomCBSDBGrid.UpdateSQL;
var TempParam: TParam;
begin
// Reasons not to update
  // Doesn't need doing
  if not RefreshGrid then exit;
  
  // No filter statement
  if FFilterStatement.Text = '' then exit;
  // SQL hasn't been set up yet
  if (BaseSQL.DatabaseName = '') or
     (BaseSQL.SQL.Text = '') then exit;

  // No values for either Exam or Patient
  if (FExam = 0) and (FPatient = 0) then exit;
  // not checking the exam or patient
  if not (FCurrentExamOnly or FCurrentPatientOnly) then exit;

  if (FCurrentExamOnly and (FExam>0)) or
      (FCurrentPatientOnly and (FPatient>0)) then
  begin
  with BaseSQL do
  begin
    Close;
    TempParam := Params.FindParam('patunique');
    if Assigned(TempParam) then
      TempParam.AsInteger := FPatient;
    TempParam := Params.FindParam('examunique');
    if Assigned(TempParam) then
      TempParam.AsInteger := FExam;
    Open;

  end;

  end;

end;

{ TCustomCBSPrintGrid }

function TCustomCBSPrintGrid.GetDataSource: TDataSource;
begin
  Result := LinkedDataSource;
end;

procedure TCustomCBSPrintGrid.SetDataSource(const Value: TDataSource);
begin
  LinkedDataSource := Value;
end;

end.
