unit MergeModule;

interface

uses
  SysUtils, Classes, DB, StrUtils, Variants,
  adsdata, adsfunc, adstable, adscnnct,
  dialogs,ComObj, CBSPrintInterface, xmltools, NativeXML;

type
  TPracticeInfo = record
  Name: String;
  Address1: String;
  Address2: String;
  Phone: String;
  LetterHead1: String;
  LetterHead2: String;
  LetterHead3: String;
  LetterHead4: String;
  LetterHead5: String;
  LetterHead6: String;
  end;

  TCBSMergeModule = class(TDataModule)
    ToolsConnection: TAdsConnection;
    CheckQuery: TAdsQuery;
    OutputQuery: TAdsQuery;
    FilesConnection: TAdsConnection;
    LookupQuery: TAdsQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FOutputList: TStringList;
    FSQLList: TStringList;
    FInputList: TStringList;
    FExamNum: Integer;
    FPatientNum: Integer;
    FOrigination: Char;
    FFileName: String;
    FReferNum: Integer;
    FPrintLoc: String;
    FTableSort: String;
    FTableRecordSelect: String;
    FTableFilter: String;
    FBillNum: Integer;
    procedure SetSQLList(const Value: TStringList);
    procedure SetReferNum(const Value: Integer);
    function BuildSystemSQL: String;
    procedure SetPrintLoc(const Value: String);
    procedure SetTableFilter(const Value: String);
    procedure SetTableRecordSelect(const Value: String);
    procedure SetTableSort(const Value: String);
    procedure SetBillNum(const Value: Integer);
    property SQLList: TStringList read FSQLList write SetSQLList;
    procedure SetOutputList(const Value: TStringList);
    property OutputList: TStringList read FOutputList write SetOutputList;
    procedure SetInputList(const Value: TStringList);
    property InputList: TStringList read FInputList write SetInputList;
    procedure TranslateEntry(const EntryString: String);
    function BuildSQL(const FieldList: TStringList;IsDocX: Boolean): String;
    procedure CheckDefined(var RetString: string; const EntryString: string);
    procedure CheckImplied(var RetString: string; const EntryString: string);
    procedure SetExamNum(const Value: Integer);
    procedure SetPatientNum(const Value: Integer);
    procedure SetOrigination(const Value: Char);
    function TableKey(const TableName: String):String;
    procedure CheckFunction(var RetString: string);
    function EnclosingQuotes(const OutString: String):String;
    function CreateXMLData(SelectList:TStringList; KeyData:TStrings):String;
    procedure CreateDocX(SourceFile, OutputFile:String; KeyData:TStrings);
    procedure DataToXML(TableName: string; FieldNameList: TStringList; OutputList: TStringList);
    procedure WriteDataToDocX(var ThisNode: TXMLNode);
    procedure WriteOneTableToDocX(var CurrentTableNode: TXMLNode);
    procedure SetParamsByPatient;
    function LookupDoctor(DoctorCode: String):String;
    function LastExam: Integer;
    procedure ClearTableAttributes;
    procedure SetTableAttributes(AList: TXMLNodeList);
    property TableFilter: String read FTableFilter write SetTableFilter;
    property TableRecordSelect: String read FTableRecordSelect write SetTableRecordSelect;
    property TableSort: String read FTableSort write SetTableSort;
  public
    { Public declarations }
    procedure PrintDocument(ThisJob: IPrintDocument);
    procedure PrintDocumentOldWay(ThisJob: IPrintDocument);
    property PatientNum: Integer read FPatientNum write SetPatientNum;
    property BillNum: Integer read FBillNum write SetBillNum;
    property ExamNum: Integer read FExamNum write SetExamNum;
    property ReferNum: Integer read FReferNum write SetReferNum;
    property PrintLoc: String read FPrintLoc write SetPrintLoc;
    property Origination: Char read FOrigination write SetOrigination;
  end;

var
  CBSMergeModule: TCBSMergeModule;

implementation

{$R *.dfm}
uses SciZipFile;

var
  DocXFile: TZipFile;

function TablePart(TableField: String): String;
var TableName: String;
begin
  if pos('.',TableField)>0 then
    TableName := copy(TableField,1,pos('.',TableField)-1)
  else
    TableName := TableField;
  if RightStr(TableName,5)='Table' then
    TableName := LeftStr(Tablename,Length(TableName)-5);
  Result := uppercase(TableName);
end;
function FieldPart(TableField: String): String;
begin
  Result := copy(TableField,pos('.',TableField)+1,100);
end;


{ TTCBSMergeModule }
function TCBSMergeModule.BuildSystemSQL: String;
begin
  with OutputQuery do
  begin
    Close;
    with SQL do
    begin
      // Create temporary table
      Clear;
      Add('Create Table #SystemTable (');
      Add(')');
    end;
    ExecSQL;
    // Fill in the data for the one record
    // Build the "extract" SQL to be used
  end;
  with FSQLList do
  begin
    Clear;

  end;
  Result := FSQLList.Text;
end;

function TCBSMergeModule.BuildSQL(const FieldList: TStringList;IsDocX: Boolean): String;
var x, LastLine: Integer;
    TableList: TStringList;
    OutputString: String;
    FirstTime: Boolean;
    KeyString: String;
