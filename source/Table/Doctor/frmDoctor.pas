unit frmDoctor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, Vcl.Buttons, Vcl.ExtCtrls;

type
  TDoctor = class(TForm)
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
    ID_DOCTOR: TEdit;
    FNAME_DOC: TEdit;
    Label3: TLabel;
    NAME_DOC: TEdit;
    Label4: TLabel;
    OTCHNAME_DOC: TEdit;
    Label5: TLabel;
    ID_RASP: TComboBox;
    Panel1: TPanel;
    Label6: TLabel;
    Search: TEdit;
    Query: TIBQuery;
    DataSource: TDataSource;
    DOCTOR: TIBQuery;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    TableBtn: TButton;
    procedure readdate();
    procedure updates();
    procedure refresh();
    procedure Combobox();
    procedure FormCreate(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure FNAME_DOCKeyPress(Sender: TObject; var Key: Char);
    procedure SearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Doctor: TDoctor;
  data:array[0..4] of string;

implementation

{$R *.dfm}

uses All, frmTable;

procedure openTable (Aowner :Tcomponent); external 'Table.dll' ;

procedure TDoctor.NextBtnClick(Sender: TObject);
begin

Doctor.next;
readdate;
end;

procedure TDoctor.readdate;
Begin
   ID_DOCTOR.Text:=DOCTOR.FieldByName('ID_DOCTOR').Value;
   FNAME_DOC.Text:=DOCTOR.FieldByName('FNAME_DOC').Value;
   NAME_DOC.Text:=DOCTOR.FieldByName('NAME_DOC').Value;
   OtchNAME_DOC.Text:=DOCTOR.FieldByName('OtchNAME_DOC').Value;

   if DoCtOR.Fieldbyname('ID_RASP').IsNull then ID_RASP.itemindex:=0
   else
   begin
   IBQUERY1.SQL.clear;
   IBQUERY1.SQL.ADD('SELECT * FROM RASP WHERE ID_RASP='+DoCtOR.Fieldbyname('ID_RASP').AsString);
   IBQUERY1.open;
   ID_RASP.ItemIndex:=ID_RASP.items.indexof(IBQUERY1.Fieldbyname('ID_RASP').AsString+', '+IBQUERY1.FieldByName('HOURS_START').AsString+'-'+IBQUERY1.FieldByName('HOURS_end').AsString+', '+IBQUERY1.FieldByName('DAYS_start').AsString+'-'+IBQUERY1.FieldByName('DAYS_end').AsString)
   end;

End;

procedure TDoctor.updates;
begin
  data[0]:=ID_DOCTOR.Text;
  data[1]:=FNAME_DOC.Text;
  data[2]:=NAME_DOC.Text;
  data[3]:=OtchNAME_DOC.Text;
  BoxId(ID_RASP,data[4]);
End;

procedure TDoctor.ChangeBtnClick(Sender: TObject);
begin
if  ChangeBtn.Caption='??????' then
Begin
    ID_DOCTOR.Enabled:=False;
    FNAME_DOC.Enabled:=False;
  Search.Enabled:=true;
    NAME_DOC.Enabled:=False;
    OtchNAME_DOC.Enabled:=False;
    ID_RASP.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  AddBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
End
  Else
  begin
    ID_DOCTOR.Enabled:=true;
    FNAME_DOC.Enabled:=true;
    NAME_DOC.Enabled:=true;
  Search.Enabled:=false;
    OtchNAME_DOC.Enabled:=true;
    ID_RASP.Enabled:=true;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  AddBtn.Enabled:=False;
  ChangeBtn.Caption:='??????';
  end;
end;

procedure TDoctor.COMBOBOX;
Begin
ID_RASP.items.clear;
  With DOCTOR do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM RASP');
   open;
   first;
  end;
  ID_RASP.items.add('?? ???????');
  while not(DOCTOR.EOF) do
    begin
     ID_RASP.items.add(DOCTOR.FieldByName('ID_RASP').AsString+', '+DOCTOR.FieldByName('HOURS_Start').AsString+'-'+DOCTOR.FieldByName('HOURS_end').AsString+', '+DOCTOR.FieldByName('DAYS_start').AsString+'-'+DOCTOR.FieldByName('DAYS_end').AsString);
     DOCTOR.next;
    end;
End;

procedure TDoctor.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, DOCTOR, IBTransaction, Data);
refresh();
DOCTOR.first;
readdate;
end;

