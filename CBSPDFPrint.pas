unit CBSPDFPrint;

interface
uses Classes, Windows, Forms, Graphics, ComCtrls, Dialogs, SysUtils, Controls,
CBSComponents,  gtCstPlnEng, gtCstPDFEng, ExtCtrls,
gtExPDFEng, gtUtils, gtPDFEng, gtPDFViewer,
gtPDFCrypt, gtCstPDFDoc, gtExPDFDoc, gtPDFDoc, gtCstDocEng,
StrUtils, DateUtils, Printers, CBSPrintInterface,
PrintSupport, Math, CBSPrintComponents, DB, Design, adsfunc;

const RoundGroup = 5;
      SecondColumn = 400;
      Test = False;
      // ScaleXFactor = 1;
      // ScaleYFactor = 1;
type
TFormPrinter = class(TComponent)
private
  PrintList: TStringList;
  CurrentForm: TfrmDesign;
  CurrentSpot: TPoint;
  CurrentRow: Integer;
  LastTop: Integer;
  LeftMargin: Integer;
  CurrentPage: Integer;
  BaseForm: TPrintSupportForm;
  PageEnd: Integer;
  Columns: Boolean;
  MemoryDocument: TMemoryStream;
    FDateTimeStamp: WideString;
  function LoadList(LayoutPageControl: TPageControl;var MaxWidth: Integer):Boolean;
  function PrintRound(StartNumber: Integer): Integer;
  procedure SetPageEnd(WhichPage: Integer=0);
  procedure PrintText(PrintItem: TCBSPrintText);overload;
  procedure PrintText(PrintItem: TCBSPrintField);overload;
  procedure PrintText(PrintItem: TCBSPrintCheckBox);overload;
  procedure PrintText(PrintItem: TCBSPrintMemo);overload;
  procedure PrintText(PrintItem: TCBSPrintImage);overload;
  procedure PrintText(PrintItem: TCBSPrintGrid);overload;
  procedure PrintText(PrintItem: TCBSPrintPanel);overload;
  procedure PrintPanel(PrintItem: TCBSPrintPanel);
  procedure SetCurrentRow(const CheckRow:Integer;const Height: Integer=0;const LineBefore: Boolean=False);
  procedure PrintBlock(TextToPrint: WideString; Width: Integer);
  function CheckBreak(BreakObject: IPrintProperties; BreakBefore: Boolean):Boolean;
  procedure NewPage;
  procedure PresetDocument(MaxWide: Integer);
  procedure CheckBottom(Position: Integer);
  procedure PrintImage(ThisImage: TBitmap; PrintItem: TCBSPrintImage);overload;
  procedure PrintImage(ThisImage: TBitmap; PrintItem: TImage);overload;
  procedure PrintMemo(PrintItem: TCBSPrintMemo);
  procedure PrintCheckBox(PrintItem: TCBSPrintCheckbox);
  procedure PrintField(PrintItem: TCBSPrintField);
  procedure PrintLabel(PrintItem: TCBSPrintText);
  procedure PrintPageHeader;
    procedure SetDateTimeStamp(const Value: WideString);
public
  PDFPrintEngine: TgtPDFEngine;
  PDFViewer: TgtPDFViewer;
  PDFDocument: TgtPDFDocument;
  constructor Create(AOwner: TComponent);
  destructor Destroy; override;
  procedure PrintLayout(const BaseForm: TPrintSupportForm; const LayoutID: Integer);
  procedure PrintSet(LayoutPageControl: TPageControl);
  procedure PrintDocument(JobToPrint: IPrintDocument);
  property DateTimeStamp: WideString read FDateTimeStamp write SetDateTimeStamp;
end;

implementation

uses LayoutDataMod, Gr32, Jpeg, ShellAPI;
{ TFormPrinter }

constructor TFormPrinter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PrintList := TStringList.Create;
  PDFPrintEngine := TgtPDFEngine.Create(Self);
  PDFPrintEngine.MeasurementUnit := muPixels;
  PDFViewer := TgtPDFViewer.Create(Self);
  PDFDocument := TgtPDFDocument.Create(Self);
  PDFViewer.Active := False;
  BaseForm := TPrintSupportForm.Create(Self);
  MemoryDocument := TMemoryStream.Create;
  LeftMargin := 0;
  Columns := False;
