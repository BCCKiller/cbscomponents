unit NoBo;

(* **********************************************
   ***   MOVING BORDERLESS FORMS              ***
   ***                                        ***
   ***   Unit for moving and resizing         ***
   ***   borderless forms.                    ***
   ***                                        ***
   ***   Peter Fox 15 Oct 2003                ***
   ***   peter@eminent.demon.co.uk            ***
   ***                                        ***
   ***                                        ***
   **********************************************



   USE
   ----------------------------------------------
   The width of the active border defaults to 8.
   If that is not what you want then call
   NoBoSet.

   The default behaviour is to allow moving (drag the
   'top bar') and resizing.  You can block resizing
   by calling NoBoSet

   Put NoBoDwn(self,Button,X,Y); in OnMouseDown event
   Put NoBoMve(self,X,Y); in OnMouseMove event

   That's it  ...  except to let your users know
   about the facility.



   BONUS!
   ----------------------------------------------
   Instead of self, which moves the form you could
   use TControl(Sender) in the events for any
   control*.  This means an instant method of moving
   controls.

   * - Except labels,bevels,images and paintboxes which are
       not TWinControls but TGraphicControls,


   The way the code works is to set the cursor appropriately
   if the mouse enters a border zone.  When the mouse is clicked
   we use this to tell us what sort of .perform we are going
   to use.


*)

interface

uses
  Windows, Messages, SysUtils, Classes, Controls;

  procedure NoBoSet(const BorderMargin:integer; const StopResize:Boolean);
  procedure NoBoMve(Ctrl:tcontrol; X, Y: Integer);
  procedure NoBoDwn(Ctrl:Tcontrol; Button: TMouseButton; X, Y: Integer);

var
  NoBoBORDERMARGIN : integer;   // pixels active zone width  Defaults to 8
  NoBoStopResize   : boolean;   // prevent resizing          Defaults to False
const
  sc_DragMove = $f012;          // these are used by .perform
  sc_Leftsize = $f001;
  sc_Rightsize = $f002;
  sc_Upsize = $f003;
  sc_UpLeftsize = $f004;
  sc_DnRightsize = $f005;
  sc_Dnsize = $f006;
  sc_DnLeftsize = $f007;
  sc_UpRightsize = $f008;

implementation


procedure NoBoSet(const BorderMargin:integer; const StopResize:Boolean);
{ Set up the width of the active border and block resizing
  Typically set up once before the form gets shown.
  Defaults are 8 pixels and false - so can be ignored
}
begin
  NoBoBORDERMARGIN := BorderMargin;
  NoBoStopResize   := StopResize;
end;

procedure NoBoMve(Ctrl:tcontrol; X, Y: Integer);
{ The purpose of this is to indicate to the user that they can resize
  the invisible border by twiddling the cursor to the appropriate shape

  We'll use this shape if we later get a mouse-down do initiate the
  appropriate border resize
}
var
  c : tcursor;
  lm,rm,tm,bm : boolean;
begin

  // check we have a sensible value for the border width
  if (NoBoBORDERMARGIN<2) or (NoBoBORDERMARGIN>30) then NoBoBORDERMARGIN := 8;

  // are we in any BORDERMARGINin areas?
  tm := (y<NoBoBORDERMARGIN);
  if NoBoStopResize then begin
    // block resize
    lm := false;
    rm := false;
    bm := false;
  end else begin
    lm := (x < NoBoBORDERMARGIN);
    rm := (ctrl.width-x <= NoBoBORDERMARGIN);
    bm := (ctrl.height-y <= NoBoBORDERMARGIN);
  end;
  c := crdefault;

  // simple edge conditions
  if bm then c := crSizeNS;
  if tm then c := crSize;
  if (lm or rm) then c := crSizeWE;
  // corners
  if ((lm and tm) or (rm and bm)) then c := crSizeNWSE;
  if ((rm and tm) or (lm and bm)) then c := crSizeNESW;

  // change if altered
  if ctrl.cursor <> c then ctrl.cursor := c;
end;

procedure NoBoDwn(Ctrl:Tcontrol; Button: TMouseButton; X, Y: Integer);
{ if we're in the border regions as determined by the cursor shape
  then we have to initiate a border resize }
var
  resizeaction : integer;
begin

  if button <> mbLeft then exit;         // not a left click
  if ctrl.cursor = crdefault then exit;  // nothing to do


  // start the resize logic
  Resizeaction := 0;    // safety trap
  ReleaseCapture;
  if ctrl.cursor = crSizeWE then begin
    if X < NoBoBORDERMARGIN then resizeaction := sc_LeftSize
                            else resizeaction := sc_RightSize;
  end;
  if ctrl.cursor = crSizeNS then resizeaction := sc_DnSize;
  if ctrl.cursor = crSizeNWSE then begin
    if X < NoBoBORDERMARGIN then resizeaction := sc_UpLeftSize
                            else resizeaction := sc_UpRightSize;
  end;
  if ctrl.cursor = crSizeNESW then begin
    if X < NoBoBORDERMARGIN then resizeaction := sc_DnLeftSize
                            else resizeaction := sc_DnRightSize;
  end;
  if ctrl.cursor = crSize then resizeaction := sc_DragMove;

  // do the dirty deed
  // while the mouse is down the control gets dragged
  // or the edge/corner gets dragged
  if resizeaction>0 then ctrl.Perform(wm_SysCommand, resizeaction, 0);

end;



end.
