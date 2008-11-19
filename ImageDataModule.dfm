object ImageData: TImageData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 320
  Width = 452
  object CBSToolsConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 32
    Top = 8
  end
  object ToolImageQuery: TAdsQuery
    DatabaseName = 'CBSToolsConnection'
    StoreActive = True
    Left = 32
    Top = 56
    ParamData = <>
  end
  object ToolMasterTable: TAdsTable
    DatabaseName = 'CBSToolsConnection'
    StoreActive = True
    AdsConnection = CBSToolsConnection
    TableName = 'ToolMaster.adt'
    Left = 32
    Top = 104
  end
  object ExamImageTable: TAdsTable
    StoreActive = True
    AdsConnection = CBSToolsConnection
    TableName = 'EXAMIMAG.ADT'
    Left = 32
    Top = 160
  end
  object CBSFilesConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 344
    Top = 24
  end
  object MasterTable: TAdsTable
    DatabaseName = 'CBSFilesConnection'
    StoreActive = True
    AdsConnection = CBSFilesConnection
    TableName = 'MASTER.DBF'
    TableType = ttAdsCDX
    Left = 352
    Top = 80
  end
  object ToolCategoryTable: TAdsTable
    DatabaseName = 'CBSToolsConnection'
    StoreActive = True
    AdsConnection = CBSToolsConnection
    TableName = 'ToolCategoryMaster.adt'
    Left = 144
    Top = 112
  end
  object ToolCategoryQuery: TAdsQuery
    DatabaseName = 'CBSToolsConnection'
    StoreActive = True
    Left = 144
    Top = 56
    ParamData = <>
  end
  object SourceTable: TAdsTable
    DatabaseName = 'CBSFilesConnection'
    StoreActive = True
    AdsConnection = CBSFilesConnection
    TableType = ttAdsCDX
    Left = 352
    Top = 136
  end
end