end;

destructor TFormPrinter.Destroy;
begin
// watch here....might have to set all object to nil first.
  FreeAndNil(PrintList);
  FreeAndNil(MemoryDocument);
//  FreeAndNil(PDFPrintEngine);
//  FreeAndNil(PDFViewer);
//  FreeAndNil(PDFDocument);
//  FreeAndNil(BaseForm);
  inherited;
end;

function TFormPrinter.LoadList(LayoutPageControl: TPageControl;var MaxWidth: Integer):Boolean;
var x, y: Integer;
  ThisControl: TControl;
  SortSpot: String;
  CheckSource: IPrintProperties;
  ColumnCount: Integer;
begin
  Result := False;
  {$O-}
  for x := 0 to LayoutPageControl.PageCount -1 do
  begin
    CurrentForm := LayoutPageControl.Pages[x].Controls[0] as TfrmDesign;
    if CurrentForm.Columns then
      ColumnCount := 2
    else
      ColumnCount := 1;
    CurrentForm.Visible := False;
    for y := 0 to CurrentForm.ControlCount -1 do
    begin
      ThisControl := CurrentForm.Controls[y];
      SortSpot := Format('%6.6d%4.4d%1d',[(PrintRound(ThisControl.Top)+(x*10000)),ThisControl.Left,ColumnCount]);
      if Supports(ThisControl,IPrintProperties,CheckSource) then
         MaxWidth := Max(MaxWidth,ThisControl.Left+ThisControl.Width);
      PrintList.AddObject(SortSpot, ThisControl)
    end;
  end;
  Result := PrintList.Count > 0;
end;

procedure TFormPrinter.SetPageEnd(WhichPage: Integer=0);
var ThisPage: Integer;
begin
  if WhichPage < 1 then
    ThisPage := CurrentPage
  else
    ThisPage := WhichPage;
  if PDFPrintEngine.Page.Orientation = poLandScape then
    PageEnd := 768 * ThisPage
  else
    PageEnd := 1008 * ThisPage;

end;

procedure TFormPrinter.PrintBlock(TextToPrint: WideString; Width: Integer);
  var CurrentSettings: TgtTextFormatting;
begin
  CurrentSettings := TgtTextFormatting.Create;
  try
    CurrentSettings.Assign(PDFPrintEngine.TextFormatting);
    PDFPrintEngine.TextFormatting.LeftIndent := CurrentSpot.X;
    PDFPrintEngine.TextFormatting.RightIndent := 0.5;
    PDFPrintEngine.BeginPara;
    PDFPrintEngine.TextOut(TextToPrint);
    PDFPrintEngine.EndPara;
    PDFPrintEngine.TextFormatting.Assign(CurrentSettings);
  finally
    CurrentSettings.Free;
  end;
end;

procedure TFormPrinter.PrintDocument(JobToPrint: IPrintDocument);
var LayoutID: Integer;
    UniqueLookup: String;
    DeleteFileName: String;
begin
  BaseForm.DataName := JobToPrint.SourceQuery.Values['SourceScreen'];
  BaseForm.KeyValue := 0;
  UniqueLookup := '';
  if Uppercase(BaseForm.DataName) = 'F_EXAM' then
    UniqueLookup := JobToPrint.KeyFields.Values['examunique'];
  if Uppercase(BaseForm.DataName) = 'F_SPECSCRN' then
    UniqueLookup := JobToPrint.KeyFields.Values['specunique'];
  if Uppercase(BaseForm.DataName) = 'F_CLSCRN' then
    UniqueLookup := JobToPrint.KeyFields.Values['lensunique'];
  if Uppercase(BaseForm.DataName) = 'F_PATSCRN' then
    UniqueLookup := JobToPrint.KeyFields.Values['patunique'];
  if Uppercase(BaseForm.DataName) = 'F_RESPSCRN' then
    UniqueLookup := JobToPrint.KeyFields.Values['billunique'];
  if Uppercase(BaseForm.DataName) = 'F_APPTEDIT' then
    UniqueLookup := JobToPrint.KeyFields.Values['apptunique'];
  if Uppercase(BaseForm.DataName) = 'F_CLMSCRN' then
    UniqueLookup := JobToPrint.KeyFields.Values['clmunique'];
  if UniqueLookup = '' then
    UniqueLookup := JobToPrint.KeyFields.Values['keyunique'];
  try
    BaseForm.KeyValue := StrToInt(UniqueLookup);
  except
    on E: Exception do BaseForm.KeyValue := 0;
  end;

  LayoutID := StrToInt(JobToPrint.KeyFields.Values['LayoutID']);
  PDFPrintEngine.Filename := JobToPrint.Document;
