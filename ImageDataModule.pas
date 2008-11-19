unit ImageDataModule;

interface

uses
  SysUtils, Classes, ExtCtrls, adsfunc, adstable, DB, adsdata, adscnnct,
  GR32_Image, GR32, DrawComponents, Graphics, Forms, Buttons, CBSGraphics;

procedure LoadFilesByMask(lst: TStrings; const SpecDir, WildCard: string);

type
  TImageData = class(TDataModule)
    CBSToolsConnection: TAdsConnection;
    ToolImageQuery: TAdsQuery;
    ToolMasterTable: TAdsTable;
    ExamImageTable: TAdsTable;
    CBSFilesConnection: TAdsConnection;
    MasterTable: TAdsTable;
    ToolCategoryTable: TAdsTable;
    ToolCategoryQuery: TAdsQuery;
    SourceTable: TAdsTable;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure SetDrawTool(Value :TBitMap32);
  private
    FDrawTool: TBitMap32;
    //DJ Added place to store currently selected button information
    FMedicalInformation: TMedProcedure;
    FBaseImage: String;
    FCategory: Integer;
    FSourceEditable: Boolean;
    FSourceUnique: Integer;
    FRecordSource: Integer;
    procedure ToolClick(Sender: TObject);
    procedure SetBaseImage(const Value: String);
    function GetCategory: String;
    function GetSourceEditable: Boolean;
    procedure SetCategory(const Value: String);
    procedure SetCategoryFromBaseImage(Value: String);
    procedure SetRecordSource(const Value: Integer);
    procedure SetSourceEditable(const Value: Boolean);
    procedure SetSourceUnique(const Value: Integer);
  public
    procedure UpdateImageTable;
    procedure GetImages(var DropToolsPanel: TPanel);
    property DrawTool: TBitMap32 read FDrawTool write SetDrawTool;
    property BaseImage: String read FBaseImage Write SetBaseImage;
    property Category: String read GetCategory Write SetCategory;
    property MedicalInformation: TMedProcedure read FMedicalInformation Write FMedicalInformation;
    property RecordSource: Integer read FRecordSource write SetRecordSource;
    property SourceUnique: Integer read FSourceUnique write SetSourceUnique;
    property SourceEditable: Boolean read GetSourceEditable write SetSourceEditable;
  end;

var
  ImageData: TImageData;

implementation

{$R *.dfm}
uses ImageHandlerInt;

{ TImageData }

procedure TImageData.GetImages(var DropToolsPanel: TPanel);
var
  ImageStream: TStream;
  BlobField: TField;
  NextButton: TDropToolButton;
  ButtonImage: TBitmap32;
  x: Integer;
  ButtonColumnCount: Integer;
begin
  ButtonImage := TBitMap32.Create;
  ButtonColumnCount := DropToolsPanel.Width div ButtonWidth;
