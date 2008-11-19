unit SmartFields;

interface
uses Forms, Classes, Controls, SysUtils, Dialogs,
  BASE_PARSER, PaxScripter, PaxPascal,TypInfo, IMP_Dialogs, IMP_DB, IMP_Classes,
  IMP_Forms, IMP_SmartFunctions, IMP_Sysutils, IMP_Dateutils, IMP_Math, SmartFunctions;

type
 TShowEvent = (seClick,seDblClick,seEnter,seExit,seDropdown, seColumnClick, seGridLoad);
 TShowEventSet = set of TShowEvent;

 TSmartEvents = class(TPersistent)
  private
    FCBSExit: String;
    FCBSDoubleClick: String;
    FCBSDropDown: String;
    FCBSEnter: String;
    FCBSClick: String;
    FShowEvents: TShowEventSet;
    FCBSColumnClick: String;
    FCBSGridLoad: String;
    procedure SetCBSClick(const Value: String);
    procedure SetCBSDoubleClick(const Value: String);
    procedure SetCBSDropDown(const Value: String);
    procedure SetCBSEnter(const Value: String);
    procedure SetCBSExit(const Value: String);
    procedure SetShowEvents(const Value: TShowEventSet);
    procedure SetCBSColumnClick(const Value: String);
    procedure SetCBSGridLoad(const Value: String);
 public
   constructor Create(AOwner: TComponent);
   destructor Destroy; override;
   procedure Assign(Source: TPersistent);override;
   property ShowEvents: TShowEventSet read FShowEvents write SetShowEvents;
 published
   property CBSClick: String read FCBSClick write SetCBSClick;
   property CBSDblClick: String read FCBSDoubleClick write SetCBSDoubleClick;
   property CBSEnter: String read FCBSEnter write SetCBSEnter;
   property CBSExit: String read FCBSExit write SetCBSExit;
   property CBSDropDown: String read FCBSDropDown write SetCBSDropDown;
   property CBSColumnClick: String read FCBSColumnClick write SetCBSColumnClick;
   property CBSGridLoad: String read FCBSGridLoad write SetCBSGridLoad;
 end;

type TCustomSmartEngine = class(TComponent)
private
  FCallFunctions: TCalledFunctions;
  FScriptEngine: TPaxScripter;
  FPaxPascal: TPaxPascal;
  FScriptName: String;
  procedure SetCallFunctions(const Value: TCalledFunctions);
  procedure SetMasterForm(const Value: TForm);
  function GetMasterForm: TForm;
  procedure SetScriptName(const Value: String);
  property PaxPascal: TPaxPascal read FPaxPascal;
  property CallFunctions: TCalledFunctions read FCallFunctions write SetCallFunctions;
public
  constructor Create(AComponent: TComponent); override;
  destructor Destroy;
  property ScriptEngine: TPaxScripter read FScriptEngine;
  property ScriptName: String read FScriptName write SetScriptName;
  procedure SaveAndCompile(ScriptName: String);
  procedure SetSmartFields(SentForm: TForm);
  property MasterForm: TForm read GetMasterForm write SetMasterForm;
end;

type TSmartEngine = class(TCustomSmartEngine);


implementation

{ TCustomSmartEngine }
uses PropList;

procedure TCustomSmartEngine.SetSmartFields(SentForm: TForm);
var
  x,y: Integer;
  P: TProperty;
  ScriptRef, EventName: String;
  CurrentForm: TForm;