//  PDFPrintEngine.Preferences.OutputToUserStream := True;
//  PDFPrintEngine.UserStream := MemoryDocument;
  BaseForm.SetupDone := True;
  PrintLayout(BaseForm,LayoutID);
//  if copy(ExtractFileName(PDFPrintEngine.Filename),1,3)='PDF' then
//  begin
//    DeleteFileName := PDFPrintEngine.Filename+'.PDF';
//    if FileExists(DeleteFileName) then
//      DeleteFile(DeleteFileName)
//    else
//    begin
//      DeleteFileName := GetCurrentDir+'\'+ ExtractFileName(DeleteFileName);
//      if FileExists(DeleteFileName) then
//        DeleteFile(DeleteFileName)
//    end;
//  end;
end;

procedure TFormPrinter.PrintLabel(PrintItem: TCBSPrintText);
var HoldBrushColor, HoldPenColor: TColor;
begin
  HoldBrushColor := PDFPrintEngine.Brush.Color;
  HoldPenColor := PDFPrintEngine.Pen.Color;
  if PrintItem.Color <> clBtnFace then
  begin
    PDFPrintEngine.Brush.Color := PrintItem.Color;
    PDFPrintEngine.Pen.Color := PrintItem.Color;
    PDFPrintEngine.Rectangle(CurrentSpot.X,
                             CurrentSpot.Y,
                             CurrentSpot.X+PrintItem.Width,
                             CurrentSpot.Y+PrintItem.Height,
                             True);
  end;
  PDFPrintEngine.Font := PrintItem.Font;
  PDFPrintEngine.TextOut(CurrentSpot.x, CurrentSpot.y, PrintItem.Caption);
  PDFPrintEngine.Brush.Color := HoldBrushColor;
  PDFPrintEngine.Pen.Color := HoldPenColor;


end;

procedure TFormPrinter.PrintField(PrintItem: TCBSPrintField);
var HoldBrushColor, HoldPenColor: TColor;
begin
  HoldBrushColor := PDFPrintEngine.Brush.Color;
  HoldPenColor := PDFPrintEngine.Pen.Color;
  if PrintItem.Color <> clBtnFace then
  begin
    PDFPrintEngine.Brush.Color := PrintItem.Color;
    PDFPrintEngine.Pen.Color := PrintItem.Color;
    PDFPrintEngine.Rectangle(CurrentSpot.X,
                             CurrentSpot.Y,
                             CurrentSpot.X+PrintItem.Width,
                             CurrentSpot.Y+PrintItem.Height,
                             True);
  end;
  PDFPrintEngine.Font := PrintItem.Font;
  PDFPrintEngine.TextOut(CurrentSpot.x, CurrentSpot.y, PrintItem.Text);
  PDFPrintEngine.Brush.Color := HoldBrushColor;
  PDFPrintEngine.Pen.Color := HoldPenColor;
end;

procedure TFormPrinter.PrintCheckBox(PrintItem: TCBSPrintCheckbox);
var
  Addon: Double;
