object CBSMergeModule: TCBSMergeModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 221
  Width = 219
  object ToolsConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 40
    Top = 24
  end
  object CheckQuery: TAdsQuery
    DatabaseName = 'ToolsConnection'
    StoreActive = True
    Left = 136
    Top = 24
    ParamData = <>
  end
  object OutputQuery: TAdsQuery
    DatabaseName = 'FilesConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 40
    Top = 72
    ParamData = <>
  end
  object FilesConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 136
    Top = 80
  end
  object LookupQuery: TAdsQuery
    DatabaseName = 'FilesConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 40
    Top = 128
    ParamData = <>
  end
end
