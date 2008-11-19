unit IMP_Dialogs;
interface
uses
  Windows,
  Messages,
  SysUtils,
  CommDlg,
  Printers,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  Dialogs,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_Dialogs;
implementation
procedure TCommonDialog_Execute1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TCommonDialog(Self).Execute();
end;
function TCommonDialog__GetHandle(Self:TCommonDialog):HWnd;
begin
  result := Self.Handle;
end;
function TOpenDialog__GetFileEditStyle(Self:TOpenDialog):TFileEditStyle;
begin
  result := Self.FileEditStyle;
end;
procedure TOpenDialog__PutFileEditStyle(Self:TOpenDialog;const Value: TFileEditStyle);
begin
  Self.FileEditStyle := Value;
end;
function TOpenDialog__GetFiles(Self:TOpenDialog):TStrings;
begin
  result := Self.Files;
end;
function TOpenDialog__GetHistoryList(Self:TOpenDialog):TStrings;
begin
  result := Self.HistoryList;
end;
procedure TOpenDialog__PutHistoryList(Self:TOpenDialog;const Value: TStrings);
begin
  Self.HistoryList := Value;
end;
procedure TPageSetupDialog_GetDefaults(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TPageSetupDialog(Self).GetDefaults();
end;
function TPageSetupDialog__GetPageSetupDlgRec(Self:TPageSetupDialog):TPageSetupDlg;
begin
  result := Self.PageSetupDlgRec;
end;
procedure TFindDialog_CloseDialog(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TFindDialog(Self).CloseDialog();
end;
function TFindDialog__GetLeft(Self:TFindDialog):Integer;
begin
  result := Self.Left;
end;
procedure TFindDialog__PutLeft(Self:TFindDialog;const Value: Integer);
begin
  Self.Left := Value;
end;
function TFindDialog__GetPosition(Self:TFindDialog):TPoint;
begin
  result := Self.Position;
end;
procedure TFindDialog__PutPosition(Self:TFindDialog;const Value: TPoint);
begin
  Self.Position := Value;
end;
function TFindDialog__GetTop(Self:TFindDialog):Integer;
begin
  result := Self.Top;
end;
procedure TFindDialog__PutTop(Self:TFindDialog;const Value: Integer);
begin
  Self.Top := Value;
end;
procedure _ShowMessage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Dialogs.ShowMessage(Params[0].AsString);
end;
procedure _ShowMessagePos(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Dialogs.ShowMessagePos(Params[0].AsString,Params[1].AsInteger,Params[2].AsInteger);
end;
procedure _InputBox(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := Dialogs.InputBox(Params[0].AsString,Params[1].AsString,Params[2].AsString);
end;
procedure RegisterIMP_Dialogs;
var H: Integer;
begin
  H := RegisterNamespace('Dialogs', -1);
  RegisterConstant('MaxCustomColors', 16, H);
  // Begin of class TCommonDialog
  RegisterClassType(TCommonDialog, H);
  RegisterMethod(TCommonDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TCommonDialog.Create);
  RegisterMethod(TCommonDialog,
       'destructor Destroy; override;',
       @TCommonDialog.Destroy);
  RegisterStdMethodEx(TCommonDialog,'Execute',TCommonDialog_Execute1,0,[typeBOOLEAN]);
  RegisterMethod(TCommonDialog,
       'procedure DefaultHandler(var Message); override;',
       @TCommonDialog.DefaultHandler);
  RegisterMethod(TCommonDialog,
       'function TCommonDialog__GetHandle(Self:TCommonDialog):HWnd;',
       @TCommonDialog__GetHandle, true);
  RegisterProperty(TCommonDialog,
       'property Handle:HWnd read TCommonDialog__GetHandle;');
  // End of class TCommonDialog
  RegisterRTTIType(TypeInfo(TOpenOption));
  RegisterRTTIType(TypeInfo(TOpenOptions));
  RegisterRTTIType(TypeInfo(TOpenOptionEx));
  RegisterRTTIType(TypeInfo(TOpenOptionsEx));
  RegisterRTTIType(TypeInfo(TFileEditStyle));
  RegisterTypeAlias('TOFNotifyEx','CommDlg.TOFNotifyEx');
  // Begin of class TOpenDialog
  RegisterClassType(TOpenDialog, H);
  RegisterMethod(TOpenDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TOpenDialog.Create);
  RegisterMethod(TOpenDialog,
       'destructor Destroy; override;',
       @TOpenDialog.Destroy);
  RegisterMethod(TOpenDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TOpenDialog.Execute);
  RegisterMethod(TOpenDialog,
       'function TOpenDialog__GetFileEditStyle(Self:TOpenDialog):TFileEditStyle;',
       @TOpenDialog__GetFileEditStyle, true);
  RegisterMethod(TOpenDialog,
       'procedure TOpenDialog__PutFileEditStyle(Self:TOpenDialog;const Value: TFileEditStyle);',
       @TOpenDialog__PutFileEditStyle, true);
  RegisterProperty(TOpenDialog,
       'property FileEditStyle:TFileEditStyle read TOpenDialog__GetFileEditStyle write TOpenDialog__PutFileEditStyle;');
  RegisterMethod(TOpenDialog,
       'function TOpenDialog__GetFiles(Self:TOpenDialog):TStrings;',
       @TOpenDialog__GetFiles, true);
  RegisterProperty(TOpenDialog,
       'property Files:TStrings read TOpenDialog__GetFiles;');
  RegisterMethod(TOpenDialog,
       'function TOpenDialog__GetHistoryList(Self:TOpenDialog):TStrings;',
       @TOpenDialog__GetHistoryList, true);
  RegisterMethod(TOpenDialog,
       'procedure TOpenDialog__PutHistoryList(Self:TOpenDialog;const Value: TStrings);',
       @TOpenDialog__PutHistoryList, true);
  RegisterProperty(TOpenDialog,
       'property HistoryList:TStrings read TOpenDialog__GetHistoryList write TOpenDialog__PutHistoryList;');
  // End of class TOpenDialog
  // Begin of class TSaveDialog
  RegisterClassType(TSaveDialog, H);
  RegisterMethod(TSaveDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TSaveDialog.Execute);
  RegisterMethod(TSaveDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TSaveDialog.Create);
  // End of class TSaveDialog
  RegisterRTTIType(TypeInfo(TColorDialogOption));
  RegisterRTTIType(TypeInfo(TColorDialogOptions));
  // Begin of class TColorDialog
  RegisterClassType(TColorDialog, H);
  RegisterMethod(TColorDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TColorDialog.Create);
  RegisterMethod(TColorDialog,
       'destructor Destroy; override;',
       @TColorDialog.Destroy);
  RegisterMethod(TColorDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TColorDialog.Execute);
  // End of class TColorDialog
  RegisterRTTIType(TypeInfo(TFontDialogOption));
  RegisterRTTIType(TypeInfo(TFontDialogOptions));
  RegisterRTTIType(TypeInfo(TFontDialogDevice));
  // Begin of class TFontDialog
  RegisterClassType(TFontDialog, H);
  RegisterMethod(TFontDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TFontDialog.Create);
  RegisterMethod(TFontDialog,
       'destructor Destroy; override;',
       @TFontDialog.Destroy);
  RegisterMethod(TFontDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TFontDialog.Execute);
  // End of class TFontDialog
  // Begin of class TPrinterSetupDialog
  RegisterClassType(TPrinterSetupDialog, H);
  RegisterMethod(TPrinterSetupDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TPrinterSetupDialog.Execute);
  RegisterMethod(TPrinterSetupDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TPrinterSetupDialog.Create);
  // End of class TPrinterSetupDialog
  RegisterRTTIType(TypeInfo(TPrintRange));
  RegisterRTTIType(TypeInfo(TPrintDialogOption));
  RegisterRTTIType(TypeInfo(TPrintDialogOptions));
  // Begin of class TPrintDialog
  RegisterClassType(TPrintDialog, H);
  RegisterMethod(TPrintDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TPrintDialog.Execute);
  RegisterMethod(TPrintDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TPrintDialog.Create);
  // End of class TPrintDialog
  RegisterTypeAlias('TPrinterOrientation','Printers.TPrinterOrientation');
  RegisterRTTIType(TypeInfo(TPageSetupDialogOption));
  RegisterRTTIType(TypeInfo(TPageSetupDialogOptions));
  RegisterRTTIType(TypeInfo(TPrinterKind));
  RegisterRTTIType(TypeInfo(TPageType));
  RegisterRTTIType(TypeInfo(TPageMeasureUnits));
  // Begin of class TPageSetupDialog
  RegisterClassType(TPageSetupDialog, H);
  RegisterMethod(TPageSetupDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TPageSetupDialog.Create);
  RegisterMethod(TPageSetupDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TPageSetupDialog.Execute);
  RegisterStdMethodEx(TPageSetupDialog,'GetDefaults',TPageSetupDialog_GetDefaults,0,[typeBOOLEAN]);
  RegisterMethod(TPageSetupDialog,
       'function TPageSetupDialog__GetPageSetupDlgRec(Self:TPageSetupDialog):TPageSetupDlg;',
       @TPageSetupDialog__GetPageSetupDlgRec, true);
  RegisterProperty(TPageSetupDialog,
       'property PageSetupDlgRec:TPageSetupDlg read TPageSetupDialog__GetPageSetupDlgRec;');
  // End of class TPageSetupDialog
  RegisterRTTIType(TypeInfo(TFindOption));
  RegisterRTTIType(TypeInfo(TFindOptions));
  // Begin of class TFindDialog
  RegisterClassType(TFindDialog, H);
  RegisterMethod(TFindDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TFindDialog.Create);
  RegisterMethod(TFindDialog,
       'destructor Destroy; override;',
       @TFindDialog.Destroy);
  RegisterStdMethodEx(TFindDialog,'CloseDialog',TFindDialog_CloseDialog,0,[typeVARIANT]);
  RegisterMethod(TFindDialog,
       'function Execute(ParentWnd: HWND): Boolean; override;',
       @TFindDialog.Execute);
  RegisterMethod(TFindDialog,
       'function TFindDialog__GetLeft(Self:TFindDialog):Integer;',
       @TFindDialog__GetLeft, true);
  RegisterMethod(TFindDialog,
       'procedure TFindDialog__PutLeft(Self:TFindDialog;const Value: Integer);',
       @TFindDialog__PutLeft, true);
  RegisterProperty(TFindDialog,
       'property Left:Integer read TFindDialog__GetLeft write TFindDialog__PutLeft;');
  RegisterMethod(TFindDialog,
       'function TFindDialog__GetPosition(Self:TFindDialog):TPoint;',
       @TFindDialog__GetPosition, true);
  RegisterMethod(TFindDialog,
       'procedure TFindDialog__PutPosition(Self:TFindDialog;const Value: TPoint);',
       @TFindDialog__PutPosition, true);
  RegisterProperty(TFindDialog,
       'property Position:TPoint read TFindDialog__GetPosition write TFindDialog__PutPosition;');
  RegisterMethod(TFindDialog,
       'function TFindDialog__GetTop(Self:TFindDialog):Integer;',
       @TFindDialog__GetTop, true);
  RegisterMethod(TFindDialog,
       'procedure TFindDialog__PutTop(Self:TFindDialog;const Value: Integer);',
       @TFindDialog__PutTop, true);
  RegisterProperty(TFindDialog,
       'property Top:Integer read TFindDialog__GetTop write TFindDialog__PutTop;');
  // End of class TFindDialog
  // Begin of class TReplaceDialog
  RegisterClassType(TReplaceDialog, H);
  RegisterMethod(TReplaceDialog,
       'constructor Create(AOwner: TComponent); override;',
       @TReplaceDialog.Create);
  // End of class TReplaceDialog
  RegisterRTTIType(TypeInfo(TMsgDlgType));
  RegisterRTTIType(TypeInfo(TMsgDlgBtn));
  RegisterRTTIType(TypeInfo(TMsgDlgButtons));
  RegisterRoutine('function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;  Buttons: TMsgDlgButtons): TForm;', @CreateMessageDialog, H);
  RegisterRoutine('function MessageDlg(const Msg: string; DlgType: TMsgDlgType;  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;', @MessageDlg, H);
  RegisterRoutine('function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer;', @MessageDlgPos, H);
  RegisterRoutine('function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;  const HelpFileName: string): Integer;', @MessageDlgPosHelp, H);
  RegisterStdRoutineEx('ShowMessage', _ShowMessage,1,[typeSTRING,typeINTEGER], H);
  RegisterRoutine('procedure ShowMessageFmt(const Msg: string; Params: array of const);', @ShowMessageFmt, H);
  RegisterStdRoutineEx('ShowMessagePos', _ShowMessagePos,3,[typeSTRING,typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterStdRoutineEx('InputBox', _InputBox,3,[typeSTRING,typeSTRING,typeSTRING,typeSTRING], H);
  RegisterRoutine('function InputQuery(const ACaption, APrompt: string;  var Value: string): Boolean;', @InputQuery, H);
  RegisterRoutine('function PromptForFileName(var AFileName: string; const AFilter: string = '''';  const ADefaultExt: string = ''''; const ATitle: string = '''';  const AInitialDir: string = ''''; SaveDialog: Boolean = False): Boolean;', @PromptForFileName, H);
end;
initialization
  RegisterIMP_Dialogs;
end.
