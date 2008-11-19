unit IMP_Math;
interface
uses
  SysUtils,
  Types,
  Math,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_Math;
implementation
procedure _ArcCos1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCos(Params[0].AsDouble);
end;
procedure _ArcCos2(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCos(Params[0].AsDouble);
end;
procedure _ArcCos3(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCos(Params[0].AsDouble);
end;
procedure _ArcSin4(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSin(Params[0].AsDouble);
end;
procedure _ArcSin5(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSin(Params[0].AsDouble);
end;
procedure _ArcSin6(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSin(Params[0].AsDouble);
end;
procedure _ArcTan2(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcTan2(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Tan(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Tan(Params[0].AsDouble);
end;
procedure _Cotan(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Cotan(Params[0].AsDouble);
end;
procedure _Secant(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Secant(Params[0].AsDouble);
end;
procedure _Cosecant(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Cosecant(Params[0].AsDouble);
end;
procedure _Hypot(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Hypot(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _RadToDeg(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.RadToDeg(Params[0].AsDouble);
end;
procedure _RadToGrad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.RadToGrad(Params[0].AsDouble);
end;
procedure _RadToCycle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.RadToCycle(Params[0].AsDouble);
end;
procedure _DegToRad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.DegToRad(Params[0].AsDouble);
end;
procedure _DegToGrad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.DegToGrad(Params[0].AsDouble);
end;
procedure _DegToCycle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.DegToCycle(Params[0].AsDouble);
end;
procedure _GradToRad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.GradToRad(Params[0].AsDouble);
end;
procedure _GradToDeg(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.GradToDeg(Params[0].AsDouble);
end;
procedure _GradToCycle(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.GradToCycle(Params[0].AsDouble);
end;
procedure _CycleToRad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.CycleToRad(Params[0].AsDouble);
end;
procedure _CycleToDeg(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.CycleToDeg(Params[0].AsDouble);
end;
procedure _CycleToGrad(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.CycleToGrad(Params[0].AsDouble);
end;
procedure _Cot(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Cot(Params[0].AsDouble);
end;
procedure _Sec(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Sec(Params[0].AsDouble);
end;
procedure _Csc(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Csc(Params[0].AsDouble);
end;
procedure _Cosh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Cosh(Params[0].AsDouble);
end;
procedure _Sinh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Sinh(Params[0].AsDouble);
end;
procedure _Tanh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Tanh(Params[0].AsDouble);
end;
procedure _CotH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.CotH(Params[0].AsDouble);
end;
procedure _SecH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.SecH(Params[0].AsDouble);
end;
procedure _CscH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.CscH(Params[0].AsDouble);
end;
procedure _ArcCot(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCot(Params[0].AsDouble);
end;
procedure _ArcSec(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSec(Params[0].AsDouble);
end;
procedure _ArcCsc(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCsc(Params[0].AsDouble);
end;
procedure _ArcCosh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCosh(Params[0].AsDouble);
end;
procedure _ArcSinh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSinh(Params[0].AsDouble);
end;
procedure _ArcTanh(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcTanh(Params[0].AsDouble);
end;
procedure _ArcCotH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCotH(Params[0].AsDouble);
end;
procedure _ArcSecH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcSecH(Params[0].AsDouble);
end;
procedure _ArcCscH(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.ArcCscH(Params[0].AsDouble);
end;
procedure _LnXP1(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.LnXP1(Params[0].AsDouble);
end;
procedure _Log10(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Log10(Params[0].AsDouble);
end;
procedure _Log2(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Log2(Params[0].AsDouble);
end;
procedure _LogN(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.LogN(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _IntPower(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.IntPower(Params[0].AsDouble,Params[1].AsInteger);
end;
procedure _Power7(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Power(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Power8(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Power(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Power9(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Power(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Ldexp(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Ldexp(Params[0].AsDouble,Params[1].AsInteger);
end;
procedure _Ceil(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.Ceil(Params[0].AsDouble);
end;
procedure _Floor(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.Floor(Params[0].AsDouble);
end;
procedure _Min10(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.Min(Params[0].AsInteger,Params[1].AsInteger);
end;
function Min11(const A, B: Int64): Int64; 
begin
  result := Math.Min(A,B);
end;
procedure _Min12(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Min(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Min13(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Min(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Min14(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Min(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Max15(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.Max(Params[0].AsInteger,Params[1].AsInteger);
end;
function Max16(const A, B: Int64): Int64; 
begin
  result := Math.Max(A,B);
end;
procedure _Max17(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Max(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Max18(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Max(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _Max19(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.Max(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _RandG(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.RandG(Params[0].AsDouble,Params[1].AsDouble);
end;
procedure _IsNan20(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.IsNan(Params[0].AsDouble);
end;
procedure _IsNan21(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.IsNan(Params[0].AsDouble);
end;
procedure _IsNan22(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.IsNan(Params[0].AsDouble);
end;
procedure _IsInfinite(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.IsInfinite(Params[0].AsDouble);
end;
function Sign23(const AValue: Integer): TValueSign; 
begin
  result := Math.Sign(AVALUE);
end;
function Sign24(const AValue: Int64): TValueSign; 
begin
  result := Math.Sign(AVALUE);
end;
function Sign25(const AValue: Double): TValueSign; 
begin
  result := Math.Sign(AVALUE);
end;
function CompareValue26(const A, B: Extended; Epsilon: Extended = 0): TValueRelationship; 
begin
  result := Math.CompareValue(A,B,EPSILON);
end;
function CompareValue27(const A, B: Double; Epsilon: Double = 0): TValueRelationship; 
begin
  result := Math.CompareValue(A,B,EPSILON);
end;
function CompareValue28(const A, B: Single; Epsilon: Single = 0): TValueRelationship; 
begin
  result := Math.CompareValue(A,B,EPSILON);
end;
function CompareValue29(const A, B: Integer): TValueRelationship; 
begin
  result := Math.CompareValue(A,B);
end;
function CompareValue30(const A, B: Int64): TValueRelationship; 
begin
  result := Math.CompareValue(A,B);
end;
function SameValue31(const A, B: Extended; Epsilon: Extended = 0): Boolean; 
begin
  result := Math.SameValue(A,B,EPSILON);
end;
function SameValue32(const A, B: Double; Epsilon: Double = 0): Boolean; 
begin
  result := Math.SameValue(A,B,EPSILON);
end;
function SameValue33(const A, B: Single; Epsilon: Single = 0): Boolean; 
begin
  result := Math.SameValue(A,B,EPSILON);
end;
function IsZero34(const A: Extended; Epsilon: Extended = 0): Boolean; 
begin
  result := Math.IsZero(A,EPSILON);
end;
function IsZero35(const A: Double; Epsilon: Double = 0): Boolean; 
begin
  result := Math.IsZero(A,EPSILON);
end;
function IsZero36(const A: Single; Epsilon: Single = 0): Boolean; 
begin
  result := Math.IsZero(A,EPSILON);
end;
function IfThen37(AValue: Boolean; const ATrue: Integer; const AFalse: Integer = 0): Integer; 
begin
  result := Math.IfThen(AVALUE,ATRUE,AFALSE);
end;
function IfThen38(AValue: Boolean; const ATrue: Int64; const AFalse: Int64 = 0): Int64; 
begin
  result := Math.IfThen(AVALUE,ATRUE,AFALSE);
end;
function IfThen39(AValue: Boolean; const ATrue: Double; const AFalse: Double = 0.0): Double; 
begin
  result := Math.IfThen(AVALUE,ATRUE,AFALSE);
end;
procedure _RandomRange(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.RandomRange(Params[0].AsInteger,Params[1].AsInteger);
end;
function RandomFrom40(const AValues: array of Integer): Integer; 
begin
  result := Math.RandomFrom(AVALUES);
end;
function RandomFrom41(const AValues: array of Int64): Int64; 
begin
  result := Math.RandomFrom(AVALUES);
end;
function RandomFrom42(const AValues: array of Double): Double; 
begin
  result := Math.RandomFrom(AVALUES);
end;
procedure _InRange43(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.InRange(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger);
end;
function InRange44(const AValue, AMin, AMax: Int64): Boolean; 
begin
  result := Math.InRange(AVALUE,AMIN,AMAX);
end;
procedure _InRange45(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := Math.InRange(Params[0].AsDouble,Params[1].AsDouble,Params[2].AsDouble);
end;
procedure _EnsureRange46(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsInteger := Math.EnsureRange(Params[0].AsInteger,Params[1].AsInteger,Params[2].AsInteger);
end;
function EnsureRange47(const AValue, AMin, AMax: Int64): Int64; 
begin
  result := Math.EnsureRange(AVALUE,AMIN,AMAX);
end;
procedure _EnsureRange48(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.EnsureRange(Params[0].AsDouble,Params[1].AsDouble,Params[2].AsDouble);
end;
procedure _DoubleDecliningBalance(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.DoubleDecliningBalance(Params[0].AsDouble,Params[1].AsDouble,Params[2].AsInteger,Params[3].AsInteger);
end;
procedure _SLNDepreciation(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.SLNDepreciation(Params[0].AsDouble,Params[1].AsDouble,Params[2].AsInteger);
end;
procedure _SYDDepreciation(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsDouble := Math.SYDDepreciation(Params[0].AsDouble,Params[1].AsDouble,Params[2].AsInteger,Params[3].AsInteger);
end;
procedure RegisterIMP_Math;
var H: Integer;
begin
  H := RegisterNamespace('Math', -1);
  RegisterConstant('MinSingle', 1.5e-45, H);
  RegisterConstant('MaxSingle', 3.4e+38, H);
  RegisterConstant('MinDouble', 5.0e-324, H);
  RegisterConstant('MaxComp', 9.223372036854775807e+18, H);
  RegisterStdRoutineEx('ArcCos', _ArcCos1,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCos', _ArcCos2,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCos', _ArcCos3,1,[typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSin', _ArcSin4,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSin', _ArcSin5,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSin', _ArcSin6,1,[typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcTan2', _ArcTan2,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterRoutine('procedure SinCos(const Theta: Extended; var Sin, Cos: Extended) register;', @SinCos, H);
  RegisterStdRoutineEx('Tan', _Tan,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Cotan', _Cotan,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Secant', _Secant,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Cosecant', _Cosecant,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Hypot', _Hypot,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('RadToDeg', _RadToDeg,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('RadToGrad', _RadToGrad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('RadToCycle', _RadToCycle,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('DegToRad', _DegToRad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('DegToGrad', _DegToGrad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('DegToCycle', _DegToCycle,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('GradToRad', _GradToRad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('GradToDeg', _GradToDeg,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('GradToCycle', _GradToCycle,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('CycleToRad', _CycleToRad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('CycleToDeg', _CycleToDeg,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('CycleToGrad', _CycleToGrad,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Cot', _Cot,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Sec', _Sec,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Csc', _Csc,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Cosh', _Cosh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Sinh', _Sinh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Tanh', _Tanh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('CotH', _CotH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('SecH', _SecH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('CscH', _CscH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCot', _ArcCot,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSec', _ArcSec,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCsc', _ArcCsc,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCosh', _ArcCosh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSinh', _ArcSinh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcTanh', _ArcTanh,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCotH', _ArcCotH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcSecH', _ArcSecH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('ArcCscH', _ArcCscH,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('LnXP1', _LnXP1,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Log10', _Log10,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Log2', _Log2,1,[typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('LogN', _LogN,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('IntPower', _IntPower,2,[typeDOUBLE,typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('Power', _Power7,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Power', _Power8,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Power', _Power9,2,[typeINTEGER,typeINTEGER,typeDOUBLE], H);
  RegisterRoutine('procedure Frexp(const X: Extended; var Mantissa: Extended; var Exponent: Integer) register;', @Frexp, H);
  RegisterStdRoutineEx('Ldexp', _Ldexp,2,[typeDOUBLE,typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('Ceil', _Ceil,1,[typeDOUBLE,typeINTEGER], H);
  RegisterStdRoutineEx('Floor', _Floor,1,[typeDOUBLE,typeINTEGER], H);
  RegisterRoutine('function Poly(const X: Extended; const Coefficients: array of Double): Extended;', @Poly, H);
  RegisterRoutine('function Mean(const Data: array of Double): Extended;', @Mean, H);
  RegisterRoutine('function Sum(const Data: array of Double): Extended register;', @Sum, H);
  RegisterRoutine('function SumInt(const Data: array of Integer): Integer register;', @SumInt, H);
  RegisterRoutine('function SumOfSquares(const Data: array of Double): Extended;', @SumOfSquares, H);
  RegisterRoutine('procedure SumsAndSquares(const Data: array of Double;  var Sum, SumOfSquares: Extended) register;', @SumsAndSquares, H);
  RegisterRoutine('function MinValue(const Data: array of Double): Double;', @MinValue, H);
  RegisterRoutine('function MinIntValue(const Data: array of Integer): Integer;', @MinIntValue, H);
  RegisterStdRoutineEx('Min', _Min10,2,[typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function Min(const A, B: Int64): Int64; overload;', @Min11, H);
  RegisterStdRoutineEx('Min', _Min12,2,[typeINTEGER,typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('Min', _Min13,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Min', _Min14,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterRoutine('function MaxValue(const Data: array of Double): Double;', @MaxValue, H);
  RegisterRoutine('function MaxIntValue(const Data: array of Integer): Integer;', @MaxIntValue, H);
  RegisterStdRoutineEx('Max', _Max15,2,[typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function Max(const A, B: Int64): Int64; overload;', @Max16, H);
  RegisterStdRoutineEx('Max', _Max17,2,[typeINTEGER,typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('Max', _Max18,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('Max', _Max19,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterRoutine('function StdDev(const Data: array of Double): Extended;', @StdDev, H);
  RegisterRoutine('procedure MeanAndStdDev(const Data: array of Double; var Mean, StdDev: Extended);', @MeanAndStdDev, H);
  RegisterRoutine('function PopnStdDev(const Data: array of Double): Extended;', @PopnStdDev, H);
  RegisterRoutine('function Variance(const Data: array of Double): Extended;', @Variance, H);
  RegisterRoutine('function PopnVariance(const Data: array of Double): Extended;', @PopnVariance, H);
  RegisterRoutine('function TotalVariance(const Data: array of Double): Extended;', @TotalVariance, H);
  RegisterRoutine('function Norm(const Data: array of Double): Extended;', @Norm, H);
  RegisterRoutine('procedure MomentSkewKurtosis(const Data: array of Double;  var M1, M2, M3, M4, Skew, Kurtosis: Extended);', @MomentSkewKurtosis, H);
  RegisterStdRoutineEx('RandG', _RandG,2,[typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterStdRoutineEx('IsNan', _IsNan20,1,[typeDOUBLE,typeBOOLEAN], H);
  RegisterStdRoutineEx('IsNan', _IsNan21,1,[typeINTEGER,typeBOOLEAN], H);
  RegisterStdRoutineEx('IsNan', _IsNan22,1,[typeDOUBLE,typeBOOLEAN], H);
  RegisterStdRoutineEx('IsInfinite', _IsInfinite,1,[typeDOUBLE,typeBOOLEAN], H);
  RegisterRTTIType(TypeInfo(TValueSign));
  RegisterConstant('ZeroValue', 0, H);
  RegisterRoutine('function Sign(const AValue: Integer): TValueSign; overload;', @Sign23, H);
  RegisterRoutine('function Sign(const AValue: Int64): TValueSign; overload;', @Sign24, H);
  RegisterRoutine('function Sign(const AValue: Double): TValueSign; overload;', @Sign25, H);
  RegisterRoutine('function CompareValue(const A, B: Extended; Epsilon: Extended = 0): TValueRelationship; overload;', @CompareValue26, H);
  RegisterRoutine('function CompareValue(const A, B: Double; Epsilon: Double = 0): TValueRelationship; overload;', @CompareValue27, H);
  RegisterRoutine('function CompareValue(const A, B: Single; Epsilon: Single = 0): TValueRelationship; overload;', @CompareValue28, H);
  RegisterRoutine('function CompareValue(const A, B: Integer): TValueRelationship; overload;', @CompareValue29, H);
  RegisterRoutine('function CompareValue(const A, B: Int64): TValueRelationship; overload;', @CompareValue30, H);
  RegisterRoutine('function SameValue(const A, B: Extended; Epsilon: Extended = 0): Boolean; overload;', @SameValue31, H);
  RegisterRoutine('function SameValue(const A, B: Double; Epsilon: Double = 0): Boolean; overload;', @SameValue32, H);
  RegisterRoutine('function SameValue(const A, B: Single; Epsilon: Single = 0): Boolean; overload;', @SameValue33, H);
  RegisterRoutine('function IsZero(const A: Extended; Epsilon: Extended = 0): Boolean; overload;', @IsZero34, H);
  RegisterRoutine('function IsZero(const A: Double; Epsilon: Double = 0): Boolean; overload;', @IsZero35, H);
  RegisterRoutine('function IsZero(const A: Single; Epsilon: Single = 0): Boolean; overload;', @IsZero36, H);
  RegisterRoutine('function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer = 0): Integer; overload;', @IfThen37, H);
  RegisterRoutine('function IfThen(AValue: Boolean; const ATrue: Int64; const AFalse: Int64 = 0): Int64; overload;', @IfThen38, H);
  RegisterRoutine('function IfThen(AValue: Boolean; const ATrue: Double; const AFalse: Double = 0.0): Double; overload;', @IfThen39, H);
  RegisterStdRoutineEx('RandomRange', _RandomRange,2,[typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function RandomFrom(const AValues: array of Integer): Integer; overload;', @RandomFrom40, H);
  RegisterRoutine('function RandomFrom(const AValues: array of Int64): Int64; overload;', @RandomFrom41, H);
  RegisterRoutine('function RandomFrom(const AValues: array of Double): Double; overload;', @RandomFrom42, H);
  RegisterStdRoutineEx('InRange', _InRange43,3,[typeINTEGER,typeINTEGER,typeINTEGER,typeBOOLEAN], H);
  RegisterRoutine('function InRange(const AValue, AMin, AMax: Int64): Boolean; overload;', @InRange44, H);
  RegisterStdRoutineEx('InRange', _InRange45,3,[typeDOUBLE,typeDOUBLE,typeDOUBLE,typeBOOLEAN], H);
  RegisterStdRoutineEx('EnsureRange', _EnsureRange46,3,[typeINTEGER,typeINTEGER,typeINTEGER,typeINTEGER], H);
  RegisterRoutine('function EnsureRange(const AValue, AMin, AMax: Int64): Int64; overload;', @EnsureRange47, H);
  RegisterStdRoutineEx('EnsureRange', _EnsureRange48,3,[typeDOUBLE,typeDOUBLE,typeDOUBLE,typeDOUBLE], H);
  RegisterRoutine('procedure DivMod(Dividend: Cardinal; Divisor: Word;  var Result, Remainder: Word);', @DivMod, H);
  RegisterRTTIType(TypeInfo(TRoundToRange));
  RegisterRoutine('function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;', @RoundTo, H);
  RegisterRoutine('function SimpleRoundTo(const AValue: Double; const ADigit: TRoundToRange = -2): Double;', @SimpleRoundTo, H);
  RegisterRTTIType(TypeInfo(TPaymentTime));
  RegisterStdRoutineEx('DoubleDecliningBalance', _DoubleDecliningBalance,4,[typeDOUBLE,typeDOUBLE,typeINTEGER,typeINTEGER,typeDOUBLE], H);
  RegisterRoutine('function FutureValue(const Rate: Extended; NPeriods: Integer; const Payment,  PresentValue: Extended; PaymentTime: TPaymentTime): Extended;', @FutureValue, H);
  RegisterRoutine('function InterestPayment(const Rate: Extended; Period, NPeriods: Integer;  const PresentValue, FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @InterestPayment, H);
  RegisterRoutine('function InterestRate(NPeriods: Integer; const Payment, PresentValue,  FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @InterestRate, H);
  RegisterRoutine('function InternalRateOfReturn(const Guess: Extended;  const CashFlows: array of Double): Extended;', @InternalRateOfReturn, H);
  RegisterRoutine('function NumberOfPeriods(const Rate: Extended; Payment: Extended;  const PresentValue, FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @NumberOfPeriods, H);
  RegisterRoutine('function NetPresentValue(const Rate: Extended; const CashFlows: array of Double;  PaymentTime: TPaymentTime): Extended;', @NetPresentValue, H);
  RegisterRoutine('function Payment(Rate: Extended; NPeriods: Integer; const PresentValue,  FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @Payment, H);
  RegisterRoutine('function PeriodPayment(const Rate: Extended; Period, NPeriods: Integer;  const PresentValue, FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @PeriodPayment, H);
  RegisterRoutine('function PresentValue(const Rate: Extended; NPeriods: Integer;  const Payment, FutureValue: Extended; PaymentTime: TPaymentTime): Extended;', @PresentValue, H);
  RegisterStdRoutineEx('SLNDepreciation', _SLNDepreciation,3,[typeDOUBLE,typeDOUBLE,typeINTEGER,typeDOUBLE], H);
  RegisterStdRoutineEx('SYDDepreciation', _SYDDepreciation,4,[typeDOUBLE,typeDOUBLE,typeINTEGER,typeINTEGER,typeDOUBLE], H);
  // Begin of class EInvalidArgument
  RegisterClassType(EInvalidArgument, H);
  // CONSTRUCTOR IS NOT FOUND!!!
  // End of class EInvalidArgument
  RegisterRTTIType(TypeInfo(TFPURoundingMode));
  RegisterRoutine('function GetRoundMode: TFPURoundingMode;', @GetRoundMode, H);
  RegisterRoutine('function SetRoundMode(const RoundMode: TFPURoundingMode): TFPURoundingMode;', @SetRoundMode, H);
  RegisterRTTIType(TypeInfo(TFPUPrecisionMode));
  RegisterRoutine('function GetPrecisionMode: TFPUPrecisionMode;', @GetPrecisionMode, H);
  RegisterRoutine('function SetPrecisionMode(const Precision: TFPUPrecisionMode): TFPUPrecisionMode;', @SetPrecisionMode, H);
  RegisterRTTIType(TypeInfo(TFPUException));
  RegisterRTTIType(TypeInfo(TFPUExceptionMask));
  RegisterRoutine('function GetExceptionMask: TFPUExceptionMask;', @GetExceptionMask, H);
  RegisterRoutine('function SetExceptionMask(const Mask: TFPUExceptionMask): TFPUExceptionMask;', @SetExceptionMask, H);
  RegisterRoutine('procedure ClearExceptions(RaisePending: Boolean = True);', @ClearExceptions, H);
end;
initialization
  RegisterIMP_Math;
end.