begin
  PDFPrintEngine.Font := PrintItem.Font;
  if PrintItem.Checked then
  begin
    PDFPrintEngine.Font.Name := 'Wingdings';
    PDFPrintEngine.Font.Color := clBlack;
    PDFPrintEngine.Font.Charset := SYMBOL_CHARSET;
    PDFPrintEngine.TextOut(CurrentSpot.x, CurrentSpot.y, 'x');
    AddOn := PDFPrintEngine.TextWidth('x');
  end
  else
  begin
    PDFPrintEngine.Font.Name := 'Wingdings';
    PDFPrintEngine.Font.Color := clBlack;
    PDFPrintEngine.Font.Charset := SYMBOL_CHARSET;
    PDFPrintEngine.TextOut(CurrentSpot.x, CurrentSpot.y, 'q');
    AddOn := PDFPrintEngine.TextWidth('q');
  end;
  AddOn := 1.3 * Addon;
  PDFPrintEngine.Font := PrintItem.Font;
  PDFPrintEngine.TextOut(CurrentSpot.x + Addon, CurrentSpot.y, PrintItem.Caption);
end;

procedure TFormPrinter.PrintMemo(PrintItem: TCBSPrintMemo);
var
  TextArea: TgtRect;
begin
  PDFPrintEngine.Font := PrintItem.Font;
  TextArea.Top := CurrentSpot.Y;
  TextArea.Bottom := TextArea.Top + PrintItem.Height;
  TextArea.Left := CurrentSpot.X;
  TextArea.Right := TextArea.Left + PrintItem.Width;
  PDFPrintEngine.TextBox(TextArea, PrintItem.Text, haLeft, vaTop);
end;

procedure TFormPrinter.PrintImage(ThisImage: TBitmap; PrintItem: TCBSPrintImage);
var
  ImageRect: TgtRect;
  HoldFrame, HoldStretch: Boolean;
begin
  ImageRect := gtRect(CurrentSpot.x, CurrentSpot.y, (CurrentSpot.x + PrintItem.Width), (CurrentSpot.y + PrintItem.Height));
  if Assigned(ThisImage) then
  begin
    HoldFrame := PDFPrintEngine.ImageSettings.IsFrame;
    HoldStretch := PDFPrintEngine.ImageSettings.Stretch;
    PDFPrintEngine.ImageSettings.IsFrame := (PrintItem.BorderStyle = bsSingle);
    PDFPrintEngine.ImageSettings.Stretch := True;
    PDFPrintEngine.DrawImage(ImageRect, ThisImage);
    PDFPrintEngine.ImageSettings.IsFrame := HoldFrame;
    PDFPrintEngine.ImageSettings.Stretch := HoldStretch;
  end;
end;

procedure TFormPrinter.PrintImage(ThisImage: TBitmap; PrintItem: TImage);
var
  ImageRect: TgtRect;
  HoldFrame, HoldStretch: Boolean;
begin
  ImageRect := gtRect(CurrentSpot.x, CurrentSpot.y, (CurrentSpot.x + PrintItem.Width), (CurrentSpot.y + PrintItem.Height));
  if Assigned(ThisImage) then
  begin
    HoldFrame := PDFPrintEngine.ImageSettings.IsFrame;
    HoldStretch := PDFPrintEngine.ImageSettings.Stretch;
    PDFPrintEngine.ImageSettings.IsFrame := False;
    PDFPrintEngine.ImageSettings.Stretch := True;
    PDFPrintEngine.DrawImage(ImageRect, ThisImage);
    PDFPrintEngine.ImageSettings.IsFrame := HoldFrame;
    PDFPrintEngine.ImageSettings.Stretch := HoldStretch;

  end;
end;

procedure TFormPrinter.PresetDocument(MaxWide: Integer);
begin
  if (PDFPrintEngine.FileName = '') or
     (copy(uppercase(PDFPrintEngine.FileName),1,6) = 'C:\NEW') then
  begin
    randomize;
    PDFPrintEngine.FileName := GetCurrentDir + '\PDF'+IntToStr(random(999999));
  end;
  PDFPrintEngine.Page.PaperSize := Letter;
  if MaxWide > 790 then
    PDFPrintEngine.Page.Orientation := poLandScape
  else
    PDFPrintEngine.Page.Orientation := poPortrait;
  PDFPrintEngine.Preferences.ShowSetupDialog := False;
  PDFPrintEngine.Preferences.OpenAfterCreate := not Test;
  CurrentSpot := Point(0, 0);
  CurrentRow := 15;
  CurrentPage := 1;
  LastTop := 15;
  SetPageEnd;
