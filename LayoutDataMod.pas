unit LayoutDataMod;

interface

uses
  SysUtils, Classes, DB, adsdata, adsfunc, adstable,
  ComCtrls, adscnnct, Design, Forms, Controls,
  CBSComponents, CBSGraphics, dialogs, Math, Types, FDMain,
  TabExport;

const ListToEliminate = 'EXPLICITTOP~EXPLICITLEFT~EXPLICITWIDTH~EXPLICITHEIGHT~ONMOUSELEAVE~ONMOUSEENTER';

type
  TLayoutInformation = record
   LayoutID: Integer;
   LayoutType: String;
   LayoutName: String;
   PrintLayout:Boolean;
  end;

  TLayoutData = class(TDataModule)
    LayoutTable: TAdsTable;
    LinkTable: TAdsTable;
    TabTable: TAdsTable;
    ExamLinkTable: TAdsTable;
    ExamTabTable: TAdsTable;
    LayoutConnection: TAdsConnection;
    TabTypeQuery: TAdsQuery;
    TabAdjustQuery: TAdsQuery;
    GeneralQuery: TAdsQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    CurrentTab: TTabSheet;
    CurrentForm : TfrmDesign;
    FPrintLayout: Boolean;
    FLayoutType: String;
    procedure ChangeComponentParent;
    procedure StripProperties(var ComponentList: TStringList);
    procedure FillPullDown;
    procedure SaveAllTabs(LayoutID: Integer; LayoutPageControl: TPageControl);
    procedure SaveCurrentTab(TabID, LayoutID: Integer);
    function PickPrintLayout: Integer;
    procedure SetPrintLayout(const Value: Boolean);
    procedure SetLayoutType(const Value: String);
    procedure AddToTabMaster(ThisTab: IXMLTabRecordType; var Description: WideString);
  public
    { Public declarations }
    function LayoutExists(const LayoutName:String;PrintLayout: Boolean=False): Boolean;
    function TabExists(const TabName:String;PrintLayout: Boolean=False): Boolean;
    procedure GetLayoutInfo(LayoutName:String;var LayoutID:Integer);overload;
    procedure GetLayoutInfo(LayoutID:Integer;var LayoutName:String);overload;
    procedure GetTabInfo(Description:String;var TabID:Integer; var TabLabel: String; var TabInformation: String);overload;
    procedure GetTabInfo(TabID:Integer;var Description:String; var TabLabel: String; var TabInformation: String);overload;
    procedure LoadLayout(LayoutID: Integer; MasterPageControl: TPageControl;LoadBinary:Boolean = False);
    procedure LoadTab(TabID: Integer; var MasterPageControl: TPageControl;LoadBinary: Boolean=False);
    function IsTabLayoutType(const TabID: Integer; LayoutType: String):Boolean;
    procedure SaveLayout(LayoutPageControl: TPageControl; LayoutInfo: TLayoutInformation);
    procedure SaveTab(TabID, LayoutID: Integer; LayoutSheet: TTabSheet);
    procedure SaveLayoutHead(var LayoutInfo: TLayoutInformation);
    procedure RemoveTab(LayoutID, TabID: Integer);
    function PrinterLayout(const LayoutID: Integer): Integer;
    property PrintLayout: Boolean read FPrintLayout write SetPrintLayout;
    property LayoutType: String read FLayoutType write SetLayoutType;
    function ExportTab(TabID: Integer; var FileName: WideString): Boolean;
    function ImportTab(FileName: WideString; var Description: WideString): Boolean;
  end;

var
  LayoutData: TLayoutData;

implementation

uses PickALayoutMain;
{$R *.dfm}


{ TLayoutDataModule }
procedure TLayoutData.SaveLayout(LayoutPageControl: TPageControl; LayoutInfo: TLayoutInformation);
var TabNumber, LayoutIndex: Integer;
begin
  LayoutType := LayoutInfo.LayoutType;
  PrintLayout := LayoutInfo.PrintLayout;
  SaveLayoutHead(LayoutInfo);
  SaveAllTabs(LayoutInfo.LayoutID, LayoutPageControl);
  ShowMessage('Layout Saved');
