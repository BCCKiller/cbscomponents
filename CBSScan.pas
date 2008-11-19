unit CBSScan;

interface

uses Classes, SysUtils;

type TMMOpenDialog = class(TComponent)

end;
type TMMSaveDialog = class(TComponent)

end;
type ILDBDocumentImage = class(TComponent)

end;
type TILDBDocImageToolbar = class(TComponent)

end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Link',[TMMOpenDialog, TMMSaveDialog, ILDBDocumentImage, TILDBDocImageToolbar]);

end;

end.