begin
  // Translate Mergefields into useful info
    FOutputList.Clear;
    for x := 0 to FieldList.Count -1 do
    begin
      if IsDocX then
        FOutputList.Add(FieldList[x])
      else
        TranslateEntry(FieldList[x]);
    end;

  TableList := TStringList.Create;
  try
  TableList.Sorted := True;
  // Build the SQL
  with FSQLList do
  begin
    Clear;
    Add('Select');
    // Start with extra fields
    FirstTime := False;
    if TablePart(FOutputList[0])= 'PATIENT' then
    begin
      Add(' iif(sex=''M'',''him'',''her'') as himher, ');
      Add(' iif(sex=''M'',''he'',''she'') as heshe, ');
      Add(' iif(sex=''M'',''He'',''She'') as heshecap, ');
      Add(' iif(sex=''M'',''his'',''her'') as hisher, ');
      Add(' iif(sex=''M'',''himself'',''herself'') as himherself, ');
      Add(' ((curdate()-birth)/365) as pat_age ');
      TableList.Add('PATIENT');
      FirstTime := True;
    end;
    if TablePart(FOutputList[0])= 'BILL' then
    begin
      Add(' (balance-ins_out) as amtdue, ');
    end;
    // Build Field List
    LastLine := FOutputList.Count-1;
    for x := 0 to LastLine do
    begin
      OutputString := FOutputList[x];
      // Error in Fieldlist
      { TODO : Inform user of error }
      if copy(OutputString,1,8)='NotFound' then continue;
      // if includes a table, add to table list
      if pos('.',OutputString)>0 then
      begin
        if pos(FieldPart(OutputString),'HIMHER~HESHE~HESHECAP~HISHER~HIMHERSELF~PAT_AGE')>0 then continue;

        TableList.Add(uppercase(copy(OutputString,1,pos('.',OutputString)-1)));
        OutputString := TablePart(OutputString)+'."'+FieldPart(Outputstring)+'"';
      end;
      Add(IfThen(FirstTime,', ','')+OutputString);
      if not FirstTime then  FirstTime := True; //First time has been done
    end;
    FirstTime := False;
    // Build Table List
    Add('From ');
    LastLine := TableList.Count - 1;
    for x := 0 to LastLine do
    begin
      OutputString := TableList[x];
      if x < LastLine then
        Add(OutputString+ ',')
      else
        Add(OutputString);
    end;
//    ShowMessage(OutputString + #13#10 + 'filter='+TableFilter+
//                 #13#10+'sort='+TableSort+
//                 #13#10+'recordselect='+TableRecordSelect);
    // Build Selection criteria
    FirstTime := True;
    for x := 0 to LastLine do
    begin
      KeyString := TableKey(TableList[x]);
      if KeyString <> '' then
      begin
        if FirstTime then
          Add('WHERE '+KeyString)
        else
          Add('and '+KeyString);
        FirstTime := False;
      end;
    end;
    // Add sort info
    if TableSort <> '' then
    begin
      if pos(';',TableSort)>0 then
      begin
        Add('Order By "'+copy(TableSort,1,pos(';',TableSort)-1)+'"');
        if uppercase(trim(copy(TableSort,pos(';',TableSort)+1,5)))='D' then
          Add('DESC');
      end
      else
        Add('Order By ' + TableSort);
    end;
 end;
  finally
    TableList.Free;
  end;
  Result := FSQLList.Text;
end;

procedure TCBSMergeModule.DataModuleCreate(Sender: TObject);
begin
  Randomize;
  FFileName := IntToStr(Random(9999999)+10000000);
  FOutputList := TStringList.Create;
  FOutputList.Sorted := True;
  FOutputList.Duplicates := dupignore;
  FSQLList := TStringList.Create;
  FInputList := TStringList.Create;
  FInputList.Sorted := True;
  FInputList.Duplicates := dupignore;
  FPatientNum := 0;
  FBillNum := 0;
  FExamNum := 0;
  FReferNum := 0;
  FPrintLoc := '';
  ClearTableAttributes;
  with CheckQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select ReturnValue from MergeLookup');
      Add('where MergeFieldName = :Entry');
    end;
  end;
  DocXFile := TZipFile.Create;
end;

procedure TCBSMergeModule.SetOutputList(const Value: TStringList);
begin
  FOutputList := Value;
end;

procedure TCBSMergeModule.SetSQLList(const Value: TStringList);
begin
  FSQLList := Value;
end;

procedure TCBSMergeModule.SetTableAttributes(AList: TXMLNodeList);
var
  I: Integer;
  ThisAttribute, ThisAttributeValue: String;
begin
  for I := 0 to AList.Count - 1 do
  begin
    ThisAttribute := Alist[I].AttributeByName['w:name'];
    ThisAttributeValue := Alist[I].AttributeByName['w:val'];
    if ThisAttribute = 'filter' then TableFilter := ThisAttributeValue;
    if ThisAttribute = 'recordselect' then TableRecordSelect := ThisAttributeValue;
    if ThisAttribute = 'sortfield' then TableSort := ThisAttributeValue;

  end;
end;

procedure TCBSMergeModule.SetTableFilter(const Value: String);
var I: Integer;
    TempStr: String;
begin
  FTableFilter := Value;
  if FTableFilter = '' then exit;
  
  TempStr := '';
  for I := 1 to Length(Value) do
  begin
    case Value[I] of
    '*': TempStr := TempStr + '%';
    '?': TempStr := TempStr + '_';
    else
      TempStr := TempStr + Value[I]
    end;
  end;
  FTableFilter := TempStr;
end;

procedure TCBSMergeModule.SetTableRecordSelect(const Value: String);
begin
  FTableRecordSelect := lowercase(trim(Value));
end;

procedure TCBSMergeModule.SetTableSort(const Value: String);
begin
  FTableSort := Value;
end;

procedure TCBSMergeModule.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FOutputList);
  FreeAndNil(FSQLList);
  FreeAndNil(FInputList);
  FreeAndNil(DocXFile);
end;

procedure TCBSMergeModule.TranslateEntry(const EntryString: String);
var RetString : String;
begin
  RetString := '';
  CheckDefined(RetString, EntryString);
  if RetString = '' then
    // if not a predefined word, see if it is a "type" based on data name
    CheckImplied(RetString, EntryString)
  else
    // if pre-defined, but not a table field, get return function
    if pos('.',RetString) = 0 then    //. is separator between table and field name
      CheckFunction(RetString);
  if RetString<>'' then
    FOutputList.Add(RetString  + ' as ' +  EntryString)
  else
    FOutputList.Add('NotFound'+'-'+EntryString);
