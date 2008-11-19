unit IMP_DateUtils;
interface
uses
  SysUtils,
  Math,
  Types,
  DateUtils,
  Variants,
  BASE_SYS,
  BASE_EXTERN,
  PaxScripter;
procedure RegisterIMP_DateUtils;
implementation
procedure _IsValidDate(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := DateUtils.IsValidDate(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^);
end;
procedure _IsValidTime(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := DateUtils.IsValidTime(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^,Params[3].PValue^);
end;
procedure _IsValidDateTime(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := DateUtils.IsValidDateTime(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^,Params[3].PValue^,Params[4].PValue^,Params[5].PValue^,Params[6].PValue^);
end;
procedure _IsValidDateDay(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.AsBoolean := DateUtils.IsValidDateDay(Params[0].PValue^,Params[1].PValue^);
end;
procedure _WeeksInAYear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := DateUtils.WeeksInAYear(Params[0].PValue^);
end;
procedure _DaysInAYear(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := DateUtils.DaysInAYear(Params[0].PValue^);
end;
procedure _DaysInAMonth(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
   result.PValue^ := DateUtils.DaysInAMonth(Params[0].PValue^,Params[1].PValue^);
end;
function StartOfADay1(const AYear, AMonth, ADay: Word): TDateTime; 
begin
  result := DateUtils.StartOfADay(AYEAR,AMONTH,ADAY);
end;
function EndOfADay2(const AYear, AMonth, ADay: Word): TDateTime; 
begin
  result := DateUtils.EndOfADay(AYEAR,AMONTH,ADAY);
end;
function StartOfADay3(const AYear, ADayOfYear: Word): TDateTime; 
begin
  result := DateUtils.StartOfADay(AYEAR,ADAYOFYEAR);
end;
function EndOfADay4(const AYear, ADayOfYear: Word): TDateTime; 
begin
  result := DateUtils.EndOfADay(AYEAR,ADAYOFYEAR);
end;
function WeekOfTheYear5(const AValue: TDateTime): Word; 
begin
  result := DateUtils.WeekOfTheYear(AVALUE);
end;
function WeekOfTheMonth6(const AValue: TDateTime): Word; 
begin
  result := DateUtils.WeekOfTheMonth(AVALUE);
end;
procedure _InvalidDateWeekError(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
DateUtils.InvalidDateWeekError(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^);
end;
procedure _InvalidDateDayError(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
DateUtils.InvalidDateDayError(Params[0].PValue^,Params[1].PValue^);
end;
procedure _InvalidDateMonthWeekError(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
DateUtils.InvalidDateMonthWeekError(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^,Params[3].PValue^);
end;
procedure _InvalidDayOfWeekInMonthError(MethodBody: TPAXMethodBody);
begin
  with MethodBody do
DateUtils.InvalidDayOfWeekInMonthError(Params[0].PValue^,Params[1].PValue^,Params[2].PValue^,Params[3].PValue^);
end;
procedure RegisterIMP_DateUtils;
var H: Integer;
begin
  H := RegisterNamespace('DateUtils', -1);
  RegisterRoutine('function DateOf(const AValue: TDateTime): TDateTime;', @DateOf, H);
  RegisterRoutine('function TimeOf(const AValue: TDateTime): TDateTime;', @TimeOf, H);
  RegisterRoutine('function IsInLeapYear(const AValue: TDateTime): Boolean;', @IsInLeapYear, H);
  RegisterRoutine('function IsPM(const AValue: TDateTime): Boolean;', @IsPM, H);
  RegisterStdRoutine('IsValidDate', _IsValidDate,3, H);
  RegisterStdRoutine('IsValidTime', _IsValidTime,4, H);
  RegisterStdRoutine('IsValidDateTime', _IsValidDateTime,7, H);
  RegisterStdRoutine('IsValidDateDay', _IsValidDateDay,2, H);
  RegisterRoutine('function WeeksInYear(const AValue: TDateTime): Word;', @WeeksInYear, H);
  RegisterStdRoutine('WeeksInAYear', _WeeksInAYear,1, H);
  RegisterRoutine('function DaysInYear(const AValue: TDateTime): Word;', @DaysInYear, H);
  RegisterStdRoutine('DaysInAYear', _DaysInAYear,1, H);
  RegisterRoutine('function DaysInMonth(const AValue: TDateTime): Word;', @DaysInMonth, H);
  RegisterStdRoutine('DaysInAMonth', _DaysInAMonth,2, H);
  RegisterRoutine('function Today: TDateTime;', @Today, H);
  RegisterRoutine('function Yesterday: TDateTime;', @Yesterday, H);
  RegisterRoutine('function Tomorrow: TDateTime;', @Tomorrow, H);
  RegisterRoutine('function IsToday(const AValue: TDateTime): Boolean;', @IsToday, H);
  RegisterRoutine('function IsSameDay(const AValue, ABasis: TDateTime): Boolean;', @IsSameDay, H);
  RegisterRoutine('function YearOf(const AValue: TDateTime): Word;', @YearOf, H);
  RegisterRoutine('function MonthOf(const AValue: TDateTime): Word;', @MonthOf, H);
  RegisterRoutine('function WeekOf(const AValue: TDateTime): Word;', @WeekOf, H);
  RegisterRoutine('function DayOf(const AValue: TDateTime): Word;', @DayOf, H);
  RegisterRoutine('function HourOf(const AValue: TDateTime): Word;', @HourOf, H);
  RegisterRoutine('function MinuteOf(const AValue: TDateTime): Word;', @MinuteOf, H);
  RegisterRoutine('function SecondOf(const AValue: TDateTime): Word;', @SecondOf, H);
  RegisterRoutine('function MilliSecondOf(const AValue: TDateTime): Word;', @MilliSecondOf, H);
  RegisterRoutine('function StartOfTheYear(const AValue: TDateTime): TDateTime;', @StartOfTheYear, H);
  RegisterRoutine('function EndOfTheYear(const AValue: TDateTime): TDateTime;', @EndOfTheYear, H);
  RegisterRoutine('function StartOfAYear(const AYear: Word): TDateTime;', @StartOfAYear, H);
  RegisterRoutine('function EndOfAYear(const AYear: Word): TDateTime;', @EndOfAYear, H);
  RegisterRoutine('function StartOfTheMonth(const AValue: TDateTime): TDateTime;', @StartOfTheMonth, H);
  RegisterRoutine('function EndOfTheMonth(const AValue: TDateTime): TDateTime;', @EndOfTheMonth, H);
  RegisterRoutine('function StartOfAMonth(const AYear, AMonth: Word): TDateTime;', @StartOfAMonth, H);
  RegisterRoutine('function EndOfAMonth(const AYear, AMonth: Word): TDateTime;', @EndOfAMonth, H);
  RegisterRoutine('function StartOfTheWeek(const AValue: TDateTime): TDateTime;', @StartOfTheWeek, H);
  RegisterRoutine('function EndOfTheWeek(const AValue: TDateTime): TDateTime;', @EndOfTheWeek, H);
  RegisterRoutine('function StartOfTheDay(const AValue: TDateTime): TDateTime;', @StartOfTheDay, H);
  RegisterRoutine('function EndOfTheDay(const AValue: TDateTime): TDateTime;', @EndOfTheDay, H);
  RegisterRoutine('function StartOfADay(const AYear, AMonth, ADay: Word): TDateTime; overload;', @StartOfADay1, H);
  RegisterRoutine('function EndOfADay(const AYear, AMonth, ADay: Word): TDateTime; overload;', @EndOfADay2, H);
  RegisterRoutine('function StartOfADay(const AYear, ADayOfYear: Word): TDateTime; overload;', @StartOfADay3, H);
  RegisterRoutine('function EndOfADay(const AYear, ADayOfYear: Word): TDateTime; overload;', @EndOfADay4, H);
  RegisterRoutine('function MonthOfTheYear(const AValue: TDateTime): Word;', @MonthOfTheYear, H);
  RegisterRoutine('function WeekOfTheYear(const AValue: TDateTime): Word; overload;', @WeekOfTheYear5, H);
  RegisterRoutine('function DayOfTheYear(const AValue: TDateTime): Word;', @DayOfTheYear, H);
  RegisterRoutine('function HourOfTheYear(const AValue: TDateTime): Word;', @HourOfTheYear, H);
  RegisterRoutine('function MinuteOfTheYear(const AValue: TDateTime): LongWord;', @MinuteOfTheYear, H);
  RegisterRoutine('function SecondOfTheYear(const AValue: TDateTime): LongWord;', @SecondOfTheYear, H);
  RegisterRoutine('function MilliSecondOfTheYear(const AValue: TDateTime): Int64;', @MilliSecondOfTheYear, H);
  RegisterRoutine('function WeekOfTheMonth(const AValue: TDateTime): Word; overload;', @WeekOfTheMonth6, H);
  RegisterRoutine('function DayOfTheMonth(const AValue: TDateTime): Word;', @DayOfTheMonth, H);
  RegisterRoutine('function HourOfTheMonth(const AValue: TDateTime): Word;', @HourOfTheMonth, H);
  RegisterRoutine('function MinuteOfTheMonth(const AValue: TDateTime): Word;', @MinuteOfTheMonth, H);
  RegisterRoutine('function SecondOfTheMonth(const AValue: TDateTime): LongWord;', @SecondOfTheMonth, H);
  RegisterRoutine('function MilliSecondOfTheMonth(const AValue: TDateTime): LongWord;', @MilliSecondOfTheMonth, H);
  RegisterRoutine('function DayOfTheWeek(const AValue: TDateTime): Word;', @DayOfTheWeek, H);
  RegisterRoutine('function HourOfTheWeek(const AValue: TDateTime): Word;', @HourOfTheWeek, H);
  RegisterRoutine('function MinuteOfTheWeek(const AValue: TDateTime): Word;', @MinuteOfTheWeek, H);
  RegisterRoutine('function SecondOfTheWeek(const AValue: TDateTime): LongWord;', @SecondOfTheWeek, H);
  RegisterRoutine('function MilliSecondOfTheWeek(const AValue: TDateTime): LongWord;', @MilliSecondOfTheWeek, H);
  RegisterRoutine('function HourOfTheDay(const AValue: TDateTime): Word;', @HourOfTheDay, H);
  RegisterRoutine('function MinuteOfTheDay(const AValue: TDateTime): Word;', @MinuteOfTheDay, H);
  RegisterRoutine('function SecondOfTheDay(const AValue: TDateTime): LongWord;', @SecondOfTheDay, H);
  RegisterRoutine('function MilliSecondOfTheDay(const AValue: TDateTime): LongWord;', @MilliSecondOfTheDay, H);
  RegisterRoutine('function MinuteOfTheHour(const AValue: TDateTime): Word;', @MinuteOfTheHour, H);
  RegisterRoutine('function SecondOfTheHour(const AValue: TDateTime): Word;', @SecondOfTheHour, H);
  RegisterRoutine('function MilliSecondOfTheHour(const AValue: TDateTime): LongWord;', @MilliSecondOfTheHour, H);
  RegisterRoutine('function SecondOfTheMinute(const AValue: TDateTime): Word;', @SecondOfTheMinute, H);
  RegisterRoutine('function MilliSecondOfTheMinute(const AValue: TDateTime): LongWord;', @MilliSecondOfTheMinute, H);
  RegisterRoutine('function MilliSecondOfTheSecond(const AValue: TDateTime): Word;', @MilliSecondOfTheSecond, H);
  RegisterRoutine('function WithinPastYears(const ANow, AThen: TDateTime;  const AYears: Integer): Boolean;', @WithinPastYears, H);
  RegisterRoutine('function WithinPastMonths(const ANow, AThen: TDateTime;  const AMonths: Integer): Boolean;', @WithinPastMonths, H);
  RegisterRoutine('function WithinPastWeeks(const ANow, AThen: TDateTime;  const AWeeks: Integer): Boolean;', @WithinPastWeeks, H);
  RegisterRoutine('function WithinPastDays(const ANow, AThen: TDateTime;  const ADays: Integer): Boolean;', @WithinPastDays, H);
  RegisterRoutine('function WithinPastHours(const ANow, AThen: TDateTime;  const AHours: Int64): Boolean;', @WithinPastHours, H);
  RegisterRoutine('function WithinPastMinutes(const ANow, AThen: TDateTime;  const AMinutes: Int64): Boolean;', @WithinPastMinutes, H);
  RegisterRoutine('function WithinPastSeconds(const ANow, AThen: TDateTime;  const ASeconds: Int64): Boolean;', @WithinPastSeconds, H);
  RegisterRoutine('function WithinPastMilliSeconds(const ANow, AThen: TDateTime;  const AMilliSeconds: Int64): Boolean;', @WithinPastMilliSeconds, H);
  RegisterRoutine('function YearsBetween(const ANow, AThen: TDateTime): Integer;', @YearsBetween, H);
  RegisterRoutine('function MonthsBetween(const ANow, AThen: TDateTime): Integer;', @MonthsBetween, H);
  RegisterRoutine('function WeeksBetween(const ANow, AThen: TDateTime): Integer;', @WeeksBetween, H);
  RegisterRoutine('function DaysBetween(const ANow, AThen: TDateTime): Integer;', @DaysBetween, H);
  RegisterRoutine('function HoursBetween(const ANow, AThen: TDateTime): Int64;', @HoursBetween, H);
  RegisterRoutine('function MinutesBetween(const ANow, AThen: TDateTime): Int64;', @MinutesBetween, H);
  RegisterRoutine('function SecondsBetween(const ANow, AThen: TDateTime): Int64;', @SecondsBetween, H);
  RegisterRoutine('function MilliSecondsBetween(const ANow, AThen: TDateTime): Int64;', @MilliSecondsBetween, H);
  RegisterRoutine('function YearSpan(const ANow, AThen: TDateTime): Double;', @YearSpan, H);
  RegisterRoutine('function MonthSpan(const ANow, AThen: TDateTime): Double;', @MonthSpan, H);
  RegisterRoutine('function WeekSpan(const ANow, AThen: TDateTime): Double;', @WeekSpan, H);
  RegisterRoutine('function DaySpan(const ANow, AThen: TDateTime): Double;', @DaySpan, H);
  RegisterRoutine('function HourSpan(const ANow, AThen: TDateTime): Double;', @HourSpan, H);
  RegisterRoutine('function MinuteSpan(const ANow, AThen: TDateTime): Double;', @MinuteSpan, H);
  RegisterRoutine('function SecondSpan(const ANow, AThen: TDateTime): Double;', @SecondSpan, H);
  RegisterRoutine('function MilliSecondSpan(const ANow, AThen: TDateTime): Double;', @MilliSecondSpan, H);
  RegisterRoutine('function IncYear(const AValue: TDateTime;  const ANumberOfYears: Integer = 1): TDateTime;', @IncYear, H);
  RegisterRoutine('function IncWeek(const AValue: TDateTime;  const ANumberOfWeeks: Integer = 1): TDateTime;', @IncWeek, H);
  RegisterRoutine('function IncDay(const AValue: TDateTime;  const ANumberOfDays: Integer = 1): TDateTime;', @IncDay, H);
  RegisterRoutine('function IncHour(const AValue: TDateTime;  const ANumberOfHours: Int64 = 1): TDateTime;', @IncHour, H);
  RegisterRoutine('function IncMinute(const AValue: TDateTime;  const ANumberOfMinutes: Int64 = 1): TDateTime;', @IncMinute, H);
  RegisterRoutine('function IncSecond(const AValue: TDateTime;  const ANumberOfSeconds: Int64 = 1): TDateTime;', @IncSecond, H);
  RegisterRoutine('function IncMilliSecond(const AValue: TDateTime;  const ANumberOfMilliSeconds: Int64 = 1): TDateTime;', @IncMilliSecond, H);
  RegisterRoutine('function EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,  AMilliSecond: Word): TDateTime;', @EncodeDateTime, H);
  RegisterRoutine('procedure DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay,  AHour, AMinute, ASecond, AMilliSecond: Word);', @DecodeDateTime, H);
  RegisterRoutine('function EncodeDateDay(const AYear, ADayOfYear: Word): TDateTime;', @EncodeDateDay, H);
  RegisterRoutine('procedure DecodeDateDay(const AValue: TDateTime; out AYear, ADayOfYear: Word);', @DecodeDateDay, H);
  RegisterRoutine('function TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,  AMilliSecond: Word; out AValue: TDateTime): Boolean;', @TryEncodeDateTime, H);
  RegisterRoutine('function TryEncodeDateDay(const AYear, ADayOfYear: Word;  out AValue: TDateTime): Boolean;', @TryEncodeDateDay, H);
  RegisterRoutine('function RecodeYear(const AValue: TDateTime; const AYear: Word): TDateTime;', @RecodeYear, H);
  RegisterRoutine('function RecodeMonth(const AValue: TDateTime; const AMonth: Word): TDateTime;', @RecodeMonth, H);
  RegisterRoutine('function RecodeDay(const AValue: TDateTime; const ADay: Word): TDateTime;', @RecodeDay, H);
  RegisterRoutine('function RecodeHour(const AValue: TDateTime; const AHour: Word): TDateTime;', @RecodeHour, H);
  RegisterRoutine('function RecodeMinute(const AValue: TDateTime; const AMinute: Word): TDateTime;', @RecodeMinute, H);
  RegisterRoutine('function RecodeSecond(const AValue: TDateTime; const ASecond: Word): TDateTime;', @RecodeSecond, H);
  RegisterRoutine('function RecodeMilliSecond(const AValue: TDateTime;  const AMilliSecond: Word): TDateTime;', @RecodeMilliSecond, H);
  RegisterRoutine('function RecodeDate(const AValue: TDateTime; const AYear, AMonth,  ADay: Word): TDateTime;', @RecodeDate, H);
  RegisterRoutine('function RecodeTime(const AValue: TDateTime; const AHour, AMinute, ASecond,  AMilliSecond: Word): TDateTime;', @RecodeTime, H);
  RegisterRoutine('function RecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay,  AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime;', @RecodeDateTime, H);
  RegisterRoutine('function TryRecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay,  AHour, AMinute, ASecond, AMilliSecond: Word; out AResult: TDateTime): Boolean;', @TryRecodeDateTime, H);
  RegisterRoutine('function CompareDateTime(const A, B: TDateTime): TValueRelationship;', @CompareDateTime, H);
  RegisterRoutine('function SameDateTime(const A, B: TDateTime): Boolean;', @SameDateTime, H);
  RegisterRoutine('function CompareDate(const A, B: TDateTime): TValueRelationship;', @CompareDate, H);
  RegisterRoutine('function SameDate(const A, B: TDateTime): Boolean;', @SameDate, H);
  RegisterRoutine('function CompareTime(const A, B: TDateTime): TValueRelationship;', @CompareTime, H);
  RegisterRoutine('function SameTime(const A, B: TDateTime): Boolean;', @SameTime, H);
  RegisterRoutine('function NthDayOfWeek(const AValue: TDateTime): Word;', @NthDayOfWeek, H);
  RegisterRoutine('procedure DecodeDayOfWeekInMonth(const AValue: TDateTime; out AYear, AMonth,  ANthDayOfWeek, ADayOfWeek: Word);', @DecodeDayOfWeekInMonth, H);
  RegisterRoutine('function EncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek,  ADayOfWeek: Word): TDateTime;', @EncodeDayOfWeekInMonth, H);
  RegisterRoutine('function TryEncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek,  ADayOfWeek: Word; out AValue: TDateTime): Boolean;', @TryEncodeDayOfWeekInMonth, H);
  RegisterRoutine('procedure InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute,  ASecond, AMilliSecond: Word; const ABaseDate: TDateTime = 0);', @InvalidDateTimeError, H);
  RegisterStdRoutine('InvalidDateWeekError', _InvalidDateWeekError,3, H);
  RegisterStdRoutine('InvalidDateDayError', _InvalidDateDayError,2, H);
  RegisterStdRoutine('InvalidDateMonthWeekError', _InvalidDateMonthWeekError,4, H);
  RegisterStdRoutine('InvalidDayOfWeekInMonthError', _InvalidDayOfWeekInMonthError,4, H);
  RegisterRoutine('function DateTimeToJulianDate(const AValue: TDateTime): Double;', @DateTimeToJulianDate, H);
  RegisterRoutine('function JulianDateToDateTime(const AValue: Double): TDateTime;', @JulianDateToDateTime, H);
  RegisterRoutine('function TryJulianDateToDateTime(const AValue: Double;  out ADateTime: TDateTime): Boolean;', @TryJulianDateToDateTime, H);
  RegisterRoutine('function DateTimeToModifiedJulianDate(const AValue: TDateTime): Double;', @DateTimeToModifiedJulianDate, H);
  RegisterRoutine('function ModifiedJulianDateToDateTime(const AValue: Double): TDateTime;', @ModifiedJulianDateToDateTime, H);
  RegisterRoutine('function TryModifiedJulianDateToDateTime(const AValue: Double;  out ADateTime: TDateTime): Boolean;', @TryModifiedJulianDateToDateTime, H);
  RegisterRoutine('function DateTimeToUnix(const AValue: TDateTime): Int64;', @DateTimeToUnix, H);
  RegisterRoutine('function UnixToDateTime(const AValue: Int64): TDateTime;', @UnixToDateTime, H);
  RegisterConstant('DaysPerWeek', 7, H);
  RegisterConstant('WeeksPerFortnight', 2, H);
  RegisterConstant('MonthsPerYear', 12, H);
  RegisterConstant('YearsPerDecade', 10, H);
  RegisterConstant('YearsPerCentury', 100, H);
  RegisterConstant('YearsPerMillennium', 1000, H);
  RegisterConstant('DayMonday', 1, H);
  RegisterConstant('DayTuesday', 2, H);
  RegisterConstant('DayWednesday', 3, H);
  RegisterConstant('DayThursday', 4, H);
  RegisterConstant('DayFriday', 5, H);
  RegisterConstant('DaySaturday', 6, H);
  RegisterConstant('DaySunday', 7, H);
  RegisterVariable('ApproxDaysPerMonth', 'DOUBLE',@ApproxDaysPerMonth, H);
  RegisterVariable('ApproxDaysPerYear', 'DOUBLE',@ApproxDaysPerYear, H);
end;
initialization
  RegisterIMP_DateUtils;
end.