end;

procedure TLayoutData.SaveTab(TabID, LayoutID: Integer; LayoutSheet: TTabSheet);
begin
  CurrentTab := LayoutSheet;
  CurrentForm := LayoutSheet.Controls[0] as TfrmDesign;
  SaveCurrentTab(TabID, LayoutID);
end;

procedure TLayoutData.SaveLayoutHead(var LayoutInfo: TLayoutInformation);
var
  LayoutName: string;
  LayoutNumber: Integer;
begin

  if LayoutInfo.LayoutID = 0 then
  begin
    with LayoutTable do
    begin
      Indexname := 'LAYOUTID';
      Last;
      LayoutNumber := FieldByName('LayoutID').AsInteger + 1;
      Insert;
      FieldByName('LayoutID').AsInteger := LayoutNumber;
      FieldByName('LayoutName').AsString := Trim(LayoutInfo.LayoutName);
      FieldByName('LayoutCreated').AsDateTime := now;
      FieldByName('LayoutType').AsString := LayoutInfo.LayoutType;
      FieldByName('PrintLayout').AsBoolean := LayoutInfo.PrintLayout;
      Post;
      LayoutInfo.LayoutID := LayoutNumber;
    end;
  end
  else
  begin
    with LayoutTable do
    begin
      IndexName := 'LayoutID';
      FindKey([LayoutInfo.LayoutID]);
      if FieldByName('LayoutName').AsString <> LayoutInfo.LayoutName then
      begin
        Edit;
        FieldByName('LayoutName').AsString := Trim(LayoutInfo.LayoutName);
        Post;
      end;
    end;
  end;
end;


procedure TLayoutData.SaveAllTabs(LayoutID: Integer; LayoutPageControl:TPageControl);
var x, StartTab: Integer;
begin
  TabTable.IndexName := 'TabID';
  StartTab := LayoutPageControl.ActivePageIndex;
  for x := 0 to LayoutPageControl.PageCount - 1 do
  begin
    LayoutPageControl.ActivePage := LayoutPageControl.Pages[x];
    CurrentTab := LayoutPageControl.Pages[x];
    CurrentForm := CurrentTab.Controls[0] as tfrmDesign;
    SaveCurrentTab(CurrentForm.TabID, LayoutID);
  end;
  TabTable.IndexName := '';
end;

procedure TLayoutData.SaveCurrentTab(TabID, LayoutID: Integer);
var NewTabID: Integer;
  ComponentStream : TStream;
  BlobField : TField;
  Description: String;
  ComponentsAsString: TStringList;
begin
  Description := '';
  with TabTable do
  begin
    if TabID = 0 then
    begin
      //Check for description duplicate
      IndexName := 'TabDescription';
      if Description = '' then
        Description := CurrentForm.TabName;
      while FindKey([Description, FPrintLayout]) do
      begin
        ShowMessage(Description+' is already a named tab');
        exit;
      end;
      IndexName := 'TabID';
      Last;
      NewTabID := FieldByName('TabID').AsInteger + 1;
      Insert;
      FieldByName('TabID').AsInteger := NewTabID;
      CurrentForm.TabID := NewTabID;
      FieldByName('TabCreated').AsDateTime := now;
      FieldByName('LayoutType').AsString := FLayoutType;
      FieldByName('PrintLayout').AsBoolean := FPrintLayout;
      Post;
    end
    else
    begin
      // Find tab record
     IndexName := 'TabID';
     FindKey([CurrentForm.TabID]);
    end;
    CurrentForm.VertScrollBar.Position := 0;
    CurrentForm.HorzScrollBar.Position := 0;
    CurrentForm.Visible := False;
