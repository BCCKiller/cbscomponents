object BaseScreenModule: TBaseScreenModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 657
  Width = 599
  object ExamTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAM.DBF'
    TableType = ttAdsCDX
    Left = 480
    Top = 551
  end
  object S_EXAMSURG: TDataSource
    DataSet = ExamSurgQuery
    Left = 160
    Top = 231
  end
  object S_EXAM: TDataSource
    DataSet = ExamQuery
    Left = 160
    Top = 119
  end
  object S_EXAMALGY: TDataSource
    DataSet = ExamALGQuery
    Left = 96
    Top = 231
  end
  object ExamALGTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMALGY.DBF'
    TableType = ttAdsCDX
    Left = 168
    Top = 512
  end
  object ExamALRTTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMALRT.DBF'
    TableType = ttAdsCDX
    Left = 168
    Top = 552
  end
  object S_EXAMALRT: TDataSource
    DataSet = ExamALRTQuery
    Left = 96
    Top = 448
  end
  object ExamCLTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMCL.DBF'
    TableType = ttAdsCDX
    Left = 512
    Top = 487
  end
  object S_EXAMCL: TDataSource
    DataSet = ExamCLQuery
    Left = 360
    Top = 231
  end
  object ExamDiagTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMDIAG.DBF'
    TableType = ttAdsCDX
    Left = 512
    Top = 551
  end
  object S_EXAMDIAG: TDataSource
    DataSet = ExamDiagQuery
    Left = 224
    Top = 119
  end
  object ExamImagTable: TAdsTable
    DatabaseName = 'AdsConnection1'
    StoreActive = False
    AdsConnection = AdsConnection1
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMIMAG.ADT'
    Left = 200
    Top = 512
  end
  object S_EXAMIMAG: TDataSource
    DataSet = ExamImagQuery
    Left = 544
    Top = 216
  end
  object ExamIOPTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMIOP.DBF'
    TableType = ttAdsCDX
    Left = 200
    Top = 552
  end
  object S_EXAMIOP: TDataSource
    DataSet = ExamIOPQuery
    Left = 24
    Top = 344
  end
  object ExamMedTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMMED.DBF'
    TableType = ttAdsCDX
    Left = 544
    Top = 487
  end
  object S_EXAMMED: TDataSource
    DataSet = ExamMedQuery
    Left = 304
    Top = 231
  end
  object ExamRefrTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'examrefr.dbf'
    TableType = ttAdsCDX
    Left = 544
    Top = 551
  end
  object S_EXAMREFR: TDataSource
    DataSet = ExamRefrQuery
    Left = 224
    Top = 231
  end
  object ExamSurgTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMSURG.DBF'
    TableType = ttAdsCDX
    Left = 232
    Top = 512
  end
  object ExamApptTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMAPPT.DBF'
    TableType = ttAdsCDX
    Left = 136
    Top = 552
  end
  object S_ExamAppt: TDataSource
    DataSet = ExamApptQuery
    Left = 168
    Top = 344
  end
  object ExamCompTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'EXAMCOMP.DBF'
    TableType = ttAdsCDX
    Left = 480
    Top = 487
  end
  object S_ExamComp: TDataSource
    DataSet = ExamCompQuery
    Left = 296
    Top = 119
  end
  object CompulinkConnection: TAdsConnection
    AliasName = 'CBSFiles'
    IsConnected = True
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Compression = ccAdsCompressionNotSet
    Left = 168
    Top = 8
  end
  object Pat_TodoTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PAT_TODO.DBF'
    TableType = ttAdsCDX
    Left = 448
    Top = 551
  end
  object patrecaltable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PATRECAL.DBF'
    TableType = ttAdsCDX
    Left = 104
    Top = 512
  end
  object patRefTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PATREF.DBF'
    TableType = ttAdsCDX
    Left = 136
    Top = 512
  end
  object AlertTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'ALERT.DBF'
    TableType = ttAdsCDX
    Left = 104
    Top = 552
  end
  object S_Pat_ToDo: TDataSource
    DataSet = Pat_TodoQuery
    Left = 304
    Top = 344
  end
  object S_PatRecal: TDataSource
    DataSet = patrecalQuery
    Left = 280
    Top = 455
  end
  object S_PatRef: TDataSource
    DataSet = patRefQuery
    Left = 32
    Top = 231
  end
  object s_alert: TDataSource
    DataSet = AlertQuery
    Left = 352
    Top = 440
  end
  object LttrhistTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'LTTRHIST.DBF'
    TableType = ttAdsCDX
    Left = 416
    Top = 551
  end
  object S_LttrHist: TDataSource
    DataSet = LttrhistQuery
    Left = 360
    Top = 119
  end
  object ExamTestTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'examtest.dbf'
    TableType = ttAdsCDX
    Left = 8
    Top = 552
  end
  object PatientTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PATIENT.DBF'
    TableType = ttAdsCDX
    Left = 416
    Top = 487
  end
  object BillTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'BILL.DBF'
    TableType = ttAdsCDX
    Left = 352
    Top = 551
  end
  object fram_rxTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'FRAM_RX.DBF'
    TableType = ttAdsCDX
    Left = 320
    Top = 551
  end
  object Lens_RxTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'LENS_RX.DBF'
    TableType = ttAdsCDX
    Left = 384
    Top = 487
  end
  object DocumentTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'DOCUMENT.DBF'
    TableType = ttAdsCDX
    Left = 384
    Top = 551
  end
  object PatTrackTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PATTRACK.DBF'
    TableType = ttAdsCDX
    Left = 8
    Top = 512
  end
  object InsuredTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'INSURED.DBF'
    TableType = ttAdsCDX
    Left = 72
    Top = 552
  end
  object Log_apptTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'APPT.DBF'
    TableType = ttAdsCDX
    Left = 448
    Top = 487
  end
  object LogToDoTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PAT_TODO.DBF'
    TableType = ttAdsCDX
    Left = 72
    Top = 512
  end
  object CollectTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'collect.dbf'
    TableType = ttAdsCDX
    Left = 320
    Top = 487
  end
  object S_examtest: TDataSource
    DataSet = ExamTestQuery
    Left = 496
    Top = 439
  end
  object s_patient: TDataSource
    DataSet = PatientQuery
    Left = 496
    Top = 223
  end
  object S_Bill: TDataSource
    DataSet = BillQuery
    Left = 96
    Top = 119
  end
  object S_Fram_RX: TDataSource
    DataSet = fram_rxQuery
    Left = 32
    Top = 119
  end
  object S_Lens_RX: TDataSource
    DataSet = Lens_RxQuery
    Left = 424
    Top = 231
  end
  object S_Document: TDataSource
    DataSet = DocumentQuery
    Left = 360
    Top = 344
  end
  object S_pattrack: TDataSource
    DataSet = PatTrackQuery
    Left = 24
    Top = 447
  end
  object s_insured: TDataSource
    DataSet = InsuredQuery
    Left = 432
    Top = 448
  end
  object S_logappt: TDataSource
    DataSet = Log_apptQuery
    Left = 416
    Top = 343
  end
  object S_LogToDo: TDataSource
    DataSet = LogToDoQuery
    Left = 224
    Top = 455
  end
  object S_Collect: TDataSource
    DataSet = CollectQuery
    Left = 496
    Top = 119
  end
  object claimtable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'CLAIM.DBF'
    TableType = ttAdsCDX
    Left = 40
    Top = 552
  end
  object S_claim: TDataSource
    DataSet = claimQuery
    Left = 496
    Top = 344
  end
  object ApptHistTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'APPT.DBF'
    TableType = ttAdsCDX
    Left = 40
    Top = 512
  end
  object S_ApptHist: TDataSource
    DataSet = ApptHistQuery
    Left = 96
    Top = 343
  end
  object LogTrackTable: TAdsTable
    DatabaseName = 'CompulinkConnection'
    StoreActive = False
    AdsConnection = CompulinkConnection
    AdsTableOptions.AdsIndexPageSize = 512
    TableName = 'PATTRACK.DBF'
    TableType = ttAdsCDX
    Left = 352
    Top = 487
  end
  object S_LOGTRACK: TDataSource
    DataSet = LogTrackQuery
    Left = 424
    Top = 119
  end
  object AdsConnection1: TAdsConnection
    AliasName = 'CBSTools'
    IsConnected = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = True
    Compression = ccAdsCompressionNotSet
    Left = 40
    Top = 7
  end
  object CollectQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 496
    Top = 64
    ParamData = <>
  end
  object ExamQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 160
    Top = 64
    ParamData = <>
  end
  object ExamALGQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 96
    Top = 176
    ParamData = <>
  end
  object ExamALRTQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 96
    Top = 400
    ParamData = <>
  end
  object ExamCLQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 360
    Top = 176
    ParamData = <>
  end
  object ExamDiagQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 224
    Top = 64
    ParamData = <>
  end
  object ExamImagQuery: TAdsQuery
    DatabaseName = 'AdsConnection1'
    StoreActive = False
    Left = 552
    Top = 169
    ParamData = <>
  end
  object ExamIOPQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 24
    Top = 289
    ParamData = <>
  end
  object ExamMedQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 296
    Top = 176
    ParamData = <>
  end
  object ExamRefrQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 224
    Top = 176
    ParamData = <>
  end
  object ExamSurgQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 160
    Top = 176
    ParamData = <>
  end
  object ExamApptQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 168
    Top = 289
    ParamData = <>
  end
  object ExamCompQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 296
    Top = 64
    ParamData = <>
  end
  object Pat_TodoQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 304
    Top = 288
    ParamData = <>
  end
  object patrecalQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 280
    Top = 400
    ParamData = <>
  end
  object patRefQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 32
    Top = 176
    ParamData = <>
  end
  object AlertQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 344
    Top = 393
    ParamData = <>
  end
  object LttrhistQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 360
    Top = 64
    ParamData = <>
  end
  object ExamTestQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 496
    Top = 392
    ParamData = <>
  end
  object PatientQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 496
    Top = 168
    ParamData = <>
  end
  object BillQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 96
    Top = 64
    ParamData = <>
  end
  object fram_rxQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 32
    Top = 64
    ParamData = <>
  end
  object Lens_RxQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 424
    Top = 176
    ParamData = <>
  end
  object DocumentQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 360
    Top = 288
    ParamData = <>
  end
  object PatTrackQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 24
    Top = 400
    ParamData = <>
  end
  object InsuredQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 432
    Top = 401
    ParamData = <>
  end
  object Log_apptQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 424
    Top = 288
    ParamData = <>
  end
  object LogToDoQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 224
    Top = 400
    ParamData = <>
  end
  object claimQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 496
    Top = 281
    ParamData = <>
  end
  object ApptHistQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 88
    Top = 288
    ParamData = <>
  end
  object LogTrackQuery: TAdsQuery
    DatabaseName = 'CompulinkConnection'
    StoreActive = True
    SourceTableType = ttAdsCDX
    Left = 424
    Top = 64
    ParamData = <>
  end
  object ExamImag3Query: TAdsQuery
    DatabaseName = 'AdsConnection1'
    StoreActive = False
    Left = 552
    Top = 393
    ParamData = <>
  end
  object Examimag2Query: TAdsQuery
    DatabaseName = 'AdsConnection1'
    StoreActive = False
    Left = 552
    Top = 281
    ParamData = <>
  end
  object S_EXAMIMAG2: TDataSource
    DataSet = Examimag2Query
    Left = 552
    Top = 336
  end
  object S_EXAMIMAG3: TDataSource
    DataSet = ExamImag3Query
    Left = 544
    Top = 440
  end
end
