unit IMP_Forms;
interface
uses
  Messages,
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Menus,
  Controls,
  Imm,
  ActnList,
  MultiMon,
  HelpIntfs,
  Forms,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_Forms;
implementation
procedure TControlScrollBar_ChangeBiDiPosition(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControlScrollBar(Self).ChangeBiDiPosition();
end;
function TControlScrollBar__GetKind(Self:TControlScrollBar):TScrollBarKind;
begin
  result := Self.Kind;
end;
procedure TControlScrollBar_IsScrollBarVisible(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControlScrollBar(Self).IsScrollBarVisible();
end;
function TControlScrollBar__GetScrollPos(Self:TControlScrollBar):Integer;
begin
  result := Self.ScrollPos;
end;
procedure TScrollingWinControl_DisableAutoRange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScrollingWinControl(Self).DisableAutoRange();
end;
procedure TScrollingWinControl_EnableAutoRange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScrollingWinControl(Self).EnableAutoRange();
end;
procedure TCustomForm_AfterConstruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).AfterConstruction();
end;
procedure TCustomForm_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).BeforeDestruction();
end;
procedure TCustomForm_Close(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).Close();
end;
procedure TCustomForm_CloseQuery(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TCustomForm(Self).CloseQuery();
end;
procedure TCustomForm_Hide(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).Hide();
end;
procedure TCustomForm_Print(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).Print();
end;
procedure TCustomForm_Release(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).Release();
end;
procedure TCustomForm_SetFocus(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).SetFocus();
end;
procedure TCustomForm_Show(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCustomForm(Self).Show();
end;
procedure TCustomForm_ShowModal(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TCustomForm(Self).ShowModal();
end;
function TCustomForm__GetActive(Self:TCustomForm):Boolean;
begin
  result := Self.Active;
end;
function TCustomForm__GetActiveControl(Self:TCustomForm):TWinControl;
begin
  result := Self.ActiveControl;
end;
procedure TCustomForm__PutActiveControl(Self:TCustomForm;const Value: TWinControl);
begin
  Self.ActiveControl := Value;
end;
function TCustomForm__GetActiveOleControl(Self:TCustomForm):TWinControl;
begin
  result := Self.ActiveOleControl;
end;
procedure TCustomForm__PutActiveOleControl(Self:TCustomForm;const Value: TWinControl);
begin
  Self.ActiveOleControl := Value;
end;
function TCustomForm__GetBorderStyle(Self:TCustomForm):TFormBorderStyle;
begin
  result := Self.BorderStyle;
end;
procedure TCustomForm__PutBorderStyle(Self:TCustomForm;const Value: TFormBorderStyle);
begin
  Self.BorderStyle := Value;
end;
function TCustomForm__GetCanvas(Self:TCustomForm):TCanvas;
begin
  result := Self.Canvas;
end;
function TCustomForm__GetDesigner(Self:TCustomForm):IDesignerHook;
begin
  result := Self.Designer;
end;
procedure TCustomForm__PutDesigner(Self:TCustomForm;const Value: IDesignerHook);
begin
  Self.Designer := Value;
end;
function TCustomForm__GetDropTarget(Self:TCustomForm):Boolean;
begin
  result := Self.DropTarget;
end;
procedure TCustomForm__PutDropTarget(Self:TCustomForm;const Value: Boolean);
begin
  Self.DropTarget := Value;
end;
function TCustomForm__GetFormState(Self:TCustomForm):TFormState;
begin
  result := Self.FormState;
end;
function TCustomForm__GetHelpFile(Self:TCustomForm):String;
begin
  result := Self.HelpFile;
end;
procedure TCustomForm__PutHelpFile(Self:TCustomForm;const Value: String);
begin
  Self.HelpFile := Value;
end;
function TCustomForm__GetKeyPreview(Self:TCustomForm):Boolean;
begin
  result := Self.KeyPreview;
end;
procedure TCustomForm__PutKeyPreview(Self:TCustomForm;const Value: Boolean);
begin
  Self.KeyPreview := Value;
end;
function TCustomForm__GetMenu(Self:TCustomForm):TMainMenu;
begin
  result := Self.Menu;
end;
procedure TCustomForm__PutMenu(Self:TCustomForm;const Value: TMainMenu);
begin
  Self.Menu := Value;
end;
function TCustomForm__GetModalResult(Self:TCustomForm):TModalResult;
begin
  result := Self.ModalResult;
end;
procedure TCustomForm__PutModalResult(Self:TCustomForm;const Value: TModalResult);
begin
  Self.ModalResult := Value;
end;
function TCustomForm__GetMonitor(Self:TCustomForm):TMonitor;
begin
  result := Self.Monitor;
end;
function TCustomForm__GetOleFormObject(Self:TCustomForm):IOleForm;
begin
  result := Self.OleFormObject;
end;
procedure TCustomForm__PutOleFormObject(Self:TCustomForm;const Value: IOleForm);
begin
  Self.OleFormObject := Value;
end;
function TCustomForm__GetPopupMode(Self:TCustomForm):TPopupMode;
begin
  result := Self.PopupMode;
end;
procedure TCustomForm__PutPopupMode(Self:TCustomForm;const Value: TPopupMode);
begin
  Self.PopupMode := Value;
end;
function TCustomForm__GetPopupParent(Self:TCustomForm):TCustomForm;
begin
  result := Self.PopupParent;
end;
procedure TCustomForm__PutPopupParent(Self:TCustomForm;const Value: TCustomForm);
begin
  Self.PopupParent := Value;
end;
function TCustomForm__GetScreenSnap(Self:TCustomForm):Boolean;
begin
  result := Self.ScreenSnap;
end;
procedure TCustomForm__PutScreenSnap(Self:TCustomForm;const Value: Boolean);
begin
  Self.ScreenSnap := Value;
end;
function TCustomForm__GetSnapBuffer(Self:TCustomForm):Integer;
begin
  result := Self.SnapBuffer;
end;
procedure TCustomForm__PutSnapBuffer(Self:TCustomForm;const Value: Integer);
begin
  Self.SnapBuffer := Value;
end;
function TCustomForm__GetWindowState(Self:TCustomForm):TWindowState;
begin
  result := Self.WindowState;
end;
procedure TCustomForm__PutWindowState(Self:TCustomForm;const Value: TWindowState);
begin
  Self.WindowState := Value;
end;
procedure TForm_ArrangeIcons(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TForm(Self).ArrangeIcons();
end;
procedure TForm_Cascade(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TForm(Self).Cascade();
end;
procedure TForm_Next(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TForm(Self).Next();
end;
procedure TForm_Previous(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TForm(Self).Previous();
end;
procedure TForm_Tile(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TForm(Self).Tile();
end;
function TMonitor__GetHandle(Self:TMonitor):HMONITOR;
begin
  result := Self.Handle;
end;
function TMonitor__GetMonitorNum(Self:TMonitor):Integer;
begin
  result := Self.MonitorNum;
end;
function TMonitor__GetLeft(Self:TMonitor):Integer;
begin
  result := Self.Left;
end;
function TMonitor__GetHeight(Self:TMonitor):Integer;
begin
  result := Self.Height;
end;
function TMonitor__GetTop(Self:TMonitor):Integer;
begin
  result := Self.Top;
end;
function TMonitor__GetWidth(Self:TMonitor):Integer;
begin
  result := Self.Width;
end;
function TMonitor__GetBoundsRect(Self:TMonitor):TRect;
begin
  result := Self.BoundsRect;
end;
function TMonitor__GetWorkareaRect(Self:TMonitor):TRect;
begin
  result := Self.WorkareaRect;
end;
function TMonitor__GetPrimary(Self:TMonitor):Boolean;
begin
  result := Self.Primary;
end;
procedure TScreen_DisableAlign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScreen(Self).DisableAlign();
end;
procedure TScreen_EnableAlign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScreen(Self).EnableAlign();
end;
procedure TScreen_Realign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScreen(Self).Realign();
end;
procedure TScreen_ResetFonts(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TScreen(Self).ResetFonts();
end;
function TScreen__GetActiveControl(Self:TScreen):TWinControl;
begin
  result := Self.ActiveControl;
end;
function TScreen__GetActiveCustomForm(Self:TScreen):TCustomForm;
begin
  result := Self.ActiveCustomForm;
end;
function TScreen__GetActiveForm(Self:TScreen):TForm;
begin
  result := Self.ActiveForm;
end;
function TScreen__GetCustomFormCount(Self:TScreen):Integer;
begin
  result := Self.CustomFormCount;
end;
function TScreen__GetCustomForms(Self:TScreen;Index: Integer):TCustomForm;
begin
  result := Self.CustomForms[Index];
end;
function TScreen__GetCursorCount(Self:TScreen):Integer;
begin
  result := Self.CursorCount;
end;
function TScreen__GetCursor(Self:TScreen):TCursor;
begin
  result := Self.Cursor;
end;
procedure TScreen__PutCursor(Self:TScreen;const Value: TCursor);
begin
  Self.Cursor := Value;
end;
function TScreen__GetCursors(Self:TScreen;Index: Integer):HCURSOR;
begin
  result := Self.Cursors[Index];
end;
procedure TScreen__PutCursors(Self:TScreen;Index: Integer;const Value: HCURSOR);
begin
  Self.Cursors[Index] := Value;
end;
function TScreen__GetDataModules(Self:TScreen;Index: Integer):TDataModule;
begin
  result := Self.DataModules[Index];
end;
function TScreen__GetDataModuleCount(Self:TScreen):Integer;
begin
  result := Self.DataModuleCount;
end;
function TScreen__GetFocusedForm(Self:TScreen):TCustomForm;
begin
  result := Self.FocusedForm;
end;
procedure TScreen__PutFocusedForm(Self:TScreen;const Value: TCustomForm);
begin
  Self.FocusedForm := Value;
end;
function TScreen__GetSaveFocusedList(Self:TScreen):TList;
begin
  result := Self.SaveFocusedList;
end;
function TScreen__GetMonitorCount(Self:TScreen):Integer;
begin
  result := Self.MonitorCount;
end;
function TScreen__GetMonitors(Self:TScreen;Index: Integer):TMonitor;
begin
  result := Self.Monitors[Index];
end;
function TScreen__GetDesktopRect(Self:TScreen):TRect;
begin
  result := Self.DesktopRect;
end;
function TScreen__GetDesktopHeight(Self:TScreen):Integer;
begin
  result := Self.DesktopHeight;
end;
function TScreen__GetDesktopLeft(Self:TScreen):Integer;
begin
  result := Self.DesktopLeft;
end;
function TScreen__GetDesktopTop(Self:TScreen):Integer;
begin
  result := Self.DesktopTop;
end;
function TScreen__GetDesktopWidth(Self:TScreen):Integer;
begin
  result := Self.DesktopWidth;
end;
function TScreen__GetWorkAreaRect(Self:TScreen):TRect;
begin
  result := Self.WorkAreaRect;
end;
function TScreen__GetWorkAreaHeight(Self:TScreen):Integer;
begin
  result := Self.WorkAreaHeight;
end;
function TScreen__GetWorkAreaLeft(Self:TScreen):Integer;
begin
  result := Self.WorkAreaLeft;
end;
function TScreen__GetWorkAreaTop(Self:TScreen):Integer;
begin
  result := Self.WorkAreaTop;
end;
function TScreen__GetWorkAreaWidth(Self:TScreen):Integer;
begin
  result := Self.WorkAreaWidth;
end;
function TScreen__GetHintFont(Self:TScreen):TFont;
begin
  result := Self.HintFont;
end;
procedure TScreen__PutHintFont(Self:TScreen;const Value: TFont);
begin
  Self.HintFont := Value;
end;
function TScreen__GetIconFont(Self:TScreen):TFont;
begin
  result := Self.IconFont;
end;
procedure TScreen__PutIconFont(Self:TScreen;const Value: TFont);
begin
  Self.IconFont := Value;
end;
function TScreen__GetMenuFont(Self:TScreen):TFont;
begin
  result := Self.MenuFont;
end;
procedure TScreen__PutMenuFont(Self:TScreen;const Value: TFont);
begin
  Self.MenuFont := Value;
end;
function TScreen__GetFonts(Self:TScreen):TStrings;
begin
  result := Self.Fonts;
end;
function TScreen__GetFormCount(Self:TScreen):Integer;
begin
  result := Self.FormCount;
end;
function TScreen__GetForms(Self:TScreen;Index: Integer):TForm;
begin
  result := Self.Forms[Index];
end;
function TScreen__GetImes(Self:TScreen):TStrings;
begin
  result := Self.Imes;
end;
function TScreen__GetDefaultIme(Self:TScreen):String;
begin
  result := Self.DefaultIme;
end;
function TScreen__GetDefaultKbLayout(Self:TScreen):HKL;
begin
  result := Self.DefaultKbLayout;
end;
function TScreen__GetHeight(Self:TScreen):Integer;
begin
  result := Self.Height;
end;
function TScreen__GetPixelsPerInch(Self:TScreen):Integer;
begin
  result := Self.PixelsPerInch;
end;
function TScreen__GetPrimaryMonitor(Self:TScreen):TMonitor;
begin
  result := Self.PrimaryMonitor;
end;
function TScreen__GetWidth(Self:TScreen):Integer;
begin
  result := Self.Width;
end;
procedure TApplication_BringToFront(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).BringToFront();
end;
procedure TApplication_CancelHint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).CancelHint();
end;
procedure TApplication_CreateHandle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).CreateHandle();
end;
procedure TApplication_DoApplicationIdle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).DoApplicationIdle();
end;
procedure TApplication_HandleMessage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).HandleMessage();
end;
procedure TApplication_HelpCommand(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).HelpCommand(Params[0].AsInteger,Params[1].PValue^);
end;
procedure TApplication_HelpJump(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).HelpJump(Params[0].AsString);
end;
procedure TApplication_HelpKeyword(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).HelpKeyword(Params[0].AsString);
end;
procedure TApplication_HideHint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).HideHint();
end;
procedure TApplication_HookSynchronizeWakeup(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).HookSynchronizeWakeup();
end;
procedure TApplication_Initialize(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).Initialize();
end;
procedure TApplication_IsRightToLeft(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).IsRightToLeft();
end;
procedure TApplication_Minimize(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).Minimize();
end;
procedure TApplication_ModalStarted(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).ModalStarted();
end;
procedure TApplication_ModalFinished(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).ModalFinished();
end;
procedure TApplication_NormalizeAllTopMosts(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).NormalizeAllTopMosts();
end;
procedure TApplication_NormalizeTopMosts(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).NormalizeTopMosts();
end;
procedure TApplication_ProcessMessages(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).ProcessMessages();
end;
procedure TApplication_Restore(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).Restore();
end;
procedure TApplication_RestoreTopMosts(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).RestoreTopMosts();
end;
procedure TApplication_Run(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).Run();
end;
procedure TApplication_Terminate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).Terminate();
end;
procedure TApplication_UnhookSynchronizeWakeup(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TApplication(Self).UnhookSynchronizeWakeup();
end;
procedure TApplication_UseRightToLeftAlignment(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).UseRightToLeftAlignment();
end;
procedure TApplication_UseRightToLeftReading(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).UseRightToLeftReading();
end;
procedure TApplication_UseRightToLeftScrollBar(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TApplication(Self).UseRightToLeftScrollBar();
end;
function TApplication__GetActive(Self:TApplication):Boolean;
begin
  result := Self.Active;
end;
function TApplication__GetActionUpdateDelay(Self:TApplication):Integer;
begin
  result := Self.ActionUpdateDelay;
end;
procedure TApplication__PutActionUpdateDelay(Self:TApplication;const Value: Integer);
begin
  Self.ActionUpdateDelay := Value;
end;
function TApplication__GetActiveFormHandle(Self:TApplication):HWND;
begin
  result := Self.ActiveFormHandle;
end;
function TApplication__GetAllowTesting(Self:TApplication):Boolean;
begin
  result := Self.AllowTesting;
end;
procedure TApplication__PutAllowTesting(Self:TApplication;const Value: Boolean);
begin
  Self.AllowTesting := Value;
end;
function TApplication__GetAutoDragDocking(Self:TApplication):Boolean;
begin
  result := Self.AutoDragDocking;
end;
procedure TApplication__PutAutoDragDocking(Self:TApplication;const Value: Boolean);
begin
  Self.AutoDragDocking := Value;
end;
function TApplication__GetHelpSystem(Self:TApplication):IHelpSystem;
begin
  result := Self.HelpSystem;
end;
function TApplication__GetCurrentHelpFile(Self:TApplication):String;
begin
  result := Self.CurrentHelpFile;
end;
function TApplication__GetDialogHandle(Self:TApplication):HWnd;
begin
  result := Self.DialogHandle;
end;
procedure TApplication__PutDialogHandle(Self:TApplication;const Value: HWnd);
begin
  Self.DialogHandle := Value;
end;
function TApplication__GetExeName(Self:TApplication):String;
begin
  result := Self.ExeName;
end;
function TApplication__GetHandle(Self:TApplication):HWnd;
begin
  result := Self.Handle;
end;
procedure TApplication__PutHandle(Self:TApplication;const Value: HWnd);
begin
  Self.Handle := Value;
end;
function TApplication__GetHelpFile(Self:TApplication):String;
begin
  result := Self.HelpFile;
end;
procedure TApplication__PutHelpFile(Self:TApplication;const Value: String);
begin
  Self.HelpFile := Value;
end;
function TApplication__GetHint(Self:TApplication):String;
begin
  result := Self.Hint;
end;
procedure TApplication__PutHint(Self:TApplication;const Value: String);
begin
  Self.Hint := Value;
end;
function TApplication__GetHintColor(Self:TApplication):TColor;
begin
  result := Self.HintColor;
end;
procedure TApplication__PutHintColor(Self:TApplication;const Value: TColor);
begin
  Self.HintColor := Value;
end;
function TApplication__GetHintHidePause(Self:TApplication):Integer;
begin
  result := Self.HintHidePause;
end;
procedure TApplication__PutHintHidePause(Self:TApplication;const Value: Integer);
begin
  Self.HintHidePause := Value;
end;
function TApplication__GetHintPause(Self:TApplication):Integer;
begin
  result := Self.HintPause;
end;
procedure TApplication__PutHintPause(Self:TApplication;const Value: Integer);
begin
  Self.HintPause := Value;
end;
function TApplication__GetHintShortCuts(Self:TApplication):Boolean;
begin
  result := Self.HintShortCuts;
end;
procedure TApplication__PutHintShortCuts(Self:TApplication;const Value: Boolean);
begin
  Self.HintShortCuts := Value;
end;
function TApplication__GetHintShortPause(Self:TApplication):Integer;
begin
  result := Self.HintShortPause;
end;
procedure TApplication__PutHintShortPause(Self:TApplication;const Value: Integer);
begin
  Self.HintShortPause := Value;
end;
function TApplication__GetIcon(Self:TApplication):TIcon;
begin
  result := Self.Icon;
end;
procedure TApplication__PutIcon(Self:TApplication;const Value: TIcon);
begin
  Self.Icon := Value;
end;
function TApplication__GetMainForm(Self:TApplication):TForm;
begin
  result := Self.MainForm;
end;
function TApplication__GetMainFormHandle(Self:TApplication):HWND;
begin
  result := Self.MainFormHandle;
end;
function TApplication__GetModalLevel(Self:TApplication):Integer;
begin
  result := Self.ModalLevel;
end;
function TApplication__GetBiDiMode(Self:TApplication):TBiDiMode;
begin
  result := Self.BiDiMode;
end;
procedure TApplication__PutBiDiMode(Self:TApplication;const Value: TBiDiMode);
begin
  Self.BiDiMode := Value;
end;
function TApplication__GetBiDiKeyboard(Self:TApplication):String;
begin
  result := Self.BiDiKeyboard;
end;
procedure TApplication__PutBiDiKeyboard(Self:TApplication;const Value: String);
begin
  Self.BiDiKeyboard := Value;
end;
function TApplication__GetNonBiDiKeyboard(Self:TApplication):String;
begin
  result := Self.NonBiDiKeyboard;
end;
procedure TApplication__PutNonBiDiKeyboard(Self:TApplication;const Value: String);
begin
  Self.NonBiDiKeyboard := Value;
end;
function TApplication__GetPopupControlWnd(Self:TApplication):HWND;
begin
  result := Self.PopupControlWnd;
end;
function TApplication__GetShowHint(Self:TApplication):Boolean;
begin
  result := Self.ShowHint;
end;
procedure TApplication__PutShowHint(Self:TApplication;const Value: Boolean);
begin
  Self.ShowHint := Value;
end;
function TApplication__GetShowMainForm(Self:TApplication):Boolean;
begin
  result := Self.ShowMainForm;
end;
procedure TApplication__PutShowMainForm(Self:TApplication;const Value: Boolean);
begin
  Self.ShowMainForm := Value;
end;
function TApplication__GetTerminated(Self:TApplication):Boolean;
begin
  result := Self.Terminated;
end;
function TApplication__GetTitle(Self:TApplication):String;
begin
  result := Self.Title;
end;
procedure TApplication__PutTitle(Self:TApplication;const Value: String);
begin
  Self.Title := Value;
end;
function TApplication__GetUpdateFormatSettings(Self:TApplication):Boolean;
begin
  result := Self.UpdateFormatSettings;
end;
procedure TApplication__PutUpdateFormatSettings(Self:TApplication;const Value: Boolean);
begin
  Self.UpdateFormatSettings := Value;
end;
function TApplication__GetUpdateMetricSettings(Self:TApplication):Boolean;
begin
  result := Self.UpdateMetricSettings;
end;
procedure TApplication__PutUpdateMetricSettings(Self:TApplication;const Value: Boolean);
begin
  Self.UpdateMetricSettings := Value;
end;
procedure _EnableTaskWindows(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Forms.EnableTaskWindows(Params[0].AsPointer);
end;
procedure _FreeObjectInstance(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Forms.FreeObjectInstance(Params[0].AsPointer);
end;
procedure _IsAccel(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Forms.IsAccel(Params[0].PValue^,Params[1].AsString);
end;
procedure _SetAutoSubClass(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Forms.SetAutoSubClass(Params[0].AsBoolean);
end;
procedure _DoneCtl3D(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Forms.DoneCtl3D();
end;
procedure _InitCtl3D(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Forms.InitCtl3D();
end;
function KeyboardStateToShiftState1(const KeyboardState: TKeyboardState): TShiftState; 
begin
  result := Forms.KeyboardStateToShiftState(KEYBOARDSTATE);
end;
function KeyboardStateToShiftState2: TShiftState; 
begin
  result := Forms.KeyboardStateToShiftState();
end;
procedure _ForegroundTask(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Forms.ForegroundTask();
end;
procedure RegisterIMP_Forms;
var H: Integer;
begin
  H := RegisterNamespace('Forms', -1);
  RegisterRTTIType(TypeInfo(TScrollBarKind));
  RegisterRTTIType(TypeInfo(TScrollBarInc));
  RegisterRTTIType(TypeInfo(TScrollBarStyle));
  // Begin of class TControlScrollBar
  RegisterClassType(TControlScrollBar, H);
  RegisterMethod(TControlScrollBar,
       'procedure Assign(Source: TPersistent); override;',
       @TControlScrollBar.Assign);
  RegisterStdMethodEx(TControlScrollBar,'ChangeBiDiPosition',TControlScrollBar_ChangeBiDiPosition,0,[typeVARIANT]);
  RegisterMethod(TControlScrollBar,
       'function TControlScrollBar__GetKind(Self:TControlScrollBar):TScrollBarKind;',
       @TControlScrollBar__GetKind, true);
  RegisterProperty(TControlScrollBar,
       'property Kind:TScrollBarKind read TControlScrollBar__GetKind;');
  RegisterStdMethodEx(TControlScrollBar,'IsScrollBarVisible',TControlScrollBar_IsScrollBarVisible,0,[typeBOOLEAN]);
  RegisterMethod(TControlScrollBar,
       'function TControlScrollBar__GetScrollPos(Self:TControlScrollBar):Integer;',
       @TControlScrollBar__GetScrollPos, true);
  RegisterProperty(TControlScrollBar,
       'property ScrollPos:Integer read TControlScrollBar__GetScrollPos;');
  RegisterMethod(TControlScrollBar,
       'constructor Create;',
       @TControlScrollBar.Create);
  // End of class TControlScrollBar
  RegisterRTTIType(TypeInfo(TWindowState));
  // Begin of class TScrollingWinControl
  RegisterClassType(TScrollingWinControl, H);
  RegisterMethod(TScrollingWinControl,
       'constructor Create(AOwner: TComponent); override;',
       @TScrollingWinControl.Create);
  RegisterMethod(TScrollingWinControl,
       'destructor Destroy; override;',
       @TScrollingWinControl.Destroy);
  RegisterStdMethodEx(TScrollingWinControl,'DisableAutoRange',TScrollingWinControl_DisableAutoRange,0,[typeVARIANT]);
  RegisterStdMethodEx(TScrollingWinControl,'EnableAutoRange',TScrollingWinControl_EnableAutoRange,0,[typeVARIANT]);
  RegisterMethod(TScrollingWinControl,
       'procedure ScrollInView(AControl: TControl);',
       @TScrollingWinControl.ScrollInView);
  // End of class TScrollingWinControl
  RegisterRTTIType(TypeInfo(TFormBorderStyle));
  RegisterRTTIType(TypeInfo(TBorderStyle));
  // Begin of class TScrollBox
  RegisterClassType(TScrollBox, H);
  RegisterMethod(TScrollBox,
       'constructor Create(AOwner: TComponent); override;',
       @TScrollBox.Create);
  // End of class TScrollBox
  // Begin of class TCustomFrame
  RegisterClassType(TCustomFrame, H);
  RegisterMethod(TCustomFrame,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomFrame.Create);
  // End of class TCustomFrame
  // Begin of class TFrame
  RegisterClassType(TFrame, H);
  RegisterMethod(TFrame,
       'constructor Create(AOwner: TComponent); override;',
       @TFrame.Create);
  // End of class TFrame
  // Begin of interface IDesignerHook
  RegisterInterfaceType('IDesignerHook',IDesignerHook,'IDesignerNotify',IDesignerNotify,H);
  RegisterInterfaceMethod(IDesignerHook,
       'function GetCustomForm: TCustomForm;');
  RegisterInterfaceMethod(IDesignerHook,
       'procedure SetCustomForm(Value: TCustomForm);');
  RegisterInterfaceMethod(IDesignerHook,
       'function GetIsControl: Boolean;');
  RegisterInterfaceMethod(IDesignerHook,
       'procedure SetIsControl(Value: Boolean);');
  RegisterInterfaceMethod(IDesignerHook,
       'function IsDesignMsg(Sender: TControl; var Message: TMessage): Boolean;');
  RegisterInterfaceMethod(IDesignerHook,
       'procedure PaintGrid;');
  RegisterInterfaceMethod(IDesignerHook,
       'procedure PaintMenu;');
  RegisterInterfaceMethod(IDesignerHook,
       'procedure ValidateRename(AComponent: TComponent;      const CurName, NewName: string);');
  RegisterInterfaceMethod(IDesignerHook,
       'function UniqueName(const BaseName: string): string;');
  RegisterInterfaceMethod(IDesignerHook,
       'function GetRoot: TComponent;');
  RegisterInterfaceProperty(IDesignerHook,'property IsControl: Boolean read GetIsControl write SetIsControl;');
  RegisterInterfaceProperty(IDesignerHook,'property Form: TCustomForm read GetCustomForm write SetCustomForm;');
  // End of interface IDesignerHook
  // Begin of interface IOleForm
  RegisterInterfaceType('IOleForm',IOleForm,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IOleForm,
       'procedure OnDestroy;');
  RegisterInterfaceMethod(IOleForm,
       'procedure OnResize;');
  // End of interface IOleForm
  RegisterRTTIType(TypeInfo(TFormStyle));
  RegisterRTTIType(TypeInfo(TBorderIcon));
  RegisterRTTIType(TypeInfo(TBorderIcons));
  RegisterRTTIType(TypeInfo(TPosition));
  RegisterRTTIType(TypeInfo(TDefaultMonitor));
  RegisterRTTIType(TypeInfo(TPrintScale));
  RegisterRTTIType(TypeInfo(TShowAction));
  RegisterRTTIType(TypeInfo(TTileMode));
  RegisterRTTIType(TypeInfo(TCloseAction));
  RegisterRTTIType(TypeInfo(TFormState));
  RegisterRTTIType(TypeInfo(TPopupMode));
  // Begin of class TCustomForm
  RegisterClassType(TCustomForm, H);
  RegisterMethod(TCustomForm,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomForm.Create);
  RegisterMethod(TCustomForm,
       'constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;',
       @TCustomForm.CreateNew);
  RegisterMethod(TCustomForm,
       'destructor Destroy; override;',
       @TCustomForm.Destroy);
  RegisterStdMethodEx(TCustomForm,'AfterConstruction',TCustomForm_AfterConstruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TCustomForm,'BeforeDestruction',TCustomForm_BeforeDestruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TCustomForm,'Close',TCustomForm_Close,0,[typeVARIANT]);
  RegisterStdMethodEx(TCustomForm,'CloseQuery',TCustomForm_CloseQuery,0,[typeBOOLEAN]);
  RegisterMethod(TCustomForm,
       'procedure DefaultHandler(var Message); override;',
       @TCustomForm.DefaultHandler);
  RegisterMethod(TCustomForm,
       'procedure DefocusControl(Control: TWinControl; Removing: Boolean);',
       @TCustomForm.DefocusControl);
  RegisterMethod(TCustomForm,
       'procedure Dock(NewDockSite: TWinControl; ARect: TRect); override;',
       @TCustomForm.Dock);
  RegisterMethod(TCustomForm,
       'procedure FocusControl(Control: TWinControl);',
       @TCustomForm.FocusControl);
  RegisterMethod(TCustomForm,
       'function GetFormImage: TBitmap;',
       @TCustomForm.GetFormImage);
  RegisterStdMethodEx(TCustomForm,'Hide',TCustomForm_Hide,0,[typeVARIANT]);
  RegisterMethod(TCustomForm,
       'function IsShortCut(var Message: TWMKey): Boolean; dynamic;',
       @TCustomForm.IsShortCut);
  RegisterMethod(TCustomForm,
       'procedure MakeFullyVisible(AMonitor: TMonitor = nil);',
       @TCustomForm.MakeFullyVisible);
  RegisterMethod(TCustomForm,
       'procedure MouseWheelHandler(var Message: TMessage); override;',
       @TCustomForm.MouseWheelHandler);
  RegisterStdMethodEx(TCustomForm,'Print',TCustomForm_Print,0,[typeVARIANT]);
  RegisterMethod(TCustomForm,
       'procedure RecreateAsPopup(AWindowHandle: HWND);',
       @TCustomForm.RecreateAsPopup);
  RegisterStdMethodEx(TCustomForm,'Release',TCustomForm_Release,0,[typeVARIANT]);
  RegisterMethod(TCustomForm,
       'procedure SendCancelMode(Sender: TControl);',
       @TCustomForm.SendCancelMode);
  RegisterStdMethodEx(TCustomForm,'SetFocus',TCustomForm_SetFocus,0,[typeVARIANT]);
  RegisterMethod(TCustomForm,
       'function SetFocusedControl(Control: TWinControl): Boolean; virtual;',
       @TCustomForm.SetFocusedControl);
  RegisterStdMethodEx(TCustomForm,'Show',TCustomForm_Show,0,[typeVARIANT]);
  RegisterStdMethodEx(TCustomForm,'ShowModal',TCustomForm_ShowModal,0,[typeINTEGER]);
  RegisterMethod(TCustomForm,
       'function WantChildKey(Child: TControl; var Message: TMessage): Boolean; virtual;',
       @TCustomForm.WantChildKey);
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetActive(Self:TCustomForm):Boolean;',
       @TCustomForm__GetActive, true);
  RegisterProperty(TCustomForm,
       'property Active:Boolean read TCustomForm__GetActive;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetActiveControl(Self:TCustomForm):TWinControl;',
       @TCustomForm__GetActiveControl, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutActiveControl(Self:TCustomForm;const Value: TWinControl);',
       @TCustomForm__PutActiveControl, true);
  RegisterProperty(TCustomForm,
       'property ActiveControl:TWinControl read TCustomForm__GetActiveControl write TCustomForm__PutActiveControl;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetActiveOleControl(Self:TCustomForm):TWinControl;',
       @TCustomForm__GetActiveOleControl, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutActiveOleControl(Self:TCustomForm;const Value: TWinControl);',
       @TCustomForm__PutActiveOleControl, true);
  RegisterProperty(TCustomForm,
       'property ActiveOleControl:TWinControl read TCustomForm__GetActiveOleControl write TCustomForm__PutActiveOleControl;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetBorderStyle(Self:TCustomForm):TFormBorderStyle;',
       @TCustomForm__GetBorderStyle, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutBorderStyle(Self:TCustomForm;const Value: TFormBorderStyle);',
       @TCustomForm__PutBorderStyle, true);
  RegisterProperty(TCustomForm,
       'property BorderStyle:TFormBorderStyle read TCustomForm__GetBorderStyle write TCustomForm__PutBorderStyle;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetCanvas(Self:TCustomForm):TCanvas;',
       @TCustomForm__GetCanvas, true);
  RegisterProperty(TCustomForm,
       'property Canvas:TCanvas read TCustomForm__GetCanvas;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetDesigner(Self:TCustomForm):IDesignerHook;',
       @TCustomForm__GetDesigner, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutDesigner(Self:TCustomForm;const Value: IDesignerHook);',
       @TCustomForm__PutDesigner, true);
  RegisterProperty(TCustomForm,
       'property Designer:IDesignerHook read TCustomForm__GetDesigner write TCustomForm__PutDesigner;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetDropTarget(Self:TCustomForm):Boolean;',
       @TCustomForm__GetDropTarget, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutDropTarget(Self:TCustomForm;const Value: Boolean);',
       @TCustomForm__PutDropTarget, true);
  RegisterProperty(TCustomForm,
       'property DropTarget:Boolean read TCustomForm__GetDropTarget write TCustomForm__PutDropTarget;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetFormState(Self:TCustomForm):TFormState;',
       @TCustomForm__GetFormState, true);
  RegisterProperty(TCustomForm,
       'property FormState:TFormState read TCustomForm__GetFormState;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetHelpFile(Self:TCustomForm):String;',
       @TCustomForm__GetHelpFile, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutHelpFile(Self:TCustomForm;const Value: String);',
       @TCustomForm__PutHelpFile, true);
  RegisterProperty(TCustomForm,
       'property HelpFile:String read TCustomForm__GetHelpFile write TCustomForm__PutHelpFile;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetKeyPreview(Self:TCustomForm):Boolean;',
       @TCustomForm__GetKeyPreview, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutKeyPreview(Self:TCustomForm;const Value: Boolean);',
       @TCustomForm__PutKeyPreview, true);
  RegisterProperty(TCustomForm,
       'property KeyPreview:Boolean read TCustomForm__GetKeyPreview write TCustomForm__PutKeyPreview;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetMenu(Self:TCustomForm):TMainMenu;',
       @TCustomForm__GetMenu, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutMenu(Self:TCustomForm;const Value: TMainMenu);',
       @TCustomForm__PutMenu, true);
  RegisterProperty(TCustomForm,
       'property Menu:TMainMenu read TCustomForm__GetMenu write TCustomForm__PutMenu;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetModalResult(Self:TCustomForm):TModalResult;',
       @TCustomForm__GetModalResult, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutModalResult(Self:TCustomForm;const Value: TModalResult);',
       @TCustomForm__PutModalResult, true);
  RegisterProperty(TCustomForm,
       'property ModalResult:TModalResult read TCustomForm__GetModalResult write TCustomForm__PutModalResult;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetMonitor(Self:TCustomForm):TMonitor;',
       @TCustomForm__GetMonitor, true);
  RegisterProperty(TCustomForm,
       'property Monitor:TMonitor read TCustomForm__GetMonitor;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetOleFormObject(Self:TCustomForm):IOleForm;',
       @TCustomForm__GetOleFormObject, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutOleFormObject(Self:TCustomForm;const Value: IOleForm);',
       @TCustomForm__PutOleFormObject, true);
  RegisterProperty(TCustomForm,
       'property OleFormObject:IOleForm read TCustomForm__GetOleFormObject write TCustomForm__PutOleFormObject;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetPopupMode(Self:TCustomForm):TPopupMode;',
       @TCustomForm__GetPopupMode, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutPopupMode(Self:TCustomForm;const Value: TPopupMode);',
       @TCustomForm__PutPopupMode, true);
  RegisterProperty(TCustomForm,
       'property PopupMode:TPopupMode read TCustomForm__GetPopupMode write TCustomForm__PutPopupMode;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetPopupParent(Self:TCustomForm):TCustomForm;',
       @TCustomForm__GetPopupParent, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutPopupParent(Self:TCustomForm;const Value: TCustomForm);',
       @TCustomForm__PutPopupParent, true);
  RegisterProperty(TCustomForm,
       'property PopupParent:TCustomForm read TCustomForm__GetPopupParent write TCustomForm__PutPopupParent;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetScreenSnap(Self:TCustomForm):Boolean;',
       @TCustomForm__GetScreenSnap, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutScreenSnap(Self:TCustomForm;const Value: Boolean);',
       @TCustomForm__PutScreenSnap, true);
  RegisterProperty(TCustomForm,
       'property ScreenSnap:Boolean read TCustomForm__GetScreenSnap write TCustomForm__PutScreenSnap;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetSnapBuffer(Self:TCustomForm):Integer;',
       @TCustomForm__GetSnapBuffer, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutSnapBuffer(Self:TCustomForm;const Value: Integer);',
       @TCustomForm__PutSnapBuffer, true);
  RegisterProperty(TCustomForm,
       'property SnapBuffer:Integer read TCustomForm__GetSnapBuffer write TCustomForm__PutSnapBuffer;');
  RegisterMethod(TCustomForm,
       'function TCustomForm__GetWindowState(Self:TCustomForm):TWindowState;',
       @TCustomForm__GetWindowState, true);
  RegisterMethod(TCustomForm,
       'procedure TCustomForm__PutWindowState(Self:TCustomForm;const Value: TWindowState);',
       @TCustomForm__PutWindowState, true);
  RegisterProperty(TCustomForm,
       'property WindowState:TWindowState read TCustomForm__GetWindowState write TCustomForm__PutWindowState;');
  // End of class TCustomForm
  RegisterRTTIType(TypeInfo(TActiveFormBorderStyle));
  // Begin of class TCustomActiveForm
  RegisterClassType(TCustomActiveForm, H);
  RegisterMethod(TCustomActiveForm,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomActiveForm.Create);
  RegisterMethod(TCustomActiveForm,
       'function WantChildKey(Child: TControl; var Message: TMessage): Boolean; override;',
       @TCustomActiveForm.WantChildKey);
  // End of class TCustomActiveForm
  // Begin of class TForm
  RegisterClassType(TForm, H);
  RegisterStdMethodEx(TForm,'ArrangeIcons',TForm_ArrangeIcons,0,[typeVARIANT]);
  RegisterStdMethodEx(TForm,'Cascade',TForm_Cascade,0,[typeVARIANT]);
  RegisterStdMethodEx(TForm,'Next',TForm_Next,0,[typeVARIANT]);
  RegisterStdMethodEx(TForm,'Previous',TForm_Previous,0,[typeVARIANT]);
  RegisterStdMethodEx(TForm,'Tile',TForm_Tile,0,[typeVARIANT]);
  RegisterMethod(TForm,
       'constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;',
       @TForm.Create);
  // End of class TForm
  // Begin of class TCustomDockForm
  RegisterClassType(TCustomDockForm, H);
  RegisterMethod(TCustomDockForm,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomDockForm.Create);
  // End of class TCustomDockForm
  // Begin of class TMonitor
  RegisterClassType(TMonitor, H);
  RegisterMethod(TMonitor,
       'function TMonitor__GetHandle(Self:TMonitor):HMONITOR;',
       @TMonitor__GetHandle, true);
  RegisterProperty(TMonitor,
       'property Handle:HMONITOR read TMonitor__GetHandle;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetMonitorNum(Self:TMonitor):Integer;',
       @TMonitor__GetMonitorNum, true);
  RegisterProperty(TMonitor,
       'property MonitorNum:Integer read TMonitor__GetMonitorNum;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetLeft(Self:TMonitor):Integer;',
       @TMonitor__GetLeft, true);
  RegisterProperty(TMonitor,
       'property Left:Integer read TMonitor__GetLeft;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetHeight(Self:TMonitor):Integer;',
       @TMonitor__GetHeight, true);
  RegisterProperty(TMonitor,
       'property Height:Integer read TMonitor__GetHeight;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetTop(Self:TMonitor):Integer;',
       @TMonitor__GetTop, true);
  RegisterProperty(TMonitor,
       'property Top:Integer read TMonitor__GetTop;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetWidth(Self:TMonitor):Integer;',
       @TMonitor__GetWidth, true);
  RegisterProperty(TMonitor,
       'property Width:Integer read TMonitor__GetWidth;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetBoundsRect(Self:TMonitor):TRect;',
       @TMonitor__GetBoundsRect, true);
  RegisterProperty(TMonitor,
       'property BoundsRect:TRect read TMonitor__GetBoundsRect;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetWorkareaRect(Self:TMonitor):TRect;',
       @TMonitor__GetWorkareaRect, true);
  RegisterProperty(TMonitor,
       'property WorkareaRect:TRect read TMonitor__GetWorkareaRect;');
  RegisterMethod(TMonitor,
       'function TMonitor__GetPrimary(Self:TMonitor):Boolean;',
       @TMonitor__GetPrimary, true);
  RegisterProperty(TMonitor,
       'property Primary:Boolean read TMonitor__GetPrimary;');
  RegisterMethod(TMonitor,
       'constructor Create;',
       @TMonitor.Create);
  // End of class TMonitor
  RegisterRTTIType(TypeInfo(TMonitorDefaultTo));
  // Begin of class TScreen
  RegisterClassType(TScreen, H);
  RegisterMethod(TScreen,
       'constructor Create(AOwner: TComponent); override;',
       @TScreen.Create);
  RegisterMethod(TScreen,
       'destructor Destroy; override;',
       @TScreen.Destroy);
  RegisterStdMethodEx(TScreen,'DisableAlign',TScreen_DisableAlign,0,[typeVARIANT]);
  RegisterStdMethodEx(TScreen,'EnableAlign',TScreen_EnableAlign,0,[typeVARIANT]);
  RegisterMethod(TScreen,
       'function MonitorFromPoint(const Point: TPoint;      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;',
       @TScreen.MonitorFromPoint);
  RegisterMethod(TScreen,
       'function MonitorFromRect(const Rect: TRect;      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;',
       @TScreen.MonitorFromRect);
  RegisterMethod(TScreen,
       'function MonitorFromWindow(const Handle: THandle;      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;',
       @TScreen.MonitorFromWindow);
  RegisterStdMethodEx(TScreen,'Realign',TScreen_Realign,0,[typeVARIANT]);
  RegisterStdMethodEx(TScreen,'ResetFonts',TScreen_ResetFonts,0,[typeVARIANT]);
  RegisterMethod(TScreen,
       'function TScreen__GetActiveControl(Self:TScreen):TWinControl;',
       @TScreen__GetActiveControl, true);
  RegisterProperty(TScreen,
       'property ActiveControl:TWinControl read TScreen__GetActiveControl;');
  RegisterMethod(TScreen,
       'function TScreen__GetActiveCustomForm(Self:TScreen):TCustomForm;',
       @TScreen__GetActiveCustomForm, true);
  RegisterProperty(TScreen,
       'property ActiveCustomForm:TCustomForm read TScreen__GetActiveCustomForm;');
  RegisterMethod(TScreen,
       'function TScreen__GetActiveForm(Self:TScreen):TForm;',
       @TScreen__GetActiveForm, true);
  RegisterProperty(TScreen,
       'property ActiveForm:TForm read TScreen__GetActiveForm;');
  RegisterMethod(TScreen,
       'function TScreen__GetCustomFormCount(Self:TScreen):Integer;',
       @TScreen__GetCustomFormCount, true);
  RegisterProperty(TScreen,
       'property CustomFormCount:Integer read TScreen__GetCustomFormCount;');
  RegisterMethod(TScreen,
       'function TScreen__GetCustomForms(Self:TScreen;Index: Integer):TCustomForm;',
       @TScreen__GetCustomForms, true);
  RegisterProperty(TScreen,
       'property CustomForms[Index: Integer]:TCustomForm read TScreen__GetCustomForms;');
  RegisterMethod(TScreen,
       'function TScreen__GetCursorCount(Self:TScreen):Integer;',
       @TScreen__GetCursorCount, true);
  RegisterProperty(TScreen,
       'property CursorCount:Integer read TScreen__GetCursorCount;');
  RegisterMethod(TScreen,
       'function TScreen__GetCursor(Self:TScreen):TCursor;',
       @TScreen__GetCursor, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutCursor(Self:TScreen;const Value: TCursor);',
       @TScreen__PutCursor, true);
  RegisterProperty(TScreen,
       'property Cursor:TCursor read TScreen__GetCursor write TScreen__PutCursor;');
  RegisterMethod(TScreen,
       'function TScreen__GetCursors(Self:TScreen;Index: Integer):HCURSOR;',
       @TScreen__GetCursors, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutCursors(Self:TScreen;Index: Integer;const Value: HCURSOR);',
       @TScreen__PutCursors, true);
  RegisterProperty(TScreen,
       'property Cursors[Index: Integer]:HCURSOR read TScreen__GetCursors write TScreen__PutCursors;');
  RegisterMethod(TScreen,
       'function TScreen__GetDataModules(Self:TScreen;Index: Integer):TDataModule;',
       @TScreen__GetDataModules, true);
  RegisterProperty(TScreen,
       'property DataModules[Index: Integer]:TDataModule read TScreen__GetDataModules;');
  RegisterMethod(TScreen,
       'function TScreen__GetDataModuleCount(Self:TScreen):Integer;',
       @TScreen__GetDataModuleCount, true);
  RegisterProperty(TScreen,
       'property DataModuleCount:Integer read TScreen__GetDataModuleCount;');
  RegisterMethod(TScreen,
       'function TScreen__GetFocusedForm(Self:TScreen):TCustomForm;',
       @TScreen__GetFocusedForm, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutFocusedForm(Self:TScreen;const Value: TCustomForm);',
       @TScreen__PutFocusedForm, true);
  RegisterProperty(TScreen,
       'property FocusedForm:TCustomForm read TScreen__GetFocusedForm write TScreen__PutFocusedForm;');
  RegisterMethod(TScreen,
       'function TScreen__GetSaveFocusedList(Self:TScreen):TList;',
       @TScreen__GetSaveFocusedList, true);
  RegisterProperty(TScreen,
       'property SaveFocusedList:TList read TScreen__GetSaveFocusedList;');
  RegisterMethod(TScreen,
       'function TScreen__GetMonitorCount(Self:TScreen):Integer;',
       @TScreen__GetMonitorCount, true);
  RegisterProperty(TScreen,
       'property MonitorCount:Integer read TScreen__GetMonitorCount;');
  RegisterMethod(TScreen,
       'function TScreen__GetMonitors(Self:TScreen;Index: Integer):TMonitor;',
       @TScreen__GetMonitors, true);
  RegisterProperty(TScreen,
       'property Monitors[Index: Integer]:TMonitor read TScreen__GetMonitors;');
  RegisterMethod(TScreen,
       'function TScreen__GetDesktopRect(Self:TScreen):TRect;',
       @TScreen__GetDesktopRect, true);
  RegisterProperty(TScreen,
       'property DesktopRect:TRect read TScreen__GetDesktopRect;');
  RegisterMethod(TScreen,
       'function TScreen__GetDesktopHeight(Self:TScreen):Integer;',
       @TScreen__GetDesktopHeight, true);
  RegisterProperty(TScreen,
       'property DesktopHeight:Integer read TScreen__GetDesktopHeight;');
  RegisterMethod(TScreen,
       'function TScreen__GetDesktopLeft(Self:TScreen):Integer;',
       @TScreen__GetDesktopLeft, true);
  RegisterProperty(TScreen,
       'property DesktopLeft:Integer read TScreen__GetDesktopLeft;');
  RegisterMethod(TScreen,
       'function TScreen__GetDesktopTop(Self:TScreen):Integer;',
       @TScreen__GetDesktopTop, true);
  RegisterProperty(TScreen,
       'property DesktopTop:Integer read TScreen__GetDesktopTop;');
  RegisterMethod(TScreen,
       'function TScreen__GetDesktopWidth(Self:TScreen):Integer;',
       @TScreen__GetDesktopWidth, true);
  RegisterProperty(TScreen,
       'property DesktopWidth:Integer read TScreen__GetDesktopWidth;');
  RegisterMethod(TScreen,
       'function TScreen__GetWorkAreaRect(Self:TScreen):TRect;',
       @TScreen__GetWorkAreaRect, true);
  RegisterProperty(TScreen,
       'property WorkAreaRect:TRect read TScreen__GetWorkAreaRect;');
  RegisterMethod(TScreen,
       'function TScreen__GetWorkAreaHeight(Self:TScreen):Integer;',
       @TScreen__GetWorkAreaHeight, true);
  RegisterProperty(TScreen,
       'property WorkAreaHeight:Integer read TScreen__GetWorkAreaHeight;');
  RegisterMethod(TScreen,
       'function TScreen__GetWorkAreaLeft(Self:TScreen):Integer;',
       @TScreen__GetWorkAreaLeft, true);
  RegisterProperty(TScreen,
       'property WorkAreaLeft:Integer read TScreen__GetWorkAreaLeft;');
  RegisterMethod(TScreen,
       'function TScreen__GetWorkAreaTop(Self:TScreen):Integer;',
       @TScreen__GetWorkAreaTop, true);
  RegisterProperty(TScreen,
       'property WorkAreaTop:Integer read TScreen__GetWorkAreaTop;');
  RegisterMethod(TScreen,
       'function TScreen__GetWorkAreaWidth(Self:TScreen):Integer;',
       @TScreen__GetWorkAreaWidth, true);
  RegisterProperty(TScreen,
       'property WorkAreaWidth:Integer read TScreen__GetWorkAreaWidth;');
  RegisterMethod(TScreen,
       'function TScreen__GetHintFont(Self:TScreen):TFont;',
       @TScreen__GetHintFont, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutHintFont(Self:TScreen;const Value: TFont);',
       @TScreen__PutHintFont, true);
  RegisterProperty(TScreen,
       'property HintFont:TFont read TScreen__GetHintFont write TScreen__PutHintFont;');
  RegisterMethod(TScreen,
       'function TScreen__GetIconFont(Self:TScreen):TFont;',
       @TScreen__GetIconFont, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutIconFont(Self:TScreen;const Value: TFont);',
       @TScreen__PutIconFont, true);
  RegisterProperty(TScreen,
       'property IconFont:TFont read TScreen__GetIconFont write TScreen__PutIconFont;');
  RegisterMethod(TScreen,
       'function TScreen__GetMenuFont(Self:TScreen):TFont;',
       @TScreen__GetMenuFont, true);
  RegisterMethod(TScreen,
       'procedure TScreen__PutMenuFont(Self:TScreen;const Value: TFont);',
       @TScreen__PutMenuFont, true);
  RegisterProperty(TScreen,
       'property MenuFont:TFont read TScreen__GetMenuFont write TScreen__PutMenuFont;');
  RegisterMethod(TScreen,
       'function TScreen__GetFonts(Self:TScreen):TStrings;',
       @TScreen__GetFonts, true);
  RegisterProperty(TScreen,
       'property Fonts:TStrings read TScreen__GetFonts;');
  RegisterMethod(TScreen,
       'function TScreen__GetFormCount(Self:TScreen):Integer;',
       @TScreen__GetFormCount, true);
  RegisterProperty(TScreen,
       'property FormCount:Integer read TScreen__GetFormCount;');
  RegisterMethod(TScreen,
       'function TScreen__GetForms(Self:TScreen;Index: Integer):TForm;',
       @TScreen__GetForms, true);
  RegisterProperty(TScreen,
       'property Forms[Index: Integer]:TForm read TScreen__GetForms;');
  RegisterMethod(TScreen,
       'function TScreen__GetImes(Self:TScreen):TStrings;',
       @TScreen__GetImes, true);
  RegisterProperty(TScreen,
       'property Imes:TStrings read TScreen__GetImes;');
  RegisterMethod(TScreen,
       'function TScreen__GetDefaultIme(Self:TScreen):String;',
       @TScreen__GetDefaultIme, true);
  RegisterProperty(TScreen,
       'property DefaultIme:String read TScreen__GetDefaultIme;');
  RegisterMethod(TScreen,
       'function TScreen__GetDefaultKbLayout(Self:TScreen):HKL;',
       @TScreen__GetDefaultKbLayout, true);
  RegisterProperty(TScreen,
       'property DefaultKbLayout:HKL read TScreen__GetDefaultKbLayout;');
  RegisterMethod(TScreen,
       'function TScreen__GetHeight(Self:TScreen):Integer;',
       @TScreen__GetHeight, true);
  RegisterProperty(TScreen,
       'property Height:Integer read TScreen__GetHeight;');
  RegisterMethod(TScreen,
       'function TScreen__GetPixelsPerInch(Self:TScreen):Integer;',
       @TScreen__GetPixelsPerInch, true);
  RegisterProperty(TScreen,
       'property PixelsPerInch:Integer read TScreen__GetPixelsPerInch;');
  RegisterMethod(TScreen,
       'function TScreen__GetPrimaryMonitor(Self:TScreen):TMonitor;',
       @TScreen__GetPrimaryMonitor, true);
  RegisterProperty(TScreen,
       'property PrimaryMonitor:TMonitor read TScreen__GetPrimaryMonitor;');
  RegisterMethod(TScreen,
       'function TScreen__GetWidth(Self:TScreen):Integer;',
       @TScreen__GetWidth, true);
  RegisterProperty(TScreen,
       'property Width:Integer read TScreen__GetWidth;');
  // End of class TScreen
  RegisterRTTIType(TypeInfo(TTimerMode));
  // Begin of class TApplication
  RegisterClassType(TApplication, H);
  RegisterMethod(TApplication,
       'constructor Create(AOwner: TComponent); override;',
       @TApplication.Create);
  RegisterMethod(TApplication,
       'destructor Destroy; override;',
       @TApplication.Destroy);
  RegisterMethod(TApplication,
       'procedure ActivateHint(CursorPos: TPoint);',
       @TApplication.ActivateHint);
  RegisterMethod(TApplication,
       'function AddPopupForm(APopupForm: TCustomForm): Integer;',
       @TApplication.AddPopupForm);
  RegisterStdMethodEx(TApplication,'BringToFront',TApplication_BringToFront,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure ControlDestroyed(Control: TControl);',
       @TApplication.ControlDestroyed);
  RegisterStdMethodEx(TApplication,'CancelHint',TApplication_CancelHint,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure CreateForm(InstanceClass: TComponentClass; var Reference);',
       @TApplication.CreateForm);
  RegisterStdMethodEx(TApplication,'CreateHandle',TApplication_CreateHandle,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'DoApplicationIdle',TApplication_DoApplicationIdle,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'function ExecuteAction(Action: TBasicAction): Boolean; reintroduce;',
       @TApplication.ExecuteAction);
  RegisterMethod(TApplication,
       'procedure HandleException(Sender: TObject);',
       @TApplication.HandleException);
  RegisterStdMethodEx(TApplication,'HandleMessage',TApplication_HandleMessage,0,[typeVARIANT]);
  RegisterStdMethod(TApplication,'HelpCommand',TApplication_HelpCommand,2);
  RegisterMethod(TApplication,
       'function HelpContext(Context: THelpContext): Boolean;',
       @TApplication.HelpContext);
  RegisterStdMethodEx(TApplication,'HelpJump',TApplication_HelpJump,1,[typeSTRING,typeBOOLEAN]);
  RegisterStdMethodEx(TApplication,'HelpKeyword',TApplication_HelpKeyword,1,[typeSTRING,typeBOOLEAN]);
  RegisterStdMethodEx(TApplication,'HideHint',TApplication_HideHint,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure HintMouseMessage(Control: TControl; var Message: TMessage);',
       @TApplication.HintMouseMessage);
  RegisterMethod(TApplication,
       'procedure HookMainWindow(Hook: TWindowHook);',
       @TApplication.HookMainWindow);
  RegisterStdMethodEx(TApplication,'HookSynchronizeWakeup',TApplication_HookSynchronizeWakeup,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'Initialize',TApplication_Initialize,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'IsRightToLeft',TApplication_IsRightToLeft,0,[typeBOOLEAN]);
  RegisterMethod(TApplication,
       'function MessageBox(const Text, Caption: PChar; Flags: Longint = MB_OK): Integer;',
       @TApplication.MessageBox);
  RegisterStdMethodEx(TApplication,'Minimize',TApplication_Minimize,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'ModalStarted',TApplication_ModalStarted,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'ModalFinished',TApplication_ModalFinished,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'NormalizeAllTopMosts',TApplication_NormalizeAllTopMosts,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'NormalizeTopMosts',TApplication_NormalizeTopMosts,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'ProcessMessages',TApplication_ProcessMessages,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure RemovePopupForm(APopupForm: TCustomForm);',
       @TApplication.RemovePopupForm);
  RegisterStdMethodEx(TApplication,'Restore',TApplication_Restore,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'RestoreTopMosts',TApplication_RestoreTopMosts,0,[typeVARIANT]);
  RegisterStdMethodEx(TApplication,'Run',TApplication_Run,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure ShowException(E: Exception);',
       @TApplication.ShowException);
  RegisterStdMethodEx(TApplication,'Terminate',TApplication_Terminate,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'procedure UnhookMainWindow(Hook: TWindowHook);',
       @TApplication.UnhookMainWindow);
  RegisterStdMethodEx(TApplication,'UnhookSynchronizeWakeup',TApplication_UnhookSynchronizeWakeup,0,[typeVARIANT]);
  RegisterMethod(TApplication,
       'function UpdateAction(Action: TBasicAction): Boolean; reintroduce;',
       @TApplication.UpdateAction);
  RegisterStdMethodEx(TApplication,'UseRightToLeftAlignment',TApplication_UseRightToLeftAlignment,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TApplication,'UseRightToLeftReading',TApplication_UseRightToLeftReading,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TApplication,'UseRightToLeftScrollBar',TApplication_UseRightToLeftScrollBar,0,[typeBOOLEAN]);
  RegisterMethod(TApplication,
       'function TApplication__GetActive(Self:TApplication):Boolean;',
       @TApplication__GetActive, true);
  RegisterProperty(TApplication,
       'property Active:Boolean read TApplication__GetActive;');
  RegisterMethod(TApplication,
       'function TApplication__GetActionUpdateDelay(Self:TApplication):Integer;',
       @TApplication__GetActionUpdateDelay, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutActionUpdateDelay(Self:TApplication;const Value: Integer);',
       @TApplication__PutActionUpdateDelay, true);
  RegisterProperty(TApplication,
       'property ActionUpdateDelay:Integer read TApplication__GetActionUpdateDelay write TApplication__PutActionUpdateDelay;');
  RegisterMethod(TApplication,
       'function TApplication__GetActiveFormHandle(Self:TApplication):HWND;',
       @TApplication__GetActiveFormHandle, true);
  RegisterProperty(TApplication,
       'property ActiveFormHandle:HWND read TApplication__GetActiveFormHandle;');
  RegisterMethod(TApplication,
       'function TApplication__GetAllowTesting(Self:TApplication):Boolean;',
       @TApplication__GetAllowTesting, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutAllowTesting(Self:TApplication;const Value: Boolean);',
       @TApplication__PutAllowTesting, true);
  RegisterProperty(TApplication,
       'property AllowTesting:Boolean read TApplication__GetAllowTesting write TApplication__PutAllowTesting;');
  RegisterMethod(TApplication,
       'function TApplication__GetAutoDragDocking(Self:TApplication):Boolean;',
       @TApplication__GetAutoDragDocking, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutAutoDragDocking(Self:TApplication;const Value: Boolean);',
       @TApplication__PutAutoDragDocking, true);
  RegisterProperty(TApplication,
       'property AutoDragDocking:Boolean read TApplication__GetAutoDragDocking write TApplication__PutAutoDragDocking;');
  RegisterMethod(TApplication,
       'function TApplication__GetHelpSystem(Self:TApplication):IHelpSystem;',
       @TApplication__GetHelpSystem, true);
  RegisterProperty(TApplication,
       'property HelpSystem:IHelpSystem read TApplication__GetHelpSystem;');
  RegisterMethod(TApplication,
       'function TApplication__GetCurrentHelpFile(Self:TApplication):String;',
       @TApplication__GetCurrentHelpFile, true);
  RegisterProperty(TApplication,
       'property CurrentHelpFile:String read TApplication__GetCurrentHelpFile;');
  RegisterMethod(TApplication,
       'function TApplication__GetDialogHandle(Self:TApplication):HWnd;',
       @TApplication__GetDialogHandle, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutDialogHandle(Self:TApplication;const Value: HWnd);',
       @TApplication__PutDialogHandle, true);
  RegisterProperty(TApplication,
       'property DialogHandle:HWnd read TApplication__GetDialogHandle write TApplication__PutDialogHandle;');
  RegisterMethod(TApplication,
       'function TApplication__GetExeName(Self:TApplication):String;',
       @TApplication__GetExeName, true);
  RegisterProperty(TApplication,
       'property ExeName:String read TApplication__GetExeName;');
  RegisterMethod(TApplication,
       'function TApplication__GetHandle(Self:TApplication):HWnd;',
       @TApplication__GetHandle, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHandle(Self:TApplication;const Value: HWnd);',
       @TApplication__PutHandle, true);
  RegisterProperty(TApplication,
       'property Handle:HWnd read TApplication__GetHandle write TApplication__PutHandle;');
  RegisterMethod(TApplication,
       'function TApplication__GetHelpFile(Self:TApplication):String;',
       @TApplication__GetHelpFile, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHelpFile(Self:TApplication;const Value: String);',
       @TApplication__PutHelpFile, true);
  RegisterProperty(TApplication,
       'property HelpFile:String read TApplication__GetHelpFile write TApplication__PutHelpFile;');
  RegisterMethod(TApplication,
       'function TApplication__GetHint(Self:TApplication):String;',
       @TApplication__GetHint, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHint(Self:TApplication;const Value: String);',
       @TApplication__PutHint, true);
  RegisterProperty(TApplication,
       'property Hint:String read TApplication__GetHint write TApplication__PutHint;');
  RegisterMethod(TApplication,
       'function TApplication__GetHintColor(Self:TApplication):TColor;',
       @TApplication__GetHintColor, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHintColor(Self:TApplication;const Value: TColor);',
       @TApplication__PutHintColor, true);
  RegisterProperty(TApplication,
       'property HintColor:TColor read TApplication__GetHintColor write TApplication__PutHintColor;');
  RegisterMethod(TApplication,
       'function TApplication__GetHintHidePause(Self:TApplication):Integer;',
       @TApplication__GetHintHidePause, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHintHidePause(Self:TApplication;const Value: Integer);',
       @TApplication__PutHintHidePause, true);
  RegisterProperty(TApplication,
       'property HintHidePause:Integer read TApplication__GetHintHidePause write TApplication__PutHintHidePause;');
  RegisterMethod(TApplication,
       'function TApplication__GetHintPause(Self:TApplication):Integer;',
       @TApplication__GetHintPause, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHintPause(Self:TApplication;const Value: Integer);',
       @TApplication__PutHintPause, true);
  RegisterProperty(TApplication,
       'property HintPause:Integer read TApplication__GetHintPause write TApplication__PutHintPause;');
  RegisterMethod(TApplication,
       'function TApplication__GetHintShortCuts(Self:TApplication):Boolean;',
       @TApplication__GetHintShortCuts, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHintShortCuts(Self:TApplication;const Value: Boolean);',
       @TApplication__PutHintShortCuts, true);
  RegisterProperty(TApplication,
       'property HintShortCuts:Boolean read TApplication__GetHintShortCuts write TApplication__PutHintShortCuts;');
  RegisterMethod(TApplication,
       'function TApplication__GetHintShortPause(Self:TApplication):Integer;',
       @TApplication__GetHintShortPause, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutHintShortPause(Self:TApplication;const Value: Integer);',
       @TApplication__PutHintShortPause, true);
  RegisterProperty(TApplication,
       'property HintShortPause:Integer read TApplication__GetHintShortPause write TApplication__PutHintShortPause;');
  RegisterMethod(TApplication,
       'function TApplication__GetIcon(Self:TApplication):TIcon;',
       @TApplication__GetIcon, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutIcon(Self:TApplication;const Value: TIcon);',
       @TApplication__PutIcon, true);
  RegisterProperty(TApplication,
       'property Icon:TIcon read TApplication__GetIcon write TApplication__PutIcon;');
  RegisterMethod(TApplication,
       'function TApplication__GetMainForm(Self:TApplication):TForm;',
       @TApplication__GetMainForm, true);
  RegisterProperty(TApplication,
       'property MainForm:TForm read TApplication__GetMainForm;');
  RegisterMethod(TApplication,
       'function TApplication__GetMainFormHandle(Self:TApplication):HWND;',
       @TApplication__GetMainFormHandle, true);
  RegisterProperty(TApplication,
       'property MainFormHandle:HWND read TApplication__GetMainFormHandle;');
  RegisterMethod(TApplication,
       'function TApplication__GetModalLevel(Self:TApplication):Integer;',
       @TApplication__GetModalLevel, true);
  RegisterProperty(TApplication,
       'property ModalLevel:Integer read TApplication__GetModalLevel;');
  RegisterMethod(TApplication,
       'function TApplication__GetBiDiMode(Self:TApplication):TBiDiMode;',
       @TApplication__GetBiDiMode, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutBiDiMode(Self:TApplication;const Value: TBiDiMode);',
       @TApplication__PutBiDiMode, true);
  RegisterProperty(TApplication,
       'property BiDiMode:TBiDiMode read TApplication__GetBiDiMode write TApplication__PutBiDiMode;');
  RegisterMethod(TApplication,
       'function TApplication__GetBiDiKeyboard(Self:TApplication):String;',
       @TApplication__GetBiDiKeyboard, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutBiDiKeyboard(Self:TApplication;const Value: String);',
       @TApplication__PutBiDiKeyboard, true);
  RegisterProperty(TApplication,
       'property BiDiKeyboard:String read TApplication__GetBiDiKeyboard write TApplication__PutBiDiKeyboard;');
  RegisterMethod(TApplication,
       'function TApplication__GetNonBiDiKeyboard(Self:TApplication):String;',
       @TApplication__GetNonBiDiKeyboard, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutNonBiDiKeyboard(Self:TApplication;const Value: String);',
       @TApplication__PutNonBiDiKeyboard, true);
  RegisterProperty(TApplication,
       'property NonBiDiKeyboard:String read TApplication__GetNonBiDiKeyboard write TApplication__PutNonBiDiKeyboard;');
  RegisterMethod(TApplication,
       'function TApplication__GetPopupControlWnd(Self:TApplication):HWND;',
       @TApplication__GetPopupControlWnd, true);
  RegisterProperty(TApplication,
       'property PopupControlWnd:HWND read TApplication__GetPopupControlWnd;');
  RegisterMethod(TApplication,
       'function TApplication__GetShowHint(Self:TApplication):Boolean;',
       @TApplication__GetShowHint, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutShowHint(Self:TApplication;const Value: Boolean);',
       @TApplication__PutShowHint, true);
  RegisterProperty(TApplication,
       'property ShowHint:Boolean read TApplication__GetShowHint write TApplication__PutShowHint;');
  RegisterMethod(TApplication,
       'function TApplication__GetShowMainForm(Self:TApplication):Boolean;',
       @TApplication__GetShowMainForm, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutShowMainForm(Self:TApplication;const Value: Boolean);',
       @TApplication__PutShowMainForm, true);
  RegisterProperty(TApplication,
       'property ShowMainForm:Boolean read TApplication__GetShowMainForm write TApplication__PutShowMainForm;');
  RegisterMethod(TApplication,
       'function TApplication__GetTerminated(Self:TApplication):Boolean;',
       @TApplication__GetTerminated, true);
  RegisterProperty(TApplication,
       'property Terminated:Boolean read TApplication__GetTerminated;');
  RegisterMethod(TApplication,
       'function TApplication__GetTitle(Self:TApplication):String;',
       @TApplication__GetTitle, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutTitle(Self:TApplication;const Value: String);',
       @TApplication__PutTitle, true);
  RegisterProperty(TApplication,
       'property Title:String read TApplication__GetTitle write TApplication__PutTitle;');
  RegisterMethod(TApplication,
       'function TApplication__GetUpdateFormatSettings(Self:TApplication):Boolean;',
       @TApplication__GetUpdateFormatSettings, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutUpdateFormatSettings(Self:TApplication;const Value: Boolean);',
       @TApplication__PutUpdateFormatSettings, true);
  RegisterProperty(TApplication,
       'property UpdateFormatSettings:Boolean read TApplication__GetUpdateFormatSettings write TApplication__PutUpdateFormatSettings;');
  RegisterMethod(TApplication,
       'function TApplication__GetUpdateMetricSettings(Self:TApplication):Boolean;',
       @TApplication__GetUpdateMetricSettings, true);
  RegisterMethod(TApplication,
       'procedure TApplication__PutUpdateMetricSettings(Self:TApplication;const Value: Boolean);',
       @TApplication__PutUpdateMetricSettings, true);
  RegisterProperty(TApplication,
       'property UpdateMetricSettings:Boolean read TApplication__GetUpdateMetricSettings write TApplication__PutUpdateMetricSettings;');
  // End of class TApplication
  RegisterRoutine('function GetParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;', @GetParentForm, H);
  RegisterRoutine('function ValidParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;', @ValidParentForm, H);
  RegisterRoutine('function DisableTaskWindows(ActiveWindow: HWnd): Pointer;', @DisableTaskWindows, H);
  RegisterStdRoutineEx('EnableTaskWindows', _EnableTaskWindows,1,[typePOINTER,typeINTEGER], H);
  RegisterRoutine('function MakeObjectInstance(Method: TWndMethod): Pointer; deprecated;', @MakeObjectInstance, H);
  RegisterStdRoutineEx('FreeObjectInstance', _FreeObjectInstance,1,[typePOINTER,typeINTEGER], H);
  RegisterStdRoutine('IsAccel', _IsAccel,2, H);
  RegisterRoutine('function  Subclass3DWnd(Wnd: HWnd): Boolean;     deprecated;', @Subclass3DWnd, H);
  RegisterRoutine('procedure Subclass3DDlg(Wnd: HWnd; Flags: Word); deprecated;', @Subclass3DDlg, H);
  RegisterStdRoutineEx('SetAutoSubClass', _SetAutoSubClass,1,[typeBOOLEAN,typeINTEGER], H);
  RegisterRoutine('function AllocateHWnd(Method: TWndMethod): HWND; deprecated;', @AllocateHWnd, H);
  RegisterRoutine('procedure DeallocateHWnd(Wnd: HWND);             deprecated;', @DeallocateHWnd, H);
  RegisterStdRoutineEx('DoneCtl3D', _DoneCtl3D,0,[typeINTEGER], H);
  RegisterStdRoutineEx('InitCtl3D', _InitCtl3D,0,[typeINTEGER], H);
  RegisterRoutine('function KeysToShiftState(Keys: Word): TShiftState;', @KeysToShiftState, H);
  RegisterRoutine('function KeyDataToShiftState(KeyData: Longint): TShiftState;', @KeyDataToShiftState, H);
  RegisterRoutine('function KeyboardStateToShiftState(const KeyboardState: TKeyboardState): TShiftState; overload;', @KeyboardStateToShiftState1, H);
  RegisterRoutine('function KeyboardStateToShiftState: TShiftState; overload;', @KeyboardStateToShiftState2, H);
  RegisterStdRoutineEx('ForegroundTask', _ForegroundTask,0,[typeBOOLEAN], H);
  RegisterTypeAlias('TFocusState','Pointer');
  RegisterRoutine('function SaveFocusState: TFocusState;', @SaveFocusState, H);
  RegisterRoutine('procedure RestoreFocusState(FocusState: TFocusState);', @RestoreFocusState, H);
end;
initialization
  RegisterIMP_Forms;
end.
