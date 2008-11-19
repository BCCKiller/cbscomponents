unit Design;

interface

uses
  Windows, Messages, Forms, SysUtils,
  Classes, Controls,
  StdCtrls, ExtCtrls, Dialogs, Menus, RunFus, FDMain, CBSComponents, DB, CBSKrimskyDisplay;

type TComponentLoader = class(TComponent)
  private
    FForm: TCustomForm;
    FAncestor: TComponent;
    function GetParentForm: TCustomForm;
    procedure SetParentForm(const Value: TCustomForm);
    procedure SetAncestor(const Value: TComponent);
protected
    property ParentForm: TCustomForm read GetParentForm write SetParentForm;
    property Ancestor: TComponent read FAncestor write SetAncestor;
public
  procedure SaveToStream(Stream: TStream; DFMFormat: TDFMFormat);
  procedure LoadFromStream(Stream: TStream; DFMFormat: TDFMFormat);
end;

type

  TfrmDesign = class(TForm)
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FColumns: Boolean;
    Fcmpformdesigner: TComponentLoader;
    procedure SetColumns(const Value: Boolean);
    procedure RightClicker(Sender: TObject);
    function DummyRead: Integer;
    procedure DummyWrite(const Value: Integer);
    procedure Setcmpformdesigner(const Value: TComponentLoader);
  public
    { Public declarations }
    PrintLayout: Boolean;
    TabName : String;
    TabLabel : String;
    TabNotes: String;
    TabChanged: Boolean;
    TabID : Integer;
    property cmpformdesigner: TComponentLoader read Fcmpformdesigner write Setcmpformdesigner;
    function AutoName(Component: TComponent): Boolean;

  published
    property Columns: Boolean read FColumns write SetColumns Default False;
  end;

var
  frmDesign: TfrmDesign;

implementation

uses FDCmpPal, OIForm, Layout, DBGrids;

const
  WM_SECONDARYPAINT = WM_USER + 1000;
  BufSize = 2048;


{$R *.DFM}

function TfrmDesign.AutoName(Component: TComponent): Boolean;
var
  i: Integer;
  CN: string;
begin
  Result:=False;
  if Assigned(Component) then
    with Component do
    begin
      if (Name='') or Assigned(Self.FindComponent(Name)) then
      begin
        CN:=Copy(ClassName,2,Pred(Length(ClassName)));
        for i:=1 to 32768 do
          if not Assigned(Self.FindComponent(CN+IntToStr(i))) then
          begin
            Name:=CN+IntToStr(i);
            Result:=True;
            Break;
          end;
      end;
    end;
end;

function TfrmDesign.DummyRead: Integer;
begin
  Result := -1;
end;

procedure TfrmDesign.DummyWrite(const Value: Integer);
begin

end;

procedure TfrmDesign.FormActivate(Sender: TObject);
begin
//Place holder
end;

procedure TfrmDesign.FormCreate(Sender: TObject);
begin
  cmpformdesigner := TComponentLoader.Create(Self);
  TabChanged := False;
  FColumns := False;
  If Font.Charset > 5 then Font.Charset := DEFAULT_CHARSET;
end;


procedure TfrmDesign.Setcmpformdesigner(const Value: TComponentLoader);
begin
  Fcmpformdesigner := Value;
end;

procedure TfrmDesign.SetColumns(const Value: Boolean);
begin
  FColumns := Value;
end;

procedure TfrmDesign.FormPaint(Sender: TObject);
begin
  if PrintLayout then
  begin
    Self.Canvas.MoveTo(384,0);
    Self.Canvas.LineTo(384,Self.ClientHeight);
    Self.Canvas.MoveTo(768,0);
    Self.Canvas.LineTo(768,Self.ClientHeight);
    Self.Canvas.MoveTo(1008,0);
    Self.Canvas.LineTo(1008,Self.ClientHeight);
  end;
end;

procedure TfrmDesign.FormShow(Sender: TObject);
begin
  // this is a placeholder to avoice the OnShow loading error
end;

procedure TfrmDesign.RightClicker(Sender: TObject);
begin
// Send windows message
SendMessage(Handle, WM_RBUTTONDOWN,0,0);
SendMessage(Handle, WM_RBUTTONUP,0,0);
end;

procedure TfrmDesign.FormDestroy(Sender: TObject);
begin
  // Need a place holder
end;

procedure TComponentLoader.SaveToStream(Stream: TStream; DFMFormat: TDFMFormat);
var
  Form: TCustomForm;
  BinStream: TMemoryStream;
begin
  if Assigned(ParentForm) then
  begin
    try
      BinStream:=TMemoryStream.Create;
      try
        with TWriter.Create(BinStream,BufSize) do
        try
          Form:=ParentForm;
          Form.RemoveComponent(Self);
          try
            //WriteRootComponent(Form);
            WriteDescendent(Form,FAncestor);
          finally
            Form.InsertComponent(Self);
          end;
        finally
          Free;
        end;
        BinStream.Seek(0,soFromBeginning);
        if DFMFormat=dfmText then ObjectBinaryToText(BinStream,Stream)
        else Stream.CopyFrom(BinStream,0);
      finally
        BinStream.Free;
      end;
    finally
    end;
  end;
end;

function TComponentLoader.GetParentForm: TCustomForm;
begin
  if Assigned(FForm) then Result:=FForm
  else
    if Assigned(Owner) and (Owner is TCustomForm) then Result:=TCustomForm(Owner)
    else Result:=nil;

end;

procedure TComponentLoader.SetAncestor(const Value: TComponent);
begin
  FAncestor := Value;
end;

procedure TComponentLoader.SetParentForm(const Value: TCustomForm);
begin
  if FForm<>Value then
  begin
    {$IFNDEF NOREMOVENOTIFICATION}
    if Assigned(FForm) then FForm.RemoveFreeNotification(Self);
    {$ENDIF}
    if Assigned(FForm) then FForm.Invalidate;
    FForm:=Value;
    if Assigned(FForm) then FForm.Invalidate;
    if Assigned(FForm) then FForm.FreeNotification(Self);
  end;
end;


procedure TComponentLoader.LoadFromStream(Stream: TStream; DFMFormat: TDFMFormat);
var
  BinStream: TMemoryStream;
begin
  if Assigned(ParentForm) then
  begin
    BinStream:=TMemoryStream.Create;
    try
      if DFMFormat=dfmText then ObjectTextToBinary(Stream,BinStream)
      else BinStream.CopyFrom(Stream,0);
      BinStream.Seek(0,soFromBeginning);
      with TReader.Create(BinStream, BUFSIZE) do
      try
        ReadRootComponent(ParentForm);
      finally
        Free;
      end;
    finally
      BinStream.Free;
    end;
  end;
end;

end.