begin
  CurrentForm := SentForm as TForm;
  with TPropertyList.Create(nil) do
  try
    for x := 0 to CurrentForm.ComponentCount - 1 do
    begin
      Instance := CurrentForm.Components[x];
      Root := CurrentForm.Components[x];
      P := FindProperty('SmartEvents');
      if Assigned(P) then
      begin
        for y := 0 to 5 do
        begin
          ScriptRef := '';
          case y of
          0:begin
            ScriptRef := P.Properties.FindProperty('CBSClick').AsString;
            EventName := 'OnClick';
            end;
          1:begin
            ScriptRef := P.Properties.FindProperty('CBSDblClick').AsString;
            EventName := 'OnDblClick';
            end;
          2:begin
            ScriptRef := P.Properties.FindProperty('CBSEnter').AsString;
            EventName := 'OnEnter';
            end;
          3:begin
            ScriptRef := P.Properties.FindProperty('CBSExit').AsString;
            EventName := 'OnExit';
            end;
          4:begin
            ScriptRef := P.Properties.FindProperty('CBSDropDown').AsString;
            EventName := 'OnDropDown';
            end;
           5:begin
            ScriptRef := P.Properties.FindProperty('CBSColumnClick').AsString;
            EventName := 'OnTitleClick';
            end;
          end;
          if not (ScriptRef = '') then
            ScriptEngine.AssignEventHandler(CurrentForm.Components[x],EventName,ScriptRef);
        end;
      end;
    end;
  finally
    Free;
  end;
end;


constructor TCustomSmartEngine.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);
  FScriptEngine := TPaxScripter.Create(Self);
  FPaxPascal := TPaxPascal.Create(Self);
  FCallFunctions := TCalledFunctions.Create(Self);
end;

destructor TCustomSmartEngine.Destroy;
begin
  FCallFunctions.MainForm := nil;
end;

procedure TCustomSmartEngine.SaveAndCompile(ScriptName: String);
begin

ScriptName := Trim( ScriptName );
FScriptEngine.ResetScripter;
FScriptEngine.RegisterObject('SF',FCallFunctions);
FScriptEngine.AddModule('AllEvents','PaxPascal');
FScriptEngine.AddCodeFromFile('AllEvents' , ScriptName + '.SMS' );
FScriptEngine.Compile();
FScriptEngine.SaveToFile( ScriptName + '.SME' );

end;

procedure TCustomSmartEngine.SetScriptName(const Value: String);
begin
  if FScriptName <> Value then
  begin
    if FileExists(Value) then
    begin
      FScriptEngine.ResetScripter;
      FScriptEngine.RegisterObject('SF',FCallFunctions);
      FScriptName := Value;
      FScriptEngine.LoadFromFile(FScriptName);
      FScriptEngine.Run();
    end
    else
      ShowMessage(Value + ' does not exist');
  end;
end;

procedure TCustomSmartEngine.SetMasterForm(const Value: TForm);
begin
  FCallFunctions.MainForm := Value;
  FScriptEngine.ResetScripter;
  ScriptEngine.RegisterObject('SF',FCallFunctions);
  if not (FScriptName = '') then ScriptEngine.Run();
end;

function TCustomSmartEngine.GetMasterForm: TForm;
begin

end;

procedure TCustomSmartEngine.SetCallFunctions(const Value: TCalledFunctions);
begin
  FCallFunctions := Value;
end;

{ TSmartEvents }

procedure TSmartEvents.SetCBSExit(const Value: String);
begin
  FCBSExit := Value;
end;

procedure TSmartEvents.SetCBSGridLoad(const Value: String);
begin
  FCBSGridLoad := Value;
end;

procedure TSmartEvents.SetCBSDoubleClick(const Value: String);
begin
  FCBSDoubleClick := Value;
end;

procedure TSmartEvents.SetCBSDropDown(const Value: String);
begin
  FCBSDropDown := Value;
end;

procedure TSmartEvents.SetCBSEnter(const Value: String);
begin
  FCBSEnter := Value;
end;

procedure TSmartEvents.SetCBSClick(const Value: String);
begin
  FCBSClick := Value;
end;

procedure TSmartEvents.SetCBSColumnClick(const Value: String);
begin
  FCBSColumnClick := Value;
end;

constructor TSmartEvents.Create(AOwner: TComponent);
begin
  inherited Create;
end;

destructor TSmartEvents.Destroy;
begin
  inherited;
end;

procedure TSmartEvents.Assign(Source: TPersistent);
begin
  inherited;
end;

procedure TSmartEvents.SetShowEvents(const Value: TShowEventSet);
begin
  FShowEvents := Value;
end;

end.