// New Code
    ComponentsAsString := TStringList.Create;
    try
      ComponentStream := TMemoryStream.Create;
      try
        CurrentForm.cmpFormDesigner.SaveToStream(ComponentStream,dfmText);
        ComponentStream.Seek(0, soFromBeginning);
        ComponentsAsString.LoadFromStream(ComponentStream);
        StripProperties(ComponentsAsString);
      finally
        ComponentStream.Free;
      end;
      Edit;
      Blobfield := FieldByName('TabComponents');
      ComponentStream := CreateBlobStream(BlobField, bmWrite);
      ComponentsAsString.SaveToStream(ComponentStream);
    finally
      ComponentsAsString.Free;
    end;
// End New code
{  Old Code
    Edit;
    Blobfield := FieldByName('TabComponents');
    ComponentStream := CreateBlobStream(BlobField, bmWrite);
    CurrentForm.cmpFormDesigner.SaveToStream(ComponentStream,dfmText);
}
{$IfDef BinaryStore}
    Blobfield := FieldByName('TabComponentsBinary');
    ComponentStream := CreateBlobStream(BlobField, bmWrite);
    CurrentForm.cmpFormDesigner.SaveToStream(ComponentStream,dfmBinary);
{$Endif}
    FieldByName('TabDescription').AsString := Trim(CurrentForm.TabName);
    FieldByName('TabLabel').AsString := Trim(CurrentForm.TabLabel);
    FieldByName('TabInformation').AsString := Trim(CurrentForm.TabNotes);
    FieldByName('TabLastMod').AsDateTime := now;
    Post;
    LinkTable.IndexName := 'LOOKUPID';
    if not LinkTable.FindKey([LayoutID,CurrentForm.TabID]) then
    begin
      // it's a new tab link
      LinkTable.Insert;
      LinkTable.FieldByName('LayoutID').AsInteger := LayoutID;
      LinkTable.FieldByName('TabID').AsInteger := CurrentForm.TabID;
    end
    else
      // it's an existing tab link
      LinkTable.Edit;

    LinkTable.FieldByName('LinkedTime').AsDateTime := now;
    // this next takes care of re-sorting issues
    LinkTable.FieldByName('TabSort').AsInteger := CurrentTab.TabIndex * 10;
    LinkTable.Post;
    // Check Linking Table
    CurrentForm.Visible := True;
  end;
end;

function TLayoutData.LayoutExists(const LayoutName: String;
  PrintLayout: Boolean): Boolean;
begin
  with GeneralQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select * from LayoutMaster');
      Add('where UPPER(LayoutName) = :LayoutName');
      Add('and LayoutType = :LayoutType');
      Add('and PrintLayout = :PrintLayout');
    end;
    ParamByName('LayoutName').AsString := Trim(uppercase(Trim(LayoutName)));
    ParamByName('LayoutType').AsString := FLayoutType;
    ParamByName('PrintLayout').AsBoolean := PrintLayout;
    Open;
    Result := (RecordCount > 0);
    Close;
  end;
end;

procedure TLayoutData.LoadLayout(LayoutID: Integer;
  MasterPageControl: TPageControl;LoadBinary:Boolean = False);
begin
{$IfNDef BinaryStore}
  LoadBinary := False;
{$ENDIF}
  MasterPageControl.Visible := False;
  try
    TabTable.IndexName := 'TabID';
    LinkTable.IndexName := 'TabSort';
    LinkTable.Filter := 'LayoutID = ' + IntToStr(LayoutID);
    LinkTable.Filtered := True;
    LinkTable.First;
    while not LinkTable.Eof do
    begin
      LoadTab(LinkTable.FieldByName('TabID').AsInteger,MasterPageControl,LoadBinary);
      LinkTable.Next;
    end;
    LinkTable.Filtered := False;
  finally
  MasterPageControl.Visible := True;
  end;
end;

