unit Cabinet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids,
  Vcl.DBGrids;

type
  Tfrmcab = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    FirstBtn: TButton;
    LastBtn: TButton;
    BackBtn: TButton;
    NextBtn: TButton;
    GroupBox2: TGroupBox;
    ChangeBtn: TButton;
    DeleteBtn: TButton;
    AddBtn: TButton;
    SaveBtn: TButton;
    CAB: TEdit;
    NAME_CAB: TEdit;
    Label3: TLabel;
    ID_DOCTOR: TComboBox;
    Panel1: TPanel;
    Label4: TLabel;
    Search: TEdit;
    Query: TIBQuery;
    DataSource: TDataSource;
    CABINET: TIBQuery;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    TableBtn: TButton;
    Label5: TLabel;
    ID_MED_USL: TComboBox;
    procedure Combobox;
    procedure readdate;
    procedure updates;
    procedure refresh;
    procedure BackBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure NAME_CABKeyPress(Sender: TObject; var Key: Char);
    procedure SearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcab: Tfrmcab;
  data:array[0..3] of string;

implementation

{$R *.dfm}
uses All, frmTable;
procedure openTable (Aowner :Tcomponent); external 'Table.dll' ;

procedure Tfrmcab.readdate;
Begin
   CAB.Text:=CABINET.FieldByName('CAB').Value;
   NAME_CAB.Text:=CABINET.FieldByName('NAME_CAB').Value;

   if CABINET.Fieldbyname('ID_DOCTOR').IsNull then ID_DOCTOR.itemindex:=0
   else
   begin
   with QUERY do
   begin
   SQL.clear;
   SQL.ADD('SELECT * FROM DOCTOR WHERE ID_DOCTOR='+CABINET.Fieldbyname('ID_DOCTOR').AsString);
   open;
   ID_DOCTOR.ItemIndex:=ID_DOCTOR.items.indexof(Fieldbyname('ID_DOCTOR').AsString+', '+FieldByName('FNAME_DOC').AsString+', '+FieldByName('NAME_DOC').AsString+', '+FieldByName('OTCHNAME_DOC').AsString)

   end;
   end;

   if CABINET.Fieldbyname('ID_MED_USL').IsNull then ID_MED_USL.itemindex:=0
   else
   begin
   with QUERY do
   begin
   SQL.clear;
   SQL.ADD('SELECT * FROM USLUGA WHERE ID_MED_USL='+CABINET.Fieldbyname('ID_MED_USL').AsString);
   open;
   ID_MED_USL.ItemIndex:=ID_MED_USL.items.indexof(Fieldbyname('ID_MED_USL').AsString+', '+FieldByName('MED_USL').AsString)
   end;
   end;
End;

procedure Tfrmcab.updates;
begin
  data[0]:=CAB.Text;
  data[1]:=NAME_CAB.Text;
  BoxId(ID_DOCTOR,data[2]);
  BoxId(ID_MED_USL,data[3]);
End;

procedure Tfrmcab.refresh;
Begin
  With CABINET do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM CABINET Order by CAB ASC');
   open;
  end;
End;

procedure Tfrmcab.SaveBtnClick(Sender: TObject);
begin
if (Name_Cab.Text='') or (ID_MED_USL.Text='?? ???????') or (ID_DOCTOR.Text='?? ???????') then showmessage('????????? ??? ???? ? *!') else
  begin
    updates;
    if ChangeBtn.Caption='??????' then
      begin
       MBox(1,query, CABINET, IBTransaction, Data);
      end;

    if AddBtn.Caption='??????' then
      begin
       MBox(3,query, CABINET, IBTransaction, data);
      end;
       refresh;
       CABINET.first;
    lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    NAME_CAB.Enabled:=False;
    ID_DOCTOR.Enabled:=False;
    ID_MED_USl.Enabled:=False;
  SaveBtn.Enabled:=False;
  addBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
  CABINET.last;
  readdate;
  end;
end;

