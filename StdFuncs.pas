unit StdFuncs;

interface
uses Windows, Dialogs, Forms;
type
TMyContainer = class(TObject)
public
procedure DisplayMessage(Sender: TObject);
end;


implementation

procedure TMyContainer.DisplayMessage(Sender: TObject);
var Message: String;
begin
  Message := 'Help';
  ShowMessage(Message);
end;

end.
