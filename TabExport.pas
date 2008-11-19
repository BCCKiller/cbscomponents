
{******************************************************************************}
{                                                                              }
{                               XML Data Binding                               }
{                                                                              }
{         Generated on: 08/31/2006 4:09:03 PM                                  }
{       Generated from: C:\DelphiStuff8\Projects\ScreenBuilder\TabExport.xml   }
{   Settings stored in: C:\DelphiStuff8\Projects\ScreenBuilder\TabExport.xdb   }
{                                                                              }
{******************************************************************************}

unit TabExport;

interface

uses xmldom, XMLDoc, XMLIntf, Variants;

type

{ Forward Decls }

  IXMLTabRecordsType = interface;
  IXMLTabRecordType = interface;

{ IXMLTabRecordsType }

  IXMLTabRecordsType = interface(IXMLNodeCollection)
    ['{9471D857-BD11-4740-988D-F4741776C2DA}']
    { Property Accessors }
    function Get_TabRecord(Index: Integer): IXMLTabRecordType;
    { Methods & Properties }
    function Add: IXMLTabRecordType;
    function Insert(const Index: Integer): IXMLTabRecordType;
    property TabRecord[Index: Integer]: IXMLTabRecordType read Get_TabRecord; default;
  end;

{ IXMLTabRecordType }

  IXMLTabRecordType = interface(IXMLNode)
    ['{7E0CF8E1-D68A-4F98-A362-B2574D63FC3D}']
    { Property Accessors }
    function Get_TabID: Integer;
    function Get_TabDescription: WideString;
    function Get_TabLabel: WideString;
    function Get_TabComponents: WideString;
    function Get_TabLastMod: TDateTime;
    function Get_TabCreated: TDateTime;
    function Get_TabInformation: WideString;
    function Get_LayoutType: WideString;
    function Get_PrintLayout: Boolean;
    procedure Set_TabID(Value: Integer);
    procedure Set_TabDescription(Value: WideString);
    procedure Set_TabLabel(Value: WideString);
    procedure Set_TabComponents(Value: WideString);
    procedure Set_TabLastMod(Value: TDateTime);
    procedure Set_TabCreated(Value: TDateTime);
    procedure Set_TabInformation(Value: WideString);
    procedure Set_LayoutType(Value: WideString);
    procedure Set_PrintLayout(Value: Boolean);
    { Methods & Properties }
    property TabID: Integer read Get_TabID write Set_TabID;
    property TabDescription: WideString read Get_TabDescription write Set_TabDescription;
    property TabLabel: WideString read Get_TabLabel write Set_TabLabel;
    property TabComponents: WideString read Get_TabComponents write Set_TabComponents;
    property TabLastMod: TDateTime read Get_TabLastMod write Set_TabLastMod;
    property TabCreated: TDateTime read Get_TabCreated write Set_TabCreated;
    property TabInformation: WideString read Get_TabInformation write Set_TabInformation;
    property LayoutType: WideString read Get_LayoutType write Set_LayoutType;
    property PrintLayout: Boolean read Get_PrintLayout write Set_PrintLayout;
  end;

{ Forward Decls }

  TXMLTabRecordsType = class;
  TXMLTabRecordType = class;

{ TXMLTabRecordsType }

  TXMLTabRecordsType = class(TXMLNodeCollection, IXMLTabRecordsType)
  protected
    { IXMLTabRecordsType }
    function Get_TabRecord(Index: Integer): IXMLTabRecordType;
    function Add: IXMLTabRecordType;
    function Insert(const Index: Integer): IXMLTabRecordType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTabRecordType }

  TXMLTabRecordType = class(TXMLNode, IXMLTabRecordType)
  protected
    { IXMLTabRecordType }
    function Get_TabID: Integer;
    function Get_TabDescription: WideString;
    function Get_TabLabel: WideString;
    function Get_TabComponents: WideString;
    function Get_TabLastMod: TDateTime;
    function Get_TabCreated: TDateTime;
    function Get_TabInformation: WideString;
    function Get_LayoutType: WideString;
    function Get_PrintLayout: Boolean;
    procedure Set_TabID(Value: Integer);
    procedure Set_TabDescription(Value: WideString);
    procedure Set_TabLabel(Value: WideString);
    procedure Set_TabComponents(Value: WideString);
    procedure Set_TabLastMod(Value: TDateTime);
    procedure Set_TabCreated(Value: TDateTime);
    procedure Set_TabInformation(Value: WideString);
    procedure Set_LayoutType(Value: WideString);
    procedure Set_PrintLayout(Value: Boolean);
  end;