function TLayoutData.IsTabLayoutType(const TabID: Integer; LayoutType: String): Boolean;
begin
  Result := False;
  with TabTypeQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select L.LayoutType');
      Add('from LayoutMaster as L, LayoutTabLinkMaster as LT');
      Add('where LT.TabID = :TabID and LT.LayoutID = L.LayoutID');
      Add('and L.LayoutType = :LayoutType');
    end;
    ParamByName('TabID').AsInteger := TabId;
    ParamByName('LayoutType').AsString := LayoutType;
    Open;
    Result := (RecordCount > 0);
    Close;
  end;
end;

procedure TLayoutData.LoadTab(TabID: Integer; var MasterPageControl: TPageControl;LoadBinary: Boolean=False);
var
  ObjectStream: TMemoryStream;
  ComponentStream: TStream;
  CheckObjectStream: TStringStream;
  MyStrings: TStringList;
  ThisParent: TForm;
  BlobField: TField;
begin
  TabTable.IndexName := 'TabID';
  TabTable.FindKey([TabID]);
  CurrentTab := TTabSheet.Create(MasterPageControl);
  CurrentTab.PageControl := MasterPageControl;
  if LoadBinary then
    Blobfield := TabTable.FieldByName('TabComponentsBinary')
  else
    Blobfield := TabTable.FieldByName('TabComponents');
  ObjectStream := TMemoryStream.Create;
  try
  if LoadBinary then
  begin
    ComponentStream := TabTable.CreateBlobStream(BlobField, bmRead);
    ComponentStream.Seek(0, soFromBeginning);
    ObjectStream.CopyFrom(ComponentStream, ComponentStream.Size);
  end
  else
  begin
    ComponentStream := TabTable.CreateBlobStream(BlobField, bmRead);
    CheckObjectStream := TStringStream.Create('');
    CheckObjectStream.CopyFrom(ComponentStream, ComponentStream.Size);
    CheckObjectStream.Seek(0, soFromBeginning);
    MyStrings := TStringList.Create;
    MyStrings.Add(CheckObjectStream.ReadString(CheckObjectStream.Size));
    ComponentStream.Seek(0, soFromBeginning);
    ObjectTextToBinary(ComponentStream, ObjectStream);
    FreeAndNil(CheckObjectStream);
    FreeAndNil(MyStrings);
  end;
  ObjectStream.SaveToFile('c:\test.txt');
  ObjectStream.Seek(0, soFromBeginning);
  try
    CurrentForm := TfrmDesign.Create(MasterPageControl);
    CurrentForm := ObjectStream.ReadComponent(nil) as TfrmDesign;
//        CurrentForm.cmpFormDesigner.LoadFromStream(ComponentStream,dfmText);
  except
    //create blank form if bad load
    on e: exception do
    begin
      ShowMessage(e.Message+#13#10+#13#10+
      'This is on the tab labeled - '+TabTable.FieldByName('TabLabel').AsString+#13#10+
      'You can fix this by using Load Layout in Safe Mode'+#13#10+
      'which is found on the Tools Menu');
      CurrentForm := TFrmDesign.Create(nil);
    end;
  end;
  CurrentForm.Parent := CurrentTab;
  ThisParent := TForm(masterPageControl.Parent);
  CurrentForm.Height := Min(CurrentForm.Height,Screen.Height);
  CurrentForm.Width := Min(CurrentForm.Width, Screen.Width);
  CurrentForm.AutoScroll := True;
  if ThisParent.ClientWidth < 100 then
    ThisParent.ClientWidth := 100;
  if ThisParent.ClientHeight < 100 then
    ThisParent.ClientHeight := 100;
  CurrentForm.BorderStyle := bsNone;
  CurrentForm.BorderWidth := 0;
  //CurrentForm.Align := alClient;
  CurrentForm.Visible := True;
  CurrentForm.TabLabel := TabTable.FieldByName('TabLabel').AsString;
  CurrentForm.TabName := Trim(TabTable.FieldByName('TabDescription').AsString);
  CurrentForm.TabNotes := TabTable.FieldByName('TabInformation').AsString;
  CurrentForm.TabID := TabTable.FieldByName('TabID').AsInteger;
  MasterPageControl.ActivePage := CurrentTab;
  CurrentTab.Caption := CurrentForm.TabLabel;
  finally
    ObjectStream.Free;
  end;
