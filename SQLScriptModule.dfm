object cbsSQLScript: TcbsSQLScript
  OldCreateOrder = False
  Height = 150
  Width = 215
  object DBFConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 40
    Top = 16
  end
  object ADTConnection: TAdsConnection
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 136
    Top = 16
  end
  object DBFQuery: TAdsQuery
    DatabaseName = 'DBFConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 40
    Top = 80
    ParamData = <>
  end
  object ADTQuery: TAdsQuery
    DatabaseName = 'ADTConnection'
    StoreActive = True
    Left = 136
    Top = 80
    ParamData = <>
  end
end
