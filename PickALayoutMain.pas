unit PickALayoutMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPickPrintLayoutForm = class(TForm)
    LayoutChoices: TRadioGroup;
    ChooseButton: TButton;
    CancelButton: TButton;
    procedure FormActivate(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
    Layouts: array of String;
    LayoutIDs: array of Integer;
  public
    { Public declarations }
    procedure Add(LayoutName: String; LayoutID :Integer);
  end;

var
  PickPrintLayoutForm: TPickPrintLayoutForm;

implementation

{$R *.dfm}

{ TPickLayoutForm }

procedure TPickPrintLayoutForm.Add(LayoutName: String; LayoutID: Integer);
var x: Integer;
begin
  x := Length(layouts)+1;
  SetLength(Layouts,x);
  SetLength(LayoutIDs, x);
  Layouts[x-1] := LayoutName;
  LayoutIDs[x-1] := LayoutID;
end;

procedure TPickPrintLayoutForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := -1;
end;

procedure TPickPrintLayoutForm.ChooseButtonClick(Sender: TObject);
begin
  ModalResult := LayoutIDs[LayoutChoices.ItemIndex];
end;

procedure TPickPrintLayoutForm.FormActivate(Sender: TObject);
var x: Integer;
begin
  LayoutChoices.Items.Clear;
  for x := 0 to Length(Layouts) -1 do
    LayoutChoices.Items.Add(Layouts[x]);
  if X > 3 then
    ClientHeight :=  80
  else
    ClientHeight := x * 20;
end;

end.