end;

procedure TFormPrinter.NewPage;
begin
  if Columns and (LeftMargin = 0) then
  begin
    LeftMargin := SecondColumn;
    PDFPrintEngine.Line(SecondColumn-5, 5, SecondColumn-5, PageEnd);
  end
  else
    LeftMargin := 0;

  if LeftMargin = 0 then
  begin
    PDFPrintEngine.NewPage;
    Inc(CurrentPage);
    PrintPageHeader;
  end;

  CurrentRow := 15;

end;

procedure TFormPrinter.PrintLayout(const BaseForm: TPrintSupportForm; const LayoutID: Integer);
var LayoutModule: TLayoutData;
    PrintID: Integer;
begin
  LayoutModule := TLayoutData.Create(nil);
  try
  // Lookup Layout
    PrintID := LayoutModule.PrinterLayout(LayoutID);
{ TODO : Need to deal with picking a name if none come back. }
   if PrintID < 0 then
     ShowMessage('No Print Layout chosen for this screen')
   else
   begin
    // Load Into page control
    LayoutModule.LoadLayout(PrintID,BaseForm.LayoutPageControl);
    // Send to PrintSet
    PrintSet(BaseForm.LayoutPageControl);
   end;
  finally
    FreeAndNil(LayoutModule);
  end;
end;

function TFormPrinter.PrintRound(StartNumber: Integer): Integer;
  var Diff: Integer;
begin
  Diff := StartNumber mod RoundGroup;
  if Diff <3 then
    Result := StartNumber - Diff
  else
    Result := StartNumber - Diff + RoundGroup;
end;

procedure TFormPrinter.PrintSet(LayoutPageControl: TPageControl);

function ShellFindExecutable(const FileName, DefaultDir: string): string;
var
  Res: HINST;
  Buffer: array[0..MAX_PATH] of Char;
  I: Integer;
  P: PChar;
begin
  FillChar(Buffer, SizeOf(Buffer), #0);
  if DefaultDir = '' then P := nil else P := PChar(DefaultDir);
  Res := FindExecutable(PChar(FileName), P, Buffer);
  if Res > 32 then
  begin
    for I := Low(Buffer) to High(Buffer) - 1 do
      if Buffer[I] = #0 then
        Buffer[I] := #32;
    Buffer[High(Buffer)] := #0;
    Result := Trim(Buffer);
  end else
    RaiseLastWin32Error;
end;

var x, MaxWide: Integer;
    ObjectName: String;
    ExecutableFileName: String;
begin
  MaxWide := 0;
  if LoadList(LayoutPageControl,MaxWide) then
  begin
    PrintList.Sort;
    PresetDocument(MaxWide);
    PDFPrintEngine.Preferences.OpenAfterCreate := True;
    DateTimeStamp := FormatDateTime('mm/dd/yyyy hh:nn',now);
    PDFPrintEngine.BeginDoc;
    PrintPageHeader;
    try
    for x := 0 to PrintList.Count -1 do
    begin
      if x=198  then
      break;
      Objectname := TComponent(PrintList.Objects[x]).Name;;
      if RightStr(PrintList[x],1) = '2' then
        Columns := True
      else
        Columns := False;
      if not CheckBreak(TComponent(PrintList.Objects[x]) as IPrintProperties, True)
      then continue;
      if PrintList.Objects[x] is TCBSPrintText then PrintText(PrintList.Objects[x] as TCBSPrintText);
      if PrintList.Objects[x] is TCBSPrintField then PrintText(PrintList.Objects[x] as TCBSPrintField);
      if PrintList.Objects[x] is TCBSPrintCheckbox then PrintText(PrintList.Objects[x] as TCBSPrintCheckbox);
      if PrintList.Objects[x] is TCBSPrintMemo then PrintText(PrintList.Objects[x] as TCBSPrintMemo);
      if PrintList.Objects[x] is TCBSPrintImage then PrintText(PrintList.Objects[x] as TCBSPrintImage);
      if PrintList.Objects[x] is TCBSPrintGrid then PrintText(PrintList.Objects[x] as TCBSPrintGrid);
      if PrintList.Objects[x] is TCBSPrintPanel then PrintText(PrintList.Objects[x] as TCBSPrintPanel);
      CheckBreak(TComponent(PrintList.Objects[x]) as IPrintProperties, False);
    end;
    PDFPrintEngine.EndDoc;
//    ExecutableFileName := ShellFindExecutable(PDFPrintEngine.FileName+'.PDF',GetCurrentDir);
//  if ExecutableFileName<>''  then
//    ShellExecute(Application.Handle,'open',pAnsiChar(ExecutableFileName),PAnsiChar(GetCurrentDir+'\'+ PDFPrintEngine.FileName+'.PDF'), nil, SW_SHOWNORMAL);

    except
      PDFPrintEngine.EndDoc;
      ShowMessage('Print failed on or after object named'+ObjectName+' #'+inttostr(x)+' in your print template.');
    end;
  end
  else
    ShowMessage('Nothing to do');
end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintText);
begin
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
  PrintLabel(PrintItem);