end;

procedure TLayoutData.FillPullDown;
var
  TestComponent: TComponent;
  x: Integer;
  P: TPoint;
begin
  for x := 0 to CurrentForm.ComponentCount - 1 do
  begin
    TestComponent := CurrentForm.Components[x];
    if TestComponent is TCBSDBComboBox then
    begin
      with TestComponent as TCBSDBComboBox do
      begin
        Items.Add('One');
        Items.Add('Two [Bracket Test]');
        Items.Add('Three');
        Items.Add('Four');
        Items.Add('five [Brk t');
        Items.Add('six');
        Items.Add('Negative');
        Items.Add('WNL');
        Items.Add('nine');
        Items.Add('TEN');
        Items.Add('BOne');
        Items.Add('bTwo [Bracket Test]');
        Items.Add('BThree');
        Items.Add('BFour');
        Items.Add('Bfive [Brk t');
        Items.Add('Bsix');
        Items.Add('BNegative');
        Items.Add('BWNL');
        Items.Add('Bnine');
        Items.Add('BTEN');
        Items.Add('COne');
        Items.Add('CTwo [Bracket Test]');
        Items.Add('CThree');
        Items.Add('CFour');
        Items.Add('Cfive [Brk t');
        Items.Add('Csix');
        Items.Add('CNegative');
        Items.Add('CWNL');
        Items.Add('Cnine');
        Items.Add('CTEN');
      end;
    end;
  end;
end;
procedure TLayoutData.ChangeComponentParent;
var
  TestControl: TControl;
  TestComponent: TComponent;
  x: Integer;
  P: TPoint;
begin
  for x := 0 to CurrentForm.ComponentCount - 1 do
  begin
    TestComponent := CurrentForm.Components[x];
    if TestComponent is TControl then
    begin
      TestControl := TControl(TestComponent);
      if ((TestControl is TCBSButton) or
      (TestControl is TCBSBitBtn) or
      (TestControl is TCBSDBGrid) or
       (TestControl is TCBSDBImage)) then
      begin
        P.X := TestControl.Left;
        P.Y := TestControl.Top;
        P := TestControl.Parent.ClientToScreen(P);
        P := CurrentTab.ScreenToClient(P);
        TestControl.Parent := CurrentTab;
        TestControl.Left := P.X;
        TestControl.Top := P.Y;
      end;
    end;
  end;
end;

procedure TLayoutData.DataModuleCreate(Sender: TObject);
begin
  LayoutTable.Open;
  TabTable.Open;
  LinkTable.Open;
end;

procedure TLayoutData.DataModuleDestroy(Sender: TObject);
begin
  CurrentTab := nil;
  CurrentForm := nil;
  LayoutTable.Close;
  TabTable.Close;
  LinkTable.Close;
end;

procedure TLayoutData.RemoveTab(LayoutID, TabID: Integer);
begin
  // Remove Tabs from all Layouts
  if LayoutID = 0 then
  begin
    with TabAdjustQuery do
    begin
      with SQL do
      begin
        Clear;
        Add('Delete from LayoutTabLinkMaster');
        Add('where TabID = :TabID');
      end;
      ParamByName('TabID').AsInteger := TabID;
      ExecSQL;
      Close;
    end;
  end
  else
  // Delete tabs from this layout
  begin
    with TabAdjustQuery do
    begin
      with SQL do
      begin
        Clear;
        Add('Delete from LayoutTabLinkMaster');
        Add('where TabID = :TabID');
        Add('and LayoutID = :LayoutID');
      end;
      ParamByName('TabID').AsInteger := TabID;
      ParamByName('LayoutID').AsInteger := LayoutID;
      ExecSQL;
      Close;
    end;
  end;
