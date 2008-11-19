unit TabAdjustMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, JvExCheckLst, JvCheckListBox, StrUtils;

const DeleteFromAll = 98;
      DeleteFromCurrent = 99;

type
  TTabAdjustForm = class(TForm)
    TabList: TJvCheckListBox;
    CancelButton: TButton;
    ChangeButton: TButton;
    AffectGroup: TRadioGroup;
    procedure ChangeButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    FSortTabs: Boolean;
    procedure SetSortTabs(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property SortTabs: Boolean read FSortTabs write SetSortTabs;
  end;

var
  TabAdjustForm: TTabAdjustForm;

implementation

{$R *.dfm}

procedure TTabAdjustForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := 1;
end;

procedure TTabAdjustForm.SetSortTabs(const Value: Boolean);
begin
  FSortTabs := Value;
  Caption := ifthen(SortTabs, 'Sort Tabs', 'Delete Tabs');
  AffectGroup.Visible := not FSortTabs;
end;

procedure TTabAdjustForm.ChangeButtonClick(Sender: TObject);
begin
  if AffectGroup.Visible then
  begin
    if AffectGroup.ItemIndex = 1 then
      ModalResult := DeleteFromAll
    else
      ModalResult := DeleteFromCurrent;
  end
  else
    ModalResult := 50;
end;

end.
