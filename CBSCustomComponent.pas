unit CBSCustomComponent;

interface

{$RESOURCE ARROWS.RES}

uses
  SysUtils, Classes, ComCtrls, StdCtrls, Controls,
  ExtCtrls, DBCtrls, JvExControls, JvComponent, Buttons,
  CheckLst, JvExCheckLst, JvCheckListBox, Dialogs, DB, Graphics;

type
  TCBSDBComboEdit = class(TPanel)
  private
    FListBox: TJvCheckListBox;
    FEdit: TDBEdit;
    FButton: TImage;
    FPanel: TPanel;
    FItemHeight: Integer;
    procedure SetOnButtonClick(const Value: TNotifyEvent);
    function GetOnButtonclick: TNotifyEvent;
    procedure CBSDBComboEditOnClick(Sender: TObject);
    procedure SetItemHeight(Value: Integer);
    function GetItemHeight: Integer;
    procedure SetDataSource(Value: TDataSource);
    function GetDataSource:TDataSource;
    procedure SetDataField(Value: String);
    function GetDataField:String;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure ResizeItems;
    procedure SetCharCase(const Value: TEditCharCase);
    function GetCharCase: TEditCharCase;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ListBox: TJvCheckListBox read FListBox write FListBox;
    property Edit: TDBEdit read FEdit write FEdit;
    property Button: TImage read FButton;
    property Panel: TPanel read FPanel write FPanel;
  published
    property OnButtonClick: TNotifyEvent read GetOnButtonclick write SetOnButtonClick;
    property ItemHeight: Integer read GetitemHeight write SetItemHeight;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: String read GetDataField write SetDataField;
    property Height: Integer read GetHeight write SetHeight;
    property Width: Integer read GetWidth write SetWidth;
    property CharCase: TEditCharCase read GetCharCase write SetCharCase;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TCBSDBComboEdit]);
end;

{ TEditPanel }

procedure TCBSDBComboEdit.CBSDBComboEditOnClick(Sender: TObject);
begin
  ClientHeight := 229;
  FPanel.Height := ClientHeight - FEdit.Height - 4;
  FPanel.Width := ClientWidth;
  BringToFront;
end;

constructor TCBSDBComboEdit.create(AOwner: TComponent);
var  F: TField;
begin
  inherited;
  Parent := AOwner as TWinControl;
  FItemHeight := 29;
  ClientWidth := 200;
  ClientHeight := FItemHeight;
  BevelOuter := bvnone;

  FButton := TImage.Create(self);
  FButton.Parent := self;
  FButton.Name := 'btnButton';
  FButton.Stretch := True;
  FButton.Picture.Bitmap.LoadFromResourceName(Hinstance,'ARROWDOWN1');
  //FButton.Glyph.LoadFromResourceName(Hinstance,'ARROWDOWN1');
  //FButton.Width := FButton.Glyph.Width + FButton.Spacing*3;
  //FButton.Caption := '';
  FButton.Width := FButton.Picture.Width+ 6;
  FButton.Height := Self.Height;
  FButton.Anchors := [akRight,akTop];
  FButton.OnClick := CBSDBComboEditOnClick;

  FEdit := TDBEdit.Create(self);
  FEdit.Parent := self;
  FEdit.Name := 'txtEdit';
  FEdit.Left := 0;
  FEdit.Anchors := [akLeft,akTop,akRight];
  FEdit.OnClick := CBSDBComboEditOnClick;
  // Set edit to be no longer than field length
  if (Assigned(DataSource.DataSet)) and (Assigned(DataSource)) then
  begin
    F := DataSource.DataSet.FindField(DataField);
    if Assigned(F) and (F.DataType in [ftString, ftWideString]) then
    begin
      FEdit.MaxLength := F.Size;
      ShowMessage(IntToStr(F.Size));
    end;

  end;
  ResizeItems;

  FPanel := TPanel.Create(self);
  FPanel.Parent := self;
  FPanel.Name := 'pnlPanel';
  FPanel.Caption := '';
  FPanel.BevelInner := bvNone;
  FPanel.BevelOuter := bvNone;
  FPanel.Align := alBottom;
  FPanel.Height :=0;

  FListBox := TJvCheckListBox.Create(FPanel);
  FListBox.Parent := FPanel;
  FListBox.Name := 'reListBox';
  FListBox.Align := alClient;
  FListBox.AddItem('One',nil);
  FListBox.AddItem('Two',nil);
  FListBox.AddItem('Three',nil);
  FListBox.AddItem('Four',nil);

end;

destructor TCBSDBComboEdit.destroy;
begin
  inherited;
end;

procedure TCBSDBComboEdit.ResizeItems;
begin
  FButton.Left := ClientWidth - FButton.Width;
  FButton.Top := 0;
  FButton.Height := ClientHeight;
  FEdit.Top := FButton.Top;
  FEdit.Width := ClientWidth - FButton.Width;
end;

function TCBSDBComboEdit.GetDataField: String;
begin
    Result := FEdit.DataField;
end;

function TCBSDBComboEdit.GetDataSource: TDataSource;
begin
  Result := FEdit.DataSource;
end;

function TCBSDBComboEdit.GetHeight: Integer;
begin
  Result := ClientHeight;
end;

function TCBSDBComboEdit.GetItemHeight: Integer;
begin
  Result := FItemHeight;
end;

function TCBSDBComboEdit.GetOnButtonclick: TNotifyEvent;
begin
  Result := FButton.OnClick;
end;

function TCBSDBComboEdit.GetWidth: Integer;
begin
  Result := ClientWidth;
end;

procedure TCBSDBComboEdit.SetDataField(Value: String);
begin
  if Value <> FEdit.DataField then
    Fedit.DataField := Value;
end;

procedure TCBSDBComboEdit.SetDataSource(Value: TDataSource);
begin
  if Value <> FEdit.DataSource then
    Fedit.DataSource := Value;
end;

procedure TCBSDBComboEdit.SetHeight(const Value: Integer);
begin
  ClientHeight := Value;
  FEdit.Height := ClientHeight;
  FButton.Height := ClientHeight;
end;

procedure TCBSDBComboEdit.SetItemHeight(Value: Integer);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    RecreateWnd;
  end;
end;

procedure TCBSDBComboEdit.SetOnButtonClick(const Value: TNotifyEvent);
begin
  FButton.OnClick := Value;
end;


procedure TCBSDBComboEdit.SetWidth(const Value: Integer);
begin
  ClientWidth := Value;
  ResizeItems;
end;

procedure TCBSDBComboEdit.SetCharCase(const Value: TEditCharCase);
begin
  FEdit.CharCase := Value;
end;

function TCBSDBComboEdit.GetCharCase: TEditCharCase;
begin
  Result := FEdit.CharCase;
end;

end.