end;

function TLayoutData.PrinterLayout(const LayoutID: Integer): Integer;
var LayoutName, LayoutType: String;
begin
  Result := -1; //what we send back if no match;
  with GeneralQuery do
  begin
    Close;
    // Check first to see if provided ID is a PrintLayout
    with SQL do
    begin
      Clear;
      Add('Select * from LayoutMaster');
      Add('where LayoutID = :LayoutID');
    end;
    ParamByName('LayoutID').AsInteger := LayoutID;
    Open;
    if RecordCount = 0 then
    begin
      // Found nothing, not a real layoutID
      Close;
      Exit;
    end;
    if FieldByName('PrintLayout').AsBoolean then
    // this is a print layout
    begin
      Result := LayoutId;
      exit;
    end
    else
    begin
      // LayoutID was not a printlayout, look for a printlayout by name
      LayoutName := Trim(uppercase(FieldByName('LayoutName').AsString));
      LayoutType := uppercase(FieldByName('LayoutType').AsString);
    end;
    Close;
    with SQL do
    begin
      Clear;
      Add('Select L.LayoutID, L.LayoutName from LayoutMaster as L');
      Add('where (UPPER(L.LayoutName) = :LayoutName)');
      Add('and (UPPER(L.LayoutType) = :LayoutType)');
      Add('and L.PrintLayout=True');
    end;
    ParamByName('LayoutName').AsString := Trim(LayoutName);
    ParamByName('LayoutType').AsString := LayoutType;
    Open;
    case RecordCount of
    0: begin //None found by name, look by type
      Close;
      with SQL do
      begin
        Clear;
        Add('Select L.LayoutID, L.LayoutName from LayoutMaster as L');
        Add('where (UPPER(L.LayoutType) = :LayoutType)');
        Add('and L.PrintLayout=True');
      end;
      ParamByName('LayoutType').AsString := LayoutType;
      Open;
      case RecordCount of
      0: exit;  // None Found
      1: Result :=  FieldByName('LayoutID').AsInteger; //one Found
      else
        Result := PickPrintLayout;
      end;
    end;
    1: Result := FieldByName('LayoutID').AsInteger;  //one found by name
    else
      Result := PickPrintLayout;
    end;
     Close;
  end;
end;


function TLayoutData.PickPrintLayout: Integer;
var ThisPickLayoutForm: TPickPrintLayoutForm;
begin
  Result := -1;
  ThisPickLayoutForm := TPickPrintLayoutForm.Create(Self);
  try
    with GeneralQuery do
    begin
      first;
      while not Eof do
      begin
        ThisPickLayoutForm.Add(Trim(FieldByName('LayoutName').AsString),
                               FieldByName('LayoutID').AsInteger);
        Next;
      end;
    end;
    Result := ThisPickLayoutForm.ShowModal;
  finally
    FreeAndNil(ThisPickLayoutForm);
  end;

end;

procedure TLayoutData.SetPrintLayout(const Value: Boolean);
begin
  FPrintLayout := Value;
end;

procedure TLayoutData.StripProperties(var ComponentList: TStringList);
var x: Integer;
begin
  for x := 0 to ComponentList.Count - 1 do
  begin
    if copy(uppercase(trim(ComponentList.Names[x])),1,8)='EXPLICIT' then
      ComponentList[x] := '';
    if pos('RUSSIAN_CHARSET',ComponentList[x])>0 then
      ComponentList[x] := '';
  end;
  for x := ComponentList.Count-1 downto 0 do
    if ComponentList[x] = '' then ComponentList.Delete(x);
end;

