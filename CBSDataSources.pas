unit CBSDataSources;


interface
uses Classes, db, adsdata, adstable, sysutils, inifiles;

type THackDataSet = class(TDataSet);

procedure LoadDataSources(AOwner: TComponent; DataSources: TStringList=nil);
implementation
procedure LoadDataSources(AOwner: TComponent; DataSources: TStringList);

procedure LoadList(DataSourceList: TStringList);
begin
DataSourceList.Add('S_Collect=Collect.dbf');
DataSourceList.Add('S_Exam=Exam.dbf');
DataSourceList.Add('S_ExamHist=Exam.dbf');
DataSourceList.Add('S_ExamALG=ExamALGY.dbf');
DataSourceList.Add('S_Exambin=Exambin.dbf');
DataSourceList.Add('S_ExamALRT=ExamALRT.dbf');
DataSourceList.Add('S_ExamCL=ExamCL.dbf');
DataSourceList.Add('S_ExamDiag=ExamDiag.dbf');
DataSourceList.Add('S_ExamImag=ExamImag.adt');
DataSourceList.Add('S_ExamImag2=ExamImag.adt');
DataSourceList.Add('S_ExamImag3=ExamImag.adt');
DataSourceList.Add('S_ExamIOP=ExamIOP.dbf');
DataSourceList.Add('S_ExamMed=ExamMed.dbf');
DataSourceList.Add('S_ExamRefr=ExamRefr.dbf');
DataSourceList.Add('S_ExamSurg=ExamSurg.dbf');
DataSourceList.Add('S_ExamAppt=ExamAppt.dbf');
DataSourceList.Add('S_ExamComp=ExamComp.dbf');
DataSourceList.Add('S_Pat_Todo=Pat_Todo.dbf');
DataSourceList.Add('S_patrecal=patrecal.dbf');
DataSourceList.Add('S_patRef=patRef.dbf');
DataSourceList.Add('S_Alert=Alert.dbf');
DataSourceList.Add('S_Lttrhist=Lttrhist.dbf');
DataSourceList.Add('S_ExamTest=ExamTest.dbf');
DataSourceList.Add('S_Patient=Patient.dbf');
DataSourceList.Add('S_Bill=Bill.dbf');
DataSourceList.Add('S_fram_rx=fram_rx.dbf');
DataSourceList.Add('S_Lens_Rx=Lens_Rx.dbf');
DataSourceList.Add('S_Document=Document.dbf');
DataSourceList.Add('S_PatTrack=PatTrack.dbf');
DataSourceList.Add('S_Insured=Insured.dbf');
DataSourceList.Add('S_Appt=Appt.dbf');
DataSourceList.Add('S_Logappt=Appt.dbf');
DataSourceList.Add('S_LogToDo=Pat_Todo.dbf');
DataSourceList.Add('S_claim=Claim.dbf');
DataSourceList.Add('S_ApptHist=Appt.dbf');
DataSourceList.Add('S_LogTrack=PatTrack.dbf');
DataSourceList.Add('S_ExamAddiction=ExamAddiction.dbf');
DataSourceList.Add('S_ExamGoal=ExamGoal.dbf');
DataSourceList.Add('S_ExamMeasurement=ExamMeasurement.dbf');
DataSourceList.Add('S_ExamExercise=ExamExercise.dbf');
DataSourceList.Add('S_ExamObjTest=ExamObjTest.dbf');
end;
var DataSourceList: TStringList;
    DataFieldList: TStringList;
  I, J: Integer;
  TempSource: TDataSource;
  TempTable: TADSTable;
  TempField: TField;
  CheckTableName: String;
  CheckDataSourceName: String;
begin
  DataSourceList := TStringList.Create;
  try
  // Set up stringlist to make sure there aren't duplicate names for Datasources
    DataSourceList.CaseSensitive := False;
    DataSourceList.Sorted := True;
    DataSourceList.Duplicates := dupIgnore;
    if FileExists(GetCurrentDir+'\SBCheck.ini') then
    begin
      with TIniFile.Create(GetCurrentDir+'\SBCheck.ini') do
      try
        //Read datasource names from INI file if it exists
        ReadSectionValues('DataSources',DataSourceList);
      finally
        Free;
      end;
    end;
    //Add on internal names list (this follows the INI file because ReadSectionValues clears out the stringlist)
    LoadList(DataSourceList);
    for I := 0 to DataSourceList.Count - 1 do
    begin
      //Lookup table names and make sure table exists
      CheckDataSourceName := Trim(DataSourceList.Names[i]);
      // check for a duplicate that might be because of a spacing issue in SBCheck.INI
      if Assigned(AOwner.FindComponent(CheckDataSourceName))then continue;

      CheckTableName := Trim(DataSourceList.ValueFromIndex[i]);
      if not FileExists(GetCurrentDir + '/' +CheckTableName) then continue;

      TempSource := TDataSource.Create(AOwner);
      TempSource.Name := CheckDataSourceName;
      TempTable := TAdsTable.Create(AOwner);
      TempTable.Name := 'T_'+copy(TempSource.Name,3,50);
      TempTable.TableName := CheckTableName;
      if pos('.dbf',TempTable.TableName)>0 then
      begin
        TempTable.DatabaseName := 'FilesConnection';
        TempTable.TableType := ttADSCDX;
      end
      else
      begin
        TempTable.DatabaseName := 'ToolsConnection';
        TempTable.TableType := ttADSADT;
      end;
      TempSource.DataSet := TempTable;
      //Fill in Fields
      TempTable.FieldDefs.Update;
      //Add match to Links calculated fields
      if uppercase(TempTable.Name) = 'T_PATIENT' then
      begin
        THackDataSet(TempTable).CreateFields;
        TempField := TIntegerField.Create(TempTable);
        TempField.Name := 'T_PatientAge';
        TempField.FieldName := 'Age';
        TempField.FieldKind := fkCalculated;
        TempField.Calculated := True;
        TempField.DataSet := TempTable;
      end;
      if uppercase(TempTable.Name) = 'T_BILL' then
      begin
        THackDataSet(TempTable).CreateFields;
        TempField := TFloatField.Create(TempTable);
        TempField.Name := 'T_BillAmountDue';
        TempField.FieldName := 'AmountDue';
        TempField.FieldKind := fkCalculated;
        TempField.Calculated := True;
        TempField.DataSet := TempTable;
      end;
      if Assigned(DataSources) then
      begin
      DataFieldList := TStringList.Create;
      for J := 0 to TempTable.FieldDefs.Count - 1 do
        DataFieldList.Add(TempTable.FieldDefs[J].Name);
        DataSources.AddObject(TempSource.Name,DataFieldList);
      end;
      TempTable.Filter := 'False';
      TempTable.Filtered := True;
    end;
  finally
    DataSourceList.Free;
  end;

end;


end.
