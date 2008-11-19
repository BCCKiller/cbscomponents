unit CBSKrimskyEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CBSKrimsky, StrUtils;

const PrismString = '1'+#13#10+
'2'+#13#10+
'3'+#13#10+
'4'+#13#10+
'5'+#13#10+
'6'+#13#10+
'7'+#13#10+
'8'+#13#10+
'9'+#13#10+
'10'+#13#10+
'12'+#13#10+
'14'+#13#10+
'15'+#13#10+
'16'+#13#10+
'18'+#13#10+
'20'+#13#10+
'25'+#13#10+
'30'+#13#10+
'35'+#13#10+
'40'+#13#10+
'45'+#13#10+
'50'+#13#10+
'55'+#13#10+
'60'+#13#10+
'max'+#13#10+
'evrinc';

type
  TKrimskyDataEntryForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    HPanel: TPanel;
    HDirectionGroup: TRadioGroup;
    HPrismGroup: TRadioGroup;
    HOrtho: TRadioButton;
    VPanel: TPanel;
    VDirectionGroup: TRadioGroup;
    VPrismGroup: TRadioGroup;
    VOrtho: TRadioButton;
    CopyToBlanksButton: TButton;
    HClear: TButton;
    VClear: TButton;
    CopyToAllButton: TButton;
    procedure HPanelClick(Sender: TObject);
    procedure VPanelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FHorizDirection: String;
    FHorizPrism: String;
    FVertPrism: String;
    FVertDirection: String;
    FGridType: TCBSGridType;
    procedure SetHorizDirection(const Value: String);
    procedure SetHorizPrism(const Value: String);
    procedure SetVertDirection(const Value: String);
    procedure SetVertPrism(const Value: String);
    procedure SetGridType(const Value: TCBSGridType);
    { Private declarations }
  public
    { Public declarations }
    property HorizPrism: String read FHorizPrism write SetHorizPrism;
    property HorizDirection: String read FHorizDirection write SetHorizDirection;
    property VertPrism: String read FVertPrism write SetVertPrism;
    property VertDirection: String read FVertDirection write SetVertDirection;
    property GridType: TCBSGridType read FGridType write SetGridType;
  end;

implementation

{$R *.dfm}

{ TKrimskyDataEntryForm }

procedure TKrimskyDataEntryForm.FormCreate(Sender: TObject);
begin
HPrismGroup.Items.Text := PrismString;
VPrismGroup.Items.Text := PrismString;

end;

procedure TKrimskyDataEntryForm.FormPaint(Sender: TObject);
var ItsOK: Boolean;
begin

  ItsOK :=
  ((HOrtho.Checked)
  or
  ((HDirectionGroup.ItemIndex >= 0) and (HPrismGroup.ItemIndex  >= 0))
  or
  (VOrtho.Checked)
  or
  ((VDirectionGroup.ItemIndex >= 0) and (VPrismGroup.ItemIndex  >= 0)));

  if ItsOK then
  begin
    // Make sure that both direction and prism are or are not selected
    ItsOK :=  ((VDirectionGroup.ItemIndex >= 0) and (VPrismGroup.ItemIndex  >= 0)) or
             ((VDirectionGroup.ItemIndex < 0) and (VPrismGroup.ItemIndex  < 0));
  end;
  if ItsOK then
  begin
    // Make sure that both direction and prism are or are not selected
    ItsOK :=  ((HDirectionGroup.ItemIndex >= 0) and (HPrismGroup.ItemIndex  >= 0)) or
             ((HDirectionGroup.ItemIndex < 0) and (HPrismGroup.ItemIndex  < 0));
  end;
  // if ALL are clear then exit is OK also
  if not ItsOK then
  begin
    // Make sure that both direction and prism are or are not selected
    ItsOK := ((HDirectionGroup.ItemIndex < 0) and (HPrismGroup.ItemIndex  < 0)
              and (VDirectionGroup.ItemIndex < 0) and (VPrismGroup.ItemIndex  < 0)
              and (not HOrtho.Checked) and (not VOrtho.Checked)
              );

  end;
  
  OKButton.Enabled := ItsOK;
  CopyToAllButton.Enabled := ItsOK;
  CopyToBlanksButton.Enabled := ItsOK;

