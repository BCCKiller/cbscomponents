unit IMP_Controls;
interface
uses
  Messages,
  Types,
  Windows,
  MultiMon,
  Classes,
  SysUtils,
  Graphics,
  Menus,
  CommCtrl,
  Imm,
  ImgList,
  ActnList,
  Controls,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_Controls;
implementation
procedure TDragObject_AfterConstruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragObject(Self).AfterConstruction();
end;
procedure TDragObject_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragObject(Self).BeforeDestruction();
end;
procedure TDragObject_GetName(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := TDragObject(Self).GetName();
end;
procedure TDragObject_HideDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragObject(Self).HideDragImage();
end;
procedure TDragObject_ShowDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragObject(Self).ShowDragImage();
end;
function TDragObject__GetAlwaysShowDragImages(Self:TDragObject):Boolean;
begin
  result := Self.AlwaysShowDragImages;
end;
procedure TDragObject__PutAlwaysShowDragImages(Self:TDragObject;const Value: Boolean);
begin
  Self.AlwaysShowDragImages := Value;
end;
function TDragObject__GetCancelling(Self:TDragObject):Boolean;
begin
  result := Self.Cancelling;
end;
procedure TDragObject__PutCancelling(Self:TDragObject;const Value: Boolean);
begin
  Self.Cancelling := Value;
end;
function TDragObject__GetDragHandle(Self:TDragObject):HWND;
begin
  result := Self.DragHandle;
end;
procedure TDragObject__PutDragHandle(Self:TDragObject;const Value: HWND);
begin
  Self.DragHandle := Value;
end;
function TDragObject__GetDragPos(Self:TDragObject):TPoint;
begin
  result := Self.DragPos;
end;
procedure TDragObject__PutDragPos(Self:TDragObject;const Value: TPoint);
begin
  Self.DragPos := Value;
end;
function TDragObject__GetDragTargetPos(Self:TDragObject):TPoint;
begin
  result := Self.DragTargetPos;
end;
procedure TDragObject__PutDragTargetPos(Self:TDragObject;const Value: TPoint);
begin
  Self.DragTargetPos := Value;
end;
function TDragObject__GetDragTarget(Self:TDragObject):Pointer;
begin
  result := Self.DragTarget;
end;
procedure TDragObject__PutDragTarget(Self:TDragObject;const Value: Pointer);
begin
  Self.DragTarget := Value;
end;
function TDragObject__GetDropped(Self:TDragObject):Boolean;
begin
  result := Self.Dropped;
end;
function TDragObject__GetMouseDeltaX(Self:TDragObject):Double;
begin
  result := Self.MouseDeltaX;
end;
function TDragObject__GetMouseDeltaY(Self:TDragObject):Double;
begin
  result := Self.MouseDeltaY;
end;
function TDragObject__GetRightClickCancels(Self:TDragObject):Boolean;
begin
  result := Self.RightClickCancels;
end;
procedure TDragObject__PutRightClickCancels(Self:TDragObject;const Value: Boolean);
begin
  Self.RightClickCancels := Value;
end;
procedure TDragObjectEx_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragObjectEx(Self).BeforeDestruction();
end;
function TBaseDragControlObject__GetControl(Self:TBaseDragControlObject):TControl;
begin
  result := Self.Control;
end;
procedure TBaseDragControlObject__PutControl(Self:TBaseDragControlObject;const Value: TControl);
begin
  Self.Control := Value;
end;
procedure TDragControlObject_HideDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragControlObject(Self).HideDragImage();
end;
procedure TDragControlObject_ShowDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragControlObject(Self).ShowDragImage();
end;
procedure TDragControlObjectEx_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragControlObjectEx(Self).BeforeDestruction();
end;
function TDragDockObject__GetBrush(Self:TDragDockObject):TBrush;
begin
  result := Self.Brush;
end;
procedure TDragDockObject__PutBrush(Self:TDragDockObject;const Value: TBrush);
begin
  Self.Brush := Value;
end;
function TDragDockObject__GetDockRect(Self:TDragDockObject):TRect;
begin
  result := Self.DockRect;
end;
procedure TDragDockObject__PutDockRect(Self:TDragDockObject;const Value: TRect);
begin
  Self.DockRect := Value;
end;
function TDragDockObject__GetDropAlign(Self:TDragDockObject):TAlign;
begin
  result := Self.DropAlign;
end;
function TDragDockObject__GetDropOnControl(Self:TDragDockObject):TControl;
begin
  result := Self.DropOnControl;
end;
function TDragDockObject__GetFloating(Self:TDragDockObject):Boolean;
begin
  result := Self.Floating;
end;
procedure TDragDockObject__PutFloating(Self:TDragDockObject;const Value: Boolean);
begin
  Self.Floating := Value;
end;
function TDragDockObject__GetFrameWidth(Self:TDragDockObject):Integer;
begin
  result := Self.FrameWidth;
end;
procedure TDragDockObjectEx_BeforeDestruction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragDockObjectEx(Self).BeforeDestruction();
end;
procedure TControlCanvas_FreeHandle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControlCanvas(Self).FreeHandle();
end;
procedure TControlCanvas_UpdateTextFlags(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControlCanvas(Self).UpdateTextFlags();
end;
function TControlCanvas__GetControl(Self:TControlCanvas):TControl;
begin
  result := Self.Control;
end;
procedure TControlCanvas__PutControl(Self:TControlCanvas;const Value: TControl);
begin
  Self.Control := Value;
end;
function TCustomControlAction__GetDropdownMenu(Self:TCustomControlAction):TPopupMenu;
begin
  result := Self.DropdownMenu;
end;
procedure TCustomControlAction__PutDropdownMenu(Self:TCustomControlAction;const Value: TPopupMenu);
begin
  Self.DropdownMenu := Value;
end;
function TCustomControlAction__GetEnableDropdown(Self:TCustomControlAction):Boolean;
begin
  result := Self.EnableDropdown;
end;
procedure TCustomControlAction__PutEnableDropdown(Self:TCustomControlAction;const Value: Boolean);
begin
  Self.EnableDropdown := Value;
end;
function TCustomControlAction__GetPopupMenu(Self:TCustomControlAction):TPopupMenu;
begin
  result := Self.PopupMenu;
end;
procedure TCustomControlAction__PutPopupMenu(Self:TCustomControlAction;const Value: TPopupMenu);
begin
  Self.PopupMenu := Value;
end;
procedure TControl_BringToFront(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).BringToFront();
end;
procedure TControl_Dragging(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).Dragging();
end;
procedure TControl_DrawTextBiDiModeFlags(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TControl(Self).DrawTextBiDiModeFlags(Params[0].PValue^);
end;
procedure TControl_DrawTextBiDiModeFlagsReadingOnly(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TControl(Self).DrawTextBiDiModeFlagsReadingOnly();
end;
function TControl__GetEnabled(Self:TControl):Boolean;
begin
  result := Self.Enabled;
end;
procedure TControl__PutEnabled(Self:TControl;const Value: Boolean);
begin
  Self.Enabled := Value;
end;
procedure TControl_EndDrag(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).EndDrag(Params[0].AsBoolean);
end;
procedure TControl_GetTextLen(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TControl(Self).GetTextLen();
end;
procedure TControl_HasParent(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).HasParent();
end;
procedure TControl_Hide(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Hide();
end;
procedure TControl_InitiateAction(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).InitiateAction();
end;
procedure TControl_Invalidate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Invalidate();
end;
procedure TControl_IsRightToLeft(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).IsRightToLeft();
end;
procedure TControl_Perform(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := TControl(Self).Perform(Params[0].AsCardinal,Params[1].PValue^,Params[2].PValue^);
end;
procedure TControl_Refresh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Refresh();
end;
procedure TControl_Repaint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Repaint();
end;
procedure TControl_SendToBack(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).SendToBack();
end;
procedure TControl_SetBounds(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).SetBounds(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger,Params[3].AsInteger);
end;
procedure TControl_Show(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Show();
end;
procedure TControl_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TControl(Self).Update();
end;
procedure TControl_UseRightToLeftAlignment(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).UseRightToLeftAlignment();
end;
procedure TControl_UseRightToLeftReading(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).UseRightToLeftReading();
end;
procedure TControl_UseRightToLeftScrollBar(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TControl(Self).UseRightToLeftScrollBar();
end;
function TControl__GetAction(Self:TControl):TBasicAction;
begin
  result := Self.Action;
end;
procedure TControl__PutAction(Self:TControl;const Value: TBasicAction);
begin
  Self.Action := Value;
end;
function TControl__GetAlign(Self:TControl):TAlign;
begin
  result := Self.Align;
end;
procedure TControl__PutAlign(Self:TControl;const Value: TAlign);
begin
  Self.Align := Value;
end;
function TControl__GetBiDiMode(Self:TControl):TBiDiMode;
begin
  result := Self.BiDiMode;
end;
procedure TControl__PutBiDiMode(Self:TControl;const Value: TBiDiMode);
begin
  Self.BiDiMode := Value;
end;
function TControl__GetBoundsRect(Self:TControl):TRect;
begin
  result := Self.BoundsRect;
end;
procedure TControl__PutBoundsRect(Self:TControl;const Value: TRect);
begin
  Self.BoundsRect := Value;
end;
function TControl__GetClientHeight(Self:TControl):Integer;
begin
  result := Self.ClientHeight;
end;
procedure TControl__PutClientHeight(Self:TControl;const Value: Integer);
begin
  Self.ClientHeight := Value;
end;
function TControl__GetClientOrigin(Self:TControl):TPoint;
begin
  result := Self.ClientOrigin;
end;
function TControl__GetClientRect(Self:TControl):TRect;
begin
  result := Self.ClientRect;
end;
function TControl__GetClientWidth(Self:TControl):Integer;
begin
  result := Self.ClientWidth;
end;
procedure TControl__PutClientWidth(Self:TControl;const Value: Integer);
begin
  Self.ClientWidth := Value;
end;
function TControl__GetConstraints(Self:TControl):TSizeConstraints;
begin
  result := Self.Constraints;
end;
procedure TControl__PutConstraints(Self:TControl;const Value: TSizeConstraints);
begin
  Self.Constraints := Value;
end;
function TControl__GetControlState(Self:TControl):TControlState;
begin
  result := Self.ControlState;
end;
procedure TControl__PutControlState(Self:TControl;const Value: TControlState);
begin
  Self.ControlState := Value;
end;
function TControl__GetControlStyle(Self:TControl):TControlStyle;
begin
  result := Self.ControlStyle;
end;
procedure TControl__PutControlStyle(Self:TControl;const Value: TControlStyle);
begin
  Self.ControlStyle := Value;
end;
function TControl__GetDockOrientation(Self:TControl):TDockOrientation;
begin
  result := Self.DockOrientation;
end;
procedure TControl__PutDockOrientation(Self:TControl;const Value: TDockOrientation);
begin
  Self.DockOrientation := Value;
end;
function TControl__GetFloating(Self:TControl):Boolean;
begin
  result := Self.Floating;
end;
function TControl__GetFloatingDockSiteClass(Self:TControl):TWinControlClass;
begin
  result := Self.FloatingDockSiteClass;
end;
procedure TControl__PutFloatingDockSiteClass(Self:TControl;const Value: TWinControlClass);
begin
  Self.FloatingDockSiteClass := Value;
end;
function TControl__GetHostDockSite(Self:TControl):TWinControl;
begin
  result := Self.HostDockSite;
end;
procedure TControl__PutHostDockSite(Self:TControl;const Value: TWinControl);
begin
  Self.HostDockSite := Value;
end;
function TControl__GetLRDockWidth(Self:TControl):Integer;
begin
  result := Self.LRDockWidth;
end;
procedure TControl__PutLRDockWidth(Self:TControl;const Value: Integer);
begin
  Self.LRDockWidth := Value;
end;
function TControl__GetParent(Self:TControl):TWinControl;
begin
  result := Self.Parent;
end;
procedure TControl__PutParent(Self:TControl;const Value: TWinControl);
begin
  Self.Parent := Value;
end;
function TControl__GetShowHint(Self:TControl):Boolean;
begin
  result := Self.ShowHint;
end;
procedure TControl__PutShowHint(Self:TControl;const Value: Boolean);
begin
  Self.ShowHint := Value;
end;
function TControl__GetTBDockHeight(Self:TControl):Integer;
begin
  result := Self.TBDockHeight;
end;
procedure TControl__PutTBDockHeight(Self:TControl;const Value: Integer);
begin
  Self.TBDockHeight := Value;
end;
function TControl__GetUndockHeight(Self:TControl):Integer;
begin
  result := Self.UndockHeight;
end;
procedure TControl__PutUndockHeight(Self:TControl;const Value: Integer);
begin
  Self.UndockHeight := Value;
end;
function TControl__GetUndockWidth(Self:TControl):Integer;
begin
  result := Self.UndockWidth;
end;
procedure TControl__PutUndockWidth(Self:TControl;const Value: Integer);
begin
  Self.UndockWidth := Value;
end;
function TControl__GetVisible(Self:TControl):Boolean;
begin
  result := Self.Visible;
end;
procedure TControl__PutVisible(Self:TControl;const Value: Boolean);
begin
  Self.Visible := Value;
end;
function TControl__GetWindowProc(Self:TControl):TWndMethod;
begin
  result := Self.WindowProc;
end;
procedure TControl__PutWindowProc(Self:TControl;const Value: TWndMethod);
begin
  Self.WindowProc := Value;
end;
procedure TWinControl_CanFocus(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TWinControl(Self).CanFocus();
end;
procedure TWinControl_DisableAlign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).DisableAlign();
end;
function TWinControl__GetDockClientCount(Self:TWinControl):Integer;
begin
  result := Self.DockClientCount;
end;
function TWinControl__GetDockClients(Self:TWinControl;Index: Integer):TControl;
begin
  result := Self.DockClients[Index];
end;
function TWinControl__GetDockSite(Self:TWinControl):Boolean;
begin
  result := Self.DockSite;
end;
procedure TWinControl__PutDockSite(Self:TWinControl;const Value: Boolean);
begin
  Self.DockSite := Value;
end;
function TWinControl__GetDockManager(Self:TWinControl):IDockManager;
begin
  result := Self.DockManager;
end;
procedure TWinControl__PutDockManager(Self:TWinControl;const Value: IDockManager);
begin
  Self.DockManager := Value;
end;
function TWinControl__GetDoubleBuffered(Self:TWinControl):Boolean;
begin
  result := Self.DoubleBuffered;
end;
procedure TWinControl__PutDoubleBuffered(Self:TWinControl;const Value: Boolean);
begin
  Self.DoubleBuffered := Value;
end;
procedure TWinControl_EnableAlign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).EnableAlign();
end;
procedure TWinControl_FlipChildren(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).FlipChildren(Params[0].AsBoolean);
end;
procedure TWinControl_Focused(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TWinControl(Self).Focused();
end;
procedure TWinControl_HandleAllocated(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TWinControl(Self).HandleAllocated();
end;
procedure TWinControl_HandleNeeded(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).HandleNeeded();
end;
procedure TWinControl_Invalidate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).Invalidate();
end;
procedure TWinControl_Realign(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).Realign();
end;
procedure TWinControl_Repaint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).Repaint();
end;
procedure TWinControl_ScaleBy(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).ScaleBy(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TWinControl_ScrollBy(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).ScrollBy(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TWinControl_SetBounds(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).SetBounds(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger,Params[3].AsInteger);
end;
procedure TWinControl_SetFocus(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).SetFocus();
end;
procedure TWinControl_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).Update();
end;
procedure TWinControl_UpdateControlState(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TWinControl(Self).UpdateControlState();
end;
function TWinControl__GetAlignDisabled(Self:TWinControl):Boolean;
begin
  result := Self.AlignDisabled;
end;
function TWinControl__GetVisibleDockClientCount(Self:TWinControl):Integer;
begin
  result := Self.VisibleDockClientCount;
end;
function TWinControl__GetBrush(Self:TWinControl):TBrush;
begin
  result := Self.Brush;
end;
function TWinControl__GetControls(Self:TWinControl;Index: Integer):TControl;
begin
  result := Self.Controls[Index];
end;
function TWinControl__GetControlCount(Self:TWinControl):Integer;
begin
  result := Self.ControlCount;
end;
function TWinControl__GetHandle(Self:TWinControl):HWnd;
begin
  result := Self.Handle;
end;
function TWinControl__GetParentWindow(Self:TWinControl):HWnd;
begin
  result := Self.ParentWindow;
end;
procedure TWinControl__PutParentWindow(Self:TWinControl;const Value: HWnd);
begin
  Self.ParentWindow := Value;
end;
function TWinControl__GetShowing(Self:TWinControl):Boolean;
begin
  result := Self.Showing;
end;
function TWinControl__GetTabOrder(Self:TWinControl):TTabOrder;
begin
  result := Self.TabOrder;
end;
procedure TWinControl__PutTabOrder(Self:TWinControl;const Value: TTabOrder);
begin
  Self.TabOrder := Value;
end;
function TWinControl__GetTabStop(Self:TWinControl):Boolean;
begin
  result := Self.TabStop;
end;
procedure TWinControl__PutTabStop(Self:TWinControl;const Value: Boolean);
begin
  Self.TabStop := Value;
end;
function TWinControl__GetUseDockManager(Self:TWinControl):Boolean;
begin
  result := Self.UseDockManager;
end;
procedure TWinControl__PutUseDockManager(Self:TWinControl;const Value: Boolean);
begin
  Self.UseDockManager := Value;
end;
procedure THintWindow_ShouldHideHint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := THintWindow(Self).ShouldHideHint();
end;
procedure THintWindow_ReleaseHandle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
THintWindow(Self).ReleaseHandle();
end;
procedure TDragImageList_DragMove(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDragImageList(Self).DragMove(Params[0].AsInteger,Params[1].AsInteger);
end;
procedure TDragImageList_DragUnlock(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragImageList(Self).DragUnlock();
end;
procedure TDragImageList_EndDrag(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDragImageList(Self).EndDrag();
end;
procedure TDragImageList_HideDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragImageList(Self).HideDragImage();
end;
procedure TDragImageList_SetDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := TDragImageList(Self).SetDragImage(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger);
end;
procedure TDragImageList_ShowDragImage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDragImageList(Self).ShowDragImage();
end;
function TDragImageList__GetDragCursor(Self:TDragImageList):TCursor;
begin
  result := Self.DragCursor;
end;
procedure TDragImageList__PutDragCursor(Self:TDragImageList;const Value: TCursor);
begin
  Self.DragCursor := Value;
end;
function TDragImageList__GetDragHotspot(Self:TDragImageList):TPoint;
begin
  result := Self.DragHotspot;
end;
procedure TDragImageList__PutDragHotspot(Self:TDragImageList;const Value: TPoint);
begin
  Self.DragHotspot := Value;
end;
function TDragImageList__GetDragging(Self:TDragImageList):Boolean;
begin
  result := Self.Dragging;
end;
procedure TDockZone_ExpandZoneLimit(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDockZone(Self).ExpandZoneLimit(Params[0].AsInteger);
end;
procedure TDockZone_ResetChildren(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDockZone(Self).ResetChildren();
end;
procedure TDockZone_ResetZoneLimits(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDockZone(Self).ResetZoneLimits();
end;
procedure TDockZone_Update(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TDockZone(Self).Update();
end;
function TDockZone__GetChildCount(Self:TDockZone):Integer;
begin
  result := Self.ChildCount;
end;
function TDockZone__GetChildControl(Self:TDockZone):TControl;
begin
  result := Self.ChildControl;
end;
function TDockZone__GetHeight(Self:TDockZone):Integer;
begin
  result := Self.Height;
end;
function TDockZone__GetLeft(Self:TDockZone):Integer;
begin
  result := Self.Left;
end;
function TDockZone__GetLimitBegin(Self:TDockZone):Integer;
begin
  result := Self.LimitBegin;
end;
function TDockZone__GetLimitSize(Self:TDockZone):Integer;
begin
  result := Self.LimitSize;
end;
function TDockZone__GetTop(Self:TDockZone):Integer;
begin
  result := Self.Top;
end;
function TDockZone__GetVisible(Self:TDockZone):Boolean;
begin
  result := Self.Visible;
end;
function TDockZone__GetVisibleChildCount(Self:TDockZone):Integer;
begin
  result := Self.VisibleChildCount;
end;
function TDockZone__GetWidth(Self:TDockZone):Integer;
begin
  result := Self.Width;
end;
function TDockZone__GetZoneLimit(Self:TDockZone):Integer;
begin
  result := Self.ZoneLimit;
end;
procedure TDockZone__PutZoneLimit(Self:TDockZone;const Value: Integer);
begin
  Self.ZoneLimit := Value;
end;
procedure TMouse_SettingChanged(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TMouse(Self).SettingChanged(Params[0].AsInteger);
end;
function TMouse__GetCapture(Self:TMouse):HWND;
begin
  result := Self.Capture;
end;
procedure TMouse__PutCapture(Self:TMouse;const Value: HWND);
begin
  Self.Capture := Value;
end;
function TMouse__GetCursorPos(Self:TMouse):TPoint;
begin
  result := Self.CursorPos;
end;
procedure TMouse__PutCursorPos(Self:TMouse;const Value: TPoint);
begin
  Self.CursorPos := Value;
end;
function TMouse__GetDragImmediate(Self:TMouse):Boolean;
begin
  result := Self.DragImmediate;
end;
procedure TMouse__PutDragImmediate(Self:TMouse;const Value: Boolean);
begin
  Self.DragImmediate := Value;
end;
function TMouse__GetDragThreshold(Self:TMouse):Integer;
begin
  result := Self.DragThreshold;
end;
procedure TMouse__PutDragThreshold(Self:TMouse;const Value: Integer);
begin
  Self.DragThreshold := Value;
end;
function TMouse__GetMousePresent(Self:TMouse):Boolean;
begin
  result := Self.MousePresent;
end;
function TMouse__GetIsDragging(Self:TMouse):Boolean;
begin
  result := Self.IsDragging;
end;
function TMouse__GetRegWheelMessage(Self:TMouse):UINT;
begin
  result := Self.RegWheelMessage;
end;
function TMouse__GetWheelPresent(Self:TMouse):Boolean;
begin
  result := Self.WheelPresent;
end;
function TMouse__GetWheelScrollLines(Self:TMouse):Integer;
begin
  result := Self.WheelScrollLines;
end;
function TCustomListControl__GetItemIndex(Self:TCustomListControl):Integer;
begin
  result := Self.ItemIndex;
end;
procedure TCustomListControl__PutItemIndex(Self:TCustomListControl;const Value: Integer);
begin
  Self.ItemIndex := Value;
end;
function TCustomMultiSelectListControl__GetMultiSelect(Self:TCustomMultiSelectListControl):Boolean;
begin
  result := Self.MultiSelect;
end;
procedure TCustomMultiSelectListControl__PutMultiSelect(Self:TCustomMultiSelectListControl;const Value: Boolean);
begin
  Self.MultiSelect := Value;
end;
function TCustomMultiSelectListControl__GetSelCount(Self:TCustomMultiSelectListControl):Integer;
begin
  result := Self.SelCount;
end;
procedure _CancelDrag(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Controls.CancelDrag();
end;
procedure _GetShortHint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := Controls.GetShortHint(Params[0].AsString);
end;
procedure _GetLongHint(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsString := Controls.GetLongHint(Params[0].AsString);
end;
procedure _SendAppMessage(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := Controls.SendAppMessage(Params[0].AsCardinal,Params[1].PValue^,Params[2].PValue^);
end;
procedure _DragDone(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
Controls.DragDone(Params[0].AsBoolean);
end;
procedure RegisterIMP_Controls;
var H: Integer;
begin
  H := RegisterNamespace('Controls', -1);
  RegisterConstant('CM_BASE', $B000, H);
  RegisterConstant('CN_BASE', $BC00, H);
  RegisterConstant('mrNone', 0, H);
  RegisterRoutine('function IsPositiveResult(const AModalResult: TModalResult): Boolean;', @IsPositiveResult, H);
  RegisterRoutine('function IsNegativeResult(const AModalResult: TModalResult): Boolean;', @IsNegativeResult, H);
  RegisterRoutine('function IsAbortResult(const AModalResult: TModalResult): Boolean;', @IsAbortResult, H);
  RegisterRoutine('function IsAnAllResult(const AModalResult: TModalResult): Boolean;', @IsAnAllResult, H);
  RegisterRoutine('function StripAllFromResult(const AModalResult: TModalResult): TModalResult;', @StripAllFromResult, H);
  RegisterRTTIType(TypeInfo(TCursor));
  RegisterTypeAlias('TCMActivate','TWMNoParams');
  RegisterTypeAlias('TCMDeactivate','TWMNoParams');
  RegisterTypeAlias('TCMGotFocus','TWMNoParams');
  RegisterTypeAlias('TCMLostFocus','TWMNoParams');
  RegisterTypeAlias('TCMDialogKey','TWMKey');
  RegisterTypeAlias('TCMDialogChar','TWMKey');
  RegisterTypeAlias('TCMHitTest','TWMNCHitTest');
  RegisterTypeAlias('TCMEnter','TWMNoParams');
  RegisterTypeAlias('TCMExit','TWMNoParams');
  RegisterTypeAlias('TCMDesignHitTest','TWMMouse');
  RegisterTypeAlias('TCMWantSpecialKey','TWMKey');
  RegisterRTTIType(TypeInfo(TDragMessage));
  RegisterRTTIType(TypeInfo(TAlign));
  RegisterRTTIType(TypeInfo(TAlignSet));
  // Begin of class TDragObject
  RegisterClassType(TDragObject, H);
  RegisterStdMethodEx(TDragObject,'AfterConstruction',TDragObject_AfterConstruction,0,[typeVARIANT]);
  RegisterMethod(TDragObject,
       'procedure Assign(Source: TDragObject); virtual;',
       @TDragObject.Assign);
  RegisterStdMethodEx(TDragObject,'BeforeDestruction',TDragObject_BeforeDestruction,0,[typeVARIANT]);
  RegisterStdMethodEx(TDragObject,'GetName',TDragObject_GetName,0,[typeSTRING]);
  RegisterStdMethodEx(TDragObject,'HideDragImage',TDragObject_HideDragImage,0,[typeVARIANT]);
  RegisterMethod(TDragObject,
       'function Instance: THandle; virtual;',
       @TDragObject.Instance);
  RegisterStdMethodEx(TDragObject,'ShowDragImage',TDragObject_ShowDragImage,0,[typeVARIANT]);
  RegisterMethod(TDragObject,
       'function TDragObject__GetAlwaysShowDragImages(Self:TDragObject):Boolean;',
       @TDragObject__GetAlwaysShowDragImages, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutAlwaysShowDragImages(Self:TDragObject;const Value: Boolean);',
       @TDragObject__PutAlwaysShowDragImages, true);
  RegisterProperty(TDragObject,
       'property AlwaysShowDragImages:Boolean read TDragObject__GetAlwaysShowDragImages write TDragObject__PutAlwaysShowDragImages;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetCancelling(Self:TDragObject):Boolean;',
       @TDragObject__GetCancelling, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutCancelling(Self:TDragObject;const Value: Boolean);',
       @TDragObject__PutCancelling, true);
  RegisterProperty(TDragObject,
       'property Cancelling:Boolean read TDragObject__GetCancelling write TDragObject__PutCancelling;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetDragHandle(Self:TDragObject):HWND;',
       @TDragObject__GetDragHandle, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutDragHandle(Self:TDragObject;const Value: HWND);',
       @TDragObject__PutDragHandle, true);
  RegisterProperty(TDragObject,
       'property DragHandle:HWND read TDragObject__GetDragHandle write TDragObject__PutDragHandle;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetDragPos(Self:TDragObject):TPoint;',
       @TDragObject__GetDragPos, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutDragPos(Self:TDragObject;const Value: TPoint);',
       @TDragObject__PutDragPos, true);
  RegisterProperty(TDragObject,
       'property DragPos:TPoint read TDragObject__GetDragPos write TDragObject__PutDragPos;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetDragTargetPos(Self:TDragObject):TPoint;',
       @TDragObject__GetDragTargetPos, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutDragTargetPos(Self:TDragObject;const Value: TPoint);',
       @TDragObject__PutDragTargetPos, true);
  RegisterProperty(TDragObject,
       'property DragTargetPos:TPoint read TDragObject__GetDragTargetPos write TDragObject__PutDragTargetPos;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetDragTarget(Self:TDragObject):Pointer;',
       @TDragObject__GetDragTarget, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutDragTarget(Self:TDragObject;const Value: Pointer);',
       @TDragObject__PutDragTarget, true);
  RegisterProperty(TDragObject,
       'property DragTarget:Pointer read TDragObject__GetDragTarget write TDragObject__PutDragTarget;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetDropped(Self:TDragObject):Boolean;',
       @TDragObject__GetDropped, true);
  RegisterProperty(TDragObject,
       'property Dropped:Boolean read TDragObject__GetDropped;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetMouseDeltaX(Self:TDragObject):Double;',
       @TDragObject__GetMouseDeltaX, true);
  RegisterProperty(TDragObject,
       'property MouseDeltaX:Double read TDragObject__GetMouseDeltaX;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetMouseDeltaY(Self:TDragObject):Double;',
       @TDragObject__GetMouseDeltaY, true);
  RegisterProperty(TDragObject,
       'property MouseDeltaY:Double read TDragObject__GetMouseDeltaY;');
  RegisterMethod(TDragObject,
       'function TDragObject__GetRightClickCancels(Self:TDragObject):Boolean;',
       @TDragObject__GetRightClickCancels, true);
  RegisterMethod(TDragObject,
       'procedure TDragObject__PutRightClickCancels(Self:TDragObject;const Value: Boolean);',
       @TDragObject__PutRightClickCancels, true);
  RegisterProperty(TDragObject,
       'property RightClickCancels:Boolean read TDragObject__GetRightClickCancels write TDragObject__PutRightClickCancels;');
  RegisterMethod(TDragObject,
       'constructor Create;',
       @TDragObject.Create);
  // End of class TDragObject
  // Begin of class TDragObjectEx
  RegisterClassType(TDragObjectEx, H);
  RegisterStdMethodEx(TDragObjectEx,'BeforeDestruction',TDragObjectEx_BeforeDestruction,0,[typeVARIANT]);
  RegisterMethod(TDragObjectEx,
       'constructor Create;',
       @TDragObjectEx.Create);
  // End of class TDragObjectEx
  // Begin of class TBaseDragControlObject
  RegisterClassType(TBaseDragControlObject, H);
  RegisterMethod(TBaseDragControlObject,
       'constructor Create(AControl: TControl); virtual;',
       @TBaseDragControlObject.Create);
  RegisterMethod(TBaseDragControlObject,
       'procedure Assign(Source: TDragObject); override;',
       @TBaseDragControlObject.Assign);
  RegisterMethod(TBaseDragControlObject,
       'function TBaseDragControlObject__GetControl(Self:TBaseDragControlObject):TControl;',
       @TBaseDragControlObject__GetControl, true);
  RegisterMethod(TBaseDragControlObject,
       'procedure TBaseDragControlObject__PutControl(Self:TBaseDragControlObject;const Value: TControl);',
       @TBaseDragControlObject__PutControl, true);
  RegisterProperty(TBaseDragControlObject,
       'property Control:TControl read TBaseDragControlObject__GetControl write TBaseDragControlObject__PutControl;');
  // End of class TBaseDragControlObject
  // Begin of class TDragControlObject
  RegisterClassType(TDragControlObject, H);
  RegisterStdMethodEx(TDragControlObject,'HideDragImage',TDragControlObject_HideDragImage,0,[typeVARIANT]);
  RegisterStdMethodEx(TDragControlObject,'ShowDragImage',TDragControlObject_ShowDragImage,0,[typeVARIANT]);
  RegisterMethod(TDragControlObject,
       'constructor Create(AControl: TControl); virtual;',
       @TDragControlObject.Create);
  // End of class TDragControlObject
  // Begin of class TDragControlObjectEx
  RegisterClassType(TDragControlObjectEx, H);
  RegisterStdMethodEx(TDragControlObjectEx,'BeforeDestruction',TDragControlObjectEx_BeforeDestruction,0,[typeVARIANT]);
  RegisterMethod(TDragControlObjectEx,
       'constructor Create(AControl: TControl); virtual;',
       @TDragControlObjectEx.Create);
  // End of class TDragControlObjectEx
  // Begin of class TDragDockObject
  RegisterClassType(TDragDockObject, H);
  RegisterMethod(TDragDockObject,
       'constructor Create(AControl: TControl); override;',
       @TDragDockObject.Create);
  RegisterMethod(TDragDockObject,
       'destructor Destroy; override;',
       @TDragDockObject.Destroy);
  RegisterMethod(TDragDockObject,
       'procedure Assign(Source: TDragObject); override;',
       @TDragDockObject.Assign);
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetBrush(Self:TDragDockObject):TBrush;',
       @TDragDockObject__GetBrush, true);
  RegisterMethod(TDragDockObject,
       'procedure TDragDockObject__PutBrush(Self:TDragDockObject;const Value: TBrush);',
       @TDragDockObject__PutBrush, true);
  RegisterProperty(TDragDockObject,
       'property Brush:TBrush read TDragDockObject__GetBrush write TDragDockObject__PutBrush;');
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetDockRect(Self:TDragDockObject):TRect;',
       @TDragDockObject__GetDockRect, true);
  RegisterMethod(TDragDockObject,
       'procedure TDragDockObject__PutDockRect(Self:TDragDockObject;const Value: TRect);',
       @TDragDockObject__PutDockRect, true);
  RegisterProperty(TDragDockObject,
       'property DockRect:TRect read TDragDockObject__GetDockRect write TDragDockObject__PutDockRect;');
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetDropAlign(Self:TDragDockObject):TAlign;',
       @TDragDockObject__GetDropAlign, true);
  RegisterProperty(TDragDockObject,
       'property DropAlign:TAlign read TDragDockObject__GetDropAlign;');
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetDropOnControl(Self:TDragDockObject):TControl;',
       @TDragDockObject__GetDropOnControl, true);
  RegisterProperty(TDragDockObject,
       'property DropOnControl:TControl read TDragDockObject__GetDropOnControl;');
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetFloating(Self:TDragDockObject):Boolean;',
       @TDragDockObject__GetFloating, true);
  RegisterMethod(TDragDockObject,
       'procedure TDragDockObject__PutFloating(Self:TDragDockObject;const Value: Boolean);',
       @TDragDockObject__PutFloating, true);
  RegisterProperty(TDragDockObject,
       'property Floating:Boolean read TDragDockObject__GetFloating write TDragDockObject__PutFloating;');
  RegisterMethod(TDragDockObject,
       'function TDragDockObject__GetFrameWidth(Self:TDragDockObject):Integer;',
       @TDragDockObject__GetFrameWidth, true);
  RegisterProperty(TDragDockObject,
       'property FrameWidth:Integer read TDragDockObject__GetFrameWidth;');
  // End of class TDragDockObject
  // Begin of class TDragDockObjectEx
  RegisterClassType(TDragDockObjectEx, H);
  RegisterStdMethodEx(TDragDockObjectEx,'BeforeDestruction',TDragDockObjectEx_BeforeDestruction,0,[typeVARIANT]);
  RegisterMethod(TDragDockObjectEx,
       'constructor Create(AControl: TControl); override;',
       @TDragDockObjectEx.Create);
  // End of class TDragDockObjectEx
  // Begin of class TControlCanvas
  RegisterClassType(TControlCanvas, H);
  RegisterMethod(TControlCanvas,
       'destructor Destroy; override;',
       @TControlCanvas.Destroy);
  RegisterStdMethodEx(TControlCanvas,'FreeHandle',TControlCanvas_FreeHandle,0,[typeVARIANT]);
  RegisterStdMethodEx(TControlCanvas,'UpdateTextFlags',TControlCanvas_UpdateTextFlags,0,[typeVARIANT]);
  RegisterMethod(TControlCanvas,
       'function TControlCanvas__GetControl(Self:TControlCanvas):TControl;',
       @TControlCanvas__GetControl, true);
  RegisterMethod(TControlCanvas,
       'procedure TControlCanvas__PutControl(Self:TControlCanvas;const Value: TControl);',
       @TControlCanvas__PutControl, true);
  RegisterProperty(TControlCanvas,
       'property Control:TControl read TControlCanvas__GetControl write TControlCanvas__PutControl;');
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TControlCanvas
  // Begin of class TCustomControlAction
  RegisterClassType(TCustomControlAction, H);
  RegisterMethod(TCustomControlAction,
       'function TCustomControlAction__GetDropdownMenu(Self:TCustomControlAction):TPopupMenu;',
       @TCustomControlAction__GetDropdownMenu, true);
  RegisterMethod(TCustomControlAction,
       'procedure TCustomControlAction__PutDropdownMenu(Self:TCustomControlAction;const Value: TPopupMenu);',
       @TCustomControlAction__PutDropdownMenu, true);
  RegisterProperty(TCustomControlAction,
       'property DropdownMenu:TPopupMenu read TCustomControlAction__GetDropdownMenu write TCustomControlAction__PutDropdownMenu;');
  RegisterMethod(TCustomControlAction,
       'function TCustomControlAction__GetEnableDropdown(Self:TCustomControlAction):Boolean;',
       @TCustomControlAction__GetEnableDropdown, true);
  RegisterMethod(TCustomControlAction,
       'procedure TCustomControlAction__PutEnableDropdown(Self:TCustomControlAction;const Value: Boolean);',
       @TCustomControlAction__PutEnableDropdown, true);
  RegisterProperty(TCustomControlAction,
       'property EnableDropdown:Boolean read TCustomControlAction__GetEnableDropdown write TCustomControlAction__PutEnableDropdown;');
  RegisterMethod(TCustomControlAction,
       'function TCustomControlAction__GetPopupMenu(Self:TCustomControlAction):TPopupMenu;',
       @TCustomControlAction__GetPopupMenu, true);
  RegisterMethod(TCustomControlAction,
       'procedure TCustomControlAction__PutPopupMenu(Self:TCustomControlAction;const Value: TPopupMenu);',
       @TCustomControlAction__PutPopupMenu, true);
  RegisterProperty(TCustomControlAction,
       'property PopupMenu:TPopupMenu read TCustomControlAction__GetPopupMenu write TCustomControlAction__PutPopupMenu;');
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TCustomControlAction
  // Begin of class TControlAction
  RegisterClassType(TControlAction, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TControlAction
  // Begin of class TControlActionLink
  RegisterClassType(TControlActionLink, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TControlActionLink
  RegisterRTTIType(TypeInfo(TControlState));
  RegisterRTTIType(TypeInfo(TControlStyle));
  RegisterRTTIType(TypeInfo(TMouseButton));
  RegisterRTTIType(TypeInfo(TMouseActivate));
  RegisterRTTIType(TypeInfo(TDragMode));
  RegisterRTTIType(TypeInfo(TDragState));
  RegisterRTTIType(TypeInfo(TDragKind));
  RegisterRTTIType(TypeInfo(TTabOrder));
  RegisterTypeAlias('TCaption','string');
  RegisterTypeAlias('TDate','TDateTime');
  RegisterTypeAlias('TTime','TDateTime');
  RegisterRTTIType(TypeInfo(TScalingFlags));
  RegisterRTTIType(TypeInfo(TAnchorKind));
  RegisterRTTIType(TypeInfo(TAnchors));
  RegisterRTTIType(TypeInfo(TConstraintSize));
  // Begin of class TSizeConstraints
  RegisterClassType(TSizeConstraints, H);
  RegisterMethod(TSizeConstraints,
       'constructor Create(Control: TControl); virtual;',
       @TSizeConstraints.Create);
  // End of class TSizeConstraints
  RegisterTypeAlias('TWndMethod','Classes.TWndMethod');
  RegisterRTTIType(TypeInfo(TDockOrientation));
  // Begin of class TControl
  RegisterClassType(TControl, H);
  RegisterMethod(TControl,
       'constructor Create(AOwner: TComponent); override;',
       @TControl.Create);
  RegisterMethod(TControl,
       'destructor Destroy; override;',
       @TControl.Destroy);
  RegisterMethod(TControl,
       'procedure BeginDrag(Immediate: Boolean; Threshold: Integer = -1);',
       @TControl.BeginDrag);
  RegisterStdMethodEx(TControl,'BringToFront',TControl_BringToFront,0,[typeVARIANT]);
  RegisterMethod(TControl,
       'function ClientToScreen(const Point: TPoint): TPoint;',
       @TControl.ClientToScreen);
  RegisterMethod(TControl,
       'function ClientToParent(const Point: TPoint; AParent: TWinControl = nil): TPoint;',
       @TControl.ClientToParent);
  RegisterMethod(TControl,
       'procedure Dock(NewDockSite: TWinControl; ARect: TRect); dynamic;',
       @TControl.Dock);
  RegisterMethod(TControl,
       'procedure DefaultHandler(var Message); override;',
       @TControl.DefaultHandler);
  RegisterStdMethodEx(TControl,'Dragging',TControl_Dragging,0,[typeBOOLEAN]);
  RegisterMethod(TControl,
       'procedure DragDrop(Source: TObject; X, Y: Integer); dynamic;',
       @TControl.DragDrop);
  RegisterStdMethod(TControl,'DrawTextBiDiModeFlags',TControl_DrawTextBiDiModeFlags,1);
  RegisterStdMethod(TControl,'DrawTextBiDiModeFlagsReadingOnly',TControl_DrawTextBiDiModeFlagsReadingOnly,0);
  RegisterMethod(TControl,
       'function TControl__GetEnabled(Self:TControl):Boolean;',
       @TControl__GetEnabled, true);
  RegisterMethod(TControl,
       'procedure TControl__PutEnabled(Self:TControl;const Value: Boolean);',
       @TControl__PutEnabled, true);
  RegisterProperty(TControl,
       'property Enabled:Boolean read TControl__GetEnabled write TControl__PutEnabled;');
  RegisterStdMethodEx(TControl,'EndDrag',TControl_EndDrag,1,[typeBOOLEAN,typeVARIANT]);
  RegisterMethod(TControl,
       'function GetControlsAlignment: TAlignment; dynamic;',
       @TControl.GetControlsAlignment);
  RegisterMethod(TControl,
       'function GetParentComponent: TComponent; override;',
       @TControl.GetParentComponent);
  RegisterMethod(TControl,
       'function GetTextBuf(Buffer: PChar; BufSize: Integer): Integer;',
       @TControl.GetTextBuf);
  RegisterStdMethodEx(TControl,'GetTextLen',TControl_GetTextLen,0,[typeINTEGER]);
  RegisterStdMethodEx(TControl,'HasParent',TControl_HasParent,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TControl,'Hide',TControl_Hide,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'InitiateAction',TControl_InitiateAction,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'Invalidate',TControl_Invalidate,0,[typeVARIANT]);
  RegisterMethod(TControl,
       'procedure MouseWheelHandler(var Message: TMessage); dynamic;',
       @TControl.MouseWheelHandler);
  RegisterStdMethodEx(TControl,'IsRightToLeft',TControl_IsRightToLeft,0,[typeBOOLEAN]);
  RegisterMethod(TControl,
       'function ManualDock(NewDockSite: TWinControl; DropControl: TControl = nil;      ControlSide: TAlign = alNone): Boolean;',
       @TControl.ManualDock);
  RegisterMethod(TControl,
       'function ManualFloat(ScreenPos: TRect): Boolean;',
       @TControl.ManualFloat);
  RegisterStdMethod(TControl,'Perform',TControl_Perform,3);
  RegisterStdMethodEx(TControl,'Refresh',TControl_Refresh,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'Repaint',TControl_Repaint,0,[typeVARIANT]);
  RegisterMethod(TControl,
       'function ReplaceDockedControl(Control: TControl; NewDockSite: TWinControl;      DropControl: TControl; ControlSide: TAlign): Boolean;',
       @TControl.ReplaceDockedControl);
  RegisterMethod(TControl,
       'function ScreenToClient(const Point: TPoint): TPoint;',
       @TControl.ScreenToClient);
  RegisterMethod(TControl,
       'function ParentToClient(const Point: TPoint; AParent: TWinControl = nil): TPoint;',
       @TControl.ParentToClient);
  RegisterStdMethodEx(TControl,'SendToBack',TControl_SendToBack,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'SetBounds',TControl_SetBounds,4,[typeINTEGER,typeINTEGER,typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterMethod(TControl,
       'procedure SetTextBuf(Buffer: PChar);',
       @TControl.SetTextBuf);
  RegisterStdMethodEx(TControl,'Show',TControl_Show,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'Update',TControl_Update,0,[typeVARIANT]);
  RegisterStdMethodEx(TControl,'UseRightToLeftAlignment',TControl_UseRightToLeftAlignment,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TControl,'UseRightToLeftReading',TControl_UseRightToLeftReading,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TControl,'UseRightToLeftScrollBar',TControl_UseRightToLeftScrollBar,0,[typeBOOLEAN]);
  RegisterMethod(TControl,
       'function TControl__GetAction(Self:TControl):TBasicAction;',
       @TControl__GetAction, true);
  RegisterMethod(TControl,
       'procedure TControl__PutAction(Self:TControl;const Value: TBasicAction);',
       @TControl__PutAction, true);
  RegisterProperty(TControl,
       'property Action:TBasicAction read TControl__GetAction write TControl__PutAction;');
  RegisterMethod(TControl,
       'function TControl__GetAlign(Self:TControl):TAlign;',
       @TControl__GetAlign, true);
  RegisterMethod(TControl,
       'procedure TControl__PutAlign(Self:TControl;const Value: TAlign);',
       @TControl__PutAlign, true);
  RegisterProperty(TControl,
       'property Align:TAlign read TControl__GetAlign write TControl__PutAlign;');
  RegisterMethod(TControl,
       'function TControl__GetBiDiMode(Self:TControl):TBiDiMode;',
       @TControl__GetBiDiMode, true);
  RegisterMethod(TControl,
       'procedure TControl__PutBiDiMode(Self:TControl;const Value: TBiDiMode);',
       @TControl__PutBiDiMode, true);
  RegisterProperty(TControl,
       'property BiDiMode:TBiDiMode read TControl__GetBiDiMode write TControl__PutBiDiMode;');
  RegisterMethod(TControl,
       'function TControl__GetBoundsRect(Self:TControl):TRect;',
       @TControl__GetBoundsRect, true);
  RegisterMethod(TControl,
       'procedure TControl__PutBoundsRect(Self:TControl;const Value: TRect);',
       @TControl__PutBoundsRect, true);
  RegisterProperty(TControl,
       'property BoundsRect:TRect read TControl__GetBoundsRect write TControl__PutBoundsRect;');
  RegisterMethod(TControl,
       'function TControl__GetClientHeight(Self:TControl):Integer;',
       @TControl__GetClientHeight, true);
  RegisterMethod(TControl,
       'procedure TControl__PutClientHeight(Self:TControl;const Value: Integer);',
       @TControl__PutClientHeight, true);
  RegisterProperty(TControl,
       'property ClientHeight:Integer read TControl__GetClientHeight write TControl__PutClientHeight;');
  RegisterMethod(TControl,
       'function TControl__GetClientOrigin(Self:TControl):TPoint;',
       @TControl__GetClientOrigin, true);
  RegisterProperty(TControl,
       'property ClientOrigin:TPoint read TControl__GetClientOrigin;');
  RegisterMethod(TControl,
       'function TControl__GetClientRect(Self:TControl):TRect;',
       @TControl__GetClientRect, true);
  RegisterProperty(TControl,
       'property ClientRect:TRect read TControl__GetClientRect;');
  RegisterMethod(TControl,
       'function TControl__GetClientWidth(Self:TControl):Integer;',
       @TControl__GetClientWidth, true);
  RegisterMethod(TControl,
       'procedure TControl__PutClientWidth(Self:TControl;const Value: Integer);',
       @TControl__PutClientWidth, true);
  RegisterProperty(TControl,
       'property ClientWidth:Integer read TControl__GetClientWidth write TControl__PutClientWidth;');
  RegisterMethod(TControl,
       'function TControl__GetConstraints(Self:TControl):TSizeConstraints;',
       @TControl__GetConstraints, true);
  RegisterMethod(TControl,
       'procedure TControl__PutConstraints(Self:TControl;const Value: TSizeConstraints);',
       @TControl__PutConstraints, true);
  RegisterProperty(TControl,
       'property Constraints:TSizeConstraints read TControl__GetConstraints write TControl__PutConstraints;');
  RegisterMethod(TControl,
       'function TControl__GetControlState(Self:TControl):TControlState;',
       @TControl__GetControlState, true);
  RegisterMethod(TControl,
       'procedure TControl__PutControlState(Self:TControl;const Value: TControlState);',
       @TControl__PutControlState, true);
  RegisterProperty(TControl,
       'property ControlState:TControlState read TControl__GetControlState write TControl__PutControlState;');
  RegisterMethod(TControl,
       'function TControl__GetControlStyle(Self:TControl):TControlStyle;',
       @TControl__GetControlStyle, true);
  RegisterMethod(TControl,
       'procedure TControl__PutControlStyle(Self:TControl;const Value: TControlStyle);',
       @TControl__PutControlStyle, true);
  RegisterProperty(TControl,
       'property ControlStyle:TControlStyle read TControl__GetControlStyle write TControl__PutControlStyle;');
  RegisterMethod(TControl,
       'function TControl__GetDockOrientation(Self:TControl):TDockOrientation;',
       @TControl__GetDockOrientation, true);
  RegisterMethod(TControl,
       'procedure TControl__PutDockOrientation(Self:TControl;const Value: TDockOrientation);',
       @TControl__PutDockOrientation, true);
  RegisterProperty(TControl,
       'property DockOrientation:TDockOrientation read TControl__GetDockOrientation write TControl__PutDockOrientation;');
  RegisterMethod(TControl,
       'function TControl__GetFloating(Self:TControl):Boolean;',
       @TControl__GetFloating, true);
  RegisterProperty(TControl,
       'property Floating:Boolean read TControl__GetFloating;');
  RegisterMethod(TControl,
       'function TControl__GetFloatingDockSiteClass(Self:TControl):TWinControlClass;',
       @TControl__GetFloatingDockSiteClass, true);
  RegisterMethod(TControl,
       'procedure TControl__PutFloatingDockSiteClass(Self:TControl;const Value: TWinControlClass);',
       @TControl__PutFloatingDockSiteClass, true);
  RegisterProperty(TControl,
       'property FloatingDockSiteClass:TWinControlClass read TControl__GetFloatingDockSiteClass write TControl__PutFloatingDockSiteClass;');
  RegisterMethod(TControl,
       'function TControl__GetHostDockSite(Self:TControl):TWinControl;',
       @TControl__GetHostDockSite, true);
  RegisterMethod(TControl,
       'procedure TControl__PutHostDockSite(Self:TControl;const Value: TWinControl);',
       @TControl__PutHostDockSite, true);
  RegisterProperty(TControl,
       'property HostDockSite:TWinControl read TControl__GetHostDockSite write TControl__PutHostDockSite;');
  RegisterMethod(TControl,
       'function TControl__GetLRDockWidth(Self:TControl):Integer;',
       @TControl__GetLRDockWidth, true);
  RegisterMethod(TControl,
       'procedure TControl__PutLRDockWidth(Self:TControl;const Value: Integer);',
       @TControl__PutLRDockWidth, true);
  RegisterProperty(TControl,
       'property LRDockWidth:Integer read TControl__GetLRDockWidth write TControl__PutLRDockWidth;');
  RegisterMethod(TControl,
       'function TControl__GetParent(Self:TControl):TWinControl;',
       @TControl__GetParent, true);
  RegisterMethod(TControl,
       'procedure TControl__PutParent(Self:TControl;const Value: TWinControl);',
       @TControl__PutParent, true);
  RegisterProperty(TControl,
       'property Parent:TWinControl read TControl__GetParent write TControl__PutParent;');
  RegisterMethod(TControl,
       'function TControl__GetShowHint(Self:TControl):Boolean;',
       @TControl__GetShowHint, true);
  RegisterMethod(TControl,
       'procedure TControl__PutShowHint(Self:TControl;const Value: Boolean);',
       @TControl__PutShowHint, true);
  RegisterProperty(TControl,
       'property ShowHint:Boolean read TControl__GetShowHint write TControl__PutShowHint;');
  RegisterMethod(TControl,
       'function TControl__GetTBDockHeight(Self:TControl):Integer;',
       @TControl__GetTBDockHeight, true);
  RegisterMethod(TControl,
       'procedure TControl__PutTBDockHeight(Self:TControl;const Value: Integer);',
       @TControl__PutTBDockHeight, true);
  RegisterProperty(TControl,
       'property TBDockHeight:Integer read TControl__GetTBDockHeight write TControl__PutTBDockHeight;');
  RegisterMethod(TControl,
       'function TControl__GetUndockHeight(Self:TControl):Integer;',
       @TControl__GetUndockHeight, true);
  RegisterMethod(TControl,
       'procedure TControl__PutUndockHeight(Self:TControl;const Value: Integer);',
       @TControl__PutUndockHeight, true);
  RegisterProperty(TControl,
       'property UndockHeight:Integer read TControl__GetUndockHeight write TControl__PutUndockHeight;');
  RegisterMethod(TControl,
       'function TControl__GetUndockWidth(Self:TControl):Integer;',
       @TControl__GetUndockWidth, true);
  RegisterMethod(TControl,
       'procedure TControl__PutUndockWidth(Self:TControl;const Value: Integer);',
       @TControl__PutUndockWidth, true);
  RegisterProperty(TControl,
       'property UndockWidth:Integer read TControl__GetUndockWidth write TControl__PutUndockWidth;');
  RegisterMethod(TControl,
       'function TControl__GetVisible(Self:TControl):Boolean;',
       @TControl__GetVisible, true);
  RegisterMethod(TControl,
       'procedure TControl__PutVisible(Self:TControl;const Value: Boolean);',
       @TControl__PutVisible, true);
  RegisterProperty(TControl,
       'property Visible:Boolean read TControl__GetVisible write TControl__PutVisible;');
  RegisterMethod(TControl,
       'function TControl__GetWindowProc(Self:TControl):TWndMethod;',
       @TControl__GetWindowProc, true);
  RegisterMethod(TControl,
       'procedure TControl__PutWindowProc(Self:TControl;const Value: TWndMethod);',
       @TControl__PutWindowProc, true);
  RegisterProperty(TControl,
       'property WindowProc:TWndMethod read TControl__GetWindowProc write TControl__PutWindowProc;');
  // End of class TControl
  // Begin of class TWinControlActionLink
  RegisterClassType(TWinControlActionLink, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TWinControlActionLink
  RegisterRTTIType(TypeInfo(TImeMode));
  RegisterTypeAlias('TImeName','string');
  RegisterRTTIType(TypeInfo(TBorderWidth));
  RegisterRTTIType(TypeInfo(TBevelCut));
  RegisterRTTIType(TypeInfo(TBevelEdge));
  RegisterRTTIType(TypeInfo(TBevelEdges));
  RegisterRTTIType(TypeInfo(TBevelKind));
  RegisterRTTIType(TypeInfo(TBevelWidth));
  // Begin of interface IDockManager
  RegisterInterfaceType('IDockManager',IDockManager,'IUnknown',IUnknown,H);
  RegisterInterfaceMethod(IDockManager,
       'procedure BeginUpdate;');
  RegisterInterfaceMethod(IDockManager,
       'procedure EndUpdate;');
  RegisterInterfaceMethod(IDockManager,
       'procedure GetControlBounds(Control: TControl; out CtlBounds: TRect);');
  RegisterInterfaceMethod(IDockManager,
       'procedure InsertControl(Control: TControl; InsertAt: TAlign;      DropCtl: TControl);');
  RegisterInterfaceMethod(IDockManager,
       'procedure LoadFromStream(Stream: TStream);');
  RegisterInterfaceMethod(IDockManager,
       'procedure PaintSite(DC: HDC);');
  RegisterInterfaceMethod(IDockManager,
       'procedure PositionDockRect(Client, DropCtl: TControl; DropAlign: TAlign;      var DockRect: TRect);');
  RegisterInterfaceMethod(IDockManager,
       'procedure RemoveControl(Control: TControl);');
  RegisterInterfaceMethod(IDockManager,
       'procedure ResetBounds(Force: Boolean);');
  RegisterInterfaceMethod(IDockManager,
       'procedure SaveToStream(Stream: TStream);');
  RegisterInterfaceMethod(IDockManager,
       'procedure SetReplacingControl(Control: TControl);');
  // End of interface IDockManager
  // Begin of class TWinControl
  RegisterClassType(TWinControl, H);
  RegisterMethod(TWinControl,
       'constructor Create(AOwner: TComponent); override;',
       @TWinControl.Create);
  RegisterMethod(TWinControl,
       'constructor CreateParented(ParentWindow: HWnd);',
       @TWinControl.CreateParented);
  RegisterMethod(TWinControl,
       'function CreateParentedControl(ParentWindow: HWnd): TWinControl;',
       @TWinControl.CreateParentedControl);
  RegisterMethod(TWinControl,
       'destructor Destroy; override;',
       @TWinControl.Destroy);
  RegisterMethod(TWinControl,
       'procedure Broadcast(var Message);',
       @TWinControl.Broadcast);
  RegisterStdMethodEx(TWinControl,'CanFocus',TWinControl_CanFocus,0,[typeBOOLEAN]);
  RegisterMethod(TWinControl,
       'function ContainsControl(Control: TControl): Boolean;',
       @TWinControl.ContainsControl);
  RegisterMethod(TWinControl,
       'function ControlAtPos(const Pos: TPoint; AllowDisabled: Boolean;      AllowWinControls: Boolean = False; AllLevels: Boolean = False): TControl;',
       @TWinControl.ControlAtPos);
  RegisterMethod(TWinControl,
       'procedure DefaultHandler(var Message); override;',
       @TWinControl.DefaultHandler);
  RegisterStdMethodEx(TWinControl,'DisableAlign',TWinControl_DisableAlign,0,[typeVARIANT]);
  RegisterMethod(TWinControl,
       'function TWinControl__GetDockClientCount(Self:TWinControl):Integer;',
       @TWinControl__GetDockClientCount, true);
  RegisterProperty(TWinControl,
       'property DockClientCount:Integer read TWinControl__GetDockClientCount;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetDockClients(Self:TWinControl;Index: Integer):TControl;',
       @TWinControl__GetDockClients, true);
  RegisterProperty(TWinControl,
       'property DockClients[Index: Integer]:TControl read TWinControl__GetDockClients;');
  RegisterMethod(TWinControl,
       'procedure DockDrop(Source: TDragDockObject; X, Y: Integer); dynamic;',
       @TWinControl.DockDrop);
  RegisterMethod(TWinControl,
       'function TWinControl__GetDockSite(Self:TWinControl):Boolean;',
       @TWinControl__GetDockSite, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutDockSite(Self:TWinControl;const Value: Boolean);',
       @TWinControl__PutDockSite, true);
  RegisterProperty(TWinControl,
       'property DockSite:Boolean read TWinControl__GetDockSite write TWinControl__PutDockSite;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetDockManager(Self:TWinControl):IDockManager;',
       @TWinControl__GetDockManager, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutDockManager(Self:TWinControl;const Value: IDockManager);',
       @TWinControl__PutDockManager, true);
  RegisterProperty(TWinControl,
       'property DockManager:IDockManager read TWinControl__GetDockManager write TWinControl__PutDockManager;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetDoubleBuffered(Self:TWinControl):Boolean;',
       @TWinControl__GetDoubleBuffered, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutDoubleBuffered(Self:TWinControl;const Value: Boolean);',
       @TWinControl__PutDoubleBuffered, true);
  RegisterProperty(TWinControl,
       'property DoubleBuffered:Boolean read TWinControl__GetDoubleBuffered write TWinControl__PutDoubleBuffered;');
  RegisterStdMethodEx(TWinControl,'EnableAlign',TWinControl_EnableAlign,0,[typeVARIANT]);
  RegisterMethod(TWinControl,
       'function FindChildControl(const ControlName: string): TControl;',
       @TWinControl.FindChildControl);
  RegisterStdMethodEx(TWinControl,'FlipChildren',TWinControl_FlipChildren,1,[typeBOOLEAN,typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'Focused',TWinControl_Focused,0,[typeBOOLEAN]);
  RegisterMethod(TWinControl,
       'procedure GetTabOrderList(List: TList); dynamic;',
       @TWinControl.GetTabOrderList);
  RegisterStdMethodEx(TWinControl,'HandleAllocated',TWinControl_HandleAllocated,0,[typeBOOLEAN]);
  RegisterStdMethodEx(TWinControl,'HandleNeeded',TWinControl_HandleNeeded,0,[typeVARIANT]);
  RegisterMethod(TWinControl,
       'procedure InsertControl(AControl: TControl);',
       @TWinControl.InsertControl);
  RegisterStdMethodEx(TWinControl,'Invalidate',TWinControl_Invalidate,0,[typeVARIANT]);
  RegisterMethod(TWinControl,
       'function PreProcessMessage(var Msg: TMsg): Boolean; dynamic;',
       @TWinControl.PreProcessMessage);
  RegisterMethod(TWinControl,
       'procedure RemoveControl(AControl: TControl);',
       @TWinControl.RemoveControl);
  RegisterStdMethodEx(TWinControl,'Realign',TWinControl_Realign,0,[typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'Repaint',TWinControl_Repaint,0,[typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'ScaleBy',TWinControl_ScaleBy,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'ScrollBy',TWinControl_ScrollBy,2,[typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'SetBounds',TWinControl_SetBounds,4,[typeINTEGER,typeINTEGER,typeINTEGER,typeINTEGER,typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'SetFocus',TWinControl_SetFocus,0,[typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'Update',TWinControl_Update,0,[typeVARIANT]);
  RegisterStdMethodEx(TWinControl,'UpdateControlState',TWinControl_UpdateControlState,0,[typeVARIANT]);
  RegisterMethod(TWinControl,
       'function TWinControl__GetAlignDisabled(Self:TWinControl):Boolean;',
       @TWinControl__GetAlignDisabled, true);
  RegisterProperty(TWinControl,
       'property AlignDisabled:Boolean read TWinControl__GetAlignDisabled;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetVisibleDockClientCount(Self:TWinControl):Integer;',
       @TWinControl__GetVisibleDockClientCount, true);
  RegisterProperty(TWinControl,
       'property VisibleDockClientCount:Integer read TWinControl__GetVisibleDockClientCount;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetBrush(Self:TWinControl):TBrush;',
       @TWinControl__GetBrush, true);
  RegisterProperty(TWinControl,
       'property Brush:TBrush read TWinControl__GetBrush;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetControls(Self:TWinControl;Index: Integer):TControl;',
       @TWinControl__GetControls, true);
  RegisterProperty(TWinControl,
       'property Controls[Index: Integer]:TControl read TWinControl__GetControls;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetControlCount(Self:TWinControl):Integer;',
       @TWinControl__GetControlCount, true);
  RegisterProperty(TWinControl,
       'property ControlCount:Integer read TWinControl__GetControlCount;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetHandle(Self:TWinControl):HWnd;',
       @TWinControl__GetHandle, true);
  RegisterProperty(TWinControl,
       'property Handle:HWnd read TWinControl__GetHandle;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetParentWindow(Self:TWinControl):HWnd;',
       @TWinControl__GetParentWindow, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutParentWindow(Self:TWinControl;const Value: HWnd);',
       @TWinControl__PutParentWindow, true);
  RegisterProperty(TWinControl,
       'property ParentWindow:HWnd read TWinControl__GetParentWindow write TWinControl__PutParentWindow;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetShowing(Self:TWinControl):Boolean;',
       @TWinControl__GetShowing, true);
  RegisterProperty(TWinControl,
       'property Showing:Boolean read TWinControl__GetShowing;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetTabOrder(Self:TWinControl):TTabOrder;',
       @TWinControl__GetTabOrder, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutTabOrder(Self:TWinControl;const Value: TTabOrder);',
       @TWinControl__PutTabOrder, true);
  RegisterProperty(TWinControl,
       'property TabOrder:TTabOrder read TWinControl__GetTabOrder write TWinControl__PutTabOrder;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetTabStop(Self:TWinControl):Boolean;',
       @TWinControl__GetTabStop, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutTabStop(Self:TWinControl;const Value: Boolean);',
       @TWinControl__PutTabStop, true);
  RegisterProperty(TWinControl,
       'property TabStop:Boolean read TWinControl__GetTabStop write TWinControl__PutTabStop;');
  RegisterMethod(TWinControl,
       'function TWinControl__GetUseDockManager(Self:TWinControl):Boolean;',
       @TWinControl__GetUseDockManager, true);
  RegisterMethod(TWinControl,
       'procedure TWinControl__PutUseDockManager(Self:TWinControl;const Value: Boolean);',
       @TWinControl__PutUseDockManager, true);
  RegisterProperty(TWinControl,
       'property UseDockManager:Boolean read TWinControl__GetUseDockManager write TWinControl__PutUseDockManager;');
  // End of class TWinControl
  // Begin of class TGraphicControl
  RegisterClassType(TGraphicControl, H);
  RegisterMethod(TGraphicControl,
       'constructor Create(AOwner: TComponent); override;',
       @TGraphicControl.Create);
  RegisterMethod(TGraphicControl,
       'destructor Destroy; override;',
       @TGraphicControl.Destroy);
  // End of class TGraphicControl
  // Begin of class TCustomControl
  RegisterClassType(TCustomControl, H);
  RegisterMethod(TCustomControl,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomControl.Create);
  RegisterMethod(TCustomControl,
       'destructor Destroy; override;',
       @TCustomControl.Destroy);
  // End of class TCustomControl
  // Begin of class THintWindow
  RegisterClassType(THintWindow, H);
  RegisterMethod(THintWindow,
       'constructor Create(AOwner: TComponent); override;',
       @THintWindow.Create);
  RegisterMethod(THintWindow,
       'procedure ActivateHint(Rect: TRect; const AHint: string); virtual;',
       @THintWindow.ActivateHint);
  RegisterMethod(THintWindow,
       'procedure ActivateHintData(Rect: TRect; const AHint: string; AData: Pointer); virtual;',
       @THintWindow.ActivateHintData);
  RegisterMethod(THintWindow,
       'function CalcHintRect(MaxWidth: Integer; const AHint: string;      AData: Pointer): TRect; virtual;',
       @THintWindow.CalcHintRect);
  RegisterMethod(THintWindow,
       'function IsHintMsg(var Msg: TMsg): Boolean; virtual;',
       @THintWindow.IsHintMsg);
  RegisterStdMethodEx(THintWindow,'ShouldHideHint',THintWindow_ShouldHideHint,0,[typeBOOLEAN]);
  RegisterStdMethodEx(THintWindow,'ReleaseHandle',THintWindow_ReleaseHandle,0,[typeVARIANT]);
  // End of class THintWindow
  // Begin of class TDragImageList
  RegisterClassType(TDragImageList, H);
  RegisterMethod(TDragImageList,
       'function BeginDrag(Window: HWND; X, Y: Integer): Boolean;',
       @TDragImageList.BeginDrag);
  RegisterMethod(TDragImageList,
       'function DragLock(Window: HWND; XPos, YPos: Integer): Boolean;',
       @TDragImageList.DragLock);
  RegisterStdMethodEx(TDragImageList,'DragMove',TDragImageList_DragMove,2,[typeINTEGER,typeINTEGER,typeBOOLEAN]);
  RegisterStdMethodEx(TDragImageList,'DragUnlock',TDragImageList_DragUnlock,0,[typeVARIANT]);
  RegisterStdMethodEx(TDragImageList,'EndDrag',TDragImageList_EndDrag,0,[typeBOOLEAN]);
  RegisterMethod(TDragImageList,
       'function GetHotSpot: TPoint; override;',
       @TDragImageList.GetHotSpot);
  RegisterStdMethodEx(TDragImageList,'HideDragImage',TDragImageList_HideDragImage,0,[typeVARIANT]);
  RegisterStdMethodEx(TDragImageList,'SetDragImage',TDragImageList_SetDragImage,3,[typeINTEGER,typeINTEGER,typeINTEGER,typeBOOLEAN]);
  RegisterStdMethodEx(TDragImageList,'ShowDragImage',TDragImageList_ShowDragImage,0,[typeVARIANT]);
  RegisterMethod(TDragImageList,
       'function TDragImageList__GetDragCursor(Self:TDragImageList):TCursor;',
       @TDragImageList__GetDragCursor, true);
  RegisterMethod(TDragImageList,
       'procedure TDragImageList__PutDragCursor(Self:TDragImageList;const Value: TCursor);',
       @TDragImageList__PutDragCursor, true);
  RegisterProperty(TDragImageList,
       'property DragCursor:TCursor read TDragImageList__GetDragCursor write TDragImageList__PutDragCursor;');
  RegisterMethod(TDragImageList,
       'function TDragImageList__GetDragHotspot(Self:TDragImageList):TPoint;',
       @TDragImageList__GetDragHotspot, true);
  RegisterMethod(TDragImageList,
       'procedure TDragImageList__PutDragHotspot(Self:TDragImageList;const Value: TPoint);',
       @TDragImageList__PutDragHotspot, true);
  RegisterProperty(TDragImageList,
       'property DragHotspot:TPoint read TDragImageList__GetDragHotspot write TDragImageList__PutDragHotspot;');
  RegisterMethod(TDragImageList,
       'function TDragImageList__GetDragging(Self:TDragImageList):Boolean;',
       @TDragImageList__GetDragging, true);
  RegisterProperty(TDragImageList,
       'property Dragging:Boolean read TDragImageList__GetDragging;');
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TDragImageList
  // Begin of class TImageList
  RegisterClassType(TImageList, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class TImageList
  // Begin of class TDockZone
  RegisterClassType(TDockZone, H);
  RegisterMethod(TDockZone,
       'constructor Create(Tree: TDockTree);',
       @TDockZone.Create);
  RegisterStdMethodEx(TDockZone,'ExpandZoneLimit',TDockZone_ExpandZoneLimit,1,[typeINTEGER,typeVARIANT]);
  RegisterMethod(TDockZone,
       'function FirstVisibleChild: TDockZone;',
       @TDockZone.FirstVisibleChild);
  RegisterMethod(TDockZone,
       'function NextVisible: TDockZone;',
       @TDockZone.NextVisible);
  RegisterMethod(TDockZone,
       'function PrevVisible: TDockZone;',
       @TDockZone.PrevVisible);
  RegisterStdMethodEx(TDockZone,'ResetChildren',TDockZone_ResetChildren,0,[typeVARIANT]);
  RegisterStdMethodEx(TDockZone,'ResetZoneLimits',TDockZone_ResetZoneLimits,0,[typeVARIANT]);
  RegisterStdMethodEx(TDockZone,'Update',TDockZone_Update,0,[typeVARIANT]);
  RegisterMethod(TDockZone,
       'function TDockZone__GetChildCount(Self:TDockZone):Integer;',
       @TDockZone__GetChildCount, true);
  RegisterProperty(TDockZone,
       'property ChildCount:Integer read TDockZone__GetChildCount;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetChildControl(Self:TDockZone):TControl;',
       @TDockZone__GetChildControl, true);
  RegisterProperty(TDockZone,
       'property ChildControl:TControl read TDockZone__GetChildControl;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetHeight(Self:TDockZone):Integer;',
       @TDockZone__GetHeight, true);
  RegisterProperty(TDockZone,
       'property Height:Integer read TDockZone__GetHeight;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetLeft(Self:TDockZone):Integer;',
       @TDockZone__GetLeft, true);
  RegisterProperty(TDockZone,
       'property Left:Integer read TDockZone__GetLeft;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetLimitBegin(Self:TDockZone):Integer;',
       @TDockZone__GetLimitBegin, true);
  RegisterProperty(TDockZone,
       'property LimitBegin:Integer read TDockZone__GetLimitBegin;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetLimitSize(Self:TDockZone):Integer;',
       @TDockZone__GetLimitSize, true);
  RegisterProperty(TDockZone,
       'property LimitSize:Integer read TDockZone__GetLimitSize;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetTop(Self:TDockZone):Integer;',
       @TDockZone__GetTop, true);
  RegisterProperty(TDockZone,
       'property Top:Integer read TDockZone__GetTop;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetVisible(Self:TDockZone):Boolean;',
       @TDockZone__GetVisible, true);
  RegisterProperty(TDockZone,
       'property Visible:Boolean read TDockZone__GetVisible;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetVisibleChildCount(Self:TDockZone):Integer;',
       @TDockZone__GetVisibleChildCount, true);
  RegisterProperty(TDockZone,
       'property VisibleChildCount:Integer read TDockZone__GetVisibleChildCount;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetWidth(Self:TDockZone):Integer;',
       @TDockZone__GetWidth, true);
  RegisterProperty(TDockZone,
       'property Width:Integer read TDockZone__GetWidth;');
  RegisterMethod(TDockZone,
       'function TDockZone__GetZoneLimit(Self:TDockZone):Integer;',
       @TDockZone__GetZoneLimit, true);
  RegisterMethod(TDockZone,
       'procedure TDockZone__PutZoneLimit(Self:TDockZone;const Value: Integer);',
       @TDockZone__PutZoneLimit, true);
  RegisterProperty(TDockZone,
       'property ZoneLimit:Integer read TDockZone__GetZoneLimit write TDockZone__PutZoneLimit;');
  // End of class TDockZone
  // Begin of class TDockTree
  RegisterClassType(TDockTree, H);
  RegisterMethod(TDockTree,
       'constructor Create(DockSite: TWinControl); virtual;',
       @TDockTree.Create);
  RegisterMethod(TDockTree,
       'destructor Destroy; override;',
       @TDockTree.Destroy);
  RegisterMethod(TDockTree,
       'procedure PaintSite(DC: HDC); virtual;',
       @TDockTree.PaintSite);
  // End of class TDockTree
  // Begin of class TMouse
  RegisterClassType(TMouse, H);
  RegisterMethod(TMouse,
       'constructor Create;',
       @TMouse.Create);
  RegisterMethod(TMouse,
       'destructor Destroy; override;',
       @TMouse.Destroy);
  RegisterStdMethodEx(TMouse,'SettingChanged',TMouse_SettingChanged,1,[typeINTEGER,typeVARIANT]);
  RegisterMethod(TMouse,
       'function TMouse__GetCapture(Self:TMouse):HWND;',
       @TMouse__GetCapture, true);
  RegisterMethod(TMouse,
       'procedure TMouse__PutCapture(Self:TMouse;const Value: HWND);',
       @TMouse__PutCapture, true);
  RegisterProperty(TMouse,
       'property Capture:HWND read TMouse__GetCapture write TMouse__PutCapture;');
  RegisterMethod(TMouse,
       'function TMouse__GetCursorPos(Self:TMouse):TPoint;',
       @TMouse__GetCursorPos, true);
  RegisterMethod(TMouse,
       'procedure TMouse__PutCursorPos(Self:TMouse;const Value: TPoint);',
       @TMouse__PutCursorPos, true);
  RegisterProperty(TMouse,
       'property CursorPos:TPoint read TMouse__GetCursorPos write TMouse__PutCursorPos;');
  RegisterMethod(TMouse,
       'function TMouse__GetDragImmediate(Self:TMouse):Boolean;',
       @TMouse__GetDragImmediate, true);
  RegisterMethod(TMouse,
       'procedure TMouse__PutDragImmediate(Self:TMouse;const Value: Boolean);',
       @TMouse__PutDragImmediate, true);
  RegisterProperty(TMouse,
       'property DragImmediate:Boolean read TMouse__GetDragImmediate write TMouse__PutDragImmediate;');
  RegisterMethod(TMouse,
       'function TMouse__GetDragThreshold(Self:TMouse):Integer;',
       @TMouse__GetDragThreshold, true);
  RegisterMethod(TMouse,
       'procedure TMouse__PutDragThreshold(Self:TMouse;const Value: Integer);',
       @TMouse__PutDragThreshold, true);
  RegisterProperty(TMouse,
       'property DragThreshold:Integer read TMouse__GetDragThreshold write TMouse__PutDragThreshold;');
  RegisterMethod(TMouse,
       'function TMouse__GetMousePresent(Self:TMouse):Boolean;',
       @TMouse__GetMousePresent, true);
  RegisterProperty(TMouse,
       'property MousePresent:Boolean read TMouse__GetMousePresent;');
  RegisterMethod(TMouse,
       'function TMouse__GetIsDragging(Self:TMouse):Boolean;',
       @TMouse__GetIsDragging, true);
  RegisterProperty(TMouse,
       'property IsDragging:Boolean read TMouse__GetIsDragging;');
  RegisterMethod(TMouse,
       'function TMouse__GetRegWheelMessage(Self:TMouse):UINT;',
       @TMouse__GetRegWheelMessage, true);
  RegisterProperty(TMouse,
       'property RegWheelMessage:UINT read TMouse__GetRegWheelMessage;');
  RegisterMethod(TMouse,
       'function TMouse__GetWheelPresent(Self:TMouse):Boolean;',
       @TMouse__GetWheelPresent, true);
  RegisterProperty(TMouse,
       'property WheelPresent:Boolean read TMouse__GetWheelPresent;');
  RegisterMethod(TMouse,
       'function TMouse__GetWheelScrollLines(Self:TMouse):Integer;',
       @TMouse__GetWheelScrollLines, true);
  RegisterProperty(TMouse,
       'property WheelScrollLines:Integer read TMouse__GetWheelScrollLines;');
  // End of class TMouse
  // Begin of class TCustomListControl
  RegisterClassType(TCustomListControl, H);
  RegisterMethod(TCustomListControl,
       'procedure MoveSelection(Destination: TCustomListControl); virtual;',
       @TCustomListControl.MoveSelection);
  RegisterMethod(TCustomListControl,
       'function TCustomListControl__GetItemIndex(Self:TCustomListControl):Integer;',
       @TCustomListControl__GetItemIndex, true);
  RegisterMethod(TCustomListControl,
       'procedure TCustomListControl__PutItemIndex(Self:TCustomListControl;const Value: Integer);',
       @TCustomListControl__PutItemIndex, true);
  RegisterProperty(TCustomListControl,
       'property ItemIndex:Integer read TCustomListControl__GetItemIndex write TCustomListControl__PutItemIndex;');
  RegisterMethod(TCustomListControl,
       'constructor CreateParented(ParentWindow: HWnd);',
       @TCustomListControl.Create);
  // End of class TCustomListControl
  // Begin of class TCustomMultiSelectListControl
  RegisterClassType(TCustomMultiSelectListControl, H);
  RegisterMethod(TCustomMultiSelectListControl,
       'function TCustomMultiSelectListControl__GetMultiSelect(Self:TCustomMultiSelectListControl):Boolean;',
       @TCustomMultiSelectListControl__GetMultiSelect, true);
  RegisterMethod(TCustomMultiSelectListControl,
       'procedure TCustomMultiSelectListControl__PutMultiSelect(Self:TCustomMultiSelectListControl;const Value: Boolean);',
       @TCustomMultiSelectListControl__PutMultiSelect, true);
  RegisterProperty(TCustomMultiSelectListControl,
       'property MultiSelect:Boolean read TCustomMultiSelectListControl__GetMultiSelect write TCustomMultiSelectListControl__PutMultiSelect;');
  RegisterMethod(TCustomMultiSelectListControl,
       'function TCustomMultiSelectListControl__GetSelCount(Self:TCustomMultiSelectListControl):Integer;',
       @TCustomMultiSelectListControl__GetSelCount, true);
  RegisterProperty(TCustomMultiSelectListControl,
       'property SelCount:Integer read TCustomMultiSelectListControl__GetSelCount;');
  RegisterMethod(TCustomMultiSelectListControl,
       'constructor CreateParented(ParentWindow: HWnd);',
       @TCustomMultiSelectListControl.Create);
  // End of class TCustomMultiSelectListControl
  RegisterRoutine('function IsDragObject(Sender: TObject): Boolean;', @IsDragObject, H);
  RegisterRoutine('function FindControl(Handle: HWnd): TWinControl;', @FindControl, H);
  RegisterRoutine('function FindVCLWindow(const Pos: TPoint): TWinControl;', @FindVCLWindow, H);
  RegisterRoutine('function FindDragTarget(const Pos: TPoint; AllowDisabled: Boolean): TControl;', @FindDragTarget, H);
  RegisterRoutine('function GetCaptureControl: TControl;', @GetCaptureControl, H);
  RegisterRoutine('procedure SetCaptureControl(Control: TControl);', @SetCaptureControl, H);
  RegisterStdRoutineEx('CancelDrag', _CancelDrag,0,[typeINTEGER], H);
  RegisterRoutine('function CursorToString(Cursor: TCursor): string;', @CursorToString, H);
  RegisterRoutine('function StringToCursor(const S: string): TCursor;', @StringToCursor, H);
  RegisterRoutine('procedure GetCursorValues(Proc: TGetStrProc);', @GetCursorValues, H);
  RegisterRoutine('function CursorToIdent(Cursor: Longint; var Ident: string): Boolean;', @CursorToIdent, H);
  RegisterRoutine('function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean;', @IdentToCursor, H);
  RegisterStdRoutineEx('GetShortHint', _GetShortHint,1,[typeSTRING,typeSTRING], H);
  RegisterStdRoutineEx('GetLongHint', _GetLongHint,1,[typeSTRING,typeSTRING], H);
  RegisterRoutine('procedure PerformEraseBackground(Control: TControl; DC: HDC);', @PerformEraseBackground, H);
  RegisterRoutine('function InitWndProc(HWindow: HWnd; Message, WParam: Longint;  LParam: Longint): Longint; stdcall;', @InitWndProc, H);
  RegisterConstant('CTL3D_ALL', $FFFF, H);
  RegisterRoutine('procedure ChangeBiDiModeAlignment(var Alignment: TAlignment);', @ChangeBiDiModeAlignment, H);
  RegisterStdRoutine('SendAppMessage', _SendAppMessage,3, H);
  RegisterRoutine('procedure MoveWindowOrg(DC: HDC; DX, DY: Integer);', @MoveWindowOrg, H);
  RegisterRoutine('procedure SetImeMode(hWnd: HWND; Mode: TImeMode);', @SetImeMode, H);
  RegisterRoutine('procedure SetImeName(Name: TImeName);', @SetImeName, H);
  RegisterRoutine('function Win32NLSEnableIME(hWnd: HWND; Enable: Boolean): Boolean;', @Win32NLSEnableIME, H);
  RegisterRoutine('function Imm32GetContext(hWnd: HWND): HIMC;', @Imm32GetContext, H);
  RegisterRoutine('function Imm32ReleaseContext(hWnd: HWND; hImc: HIMC): Boolean;', @Imm32ReleaseContext, H);
  RegisterRoutine('function Imm32GetConversionStatus(hImc: HIMC; var Conversion, Sentence: DWORD): Boolean;', @Imm32GetConversionStatus, H);
  RegisterRoutine('function Imm32SetConversionStatus(hImc: HIMC; Conversion, Sentence: DWORD): Boolean;', @Imm32SetConversionStatus, H);
  RegisterRoutine('function Imm32SetOpenStatus(hImc: HIMC; fOpen: Boolean): Boolean;', @Imm32SetOpenStatus, H);
  RegisterRoutine('function Imm32SetCompositionWindow(hImc: HIMC; lpCompForm: PCOMPOSITIONFORM): Boolean;', @Imm32SetCompositionWindow, H);
  RegisterRoutine('function Imm32SetCompositionFont(hImc: HIMC; lpLogfont: PLOGFONTA): Boolean;', @Imm32SetCompositionFont, H);
  RegisterRoutine('function Imm32GetCompositionString(hImc: HIMC; dWord1: DWORD; lpBuf: pointer; dwBufLen: DWORD): Longint;', @Imm32GetCompositionString, H);
  RegisterRoutine('function Imm32IsIME(hKl: HKL): Boolean;', @Imm32IsIME, H);
  RegisterRoutine('function Imm32NotifyIME(hImc: HIMC; dwAction, dwIndex, dwValue: DWORD): Boolean;', @Imm32NotifyIME, H);
  RegisterStdRoutineEx('DragDone', _DragDone,1,[typeBOOLEAN,typeINTEGER], H);
end;
initialization
  RegisterIMP_Controls;
end.
