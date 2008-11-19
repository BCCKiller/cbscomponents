object SmartField: TSmartField
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object SmartFieldScript: TPaxScripter
    OverrideHandlerMode = Replace
    StackSize = 16000
    Optimization = True
    OnRunningUpdateActive = False
    Left = 32
    Top = 24
  end
  object PaxPascal1: TPaxPascal
    CompilerDirectives.Strings = (
      'WIN32')
    LongStrLiterals = True
    CallConvention = ccRegister
    NamespaceAsModule = True
    JavaScriptOperators = False
    DeclareVariables = True
    ZeroBasedStrings = False
    Backslash = True
    FileExt = 'pp'
    LanguageName = 'paxPascal'
    InitArrays = True
    Left = 104
    Top = 24
  end
end