end;

procedure TKrimskyDataEntryForm.HPanelClick(Sender: TObject);
begin
  if Sender is TPanel then exit;
  
  if Sender is TRadioGroup then
  begin
    if TRadioGroup(Sender).Name = 'HPrismGroup' then
      HorizPrism := HPrismGroup.Items[HPrismGroup.ItemIndex]
    else
      HorizDirection := HDirectionGroup.Items[HDirectionGroup.ItemIndex];
    HOrtho.Checked := False;
  end
  else
  begin
    HorizPrism := '';
    HorizDirection := HOrtho.Caption;
    if TControl(Sender).Name='HClear' then
    begin
      HOrtho.Checked := False;
      HorizDirection := '';
    end;
  end;
  Refresh;
end;

procedure TKrimskyDataEntryForm.VPanelClick(Sender: TObject);
begin
  if Sender is TPanel then exit;

  if Sender is TRadioGroup then
  begin
    if TRadioGroup(Sender).Name = 'VPrismGroup' then
      VertPrism := VPrismGroup.Items[VPrismGroup.ItemIndex]
    else
      VertDirection := VDirectionGroup.Items[VDirectionGroup.ItemIndex];
    VOrtho.Checked := False;
  end
  else
  begin
    VertPrism := '';
    VertDirection := VOrtho.Caption;
    if TControl(Sender).Name='VClear' then
    begin
      VOrtho.Checked := False;
      VertDirection := '';
    end;

  end;
  Refresh;
end;

procedure TKrimskyDataEntryForm.SetGridType(const Value: TCBSGridType);
function SetPrime(const BaseString: String):String;
var IsPrime: Boolean;
begin
  IsPrime := False;
  case FGridType of
    CGTscprime:   IsPrime := True;
    CGTccprime:   IsPrime := True;
  end;
  Result := BaseString;
  if IsPrime and not (LeftStr(BaseString,1)=#39) then
    Result := BaseString + #39;
  if not IsPrime and (LeftStr(BaseString,1)=#39) then
    Result := copy(BaseString,1,Length(BaseString)-1);
end;

var I: Integer;
begin
  if FGridType = Value then exit;
  FGridType := Value;
  with HDirectionGroup do
  begin
  for I := 0 to Items.Count - 1 do
    Items[I] := SetPrime(Items[I]);
  end;
  with VDirectionGroup do
  begin
  for I := 0 to Items.Count - 1 do
    Items[I] := SetPrime(Items[I]);
  end;


end;

procedure TKrimskyDataEntryForm.SetHorizDirection(const Value: String);
begin
  FHorizDirection := Value;
  HDirectionGroup.ItemIndex := HDirectionGroup.Items.IndexOf(FHorizDirection);
  if Value = HOrtho.Caption then HOrtho.Checked := True;
  
end;

procedure TKrimskyDataEntryForm.SetHorizPrism(const Value: String);
begin
  FHorizPrism := Value;
  HPrismGroup.ItemIndex := HPrismGroup.Items.IndexOf(FHorizPrism);
end;

procedure TKrimskyDataEntryForm.SetVertDirection(const Value: String);
begin
  FVertDirection := Value;
  VDirectionGroup.ItemIndex := VDirectionGroup.Items.IndexOf(FVertDirection);
  if Value = VOrtho.Caption then VOrtho.Checked := True;

end;

procedure TKrimskyDataEntryForm.SetVertPrism(const Value: String);
begin
  FVertPrism := Value;
  VPrismGroup.ItemIndex := VPrismGroup.Items.IndexOf(FVertPrism);
end;

end.