procedure Tfrmcab.SearchChange(Sender: TObject);
begin
with Cabinet do
begin
SQL.clear;
SQL.Add('SELECT * FROM Cabinet WHERE name_Cab LIKE ' +quotedstr('%'+Search.text+'%'));
open;
readdate;
end;
end;

procedure Tfrmcab.TableBtnClick(Sender: TObject);
begin
Key:=5;
openTable(self);
end;

procedure Tfrmcab.AddBtnClick(Sender: TObject);
begin
if  AddBtn.Caption='??????' then
Begin
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    NAME_CAB.Enabled:=False;
    ID_DOCTOR.Enabled:=False;
    ID_MED_USl.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  AddBtn.Caption:='????????';
  CABINET.last;
  readdate;
End
  Else
  begin
  lastbtn.Enabled:=false;
  Firstbtn.Enabled:=false;
  Nextbtn.Enabled:=false;
  Search.Enabled:=false;
  Backbtn.Enabled:=false;
    ID_DOCTOR.Enabled:=true;
    NAME_CAB.Enabled:=true;
    ID_MED_USl.Enabled:=true;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  ChangeBtn.Enabled:=False;
  AddBtn.Caption:='??????';
  CABINET.last;
  refresh;
  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( CABINETgen, 0) from RDB$DATABASE');
  query.open;
    ID_DOCTOR.itemindex:=0;
    CAB.text:=inttostr(1+(query.fields[0].asinteger));
    NAME_CAB.Text:='';
  end;
end;

procedure Tfrmcab.BackBtnClick(Sender: TObject);
begin
CABINET.prior;
readdate;
end;

procedure Tfrmcab.ChangeBtnClick(Sender: TObject);
begin
if  ChangeBtn.Caption='??????' then
Begin
    ID_DOCTOR.Enabled:=False;
    NAME_CAB.Enabled:=false;
  SaveBtn.Enabled:=False;
    ID_MED_USl.Enabled:=False;
  Search.Enabled:=true;
  DeleteBtn.Enabled:=True;
  AddBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
End
  Else
  begin
    ID_DOCTOR.Enabled:=true;
    NAME_CAB.Enabled:=true;
  Search.Enabled:=false;
    ID_MED_USl.Enabled:=true;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  AddBtn.Enabled:=False;
  ChangeBtn.Caption:='??????';
  end;
end;

procedure Tfrmcab.COMBOBOX;
Begin

ID_MED_USL.items.clear;
ID_DOCTOR.items.clear;

  With CABINET do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM DOCTOR');
   open;
   first;
  end;
  ID_DOCTOR.items.add('?? ???????');
  while not(CABINET.EOF) do
    begin
     ID_DOCTOR.items.add(CABINET.FieldByName('ID_DOCTOR').AsString+', '+CABINET.FieldByName('FNAME_DOC').AsString+', '+CABINET.FieldByName('NAME_DOC').AsString+', '+CABINET.FieldByName('OTCHNAME_DOC').AsString);
     CABINET.next;
    end;

      With CABINET do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM USLUGA');
   open;
   first;
  end;
  ID_MED_USL.items.add('?? ???????');
  while not(CABINET.EOF) do
    begin
     ID_MED_USL.items.add(CABINET.FieldByName('ID_MED_USL').AsString+', '+CABINET.FieldByName('MED_USL').AsString);
     CABINET.next;
    end;
End;

procedure Tfrmcab.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, CABINET, IBTransaction, Data);
refresh();
CABINET.first;
readdate;
end;

procedure Tfrmcab.FirstBtnClick(Sender: TObject);
begin

CABINET.first;
readdate;
end;

procedure Tfrmcab.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
CheckUsers(ChangeBtn,AddBtn,DeleteBtn);
COMBOBOX;
refresh;
readdate;
end;

procedure Tfrmcab.LastBtnClick(Sender: TObject);
begin
CABINET.last;
readdate;
end;

procedure Tfrmcab.NAME_CABKeyPress(Sender: TObject; var Key: Char);
begin
 if CharInSet(key,['0'..'9','A'..'Z','a'..'z','.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','?','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure Tfrmcab.NextBtnClick(Sender: TObject);
begin
CABINET.next;
readdate;
end;

end.