end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintField);
begin
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
  PrintField(PrintItem);
end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintCheckBox);
var Checkbox: TgtPDFFormCheckBox;
begin
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
  PrintCheckBox(PrintItem);
end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintMemo);
begin
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
  PrintMemo(PrintItem);
end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintImage);
  var ThisImage: TBitmap;
begin
  ThisImage := TBitMap.Create;
  try
  ThisImage.Assign(PrintItem.BitMap);
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CheckBottom(Currentrow+PrintItem.Height);
  CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
  if PrintItem.Caption <> '' then
  begin
      PDFPrintEngine.TextOut(CurrentSpot.x, CurrentSpot.y, PrintItem.Caption);
      CurrentSpot := Point(PrintItem.Left+LeftMargin,Trunc(CurrentRow + PDFPrintEngine.TextHeight('X')));
  end;
  PrintImage(ThisImage, PrintItem);
  SetCurrentRow(CurrentRow,PrintItem.Height);
  finally
    FreeAndNil(ThisImage);
  end;
end;
procedure TFormPrinter.PrintText(PrintItem: TCBSPrintGrid);
var x,y: Integer;
  ColumnList: TList;
  HeightUsed: Double;
  HeightLeft: Double;
  PrintHeadings: Boolean;
  HoldFont: TFont;
begin
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  PrintHeadings := True;
  PrintItem.DataSource.DataSet.First;
  HoldFont := PDFPrintEngine.Font;
  for x := 0 to PrintItem.DataSource.DataSet.RecordCount-1 do
  begin
    if PrintHeadings then // Set-up headings
    begin
      CurrentSpot := Point(PrintItem.Left+LeftMargin, CurrentRow);
      PDFPrintEngine.Font := PrintItem.Columns[0].Title.Font;
      PDFPrintEngine.TableSettings.EnableTitle := True;
      PDFPrintEngine.TableSettings.AutoAdjustColumnWidth := True;
      PDFPrintEngine.TableSettings.RowHeight := 1.5*PDFPrintEngine.TextHeight('X');
      PDFPrintEngine.Tablesettings.TitleHeight := 1.5*PDFPrintEngine.TextHeight('X');
      PDFPrintEngine.TableSettings.InternalMargin := gtRect(2,2,0,0);
      ColumnList := PDFPrintEngine.BeginTable(PrintItem.Left+LeftMargin,
                                              CurrentRow,
                                              PrintItem.Columns.Count);
      HeightUsed := PDFPrintEngine.Tablesettings.TitleHeight;
      for y := 0 to PrintItem.Columns.Count -1 do
      begin
        with TgtColumn(ColumnList[y]) do
        begin
          Title := PrintItem.Columns[y].Title.Caption;
          Width := PrintItem.Columns[y].Width;
        end;
      end;
      PrintHeadings := False;
    end;
    HeightLeft := PDFPrintEngine.NewRow;
{ TODO : Check page overflow }

    HeightUsed := HeightUsed + PDFPrintEngine.Tablesettings.RowHeight;
    for y := 0 to PrintItem.Columns.Count -1 do
    begin
      PDFPrintEngine.Font := PrintItem.Columns[y].Font;
      PDFPrintEngine.TextOut(y, PrintItem.Columns[y].Field.AsString);
    end;
  PrintItem.DataSource.DataSet.Next;
    if HeightLeft < 40 then
    begin
      PrintHeadings := True;
      PDFPrintEngine.EndTable;
      PDFPrintEngine.NewPage;
      PrintPageHeader;
      CurrentSpot := Point(PrintItem.Left+LeftMargin, 20);
    end;
  end;
  // In case the table ended at the end of the page, the table is already ended
  if not PrintHeadings then
      PDFPrintEngine.EndTable;
  SetCurrentRow(PrintItem.Top,trunc(HeightUsed));
   { TODO : Make sure this height is the actual height of the table, not the printitem }
  PDFPrintEngine.Font := HoldFont;