//  DropToolsPanel.Width := ButtonWidth * ButtonColumnCount;
  try
    with ImageData.ToolImageQuery.SQL do
    begin
      Clear;
      Add('Select * from ToolMaster,ToolCategoryLinkMaster');
      Add('where ToolMaster.ToolImageID = ToolCategoryLinkMaster.ToolImageID');
     Add('and ToolCategoryLinkMaster.ToolCategoryID = :Category');
     Add('order by ToolCategoryLinkMaster.LinkOrder');
    end;
    with ImageData.ToolImageQuery do
    begin
      ParamByName('Category').AsInteger := FCategory;
      Open;
      First;
      x := 0;
      while not Eof do
      begin
        NextButton := TDropToolButton.Create(DropToolsPanel);
        NextButton.MedProcedure.ID := FieldByName('ToolImageID').AsInteger;
        Nextbutton.MedProcedure.ProcLabel := FieldByName('ToolLabel').AsString;
        Nextbutton.MedProcedure.ICD := FieldByName('ToolICD').AsString;
        Nextbutton.MedProcedure.TextForField := FieldByName('ToolTextForField').AsString;
        NextButton.MedProcedure.FieldToUpdate := FieldByName('ToolFieldToUpdate').AsString;
        NextButton.ParentShowHint := False;
        NextButton.Hint := FieldByName('ToolLabel').AsString;
        NextButton.ShowHint := (Length(NextButton.Hint)>0);
        if CaptionHeight > 0 then
          NextButton.Caption := FieldByName('ToolLabel').AsString;
        Blobfield := FieldByName('ToolImage');
        ImageStream := CreateBlobStream(BlobField, bmRead);
        ButtonImage.LoadFromStream(ImageStream);
        NextButton.DropBitMap := TBitMap32.Create;
        NextButton.DropBitMap.Assign(ButtonImage);
        DrawTool.Assign(ButtonImage);
        NextButton.Width := ButtonWidth;
        NextButton.Height := ButtonWidth+CaptionHeight;
        NextButton.Layout := blGlyphTop;
        ButtonImage.SetSize(ButtonWidth - 1, ButtonWidth - 1);
        DrawTool.DrawTo(ButtonImage, Rect(0, 0, ButtonImage.Width - 1, ButtonImage.Height - 1));
        NextButton.Glyph.Assign(ButtonImage);
        NextButton.Visible := True;
        NextButton.Parent := DropToolsPanel;
        NextButton.Top := Trunc(x / ButtonColumnCount) * ButtonWidth;
        NextButton.Left := (x mod ButtonColumnCount) * ButtonWidth;
        NextButton.GroupIndex := 1;
//        NextButton.OnClick := ToolClick;
        Inc(x);
        Next;
      end;
      Close;
    end;
    DropToolsPanel.Height := (Trunc(x/ButtonColumnCount))*ButtonWidth+CaptionHeight;
  finally
    ButtonImage.Free;
  end;

end;

procedure TImageData.SetDrawTool(Value: TBitMap32);
begin
  FDrawTool.Assign(Value);
  FDrawTool.ResetAlpha;
  FDrawTool.RaiseRectTS(FDrawTool.BoundsRect,0);
end;

procedure TImageData.ToolClick(Sender: TObject);
begin
  FDrawTool := TDropToolButton(Sender).DropBitMap;
  //DJ Added update from button
  FMedicalInformation := TDropToolButton(Sender).MedProcedure;
end;

procedure TImageData.UpdateImageTable;
var ButtonImage: TBitMap;
  ImageStream: TStream;
  BlobField :TField;
  x, NextRec: Integer;
  CheckPath : String;
  ImageFiles: TStrings;
begin
  ButtonImage := TBitMap.Create;
  ImageFiles := TStringList.Create;
  try
    with ImageData.ToolMasterTable do
    begin
      IndexName := 'TOOLLABEL';
      Open;
      NextRec := 0;
      CheckPath := ExtractFilePath(Application.ExeName)+'ToolImage\';
      LoadFilesByMask(ImageFiles, CheckPath, '*.bmp');
      for x := 0 to ImageFiles.Count -1 do
      begin
        CheckPath := ImageFiles.Strings[x];
        ButtonImage.LoadFromFile(CheckPath);
        CheckPath := ExtractFileName(CheckPath);
        CheckPath := copy(CheckPath,1,Length(CheckPath)-4);
        if not FindKey([CheckPath]) then
        begin
          if NextRec = 0 then
          begin
            First;
            while not eof do
            begin
              if NextRec < FieldByName('ToolImageID').AsInteger then
                NextRec := FieldByName('ToolImageID').AsInteger;
              Next;
            end;
          end;
          Insert;
          NextRec := NextRec + 1;
          FieldByName('ToolLabel').AsString := CheckPath;
          FieldByName('ToolImageID').AsInteger := NextRec;
        end
        else
          Edit;
        Blobfield := FieldByName('ToolImage');
        ImageStream := CreateBlobStream(BlobField, bmWrite);
        ButtonImage.SaveToStream(ImageStream);
        Post;
      end;
    Close;
    IndexName := '';
    end;
  finally
    ButtonImage.Free;
    ImageFiles.Free;
  end;
