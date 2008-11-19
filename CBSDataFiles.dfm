object CreateCBSData: TCreateCBSData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object CreateTool: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 24
    Top = 16
  end
  object CreateQuery: TAdsQuery
    DatabaseName = 'CreateTool'
    StoreActive = True
    Left = 24
    Top = 72
    ParamData = <>
  end
  object FieldNameQuery: TAdsQuery
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 112
    Top = 72
    ParamData = <>
  end
end
