unit FrmUsluga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, IBX.IBTable, sharemem, System.TypInfo,
  Data.FMTBcd, Data.SqlExpr, Vcl.ExtCtrls;

type
  TUsluga = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ChangeBtn: TButton;
    DeleteBtn: TButton;
    AddBtn: TButton;
    SaveBtn: TButton;
    FirstBtn: TButton;
    LastBtn: TButton;
    BackBtn: TButton;
    NextBtn: TButton;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource: TDataSource;
    ID_MED_USL: TEdit;
    MED_USL: TEdit;
    USLUGA: TIBQuery;
    Query: TIBQuery;
    Panel1: TPanel;
    Search: TEdit;
    Label4: TLabel;
    TableBtn: TButton;
    procedure readdate();
    procedure updates();
    procedure FormCreate(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SearchChange(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure MED_USLKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usluga: TUsluga;
  data:array[0..1] of string;
implementation

{$R *.dfm}


uses All, frmTable;
procedure openTable (Aowner :Tcomponent); external 'Table.dll' ;

procedure TUsluga.readdate;
Begin
   ID_Med_Usl.Text:=USLUGA.FieldByName('ID_Med_Usl').Value;
   MED_USL.Text:=USLUGA.FieldByName('Med_Usl').Value;
End;
procedure TUsluga.updates;
begin
  data[0]:=ID_Med_Usl.Text;
  data[1]:=MED_USL.Text;
End;

procedure TUsluga.AddBtnClick(Sender: TObject);
begin
if  AddBtn.Caption='������' then  // ���� ������� �� ������ = ������ ��
Begin
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;        //��������� ��� ���� � ������ ����������
  Search.Enabled:=true;          //�������������� ��� ������ ����� ����������
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
MED_USL.Enabled:=False;
  SaveBtn.Enabled:=False;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  AddBtn.Caption:='��������';
  USLUGA.last;
  readdate;
End
  Else                        //����� ���� ������� �� ������ �� = ������ ��
  begin
  lastbtn.Enabled:=false;
  Firstbtn.Enabled:=false;      // ������������� ��� ������  ����� ����������
  Search.Enabled:=false;
  Nextbtn.Enabled:=false;       // ������������� �����
  Backbtn.Enabled:=false;
  MED_USL.Enabled:=True;
  SaveBtn.Enabled:=true;
  DeleteBtn.Enabled:=False;
  ChangeBtn.Enabled:=False;
  AddBtn.Caption:='������';
  USLUGA.last;
  readdate;
  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( USLUGAgen, 0) from RDB$DATABASE');
  query.open;
  ID_MED_USL.text:=inttostr(1+(query.fields[0].asinteger));   //��������� +1 � ID � ����
  MED_USL.text:='';
  end;
end;

procedure TUsluga.BackBtnClick(Sender: TObject);
begin
USLUGA.prior;
readdate;
end;

procedure TUsluga.ChangeBtnClick(Sender: TObject);
begin
if  ChangeBtn.Caption='������' then // ���� ������� �� ������ = ������ ��
Begin
MED_USL.Enabled:=False;         //��������� ��� ���� � ������ ����������
  SaveBtn.Enabled:=False;
  Search.Enabled:=true;
  DeleteBtn.Enabled:=True;
  AddBtn.Enabled:=True;
  ChangeBtn.Caption:='��������';
End
  Else
  begin                    //����� ���� ������� �� ������ �� = ������ ��
    MED_USL.Enabled:=True; // ������������� ��� ������  ����� ����������
  DeleteBtn.Enabled:=False;// ������������� �����
  Search.Enabled:=false;
  AddBtn.Enabled:=False;
  ChangeBtn.Caption:='������';
  end;
  end;

procedure TUsluga.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, USLUGA, IBTransaction, Data); //����� ��������� ��� ��������
with usluga do
begin
SQL.clear;
SQL.Add('SELECT * FROM USLUGA Order by ID_Med_Usl ASC');
open;
first;
end;                      //��������� ���� �� �����
readdate;
end;

procedure TUsluga.SearchChange(Sender: TObject);
begin
try                           //��� ��������� ���� �����������
with  USLUGA do
begin
SQL.clear;                    //������ �� ����� ������� �����������
SQL.Add('SELECT * FROM USLUGA WHERE MED_USL LIKE ' +quotedstr('%'+Search.text+'%'));
open;
end;
readdate;                       //���������� ������
except
end;
end;

procedure TUsluga.TableBtnClick(Sender: TObject);
begin
Key:=1;
openTable(self);
end;

procedure TUsluga.FirstBtnClick(Sender: TObject);
begin
USLUGA.first;
readdate;
end;

procedure TUsluga.FormActivate(Sender: TObject);
begin
USLUGA.First;
readdate;
end;

procedure TUsluga.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
CheckUsers(ChangeBtn,AddBtn,DeleteBtn);
USLUGA.SQL.Add('SELECT * FROM USLUGA Order by ID_Med_Usl ASC');
USLUGA.open;
readdate;
end;

procedure TUsluga.LastBtnClick(Sender: TObject);
begin
USLUGA.last;
readdate;
end;

procedure TUsluga.MED_USLKeyPress(Sender: TObject; var Key: Char);
begin
 if CharInSet(key,['0'..'9','A'..'Z','a'..'z','.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','�','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure TUsluga.NextBtnClick(Sender: TObject);
begin
USLUGA.next;
readdate;
end;

procedure TUsluga.SaveBtnClick(Sender: TObject);
begin
if (ID_MED_USL.text='') or (MED_USL.text='') then ShowMessage('���� �� ����� �� ���������')
else                                       //���� ���� ������ ����� ������
begin                                      //���� �� ������ �� ���������� ���� ��������� ��� ����������
updates;                                   //��������� ������ �������
if ChangeBtn.Caption='������' then         //���������� ������ ������� � ���������
  begin
   MBox(1,query, USLUGA,IBTransaction, Data);
  end;

if AddBtn.Caption='������' then
  begin
   MBox(3,query, USLUGA,IBTransaction, data);
  end;
  With usluga do                  //��������� ������ � �����
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM USLUGA Order by ID_Med_Usl ASC');
   open;
   first;
  end;
  lastbtn.Enabled:=true;
  Firstbtn.Enabled:=true;
  Nextbtn.Enabled:=true;
  Backbtn.Enabled:=true;
  Search.Enabled:=true;
    ID_MED_USL.Enabled:=False;
  SaveBtn.Enabled:=False;
  addBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  ChangeBtn.Enabled:=True;
  ChangeBtn.Caption:='��������';
  USLUGA.last;
  readdate;
   readdate;
end;
end;

end.