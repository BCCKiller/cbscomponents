unit ErrorLog;

interface
uses SysUtils, DateUtils, Forms, DougUtl;

procedure WriteError(ErrorText:String;ErrorBase:String='ErrorLog.txt');
procedure WriteErrorDay(ErrorText:String);
procedure ViewErrorDay;

implementation
// Captures code written inline.....
// Is only on if the file ErrorLog.txt exists in the application directory

procedure WriteError(ErrorText:String;ErrorBase:String='ErrorLog.txt');
var ErrorFile: String;
var F: TextFile;
begin
  ErrorFile := ExtractFileDir( Application.ExeName )+'\'+ErrorBase;
  // only write error if receiving file already exists
  if FileExists(ErrorFile) then
  begin
    AssignFile(F,ErrorFile);
    Append(F);
    WriteLn(F,ErrorText);
    CloseFile(F);
  end;
end;

procedure WriteErrorDay(ErrorText:String);
var ErrorFile, ErrorBase: String;
var F: TextFile;
    FileDate: Integer;
begin
  case DayOfTheWeek(date) of
  1: ErrorBase := 'Error_Monday.txt';
  2: ErrorBase := 'Error_Tuesday.txt';
  3: ErrorBase := 'Error_Wednesday.txt';
  4: ErrorBase := 'Error_Thursday.txt';
  5: ErrorBase := 'Error_Friday.txt';
  else
    ErrorBase := 'Error_Weekend.txt';
  end;
  ErrorFile := ExtractFileDir( Application.ExeName )+'\'+ErrorBase;
//
  AssignFile(F,ErrorFile);
  // check for existence of file
  if FileExists(ErrorFile) then
  begin
    // check to see if file is current file or last week's
    FileDate := FileAge(ErrorFile);
    if ((date - FileDateToDateTime(FileDate)) >3) then
    begin
      ReWrite(F);  //last week's file....overwrite
      // add instructions
      WriteLn(F,'After fixing errors you will need to clear this error file if you');
      WriteLn(F,'wish to run a clean run on the same day.  It will clear itself next week');
      WriteLn(F,'************************************************************************');

    end
    else
      Append(F);  //this week....append
  end
  else
  begin
    // if file doesn't exist, create
    ReWrite(F);
      // add instructions
      WriteLn(F,'After fixing errors you will need to clear this error file if you');
      WriteLn(F,'wish to run a clean run on the same day.  It will clear itself next week');
      WriteLn(F,'************************************************************************');
  end;
  WriteLn(F,ErrorText);
  CloseFile(F);
end;

procedure ViewErrorDay;
var ErrorFile, ErrorBase: String;
var FileDate: Integer;
begin
  case DayOfTheWeek(date) of
  1: ErrorBase := 'Error_Monday.txt';
  2: ErrorBase := 'Error_Tuesday.txt';
  3: ErrorBase := 'Error_Wednesday.txt';
  4: ErrorBase := 'Error_Thursday.txt';
  5: ErrorBase := 'Error_Friday.txt';
  else
    ErrorBase := 'Error_Weekend.txt';
  end;
  ErrorFile := ExtractFileDir( Application.ExeName )+'\'+ErrorBase;
  // check for existence of file
  if FileExists(ErrorFile) then
  begin
    // check to see if file is current file or last week's
    FileDate := FileAge(ErrorFile);
    if ((date - FileDateToDateTime(FileDate)) < 3) then
      ExecNewProcess('Notepad '+ErrorFile, False);
  end
end;

end.
