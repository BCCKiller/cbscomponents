unit IMP_SmartFunctions;
interface
uses
  Forms,
  Classes,
  SmartFunctions,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_SmartFunctions;
implementation
procedure TCalledFunctions_UpdateHPI(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCalledFunctions(Self).UpdateHPI();
end;
procedure TCalledFunctions_CalcAge1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := TCalledFunctions(Self).CalcAge(Params[0].AsString);
end;
procedure TCalledFunctions_ShowValue(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
TCalledFunctions(Self).ShowValue(Params[0].AsString);
end;
function TCalledFunctions__GetMainForm(Self:TCalledFunctions):TForm;
begin
  result := Self.MainForm;
end;
procedure TCalledFunctions__PutMainForm(Self:TCalledFunctions;const Value: TForm);
begin
  Self.MainForm := Value;
end;
procedure RegisterIMP_SmartFunctions;
var H: Integer;
begin
  H := RegisterNamespace('SmartFunctions', -1);
  // Begin of class TCalledFunctions
  RegisterClassType(TCalledFunctions, H);
  RegisterMethod(TCalledFunctions,
       'procedure EvaluateValues(FieldList: array of string;ValueList: array of Integer;TheMessage: String='''');',
       @TCalledFunctions.EvaluateValues);
  RegisterStdMethodEx(TCalledFunctions,'UpdateHPI',TCalledFunctions_UpdateHPI,0,[typeVARIANT]);
  RegisterStdMethodEx(TCalledFunctions,'CalcAge',TCalledFunctions_CalcAge1,1,[typeSTRING,typeINTEGER]);
  RegisterStdMethodEx(TCalledFunctions,'ShowValue',TCalledFunctions_ShowValue,1,[typeSTRING,typeVARIANT]);
  RegisterMethod(TCalledFunctions,
       'function TCalledFunctions__GetMainForm(Self:TCalledFunctions):TForm;',
       @TCalledFunctions__GetMainForm, true);
  RegisterMethod(TCalledFunctions,
       'procedure TCalledFunctions__PutMainForm(Self:TCalledFunctions;const Value: TForm);',
       @TCalledFunctions__PutMainForm, true);
  RegisterProperty(TCalledFunctions,
       'property MainForm:TForm read TCalledFunctions__GetMainForm write TCalledFunctions__PutMainForm;');
  RegisterMethod(TCalledFunctions,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCalledFunctions.Create);
  // End of class TCalledFunctions
end;
initialization
  RegisterIMP_SmartFunctions;
end.
