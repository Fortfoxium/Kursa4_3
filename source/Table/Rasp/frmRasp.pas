unit frmRasp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, Vcl.Mask;

type
  TRasp = class(TForm)
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
    ID_RASP: TEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Search: TEdit;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource1: TDataSource;
    RASP: TIBQuery;
    Query: TIBQuery;
    HOURS_START: TMaskEdit;
    HOURS_END: TMaskEdit;
    Label3: TLabel;
    TableBtn: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Days_start: TComboBox;
    Days_end: TComboBox;
    procedure readdate();
    procedure updates();
    procedure refresh();
    procedure FirstBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure SearchChange(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure Days_startChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
                          Const
                          weekdays: array of string= ['???????????','???????','?????','???????','???????'];
var
  Rasp: TRasp;
  data:array[0..4] of string;
implementation

{$R *.dfm}

uses All, frmTable;
procedure openTable (Aowner :Tcomponent); external 'Table.dll' ;

procedure TRasp.readdate;
Begin
   ID_RASP.Text:=RASP.FieldByName('ID_RASP').Value;
   DAYS_START.itemindex:=DAYS_START.items.indexof(RASP.FieldByName('DAYS_START').AsString);
   DAYS_End.itemindex:=DAYS_End.items.indexof(RASP.FieldByName('DAYS_End').AsString);
   HOURS_Start.Text:=RASP.FieldByName('HOURS_Start').Value;
   HOURS_end.Text:=RASP.FieldByName('HOURS_end').Value;
End;

procedure TRasp.refresh;
Begin
  With RASP do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM RASP Order by ID_RASP ASC');
   open;
  end;
End;

procedure TRasp.updates;
begin
  data[0]:=ID_RASP.Text;
  data[1]:=DAYS_START.Text;
  data[2]:=DAYS_end.Text;
  data[3]:=Hours_START.Text;
  data[4]:=Hours_end.Text;
End;

procedure TRasp.SaveBtnClick(Sender: TObject);
begin
updates;
if ChangeBtn.Caption='??????' then
  begin
   MBox(1,query, RASP,IBTransaction, Data);
  end;

if AddBtn.Caption='??????' then
  begin
   MBox(3,query, RASP,IBTransaction, data);
  end;
   refresh();
   RASP.first;
lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    DAYS_START.Enabled:=False;
    DAYS_END.Enabled:=False;
    HOURS_START.Enabled:=False;
    HOURS_END.Enabled:=False;
  SaveBtn.Enabled:=False;
  addBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
  RASP.last;
  readdate;
end;

procedure TRasp.SearchChange(Sender: TObject);
begin
try
RASP.SQL.clear;
RASP.SQL.Add('SELECT * FROM RASP WHERE DAYS_Start LIKE ' +quotedstr('%'+Search.text+'%'));
RASP.open;
readdate;
except

end;
end;

procedure TRasp.TableBtnClick(Sender: TObject);
begin

Key:=2;
openTable(self);
end;

procedure TRasp.AddBtnClick(Sender: TObject);
begin
if  AddBtn.Caption='??????' then
Begin
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
    DAYS_START.Enabled:=False;
  Search.Enabled:=true;
    DAYS_END.Enabled:=False;
    Hours_START.Enabled:=False;
    Hours_end.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  AddBtn.Caption:='????????';
  RASP.last;
  readdate;
End
  Else
  begin
  lastbtn.Enabled:=false;
  Firstbtn.Enabled:=false;
  Nextbtn.Enabled:=false;
  Backbtn.Enabled:=false;
    DAYS_START.Enabled:=True;
    DAYS_end.Enabled:=True;
  Search.Enabled:=false;
    Hours_START.Enabled:=True;
    Hours_end.Enabled:=True;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  ChangeBtn.Enabled:=False;
  AddBtn.Caption:='??????';
  RASP.last;
  readdate;
  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( RASPgen, 0) from RDB$DATABASE');
  query.open;
  ID_RASP.text:=inttostr(1+(query.fields[0].asinteger));
    DAYS_START.text:='';
    DAYS_end.text:='';
      Hours_START.text:='';
    Hours_end.text:='';
  end;
end;

procedure TRasp.BackBtnClick(Sender: TObject);
begin

RASP.prior;
readdate;
end;

procedure TRasp.ChangeBtnClick(Sender: TObject);
begin
if  ChangeBtn.Caption='??????' then
Begin
    DAYS_START.Enabled:=False;
    DAYS_END.Enabled:=False;
  Search.Enabled:=true;
    Hours_START.Enabled:=False;
    Hours_end.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  AddBtn.Enabled:=True;
  ChangeBtn.Caption:='????????';
End
  Else
  begin
    DAYS_START.Enabled:=True;
    DAYS_end.Enabled:=True;
    Hours_START.Enabled:=True;
  Search.Enabled:=false;
    Hours_end.Enabled:=True;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  AddBtn.Enabled:=False;
  ChangeBtn.Caption:='??????';
  end;
end;

procedure TRasp.Days_startChange(Sender: TObject);
begin
case days_start.Itemindex of
0:begin
  days_end.items.Clear;
  days_end.items.Add(weekdays[0]);
  days_end.items.Add(weekdays[1]);
  days_end.items.Add(weekdays[2]);
  days_end.items.Add(weekdays[3]);
  days_end.items.Add(weekdays[4]);
  end;
1: begin
  days_end.items.Clear;
  days_end.items.Add(weekdays[1]);
  days_end.items.Add(weekdays[2]);
  days_end.items.Add(weekdays[3]);
  days_end.items.Add(weekdays[4]);
  end;
2: begin
  days_end.items.Clear;
  days_end.items.Add(weekdays[2]);
  days_end.items.Add(weekdays[3]);
  days_end.items.Add(weekdays[4]);
  end;
3: begin
  days_end.items.Clear;
  days_end.items.Add(weekdays[3]);
  days_end.items.Add(weekdays[4]);
  end;
4: begin
  days_end.items.Clear;
  days_end.items.Add(weekdays[4]);
  end;
end;
end;

procedure TRasp.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, Rasp, IBTransaction, Data);
refresh();
Rasp.first;
readdate;
end;

procedure TRasp.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
CheckUsers(ChangeBtn,AddBtn,DeleteBtn);
refresh();
readdate;
end;

procedure TRasp.FirstBtnClick(Sender: TObject);
begin
RASP.First;
readdate;
end;

procedure TRasp.LastBtnClick(Sender: TObject);
begin
RASP.last;
readdate;
end;

procedure TRasp.NextBtnClick(Sender: TObject);
begin
RASP.next;
readdate;
end;

end.