function TLayoutData.TabExists(const TabName: String; PrintLayout: Boolean): Boolean;
begin
  with GeneralQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select * from TabMaster');
      Add('where UPPER(TabDescription) = :Description');
      Add('and LayoutType = :LayoutType');
      Add('and PrintLayout = :PrintLayout');
    end;
    ParamByname('Description').AsString := uppercase(trim(TabName));
    ParamByName('LayoutType').AsString := FLayoutType;
    ParamByName('PrintLayout').AsBoolean := PrintLayout;
    Open;
    Result := (RecordCount > 0);
    Close;
  end;
end;

procedure TLayoutData.SetLayoutType(const Value: String);
begin
  FLayoutType := Value;
end;

procedure TLayoutData.GetLayoutInfo(LayoutID: Integer; var LayoutName: String);
begin
 { TODO :
This function will not perform properly but isn't being used right now
so can be finished later if needed. }
with GeneralQuery do
begin
  Close;
  with SQL do
  begin
    Clear;
    Add('Select * from LayoutMaster');
    Add('where LayoutID = :LayoutID');
    Add('and LayoutType = :LayoutType');
    Add('and PrintLayout = :PrintLayout');
  end;
  ParamByName('LayoutID').AsInteger := LayoutID;
  ParamByName('LayoutType').AsString := FLayoutType;
  ParamByName('PrintLayout').AsBoolean := FPrintLayout;
  Open;
  if RecordCount > 0 then
  begin
    LayoutName := Trim(FieldByName('LayoutName').AsString);
  end;
  Close;
end;

end;

procedure TLayoutData.GetLayoutInfo(LayoutName: String; var LayoutID: Integer);
begin
  with GeneralQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select * from LayoutMaster');
      Add('where UPPER(LayoutName) = :LayoutName');
      Add('and LayoutType = :LayoutType');
      Add('and PrintLayout = :PrintLayout');
    end;
    ParamByName('LayoutName').AsString := Trim(uppercase(Trim(LayoutName)));
    ParamByName('LayoutType').AsString := FLayoutType;
    ParamByName('PrintLayout').AsBoolean := FPrintLayout;
    Open;
    if RecordCount > 0 then
    begin
      First;
      LayoutID := FieldByName('LayoutID').AsInteger;
    end
    else
      LayoutID := 0;
    Close;
  end;
end;

procedure TLayoutData.GetTabInfo(TabID: Integer;
  var Description, TabLabel, TabInformation: String);
begin
 { TODO :
This function will not perform properly but isn't being used right now
so can be finished later if needed. }
with GeneralQuery do
begin
  Close;
  with SQL do
  begin
    Clear;
    Add('Select * from TabMaster');
    Add('where TabID = :TabID');
    Add('and LayoutType = :LayoutType');
    Add('and PrintLayout = :PrintLayout');
  end;
  ParamByname('TabID').AsInteger := TabID;
  ParamByName('LayoutType').AsString := FLayoutType;
  ParamByName('PrintLayout').AsBoolean := FPrintLayout;
  Open;
  if RecordCount > 0 then
  begin
    First;
    Description := Trim(FieldByname('TabDescription').AsString);
    TabLabel := FieldByname('TabLabel').AsString;
    TabInformation := FieldByname('TabInformation').AsString;
  end
  else
  begin
    Description := '';
    TabLabel := '';
    TabInformation := '';
  end;
  Close;
end;

end;

procedure TLayoutData.GetTabInfo(Description: String;
  var TabID: Integer;
  var TabLabel, TabInformation: String);
begin
with GeneralQuery do
begin
  Close;
  with SQL do
  begin
    Clear;
    Add('Select * from TabMaster');
    Add('where UPPER(TabDescription) = :Description');
    Add('and LayoutType = :LayoutType');
    Add('and PrintLayout = :PrintLayout');
  end;
  ParamByName('Description').AsString := uppercase(trim(Description));
  ParamByName('LayoutType').AsString := FLayoutType;
  ParamByName('PrintLayout').AsBoolean := FPrintLayout;
  Open;
  if RecordCount > 0 then
  begin
    TabID := FieldByname('TabID').AsInteger;
    TabLabel := FieldByname('TabLabel').AsString;
    TabInformation := FieldByname('TabInformation').AsString;
  end
  else
    TabID := 0;
  Close;