end;

procedure TFormPrinter.PrintText(PrintItem: TCBSPrintPanel);
var ThisDataSet: TDataSet;
    x: Integer;
    CheckSource: IDataAccess;
    HoldActive: Boolean;
begin
  ThisDataSet := nil;
// determine datasource
  for x := 0 to PrintItem.ControlCount - 1 do
  begin
    if Supports(PrintItem.Controls[x],IDataAccess,CheckSource) then
    begin
      if Assigned(CheckSource.DataSource.DataSet) then
      begin
        ThisDataSet := CheckSource.DataSource.DataSet;
        break;
      end;
    end;
  end;
  // make sure there is a Dataset (could be a panel of text)
  if ThisDataSet <> nil then
  begin
    // find first record
    with ThisDataSet do
    begin
//      HoldActive := ThisDataSet.Active;
//      Open;
      First;
      while not Eof do
      begin
        PrintPanel(PrintItem);
        // loop to next record
        Next;
      end;
//      Active := HoldActive;
    end;
  end
  else
    PrintPanel(PrintItem);

//  if Assigned(ThisDataSet) then
//    FreeAndNil(ThisDataSet)
//  else
//    ThisDataSet:= nil;

end;

procedure TFormPrinter.PrintPageHeader;
var HoldFont: TFont;
begin
  Holdfont := PDFPrintEngine.Font;
  PDFPrintEngine.Font.Name := 'Arial';
  PDFPrintEngine.Font.Color := clBlack;
  PDFPrintEngine.Font.Size := 6;
  PDFPrintEngine.Font.Style := [];
  PDFPrintEngine.TextOut(15,1,DateTimeStamp + ' ' + BaseForm.PatientInfo);
  PDFPrintEngine.Font := HoldFont;
end;

procedure TFormPrinter.PrintPanel(PrintItem: TCBSPrintPanel);
var x:Integer;
    PanelBound: TgtRect;
    ThisImage: TBitMap;
    ThisJPEG: TJpegImage;
    ThisPrintItem: IPrintProperties;
begin
  // figure out size of panel and check page
  SetCurrentRow(PrintItem.Top,0,PrintItem.LineBefore);
  CheckBottom(Currentrow+PrintItem.Height);
  if PrintItem.BorderStyle = bsSingle then
    PDFPrintEngine.Rectangle(PrintItem.Left+LeftMargin,
                       CurrentRow,
                       PrintItem.Left+LeftMargin+PrintItem.Width,
                       CurrentRow+PrintItem.Height,
                       False);

  for x := 0 to PrintItem.ControlCount -1 do
  begin
