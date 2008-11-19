object BaseScreenModule: TBaseScreenModule
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FilesConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 48
    Top = 16
  end
  object SetupBlankQuery: TAdsQuery
    DatabaseName = 'FilesConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 136
    Top = 16
    ParamData = <>
  end
  object ToolsConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 48
    Top = 72
  end
end