end;

end;

function TLayoutData.ExportTab(TabID: Integer; var FileName: WideString): Boolean;
  var ThisTabSet: IXMLTabRecordsType;
      ThisTab: IXMLTabRecordType;
      ThisSet: TStringList;
begin
  Result := False;
  ThisTabSet := NewTabRecords;
  with GeneralQuery do
  begin
    Close;
    with SQL do
    begin
      Clear;
      Add('Select * from TabMaster');
      Add('where TabID = :TabID');
    end;
    ParamByName('TabID').AsInteger := TabID;
    Open;
    if RecordCount > 0 then
    begin
      ThisSet := TStringList.Create;
      try
        ThisTab := ThisTabSet.Add;
        ThisTab.TabID := TabID;
        ThisTab.TabDescription := Trim(FieldByName('TabDescription').AsString);
        ThisTab.TabLabel := FieldByName('TabLabel').AsString;
        ThisTab.TabLastMod := FieldByName('TabLastMod').AsDateTime;
        ThisTab.TabCreated := FieldByName('TabCreated').AsDateTime;
        ThisTab.TabComponents := FieldByName('TabComponents').AsString;
        ThisTab.TabInformation := FieldByName('TabInformation').AsString;
        ThisTab.LayoutType := FieldByName('LayoutType').AsString;
        ThisTab.PrintLayout := FieldByName('PrintLayout').AsBoolean;
        ThisSet.Add(ThisTabSet.XML);
        ThisSet.SaveToFile(FileName);
        Result := True;
      finally
        ThisSet.Free;
      end;
    end;
    Close;
  end;
end;

function TLayoutData.ImportTab(FileName: WideString;
  var Description: WideString): Boolean;
  var ThisTabSet: IXMLTabRecordsType;
      ThisTab: IXMLTabRecordType;
      ThisSet: TStringList;
      x: Integer;
begin
  Result := False;
  try
    ThisTabSet := LoadTabRecords(FileName);
    for x := 0 to ThisTabSet.Count -1 do
    begin
      AddToTabMaster(ThisTabSet.TabRecord[x], Description);
    end;
  except
    on e: Exception do ShowMessage(E.Message);
  end;

end;

procedure TLayoutData.AddToTabMaster(ThisTab:IXMLTabRecordType; var Description: WideString);
var TabID: Integer;
    HoldIndex: String;
begin
  with TabTable do
  begin
    HoldIndex := IndexName;
    // Check if Description exists
    IndexName := 'TabDescription';
    if Description = '' then
      Description := ThisTab.TabDescription;
    while FindKey([Description, ThisTab.LayoutType]) do
    begin
      Randomize;
      Description := Description + '-'+IntToStr(Random(10));
    end;
    //  Check if TabID exists
    Indexname := 'TabID';
    TabID := ThisTab.TabID;
    if FindKey([TabID]) then
    begin
      Last;
      TabId := FieldByName('TabID').AsInteger+1;
    end;
    // Add Record
    Insert;
    FieldByName('TabID').AsInteger := TabID;
    FieldByName('TabDescription').AsString := Trim(Description);
    FieldByName('TabLastMod').AsDateTime := ThisTab.TabLastMod;
    FieldByName('TabLabel').AsString := ThisTab.TabLabel;
    FieldByName('TabInformation').AsString := ThisTab.TabInformation;
    FieldByName('LayoutType').AsString := ThisTab.LayoutType;
    FieldByName('PrintLayout').AsBoolean := ThisTab.PrintLayout;
    FieldByName('TabComponents').AsString := ThisTab.TabComponents;
    FieldByName('TabCreated').AsDateTime := ThisTab.TabCreated;
    Post;
    IndexName := HoldIndex;
  end;

end;

initialization
//  RegisterCBSComponents;
  RegisterClasses([TfrmDesign]);

end.