{ Global Functions }

function GetTabRecords(Doc: IXMLDocument): IXMLTabRecordsType;
function LoadTabRecords(const FileName: WideString): IXMLTabRecordsType;
function NewTabRecords: IXMLTabRecordsType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetTabRecords(Doc: IXMLDocument): IXMLTabRecordsType;
begin
  Result := Doc.GetDocBinding('TabRecords', TXMLTabRecordsType, TargetNamespace) as IXMLTabRecordsType;
end;

function LoadTabRecords(const FileName: WideString): IXMLTabRecordsType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('TabRecords', TXMLTabRecordsType, TargetNamespace) as IXMLTabRecordsType;
end;

function NewTabRecords: IXMLTabRecordsType;
begin
  Result := NewXMLDocument.GetDocBinding('TabRecords', TXMLTabRecordsType, TargetNamespace) as IXMLTabRecordsType;
end;

{ TXMLTabRecordsType }

procedure TXMLTabRecordsType.AfterConstruction;
begin
  RegisterChildNode('TabRecord', TXMLTabRecordType);
  ItemTag := 'TabRecord';
  ItemInterface := IXMLTabRecordType;
  inherited;
end;

function TXMLTabRecordsType.Get_TabRecord(Index: Integer): IXMLTabRecordType;
begin
  Result := List[Index] as IXMLTabRecordType;
end;

function TXMLTabRecordsType.Add: IXMLTabRecordType;
begin
  Result := AddItem(-1) as IXMLTabRecordType;
end;

function TXMLTabRecordsType.Insert(const Index: Integer): IXMLTabRecordType;
begin
  Result := AddItem(Index) as IXMLTabRecordType;
end;

{ TXMLTabRecordType }

function TXMLTabRecordType.Get_TabID: Integer;
begin
  Result := ChildNodes['TabID'].NodeValue;
end;

procedure TXMLTabRecordType.Set_TabID(Value: Integer);
begin
  ChildNodes['TabID'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabDescription: WideString;
begin
  Result := ChildNodes['TabDescription'].Text;
end;

procedure TXMLTabRecordType.Set_TabDescription(Value: WideString);
begin
  ChildNodes['TabDescription'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabLabel: WideString;
begin
  Result := ChildNodes['TabLabel'].Text;
end;

procedure TXMLTabRecordType.Set_TabLabel(Value: WideString);
begin
  ChildNodes['TabLabel'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabComponents: WideString;
begin
  Result := ChildNodes['TabComponents'].Text;
end;

procedure TXMLTabRecordType.Set_TabComponents(Value: WideString);
begin
  ChildNodes['TabComponents'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabLastMod: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['TabLastMod'].NodeValue);
end;

procedure TXMLTabRecordType.Set_TabLastMod(Value: TDateTime);
begin
  ChildNodes['TabLastMod'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabCreated: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['TabCreated'].NodeValue);
end;

procedure TXMLTabRecordType.Set_TabCreated(Value: TDateTime);
begin
  ChildNodes['TabCreated'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_TabInformation: WideString;
begin
  Result := ChildNodes['TabInformation'].Text;
end;

procedure TXMLTabRecordType.Set_TabInformation(Value: WideString);
begin
  ChildNodes['TabInformation'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_LayoutType: WideString;
begin
  Result := ChildNodes['LayoutType'].Text;
end;

procedure TXMLTabRecordType.Set_LayoutType(Value: WideString);
begin
  ChildNodes['LayoutType'].NodeValue := Value;
end;

function TXMLTabRecordType.Get_PrintLayout: Boolean;
begin
  Result := ChildNodes['PrintLayout'].NodeValue;
end;

procedure TXMLTabRecordType.Set_PrintLayout(Value: Boolean);
begin
  ChildNodes['PrintLayout'].NodeValue := Value;
end;

end.