end;

procedure LoadFilesByMask(lst: TStrings; const SpecDir, WildCard: string);
var
  intFound: Integer;
  SearchRec: TSearchRec;
begin
  lst.Clear;
  intFound := FindFirst(SpecDir + WildCard, faAnyFile, SearchRec);
  while intFound = 0 do
  begin
    lst.Add(SpecDir + SearchRec.Name);
    intFound := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

procedure TImageData.DataModuleCreate(Sender: TObject);
begin
  FDrawTool := TBitMap32.Create;
  FRecordSource := ctExam;
  FSourceUnique := 0;
  FBaseImage := '';
  FCategory := 1;
end;

procedure TImageData.DataModuleDestroy(Sender: TObject);
begin
  FDrawTool.Destroy;

end;

procedure TImageData.SetBaseImage(const Value: String);
begin
  FBaseImage := Value;
  SetCategoryFromBaseImage(Value);
end;

procedure TImageData.SetCategory(const Value: String);
begin
  ToolCategoryQuery.Close;
  with ToolCategoryQuery do
  begin
    with SQL do
    begin
      Clear;
      Add('Select * from ToolCategoryMaster');
      Add('where ToolCategory = :Category');
    end;
    ParamByName('Category').AsString := Value;
    Open;

    if RecordCount > 0 then
    begin
      First;
      FCategory := FieldByName('ToolCatID').AsInteger;
    end
    else
      FCategory := 1;

    Close;
  end;

end;

function TImageData.GetCategory: String;
begin
  ToolCategoryQuery.Close;
  with ToolCategoryQuery do
  begin
    with SQL do
    begin
      Clear;
      Add('Select * from ToolCategoryMaster');
      Add('where ToolCatID = :Category');
    end;
    ParamByName('Category').AsInteger := FCategory;
    Open;

    if RecordCount > 0 then
    begin
      First;
      Result := FieldByName('ToolCategory').AsString;
    end
    else
      Result := '';

    Close;
  end;
end;

procedure TImageData.SetCategoryFromBaseImage(Value: String);
begin
  ToolCategoryQuery.Close;
  with ToolCategoryQuery do
  begin
    with SQL do
    begin
      Clear;
      Add('Select * from BaseImage');
      Add('where ImageName = :BaseImage');
    end;
    ParamByName('BaseImage').AsString := Value;
    Open;
    if RecordCount > 0 then
    begin
      First;
      FCategory := FieldByName('ImageCategory').AsInteger;
    end
    else
      FCategory := 1;

    Close;
  end;
end;

procedure TImageData.SetSourceEditable(const Value: Boolean);
begin
  FSourceEditable := Value;
end;

procedure TImageData.SetSourceUnique(const Value: Integer);
begin
  FSourceUnique := Value;
end;

procedure TImageData.SetRecordSource(const Value: Integer);
begin
  FRecordSource := Value;
end;

function TImageData.GetSourceEditable: Boolean;
begin
{$O-}
  Result := False;
  if FSourceUnique <= 0 then exit;
  with SourceTable do
  begin
    Close;
    // probably only need exam, but this is the idea....
    case fRecordSource of
    ctExam:
    begin
      SourceTable.TableName := 'EXAM.DBF';
      SourceTable.IndexName := 'EXAMUNIQUE';
    end;
    ctPatient:
    begin
      SourceTable.TableName := 'PATIENT.DBF';
      SourceTable.IndexName := 'PATUNIQUE';
    end;
    end;
    Open; 
    if FindKey([FSourceUnique]) then
    begin
    try
      // Try to edit if editable, not in edit mode in calling app
      Edit;
    except
      on E:Exception do Result := True;
      //in edit mode in calling app, therefore Editable here....
    end;

    end
    else
      Result := True;  //we didn't find the record, therefore we are in add mode
    Close;
  end;

end;

end.