end;


procedure TCBSMergeModule.PrintDocumentOldWay(ThisJob: IPrintDocument);
var oApp, oDoc, oMergeDoc, oMerge: Variant;
  x, place: Integer;
  TempStr: String;
  Param: TParam;
  ParamName: String;
  ParamValue: Integer;
  TemporaryDataFile: String;
begin

  InputList.Clear;
  oApp := CreateOleObject('Word.Application');
  try
  oApp.Visible := False;
  oDoc := oApp.Documents.Open(ThisJob.Document);
  oMerge := oDoc.Mailmerge.Fields;
  for x := 1 to oMerge.Count do
  begin
    TempStr := UpperCase(Trim(oDoc.MailMerge.Fields.Item(x).Code.Text));
    if (LeftStr(TempStr,10) = 'MERGEFIELD') then
      TempStr := Trim(copy(TempStr,11,30));
    place := Pos(' ',TempStr);
    if place >0 then TempStr := copy(TempStr,1,Place-1);
    InputList.Add(TempStr);
  end;
  OutputQuery.SQL.Clear;
  BuildSQL(InputList as TStringList, False);
  for x := 0 to FSQLList.Count -1 do
  begin
    OutputQuery.SQL.Add(FSQLList[x]);
  end;
  // Fill in the Parameters in the SQL from the passed parameters
  for x := 0 to ThisJob.KeyFields.Count -1 do
  begin
    ParamName := Trim(ThisJob.KeyFields.Names[x]);
    Param := OutputQuery.Params.FindParam(ParamName);
    if not Assigned(Param) then
      Param := OutputQuery.Params.CreateParam(ftInteger,ParamName,ptInput);

    ParamValue := StrToInt(ThisJob.KeyFields.ValueFromIndex[x]);
    Param.AsInteger := ParamValue;
  end;
  OutputQuery.Open;
  TemporaryDataFile := GetCurrentDir+'\'+FFileName+'.dbf';
  OutputQuery.AdsConvertTable(TemporaryDataFile,ttAdsCDX);
  oDoc.MailMerge.OpenDataSource(TemporaryDataFile);
  oDoc.MailMerge.Destination := 0;
  oDoc.MailMerge.Execute(False);
  oDoc.Close(False);
  oMergeDoc := oApp.ActiveDocument;
  if FileExists(TemporaryDataFile) then
    DeleteFile(TemporaryDataFile);
  oApp.Visible := True;
  finally
  oApp := UnAssigned;
  oDoc := UnAssigned;
  oMergeDoc := UnAssigned;
  end;
end;

procedure TCBSMergeModule.PrintDocument(ThisJob: IPrintDocument);
var oApp, oDoc: Variant;
  x, place, IndexValue: Integer;
  TempStr: String;
  SourceDoc, OutputDoc, XMLDataDoc: String;
  SelectStrings: TStringList;
  I: Integer;