//      if PrintList.Objects[x] is TImage then
//      begin
//        PrintImage((PrintList.Objects[x] as TImage).Picture.Bitmap, PrintList.Objects[x] as TImage);
//        continue;
//      end;
   if Supports(PrintItem.Controls[x],IPrintProperties,ThisPrintItem) then
     if not ThisPrintItem.IsPrinting then continue;

    // print all items on the panel relative to Panel corner
    CurrentSpot := Point(PrintItem.Left + LeftMargin + PrintItem.Controls[x].Left,
                          CurrentRow+ PrintItem.Controls[x].Top);
    if PrintItem.Controls[x] is TCBSPrintText then PrintLabel(PrintItem.Controls[x] as TCBSPrintText);
    if PrintItem.Controls[x] is TCBSPrintField then PrintField(PrintItem.Controls[x] as TCBSPrintField);
    if PrintItem.Controls[x] is TCBSPrintCheckbox then PrintCheckBox(PrintItem.Controls[x] as TCBSPrintCheckbox);
    if PrintItem.Controls[x] is TCBSPrintMemo then PrintMemo(PrintItem.Controls[x] as TCBSPrintMemo);
    if (PrintItem.Controls[x] is TCBSPrintImage)  then
    begin
      ThisImage :=  TBitMap.Create;
      try
        ThisImage.Assign(TCBSPrintImage(PrintItem.Controls[x]).BitMap );
        if Assigned(ThisImage) then
          PrintImage(ThisImage,PrintItem.Controls[x] as  TCBSPrintImage);
      finally
        FreeAndNil(ThisImage);
      end;
    end;
    if (PrintItem.Controls[x] is TImage)  then
    begin
      ThisImage :=  TBitMap.Create;
      try
        if (TImage(PrintItem.Controls[x]).Picture.Graphic is TJpegImage) then
        begin
          ThisJpeg := TJpegImage.Create;
          try
            ThisJpeg.Assign(TImage(PrintItem.Controls[x]).Picture.Graphic);
            ThisImage.Assign(ThisJpeg);
          finally
            ThisJpeg.Free;
          end;
        end
        else
          ThisImage.Assign((PrintItem.Controls[x] as TImage).Picture.BitMap );
        if Assigned(ThisImage) then
          PrintImage(ThisImage,PrintItem.Controls[x] as  TImage);
      finally
        FreeAndNil(ThisImage);
      end;
    end;
  end;
  SetCurrentRow(CurrentRow,PrintItem.Height);
end;

procedure TFormPrinter.SetCurrentRow(const CheckRow:Integer;const Height: Integer=0;const LineBefore: Boolean=False);
var ThisCheck: Integer;
    LineMult: Integer;
begin
  ThisCheck := PrintRound(CheckRow);
  if (ThisCheck <> LastTop) or (Height > 0) then
  begin
//    CurrentRow := CurrentRow + Trunc(PDFPrintEngine.TextHeight('X')*ScaleYFactor);
    if LineBefore then LineMult := 3 else LineMult := 1;
    CurrentRow := CurrentRow + max(Height,LineMult*trunc(PDFPrintEngine.TextHeight('X')));
  end;
  LastTop := PrintRound(CheckRow+Height);
  CheckBottom (CurrentRow{+Height});
end;

procedure TFormPrinter.SetDateTimeStamp(const Value: WideString);
begin
  FDateTimeStamp := Value;
end;

procedure TFormPrinter.CheckBottom(Position: Integer);
begin
  if Position > PageEnd then NewPage;
end;

function TFormPrinter.CheckBreak(BreakObject: IPrintProperties; BreakBefore: Boolean):Boolean;
var DidNewPage: Boolean;
begin
  Result := BreakObject.IsPrinting;
  DidNewPage := False;
  try
  if Result then
  begin
    if BreakBefore and BreakObject.BreakBefore then
    begin
      NewPage;
      DidNewPage := True;
    end;
    if not BreakBefore and BreakObject.BreakAfter then
        begin
      NewPage;
      DidNewPage := True;
    end;
//    if not DidNewPage and BreakObject.LineBefore then
//      SetCurrentRow(CurrentRow,10);
  end;
  except
    ShowMessage('Problem with CheckBreak');
  end;
end;

end.
