unit FrmPacient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Vcl.ExtCtrls, dateutils;

type
  TPacient = class(TForm)
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
    ID_PACIENT: TEdit;
    FNAME: TEdit;
    Label3: TLabel;
    NAME: TEdit;
    Label4: TLabel;
    OTCHNAME: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ID_CART: TEdit;
    Label7: TLabel;
    EMAIL: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    OMS: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    STREET: TEdit;
    Building: TEdit;
    Label12: TLabel;
    APART: TEdit;
    Label14: TLabel;
    Date_Born: TDateTimePicker;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource: TDataSource;
    PACIENT: TIBQuery;
    Query: TIBQuery;
    Panel1: TPanel;
    Label13: TLabel;
    Search: TEdit;
    RadioGroup1: TRadioGroup;
    TableBtn: TButton;
    Tel: TMaskEdit;
    procedure readdate();
    procedure updates();
    procedure refresh();
    procedure FormCreate(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SearchChange(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure FNAMEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pacient: TPacient;
  data:array[0..12] of string;

implementation

{$R *.dfm}

uses All, frmTable;
procedure openTable (Aowner :Tcomponent); external 'Table.dll' ;

procedure TPacient.readdate;
Begin
   ID_PACIENT.Text:=PACIENT.FieldByName('ID_PACIENT').Value;
   NAME.Text:=PACIENT.FieldByName('NAME').Value;
   FNAME.Text:=PACIENT.FieldByName('FNAME').Value;
   OtchNAME.Text:=PACIENT.FieldByName('OtchNAME').Value;
   DATE_BORN.Date:=PACIENT.FieldByName('DATE_BORN').Value;
   ID_CART.Text:=PACIENT.FieldByName('ID_CART').Value;
   TEL.Text:=PACIENT.FieldByName('TEL').Value;
   OMS.Text:=PACIENT.FieldByName('OMS').Value;
   if varisnull(PACIENT.FieldByName('EMAIL').Value)then EMAIL.Text:='?? ??????'
   else EMAIL.Text:=PACIENT.FieldByName('EMAIL').Value;
   STREET.Text:=PACIENT.FieldByName('STREET').Value;
   BUILDING.Text:=PACIENT.FieldByName('BUILDING').Value;
   APART.Text:=PACIENT.FieldByName('APART').Value;
   if PACIENT.FieldByName('POL').Value='?' then Radiogroup1.itemindex:=0
   else Radiogroup1.itemindex:=1;
End;

procedure TPacient.updates;
begin
  data[0]:=ID_PACIENT.Text;
  data[1]:=FNAME.Text;
  data[2]:=NAME.Text;
  data[3]:=OtchNAME.Text;
  data[4]:=dateTostr(DATE_BORN.date);
  data[5]:=ID_CART.Text;
  if EMAIL.Text='' then data[6]:='NULL'
  else data[6]:=EMAIL.Text;
  data[7]:=TEL.Text;
  data[8]:=OMS.Text;
  data[9]:=STREET.Text;
  data[10]:=BUILDING.Text;
  if Radiogroup1.itemindex=1 then   data[11]:='?'
   else data[11]:='?';
  data[12]:=APART.Text;
End;

procedure TPacient.refresh;
Begin
  With Pacient do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM Pacient Order by ID_Pacient ASC');
   open;
  end;
End;

procedure TPacient.SaveBtnClick(Sender: TObject);
begin
if (length(TEL.text)<13) or (length(OMS.text)<16) or (length(ID_CART.text)<5) then showmessage('????? ???????????? ????? ??? ??? ??? ????? ????????, ?? ?????????? ???????')
 else
 begin
  if (Fname.Text='') or (name.Text='') or (street.Text='') or (apart.Text='')or (ID_CART.Text='')or (TEL.Text='')or (OMS.Text='')or (building.Text='') or (otchname.Text='') then showmessage('????????? ??? ???? ? *!') else
    begin
    if (date_born.Date>Now()) then showmessage('?? ?? ?????????') else
      begin
        if (date_born.Date>IncYear(now(),-18)) then showmessage('???????? ??? 18 ???!') else
        begin
          begin
            updates;
            if ChangeBtn.Caption='??????' then
              begin
               MBox(1,query, PACIENT, IBTransaction, Data);
              end;

            if AddBtn.Caption='??????' then
              begin
               MBox(3,query, PACIENT, IBTransaction, data);
              end;
               refresh;
               pacient.first;


lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    Fname.Enabled:=False;
    street.Enabled:=False;
    name.Enabled:=False;
    otchname.Enabled:=False;

    apart.Enabled:=False;
    ID_CART.Enabled:=False;
    TEL.Enabled:=False;
    OMS.Enabled:=False;

    DATE_BORN.Enabled:=False;
    Email.Enabled:=False;

    building.Enabled:=False;
  SaveBtn.Enabled:=False;
  addBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
  PACIENT.last;
  readdate;
          end;
        end;
      end;
  end;
 end;
end;

procedure TPacient.SearchChange(Sender: TObject);
begin
try
with pacient do
  begin
  SQL.clear;
  SQL.Add('SELECT * FROM PACIENT WHERE OMS LIKE ' +quotedstr(Search.text+'%'));
  open;
  end;
  readdate;
except

end;
end;

procedure TPacient.TableBtnClick(Sender: TObject);
begin
Key:=3;
openTable(self);
end;

procedure TPacient.AddBtnClick(Sender: TObject);
begin
if  AddBtn.Caption='??????' then
Begin
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
    NAME.Enabled:=False;
    Fname.Enabled:=False;
    OtchNAME.Enabled:=False;
    DAte_born.Enabled:=False;
    ID_CART.Enabled:=False;
  Search.Enabled:=true;
    TEL.Enabled:=False;
    OMS.Enabled:=False;
    EMAIL.Enabled:=False;
    STREET.Enabled:=False;
    BUILDING.Enabled:=False;
    Apart.Enabled:=False;
    Radiogroup1.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  AddBtn.Caption:='????????';
  PACIENT.last;
  readdate;
End
  Else
  begin
  lastbtn.Enabled:=false;
  Firstbtn.Enabled:=false;
  Nextbtn.Enabled:=false;
  Backbtn.Enabled:=false;
    NAME.Enabled:=True;
    Fname.Enabled:=True;
    OtchNAME.Enabled:=True;
  Search.Enabled:=false;
    DAte_born.Enabled:=True;
    ID_CART.Enabled:=True;
    TEL.Enabled:=True;
    OMS.Enabled:=True;
    EMAIL.Enabled:=True;
    STREET.Enabled:=True;
    BUILDING.Enabled:=True;
    Apart.Enabled:=True;
    Radiogroup1.Enabled:=True;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  ChangeBtn.Enabled:=False;
  AddBtn.Caption:='??????';
  PACIENT.last;
  refresh;
  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( PACIENTgen, 0) from RDB$DATABASE');
  query.open;
  ID_PACIENT.text:=inttostr(1+(query.fields[0].asinteger));
    NAME.Text:='';
    FNAME.Text:='';
    OtchNAME.Text:='';
    ID_CART.Text:='';
    TEL.Text:='';
    OMS.Text:='';
    EMAIL.Text:='';
    STREET.Text:='';
    BUILDING.Text:='';
    APART.Text:='';
    Radiogroup1.itemindex:=0;
  end;
end;

procedure TPacient.BackBtnClick(Sender: TObject);
begin
PACIENT.prior;
readdate;
end;

procedure TPacient.ChangeBtnClick(Sender: TObject);
begin
if  ChangeBtn.Caption='??????' then
Begin
readdate;
    NAME.Enabled:=False;
    Fname.Enabled:=False;
    OtchNAME.Enabled:=False;
  Search.Enabled:=true;
    DAte_born.Enabled:=False;
    ID_CART.Enabled:=False;
    TEL.Enabled:=False;
    OMS.Enabled:=False;
    EMAIL.Enabled:=False;
    STREET.Enabled:=False;
    BUILDING.Enabled:=False;
    Apart.Enabled:=False;
    Radiogroup1.Enabled:=False;

  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  AddBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
End
  Else
  begin
    NAME.Enabled:=True;
    Fname.Enabled:=True;
    OtchNAME.Enabled:=True;
    DAte_born.Enabled:=True;
    ID_CART.Enabled:=True;
    TEL.Enabled:=True;
  Search.Enabled:=false;
    OMS.Enabled:=True;
    EMAIL.Enabled:=True;
    STREET.Enabled:=True;
    BUILDING.Enabled:=True;
    Apart.Enabled:=True;
    Radiogroup1.Enabled:=True;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  AddBtn.Enabled:=False;
  ChangeBtn.Caption:='??????';
  end;
end;

procedure TPacient.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, PACIENT, IBTransaction, Data);
refresh();
PACIENT.first;
readdate;
end;

procedure TPacient.FirstBtnClick(Sender: TObject);
begin
PACIENT.first;
readdate;
end;

procedure TPacient.FNAMEKeyPress(Sender: TObject; var Key: Char);
begin

 if CharInSet(key,['0'..'9','A'..'Z','a'..'z','.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','?','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure TPacient.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
CheckUsers(ChangeBtn,AddBtn,DeleteBtn);
refresh;
readdate;
end;

procedure TPacient.LastBtnClick(Sender: TObject);
begin
PACIENT.last;
readdate;
end;

procedure TPacient.NextBtnClick(Sender: TObject);
begin
PACIENT.next;
readdate;
end;

end.
