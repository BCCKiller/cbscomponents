object LayoutData: TLayoutData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 224
  Width = 328
  object LayoutTable: TAdsTable
    DatabaseName = 'LayoutConnection'
    IndexDefs = <
      item
        Name = 'LAYOUTID'
        Fields = 'LAYOUTID'
      end>
    StoreActive = False
    AdsConnection = LayoutConnection
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'LayoutID'
        DataType = ftInteger
      end
      item
        Name = 'LayoutName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'LayoutCreated'
        DataType = ftDateTime
      end
      item
        Name = 'LayoutInformation'
        DataType = ftMemo
        Size = 1
      end>
    StoreDefs = True
    TableName = 'LayoutMaster.adt'
    Left = 24
    Top = 8
  end
  object LinkTable: TAdsTable
    DatabaseName = 'LayoutConnection'
    IndexDefs = <
      item
        Name = 'TABSORT'
        Fields = 'TABSORT'
      end
      item
        Name = 'TABID'
        Fields = 'TABID'
      end
      item
        Name = 'LAYOUTID'
        Fields = 'LAYOUTID'
      end
      item
        Name = 'LOOKUPID'
        Fields = 'LAYOUTID;TABID'
      end>
    StoreActive = False
    AdsConnection = LayoutConnection
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'LayoutID'
        DataType = ftInteger
      end
      item
        Name = 'TabID'
        DataType = ftInteger
      end
      item
        Name = 'LinkedTime'
        DataType = ftDateTime
      end
      item
        Name = 'TabSort'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = 'LayoutTabLinkMaster.adt'
    Left = 88
    Top = 8
  end
  object TabTable: TAdsTable
    DatabaseName = 'LayoutConnection'
    IndexDefs = <
      item
        Name = 'TABID'
        Fields = 'TABID'
      end
      item
        Name = 'TABDESCRIPTION'
        Fields = 'TABDESCRIPTION'
      end
      item
        Name = 'TABLABEL'
        Fields = 'TABLABEL'
      end>
    StoreActive = False
    AdsConnection = LayoutConnection
    AdsTableOptions.AdsIndexPageSize = 512
    FieldDefs = <
      item
        Name = 'TabID'
        DataType = ftInteger
      end
      item
        Name = 'TabDescription'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TabLabel'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TabComponents'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'TabLastMod'
        DataType = ftDateTime
      end
      item
        Name = 'TabCreated'
        DataType = ftDateTime
      end
      item
        Name = 'TabInformation'
        DataType = ftMemo
        Size = 1
      end>
    StoreDefs = True
    TableName = 'TabMaster.adt'
    Left = 144
    Top = 8
  end
  object ExamLinkTable: TAdsTable
    DatabaseName = 'LayoutConnection'
    StoreActive = False
    AdsConnection = LayoutConnection
    TableName = 'ExamTabLink.adt'
    Left = 32
    Top = 80
  end
  object ExamTabTable: TAdsTable
    DatabaseName = 'LayoutConnection'
    StoreActive = False
    AdsConnection = LayoutConnection
    TableName = 'TabExam.adt'
    Left = 120
    Top = 80
  end
  object LayoutConnection: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Compression = ccAdsCompressionNotSet
    Left = 232
    Top = 8
  end
  object TabTypeQuery: TAdsQuery
    DatabaseName = 'LayoutConnection'
    StoreActive = True
    Left = 32
    Top = 152
    ParamData = <>
  end
  object TabAdjustQuery: TAdsQuery
    DatabaseName = 'LayoutConnection'
    StoreActive = True
    Left = 112
    Top = 152
    ParamData = <>
  end
  object GeneralQuery: TAdsQuery
    DatabaseName = 'LayoutConnection'
    StoreActive = False
    Left = 208
    Top = 152
    ParamData = <>
  end
end
