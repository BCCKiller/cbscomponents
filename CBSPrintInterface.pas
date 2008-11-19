unit CBSPrintInterface;

interface
uses Windows, Classes, Forms, SysUtils;

type

  TPrintDestination = (pdPDF, pdPrinter, pdFax, pdEmail, pdScreen);
  TSourceType = (stQuery, stView, stSentFrom, stFile, stDataSet);
  {SourceType determines what is held in SourceQuery
   stQuery SourceQuery contains the text of a query
   stView SourceQuery contains the name of a view
   stSentFrom SourceQuery contains the originating screen
      SourceScreen = ScreenName eg; SourceScreen=F_EXAM
   stFile SourceQuery contains the name of a file with data
   stDataSet SourceQuery contains the name of a DataSet with filter if any
   }
   TJobType = (jtWordDoc, jtTextDoc,
               jtCrystalReport, jtScreenBuilderPrint,
               jtPDF, jtCreateXSD);

  IPrintDocument = interface
    ['{0825D192-13E6-40EC-AB56-FD6697AFBF47}']
    function GetDocument: WideString;
    procedure SetDocument(Value: WideString);
    function GetDestination: TPrintDestination;
    procedure SetDestination(Value: TPrintDestination);
    function GetSentFrom: WideString;
    procedure SetSentFrom(Value: WideString);
    function GetSourceType: TSourceType;
    procedure SetSourceType(Value: TSourceType);
    function GetJobType: TJobType;
    procedure SetJobType(Value: TJobType);
    function GetSourceQuery: TStrings;
    procedure SetSourceQuery(Value: TStrings);
    function GetKeyFields: TStrings;
    procedure SetKeyFields(Value: TStrings);
    property Document: WideString read GetDocument write SetDocument;
    property Destination: TPrintDestination read GetDestination write SetDestination;
    property SentFrom: WideString read GetSentFrom write SetSentFrom;
    property SourceType: TSourceType read GetSourceType write SetSourceType;
    property SourceQuery: TStrings read GetSourceQuery write SetSourceQuery;
    property JobType: TJobType read GetJobType write SetJobType;
    property KeyFields: TStrings read GetKeyFields write SetKeyFields;
  end;

  TPrintDocument = class(TInterfacedObject, IPrintDocument)
  private
    FDocument: WideString;
    FDestination: TPrintDestination;
    FSentFrom: WideString;
    FSourceType: TSourceType;
    FKeyFields: TStrings;
    FSourceQuery: TStrings;
    FJobType: TJobType;
    function GetDocument: WideString;
    procedure SetDocument(Value: WideString);
    function GetDestination: TPrintDestination;
    procedure SetDestination(Value: TPrintDestination);
    function GetSentFrom: WideString;
    procedure SetSentFrom(Value: WideString);
    function GetSourceType: TSourceType;
    procedure SetSourceType(Value: TSourceType);
    function GetKeyFields: TStrings;
    procedure SetKeyFields(Value: TStrings);
    function GetJobType: TJobType;
    procedure SetJobType(Value: TJobType);
    function GetSourceQuery: TStrings;
    procedure SetSourceQuery(Value: TStrings);
  public
    constructor Create;
    destructor Destroy; override;
    property Document: WideString read GetDocument write SetDocument;
    property Destination: TPrintDestination read GetDestination write SetDestination;
    property SentFrom: WideString read GetSentFrom write SetSentFrom;
    property SourceType: TSourceType read GetSourceType write SetSourceType;
    property KeyFields: TStrings read GetKeyFields write SetKeyFields;
    property SourceQuery: TStrings read GetSourceQuery write SetSourceQuery;
    property JobType: TJobType read GetJobType write SetJobType;
  end;

  implementation

{ TPrintDocument }

procedure TPrintDocument.SetSourceType(Value: TSourceType);
begin
    FSourceType := Value;
end;

constructor TPrintDocument.Create;
begin
  inherited;
  FKeyFields := TStringlist.Create;
  FSourceQuery := TStringlist.Create;

end;

function TPrintDocument.GetDocument: WideString;
begin
    Result := FDocument;
end;

procedure TPrintDocument.SetJobType(Value: TJobType);
begin
    fJobType := Value;
end;

procedure TPrintDocument.SetKeyFields(Value: TStrings);
begin
   fKeyFields.Assign(Value);
end;

procedure TPrintDocument.SetDestination(Value: TPrintDestination);
begin
    FDestination := Value;
end;

function TPrintDocument.GetSentFrom: WideString;
begin
    Result := FSentFrom;
end;

function TPrintDocument.GetSourceQuery: TStrings;
begin
    Result := FSourceQuery;
end;

procedure TPrintDocument.SetDocument(Value: WideString);
begin
    FDocument := Value;
end;

function TPrintDocument.GetSourceType: TSourceType;
begin
    Result := FSourceType;
end;

procedure TPrintDocument.SetSentFrom(Value: WideString);
begin
    fSentFrom := Value;
end;

function TPrintDocument.GetJobType: TJobType;
begin
    Result := FJobType;
end;

procedure TPrintDocument.SetSourceQuery(Value: TStrings);
begin
    fSourceQuery.Assign(Value);
end;

function TPrintDocument.GetKeyFields: TStrings;
begin
    Result := FKeyFields;
end;

function TPrintDocument.GetDestination: TPrintDestination;
begin
    Result := FDestination;
end;

destructor TPrintDocument.Destroy;
begin
  FreeAndNil(FKeyFields);
  FreeAndNil(FSourceQuery);
  inherited;
end;

end.