begin
  SourceDoc := ThisJob.Document;
  if not FileExists(SourceDoc) then
  begin
    SourceDoc := GetCurrentDir+'\'+SourceDoc;
    if not FileExists(SourceDoc) then
    begin
      exit;
    end;
  end;
  OutputDoc := '';
  with ThisJob.KeyFields do
  begin
    for I := 0 to Count  - 1 do
    begin
      try
        IndexValue := StrToInt(ValueFromIndex[I]);
      except
        on e:Exception do
          IndexValue := 0;
      end;
      if uppercase(Names[I])='PATUNIQUE' then PatientNum := IndexValue;
      if uppercase(Names[I])='EXAMUNIQUE' then ExamNum := IndexValue;
      if uppercase(Names[I])='REFUNIQUE' then ReferNum := IndexValue;
      if uppercase(Names[I])='TEMPFILE' then OutputDoc := ValueFromIndex[I];
      if uppercase(Names[I])='LOCATION' then PrintLoc := ValueFromIndex[I];
    end;
  end;

  if uppercase(ExtractFileExt(SourceDoc))='.DOCX' then
  begin
    if not DirectoryExists('TemporaryDocuments') then
      if not CreateDir('TemporaryDocuments') then
      begin
        ShowMessage('Unable to create Temporary Documents Directory.  Contact your network administrator');
        exit;
      end;
    
    if OutputDoc = '' then
      OutputDoc := '.\TemporaryDocuments\'+copy(ExtractFileName(SourceDoc),1,Length(SourceDoc)-Length(ExtractFileExt(SourceDoc)))+'.docx'
    else
      OutputDoc := '.\TemporaryDocuments\'+ChangeFileExt(ExtractFileName(OutputDoc),'.docx');
    CreateDocX(SourceDoc,OutputDoc, ThisJob.KeyFields);
    oApp := CreateOleObject('Word.Application');
    try
    oApp.Visible := True;
    oDoc := oApp.Documents.Open(GetCurrentDir+'\TemporaryDocuments\'+ExtractFileName(OutputDoc));
    oApp.Visible := True;
    finally
    oApp := UnAssigned;
    oDoc := UnAssigned;
    end;
  end
  else
  begin
    //Create XSLT from Word XML file
    OutputDoc := copy(SourceDoc,1,Length(SourceDoc)-Length(ExtractFileExt(SourceDoc)))+'.xsl';
    SelectStrings := TStringList.Create;
    try
    CreateXSLT(SourceDoc,OutputDoc,SelectStrings);
    XMLDataDoc := CreateXMLData(SelectStrings,ThisJob.KeyFields);

    finally
      FreeAndNil(SelectStrings);
    end;
    //Get Data into XML file
    InputList.Clear;
    oApp := CreateOleObject('Word.Application');
    try
    oApp.Visible := True;
    oDoc := oApp.Documents.Open(XMLDataDoc);
    oDoc.TransformDocument(OutputDoc,True);
    oApp.Visible := True;
    finally
    oApp := UnAssigned;
    oDoc := UnAssigned;
  end;
  end;
end;

procedure TCBSMergeModule.CreateDocX(SourceFile, OutputFile: String; KeyData:TStrings);
var ThisXML: TNativeXML;
    ThisNode, UpdateNode, WriteNode: TXMLNode;
    AList: TXMLNodeList;
    TableList: TStringList;
    CurrentTable: String;
    I: Integer;
    FileNo: Integer;
    StrStream, OutStream: TStringStream;
begin
  DocXFile.LoadFromFile(SourceFile);
  { Convert string to stream }
  FileNo := DocXFile.IndexOf('word/document.xml');
  if FileNo > -1 then
    StrStream := TStringStream.Create(DocXFile.Data[FileNo])
  else
  begin
    ShowMessage('cannot load');
    exit;
  end;
  ThisXML := TNativeXml.Create;
  try
    ThisXML.LoadFromStream(StrStream);
    ThisNode := ThisXML.Root;
    WriteDataToDocX(ThisNode);
    OutStream := TStringStream.Create(ThisXML.WriteToString);
    DocXFile.Data[FileNo] := OutStream.DataString;
    DocXFile.SaveToFile(OutputFile);
  finally
    FreeAndNil(ThisXML);
    FreeAndNil(StrStream);
    FreeAndNil(OutStream);
  end;
end;

procedure TCBSMergeModule.WriteDataToDocX(var ThisNode: TXMLNode);
var I, X, Y: Integer;
    TableNode, TableAttribNode: TXMLNode;
    InputList, FieldList, TableList: TStringList;
    CurrentTable: String;
    AList: TXMLNodeList;
begin
  AList := TXMLNodeList.Create;
  try
    //get customXML nodes
    ThisNode.FindNodes('w:customXml',AList);
    if Alist.Count = 0 then
    begin
      ShowMessage('Nothing to do');
      exit;
    end;
    TableList := TStringList.Create;
    try
      //Put Table nodes into a list
      for I := 0 to Alist.Count - 1 do
      begin
        if Alist[I].AttributeByName['w:uri']='' then
        begin
          if pos('Table',Alist[I].AttributeByName['w:element'])>0 then
          begin
            TableList.AddObject(Alist[I].AttributeByName['w:element'],Alist[I]);
          end;
        end;
      end;
      // Put table info together by name
      TableList.Sort;
      // List of field names for creating the SQL
      InputList := TStringList.Create;
      // List of field names with nodes for updating
      FieldList := TStringList.Create;
      try
        // put in order by table.fieldname
        FieldList.Sorted := True;
        InputList.Sorted := True;
        // Make sure we only have one set of fields
        InputList.Duplicates := dupIgnore;
        for I := 0 to TableList.Count - 1 do
        begin
          CurrentTable := TableList[I];
          if (FPrintLoc = '') and (LeftStr(CurrentTable,8) = 'LOCATION') then
            SetParamsByPatient;
          if (FBillNum = 0) and  (LeftStr(CurrentTable,4) = 'BILL') then
            SetParamsByPatient;
          
          TableNode := TXMLNode(TableList.Objects[I]);
          TableNode.FindNodes('w:customXml',AList);
          for X := 0 to AList.Count -1  do
          begin
            Y := FieldList.Add(TablePart(CurrentTable)+'.'+Alist[X].AttributeByName['w:element']);
            InputList.Add(FieldList[Y]);
          end;
          //Check for and setup Table Attributes
          ClearTableAttributes;
          TableAttribNode := TableNode.FindNode('w:customXmlPr');
          if assigned(TableAttribNode) then
          begin
            TableAttribNode.FindNodes('w:attr',AList);
            SetTableAttributes(Alist);
          end;

          if TableList[I] <> 'SYSTEMTable' then
            BuildSQL(InputList, True)
          else
            BuildSystemSQL;
          WriteOneTableToDocX(TableNode);
          FieldList.Clear;
          InputList.Clear;
        end;
      finally
        FreeAndNil(InputList);
        FreeAndNil(FieldList);
      end;
    finally
    FreeAndNil(TableList);
    end;
  finally
  FreeAndNil(AList);
  end;
end;

procedure TCBSMergeModule.WriteOneTableToDocX(var CurrentTableNode: TXMLNode);
var I, AddedNodeIndex, TableInc: Integer;
    WriteNode, UpdateNode, ParentNode, NewNode, HoldNode: TXMLNode;
    HoldNodeString, HoldNodeName: String;
    AList: TXMLNodeList;
begin
  AList := TXMLNodeList.Create;
  try
  // update
  with Outputquery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := SQLList.Text;
//    ShowMessage(SQL.Text);
    SQLList.Clear;
    for I := 0 to Params.Count - 1 do
    begin
      if uppercase(Params[I].Name) = 'PATUNIQUE' then Params[I].AsInteger := PatientNum;
      if uppercase(Params[I].Name) = 'EXAMUNIQUE' then
        if ExamNum = 0 then
          Params[I].AsInteger := LastExam
        else
          Params[I].AsInteger := ExamNum;

      if uppercase(Params[I].Name) = 'REFUNIQUE' then Params[I].AsInteger := ReferNum;
      if uppercase(Params[I].Name) = 'LOCATION' then
      begin
        if PrintLoc = '' then SetParamsByPatient;
        Params[I].AsString := PrintLoc;
      end;
      if uppercase(Params[I].Name) = 'BILLUNIQUE' then
      begin
        if BillNum = 0 then SetParamsByPatient;
        Params[I].AsInteger := BillNum;
      end;
    end;
    try
    Open;
//    ShowMessage(IntToStr(RecordCount));
    First;
    TableInc := 0;
    ParentNode := CurrentTableNode.Parent;
    AddedNodeIndex := CurrentTableNode.IndexInParent;
    HoldNodeName := CurrentTableNode.Name;
    HoldNode := ParentNode.NodeExtract(CurrentTableNode);
    // Loop through data records
    while not Eof do
    begin
      if TableRecordSelect = 'last' then last;
      
      // Establish which node we are working on...add one if needed.
      NewNode := ParentNode.NodeNewAtIndex(AddedNodeIndex,'');
      NewNode.Assign(HoldNode);
      Inc(AddedNodeIndex);
      NewNode.FindNodes('w:customXml',AList);
      for I := 0 to Alist.Count - 1 do
      begin
          UpdateNode := Alist[I];
          WriteNode := UpdateNode.FindNode('w:t');
          if assigned(WriteNode) then
          begin
            //check to see if we need to swap it out
            if uppercase(WriteNode.ValueAsString)='DRNAME' then
              WriteNode.ValueAsString := LookupDoctor(FieldByName(Alist[I].AttributeByName['w:element']).AsString)
            else

            //Here's the data switch
            WriteNode.ValueAsString := FieldByName(Alist[I].AttributeByName['w:element']).AsString;
          end;
      end;
      if TableRecordSelect = 'first' then break;

      Next;
    end;
    Close;
    except on E: Exception do
    begin
      ShowMessage(E.Message+#13#10+'SQL causing error looks like '+#13#10+SQL.Text)
    end;

    end;
  end;
  finally
    FreeAndNil(Alist);
  end;
end;


function TCBSMergeModule.CreateXMLData(SelectList: TStringList;
  KeyData: TStrings): String;
procedure ParseSelect(const StringToParse: String;var strNameSpace,strTableName,strFieldname: String);
  var x,which: Integer;
begin
  which := 1;
  strNameSpace := '';
  strTableName := '';
  strFieldname := '';
  for x := 1 to Length(StringToParse) do
  begin
    if StringToParse[x] = '/' then
      inc(which)
    else
    case which of
      1: strNameSpace := strNameSpace + StringToParse[x];
      2: strTableName := strTableName + StringToParse[x];
      3: strFieldname := strFieldname + StringToParse[x];
    end;
  end;
end;

var
  strNameSpace, strTableName, strFieldName: String;
  ChkNameSpace, ChkTableName, ChkFieldName: String;
  I, x: Integer;
  ParamName: String;
  OutputList, QueryList: TStringList;
  XMLFileName: String;
begin
//Initialize
XMLFileName := '';
strNameSpace := '';
strTableName := '';
strFieldName := '';
ChkNameSpace := '';
ChkTableName := '';
ChkFieldName := '';
  // Fill in the values from the passed parameters
  for x := 0 to KeyData.Count -1 do
  begin
    ParamName := Trim(KeyData.Names[x]);
    if lowercase(ParamName)='patunique' then Patientnum := StrToInt(KeyData.ValueFromIndex[x]);
    if lowercase(ParamName)='examunique' then Examnum := StrToInt(KeyData.ValueFromIndex[x]);
    if lowercase(ParamName)='tempfile' then XMLFileName := KeyData.ValueFromIndex[x];
  end;

OutputList := TStringList.Create;
QueryList := TStringList.Create;
QueryList.Sorted := True;
QueryList.CaseSensitive := False;
QueryList.Duplicates := dupIgnore;
try
// Sort the string list
SelectList.Sort;
for I := 0 to SelectList.Count - 1 do
begin
  ParseSelect(SelectList[I],strNameSpace,strTableName,strFieldName);
  if strNameSpace<>ChkNameSpace then
  begin
    if ChkNameSpace<>'' then OutputList.Add('</'+ChkNameSpace+'>');
    ChkNameSpace := strNameSpace;
    OutputList.Add('<'+ChkNameSpace+'>')
  end;
  if strTableName <> ChkTableName then
  begin
    if ChkTableName <> '' then 
    begin
      DataToXML(ChkTableName, QueryList, OutputList);
      QueryList.Clear;
    end;
    ChkTableName := strTableName;
  end;
  QueryList.Add(strFieldName);
end;
// final processing for last set
DataToXML(ChkTableName, QueryList, OutputList);
OutputList.Add('</'+ChkNameSpace+'>');
// Write to file
if XMLFileName = '' then
  XMLFileName := 'c:\test.xml';
OutputList.SaveToFile(XMLFileName);
// Return filename
finally
  FreeAndNil(OutputList);
  FreeAndNil(QueryList);
end;
Result := XMLFileName;
end;

procedure TCBSMergeModule.DataToXML(TableName: string; FieldNameList: TStringList; OutputList: TStringList);

function CreateSelect(TableName: String; FieldNameList: TStringList):String;
var ReturnString: String;
    I: Integer;
begin
  ReturnString := 'Select ';
  for I := 0 to FieldNameList.Count - 1 do
  begin
    ReturnString := ReturnString + FieldNameList[I] + ', ';
  end;
  // remove trailing comma and space
  ReturnString := copy(ReturnString,1,Length(ReturnString)-2);
  // remove 'Table' from Tablename to get actual Table Name (eg: PatientTable -> Patient)
  Result := ReturnString + ' from ' + copy(tableName,1,Length(TableName)-5);
end;
function ChangeToXML(const FieldName,FieldValue: String):String;
begin
  Result := '<'+FieldName+'>'+FieldValue+'</'+FieldName+'>'
end;
var
  I: Integer;

begin
  with OutputQuery do
  begin
    Close;
    SQL.Clear;
    // create the select statement
    SQL.Text := CreateSelect(TableName, FieldNameList);
    if pos('EXAM',uppercase(TableName))>0 then
    begin
      SQL.Add('where examunique = :examunique');
      ParamByName('examunique').AsInteger := ExamNum;
    end;
    if pos('PATIENT',uppercase(TableName))>0 then
    begin
      SQL.Add('where patunique = :patunique');
      ParamByName('patunique').AsInteger := PatientNum;
    end;
    if pos('LOCATION',uppercase(TableName))>0 then
    begin
      if PrintLoc = '' then SetParamsByPatient;
      SQL.Add('where location = :location');
      ParamByName('location').AsString := PrintLoc;
    end;
    if pos('BILL',uppercase(TableName))>0 then
    begin
      if Billnum = 0 then SetParamsByPatient;
      SQL.Add('where BillUnique = :BillUnique');
      ParamByName('BillUnique').AsInteger := BillNum;
    end;
    Open;
    First;
    OutputList.Add('<'+TableName+'>');
    while not EOF do
    begin
      for I := 0 to Fields.Count - 1 do
        if Fields[I].AsString <> '' then
          OutputList.Add(ChangeToXML(Fields[I].FieldName,Fields[I].AsString));
      Next;
    end;
    Close;
    OutputList.Add('</'+TableName+'>');
  end;

end;

procedure TCBSMergeModule.CheckDefined(var RetString: string; const EntryString: string);
begin
  with CheckQuery do
  begin
    Close;
    ParamByName('Entry').AsString := EntryString;
    Open;
    if RecordCount > 0 then
      RetString := FieldByName('ReturnValue').AsString;
    Close;
  end;
end;

procedure TCBSMergeModule.CheckImplied(var RetString: string; const EntryString: string);
var CheckStr,Table: String;
    x: Integer;
begin
  Table := '';
  for x:= 5 downto 2 do
  begin
    CheckStr := LeftStr(EntryString,x);
    case x of
    5: if CheckStr = 'APPT_' then Table := 'Appt.';
    4: begin
        if CheckStr = 'PAT_' then Table := 'Patient.';
        if CheckStr = 'RSP_' then Table := 'Bill.';
       end;
    3: begin
        if CheckStr = 'CL_' then Table := 'Lens.';
        if CheckStr = 'GL_' then Table := 'Fram_Rx.';
       end;
    2: begin
        if CheckStr = 'I_' then Table := 'Insured.';
        if CheckStr = 'C_' then Table := 'Claim.';
        if CheckStr = 'X_' then Table := 'Exam.';
       end;
    end;
    if Table <> '' then
    begin
      RetString := Table+copy(EntryString,x+1,30);
    end;
  end;
end;

procedure TCBSMergeModule.ClearTableAttributes;
begin
  TableFilter := '';
  TableRecordSelect := '';
  TableSort := '';
end;

procedure TCBSMergeModule.SetInputList(const Value: TStringList);
begin
  FInputList := Value;
end;

procedure TCBSMergeModule.SetParamsByPatient;
begin
  with OutputQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select location, billunique from patient');
      Add('where patunique = :patunique');
    end;
    ParamByName('patunique').AsInteger := PatientNum;
    Open;
    if RecordCount > 0 then
    begin
      PrintLoc := FieldByName('location').AsString;
      BillNum := FieldByName('Billunique').AsInteger;
    end;
    Close;
  end;
end;

procedure TCBSMergeModule.SetBillNum(const Value: Integer);
begin
  FBillNum := Value;
end;

procedure TCBSMergeModule.SetExamNum(const Value: Integer);
begin
  FExamNum := Value;
end;

procedure TCBSMergeModule.SetPatientNum(const Value: Integer);
begin
  FPatientNum := Value;
end;

procedure TCBSMergeModule.SetPrintLoc(const Value: String);
begin
  FPrintLoc := Value;
end;

procedure TCBSMergeModule.SetReferNum(const Value: Integer);
begin
  FReferNum := Value;
end;

procedure TCBSMergeModule.SetOrigination(const Value: Char);
begin
  FOrigination := Value;
end;

function TCBSMergeModule.TableKey(const TableName: String): String;
begin
  Result := '';
  if TableName = 'PATIENT' then
    Result := 'Patient.PatUnique = :PatUnique';
  if TableName = 'PATREF' then
    Result := 'Patref.RefUnique = :RefUnique';
  if TableName = 'LOCATION' then
    Result := 'Location.Location = :Location';
  if TableName = 'BILL' then
    Result := 'Bill.BillUnique = :BillUnique';

  if Result = '' then
  begin
    Result := TableName +'.PatUnique = :PatUnique';
    if LeftStr(TableName,4)='EXAM' then
    begin
      //These are all exam tables
      // There is a filter
      if TableFilter <> '' then
        Result := Result + ' and ' +TableName +'.'+ TableFilter;
      // Limit to this exam only
      if ((TableRecordSelect = '') or (lowercase(TableRecordSelect) = 'thisexam')) then
        Result := Result + ' and ' +TableName + '.ExamUnique = :ExamUnique'
      //end These are all exam tables
    end
    else
      // other tables
      if TableFilter <> '' then
        Result := Result + ' and ' +TableName +'.'+ TableFilter;

  end;
end;

function TCBSMergeModule.EnclosingQuotes(const OutString: String): String;
begin
  Result := ''''+Trim(OutString)+'''';
end;

function TCBSMergeModule.LastExam: Integer;
begin
  Result := 0;
  if PatientNum = 0 then exit;
  with LookupQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select examUnique from exam');
      Add('where PatUnique = :PatUnique');
      Add('order by "date"');
    end;
    ParamByName('PatUnique').AsInteger := PatientNum;
    Open;
    Last;
    if RecordCount > 0 then
      Result := FieldByName('ExamUnique').AsInteger;
    Close;
  end;
end;

function TCBSMergeModule.LookupDoctor(DoctorCode: String): String;
begin
  with LookupQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select "name" from doctor');
      Add('where ID = :DoctorCode');
    end;
    ParamByName('DoctorCode').AsString := DoctorCode;
    Open;
    First;
    if RecordCount > 0 then
      Result := FieldByName('Name').AsString
    else
      Result := '';
    Close;
  end;
end;

procedure TCBSMergeModule.CheckFunction(var RetString: string);
begin
  if RetString = 'CUR_DATE' then RetString :=
    EnclosingQuotes(FormatDateTime('mm/dd/dd',Date()));
  if RetString = 'CUR_DAYNUM' then RetString :=
    EnclosingQuotes(FormatDateTime('d',Date()));
  if RetString = 'CUR_DAY' then RetString :=
    EnclosingQuotes(FormatDateTime('dddd',Date()));
  if RetString = 'CUR_MONTH' then RetString :=
    EnclosingQuotes(FormatDateTime('mmmm',Date()));
  if RetString = 'CUR_YEAR' then RetString :=
    EnclosingQuotes(FormatDateTime('yyyy',Date()));
  if RetString = 'CUR_TIME' then RetString :=
    EnclosingQuotes(FormatDateTime('h:n',Date()));
  if RetString = 'PRACNAME' then RetString :=
    EnclosingQuotes('PRACNAME');
  if RetString = 'PRACADDR1' then RetString :=
    EnclosingQuotes('PRACADDR1');
  if RetString = 'PRACADDR2' then RetString :=
    EnclosingQuotes('PRACADDR2');
  if RetString = 'PRACPHON' then RetString :=
    EnclosingQuotes('PRACPHON');
  if RetString = 'LTTRHEAD1' then RetString :=
    EnclosingQuotes('LTTRHEAD1');
  if RetString = 'LTTRHEAD2' then RetString :=
    EnclosingQuotes('LTTRHEAD2');
  if RetString = 'LTTRHEAD3' then RetString :=
    EnclosingQuotes('LTTRHEAD3');
  if RetString = 'LTTRHEAD4' then RetString :=
    EnclosingQuotes('LTTRHEAD4');
  if RetString = 'LTTRHEAD5' then RetString :=
    EnclosingQuotes('LTTRHEAD5');
  if RetString = 'LTTRHEAD6' then RetString :=
    EnclosingQuotes('LTTRHEAD6');
  if RetString = 'PAT_AGE' then RetString :=
    EnclosingQuotes('PAT_AGE');
  if RetString = 'PAT_DRINIT' then RetString :=
    EnclosingQuotes('PAT_DRINIT');
  if RetString = 'PAT_PTINIT' then RetString :=
    EnclosingQuotes('PAT_PTINIT');
  if RetString = 'HESHE' then RetString :=
    EnclosingQuotes('HESHE');
  if RetString = 'HESHECAP' then RetString :=
    EnclosingQuotes('HESHECAP');
  if RetString = 'HIMHER' then RetString :=
    EnclosingQuotes('HIMHER');
  if RetString = 'HISHER' then RetString :=
    EnclosingQuotes('HISHER');
  if RetString = 'PAT_SELF' then RetString :=
    EnclosingQuotes('PAT_SELF');
  if RetString = 'PAT_BIRTHC' then RetString :=
    EnclosingQuotes('PAT_BIRTHC');
  if RetString = 'APPT_DATE' then RetString :=
    EnclosingQuotes('APPT_DATE');
  if RetString = 'APPT_RSN' then RetString :=
    EnclosingQuotes('APPT_RSN');
  if RetString = 'APPT_ID' then RetString :=
    EnclosingQuotes('APPT_ID');
  if RetString = 'APPT_LOC' then RetString :=
    EnclosingQuotes('APPT_LOC');
  if RetString = 'APPT_DEPT' then RetString :=
    EnclosingQuotes('APPT_DEPT');
  if RetString = 'APPT_RMKS' then RetString :=
    EnclosingQuotes('APPT_RMKS');
  if RetString = 'APPT_ADDID' then RetString :=
    EnclosingQuotes('APPT_ADDID');
  if RetString = 'APPT_STAT' then RetString :=
    EnclosingQuotes('APPT_STAT');
  if RetString = 'APPT_DOW' then RetString :=
    EnclosingQuotes('APPT_DOW');
  if RetString = 'APPT_MONTH' then RetString :=
    EnclosingQuotes('APPT_MONTH');
  if RetString = 'APPT_DAY' then RetString :=
    EnclosingQuotes('APPT_DAY');
  if RetString = 'APPT_TIME' then RetString :=
    EnclosingQuotes('APPT_TIME');
  if RetString = 'APPT_PROV' then RetString :=
    EnclosingQuotes('APPT_PROV');
  if RetString = 'APPT_INSTR' then RetString :=
    EnclosingQuotes('APPT_INSTR');
  if RetString = 'APPLDATE' then RetString :=
    EnclosingQuotes('APPLDATE');
  if RetString = 'APPTLRSN' then RetString :=
    EnclosingQuotes('APPTLRSN');
  if RetString = 'APPTLID' then RetString :=
    EnclosingQuotes('APPTLID');
  if RetString = 'APPTLLOC' then RetString :=
    EnclosingQuotes('APPTLLOC');
  if RetString = 'APPTLDEPT' then RetString :=
    EnclosingQuotes('APPTLDEPT');
  if RetString = 'APPTLRMKS' then RetString :=
    EnclosingQuotes('APPTLRMKS');
  if RetString = 'APPTLADDID' then RetString :=
    EnclosingQuotes('APPTLADDID');
  if RetString = 'APPTLSTAT' then RetString :=
    EnclosingQuotes('APPTLSTAT');
  if RetString = 'APPTLDOW' then RetString :=
    EnclosingQuotes('APPTLDOW');
  if RetString = 'APPTLMONTH' then RetString :=
    EnclosingQuotes('APPTLMONTH');
  if RetString = 'APPTLDAY' then RetString :=
    EnclosingQuotes('APPTLDAY');
  if RetString = 'APPTLTIME' then RetString :=
    EnclosingQuotes('APPTLTIME');
  if RetString = 'APPTLPROV' then RetString :=
    EnclosingQuotes('APPTLPROV');
  if RetString = 'APPTLINSTR' then RetString :=
    EnclosingQuotes('APPTLINSTR');
  if RetString = 'APPTADATE' then RetString :=
    EnclosingQuotes('APPTADATE');
  if RetString = 'APPTARSN' then RetString :=
    EnclosingQuotes('APPTARSN');
  if RetString = 'APPTAID' then RetString :=
    EnclosingQuotes('APPTAID');
  if RetString = 'APPTALOC' then RetString :=
    EnclosingQuotes('APPTALOC');
  if RetString = 'APPTADEPT' then RetString :=
    EnclosingQuotes('APPTADEPT');
  if RetString = 'APPTARMKS' then RetString :=
    EnclosingQuotes('APPTARMKS');
  if RetString = 'APPTAADDID' then RetString :=
    EnclosingQuotes('APPTAADDID');
  if RetString = 'APPTASTAT' then RetString :=
    EnclosingQuotes('APPTASTAT');
  if RetString = 'APPTADOW' then RetString :=
    EnclosingQuotes('APPTADOW');
  if RetString = 'APPTAMONTH' then RetString :=
    EnclosingQuotes('APPTAMONTH');
  if RetString = 'APPTADAY' then RetString :=
    EnclosingQuotes('APPTADAY');
  if RetString = 'APPTATIME' then RetString :=
    EnclosingQuotes('APPTATIME');
  if RetString = 'APPTAPROV' then RetString :=
    EnclosingQuotes('APPTAPROV');
  if RetString = 'APPTAINSTR' then RetString :=
    EnclosingQuotes('APPTAINSTR');
  if RetString = 'NON_FIRST' then RetString :=
    EnclosingQuotes('NON_FIRST');
  if RetString = 'NON_LAST' then RetString :=
    EnclosingQuotes('NON_LAST');
  if RetString = 'NON_SALUTE' then RetString :=
    EnclosingQuotes('NON_SALUTE');
  if RetString = 'NON_DEGREE' then RetString :=
    EnclosingQuotes('NON_DEGREE');
  if RetString = 'NON_ADDR1' then RetString :=
    EnclosingQuotes('NON_ADDR1');
  if RetString = 'NON_ADDR2' then RetString :=
    EnclosingQuotes('NON_ADDR2');
  if RetString = 'NON_DATE' then RetString :=
    EnclosingQuotes('NON_DATE');
  if RetString = 'NON_AUTH' then RetString :=
    EnclosingQuotes('NON_AUTH');
  if RetString = 'NON_PLANID' then RetString :=
    EnclosingQuotes('NON_PLANID');
  if RetString = 'NON_EXPIRE' then RetString :=
    EnclosingQuotes('NON_EXPIRE');
  if RetString = 'NON_MAXVST' then RetString :=
    EnclosingQuotes('NON_MAXVST');
  if RetString = 'NON_VISITS' then RetString :=
    EnclosingQuotes('NON_VISITS');
  if RetString = 'REF_FIRST' then RetString :=
    EnclosingQuotes('REF_FIRST');
  if RetString = 'REF_LAST' then RetString :=
    EnclosingQuotes('REF_LAST');
  if RetString = 'REF_HIMHER' then RetString :=
    EnclosingQuotes('REF_HIMHER');
  if RetString = 'REF_HISHER' then RetString :=
    EnclosingQuotes('REF_HISHER');
  if RetString = 'REF_PROV' then RetString :=
    EnclosingQuotes('REF_PROV');
  if RetString = 'REF_PROVID' then RetString :=
    EnclosingQuotes('REF_PROVID');
  if RetString = 'REF_SOURCE' then RetString :=
    EnclosingQuotes('REF_SOURCE');
  if RetString = 'AGMTNAME' then RetString :=
    EnclosingQuotes('AGMTNAME');
  if RetString = 'AGMTSTART' then RetString :=
    EnclosingQuotes('AGMTSTART');
  if RetString = 'AGMTDUR' then RetString :=
    EnclosingQuotes('AGMTDUR');
  if RetString = 'AGMTEXP' then RetString :=
    EnclosingQuotes('AGMTEXP');
  if RetString = 'AGMTRNWL' then RetString :=
    EnclosingQuotes('AGMTRNWL');
  if RetString = 'AGMT_NUM' then RetString :=
    EnclosingQuotes('AGMT_NUM');
  if RetString = 'AGMTCONFRM' then RetString :=
    EnclosingQuotes('AGMTCONFRM');
  if RetString = 'AGMTRCOST' then RetString :=
    EnclosingQuotes('AGMTRCOST');
  if RetString = 'AGMTLCOST' then RetString :=
    EnclosingQuotes('AGMTLCOST');
  if RetString = 'AGMTRNORM' then RetString :=
    EnclosingQuotes('AGMTRNORM');
  if RetString = 'AGMTLNORM' then RetString :=
    EnclosingQuotes('AGMTLNORM');
  if RetString = 'AGMTRTYPE' then RetString :=
    EnclosingQuotes('AGMTRTYPE');
  if RetString = 'AGMTLTYPE' then RetString :=
    EnclosingQuotes('AGMTLTYPE');
end;

end.