procedure TDoctor.refresh;
Begin
  With DOCTOR do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM DOCTOR Order by ID_DOCTOR ASC');
   open;
  end;
End;

procedure TDoctor.SaveBtnClick(Sender: TObject);
begin
if (Fname_doc.Text='') or (ID_RASP.Text='?? ???????') or(name_doc.Text='') or (otchname_doc.Text='') then showmessage('????????? ??? ???? ? *!') else
begin

updates;
if ChangeBtn.Caption='??????' then
  begin
   MBox(1,query, DOCTOR, IBTransaction, Data);
  end;

if AddBtn.Caption='??????' then
  begin
   MBox(3,query, DOCTOR, IBTransaction, data);
  end;
   refresh;
   DOCTOR.first;

lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    Fname_doc.Enabled:=False;
    ID_RASP.Enabled:=False;
    name_doc.Enabled:=False;
    otchname_doc.Enabled:=False;
  SaveBtn.Enabled:=False;
  addBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
  DOCTOR.last;
  readdate;
end;
end;

procedure TDoctor.SearchChange(Sender: TObject);
begin
try
with DOCTOR do
begin
SQL.clear;
SQL.Add('SELECT * FROM Doctor WHERE FName_doc LIKE ' +quotedstr('%'+Search.text+'%'));
open;
readdate;
end;
except

end;
end;

procedure TDoctor.TableBtnClick(Sender: TObject);
begin
Key:=4;
openTable(self);
end;

procedure TDoctor.AddBtnClick(Sender: TObject);
begin
if  AddBtn.Caption='??????' then
Begin
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Search.Enabled:=true;
  Backbtn.Enabled:=true;
    ID_DOCTOR.Enabled:=False;
    FNAME_DOC.Enabled:=False;
    NAME_DOC.Enabled:=False;
    OtchNAME_DOC.Enabled:=False;
    ID_RASP.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  AddBtn.Caption:='????????';
  DOCTOR.last;
  readdate;
End
  Else
  begin
  lastbtn.Enabled:=false;
  Firstbtn.Enabled:=false;
  Nextbtn.Enabled:=false;
  Backbtn.Enabled:=false;
    ID_DOCTOR.Enabled:=true;
    FNAME_DOC.Enabled:=true;
  Search.Enabled:=false;
    NAME_DOC.Enabled:=true;
    OtchNAME_DOC.Enabled:=true;
    ID_RASP.Enabled:=true;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  ChangeBtn.Enabled:=False;
  AddBtn.Caption:='??????';
  DOCTOR.last;
  refresh;
  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( DOCTORgen, 0) from RDB$DATABASE');
  query.open;
  ID_DOCTOR.text:=inttostr(1+(query.fields[0].asinteger));
    FNAME_DOC.Text:='';
    NAME_DOC.Text:='';
    OtchNAME_DOC.Text:='';
    ID_RASP.Text:='';
  end;
end;

procedure TDoctor.BackBtnClick(Sender: TObject);
begin
Doctor.prior;
readdate;
end;

procedure TDoctor.FirstBtnClick(Sender: TObject);
begin
Doctor.first;
readdate;
end;

procedure TDoctor.FNAME_DOCKeyPress(Sender: TObject; var Key: Char);
begin

 if CharInSet(key,['0'..'9','A'..'Z','a'..'z','.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','?','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure TDoctor.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
CheckUsers(ChangeBtn,AddBtn,DeleteBtn);
COMBOBOX;
refresh;
readdate;
end;

procedure TDoctor.LastBtnClick(Sender: TObject);
begin
Doctor.last;
readdate;
end;

end.
