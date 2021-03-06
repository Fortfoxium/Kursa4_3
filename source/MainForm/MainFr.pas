unit MainFr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Data.DB, IBX.IBDatabase, inifiles,IBX.IBCustomDataSet, IBX.IBQuery;

type
  TMain = class(TForm)
    StatusBar1: TStatusBar;
    IBTransaction: TIBTransaction;
    Query: TIBQuery;
    DB: TIBDatabase;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Enter: TMenuItem;
    Register: TMenuItem;
    Exit: TMenuItem;
    Sprav: TMenuItem;
    RaspM: TMenuItem;
    PacientM: TMenuItem;
    UslugaM: TMenuItem;
    CabinetM: TMenuItem;
    DoctorM: TMenuItem;
    Otchet: TMenuItem;
    N14: TMenuItem;
    N7: TMenuItem;
    AutorsM: TMenuItem;
    AboutM: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    procedure kill();
    procedure RegisterClick(Sender: TObject);
    procedure DoctorMClick(Sender: TObject);
    procedure RaspMClick(Sender: TObject);
    procedure PacientMClick(Sender: TObject);
    procedure UslugaMClick(Sender: TObject);
    procedure CabinetMClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure AutorsMClick(Sender: TObject);
    procedure AboutMClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnterClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private

  public

  end;

var
  ini:tinifile;
  Main: TMain;

implementation

uses FrmLogin, FrmRegister;

procedure openDoctor (Aowner :Tcomponent); external 'Table.dll' ;
procedure openUsluga (Aowner :Tcomponent); external 'Table.dll' ;
procedure openPacient (Aowner :Tcomponent); external 'Table.dll' ;
procedure openRasp (Aowner :Tcomponent); external 'Table.dll' ;
procedure openCabinet (Aowner :Tcomponent); external 'Table.dll' ;

procedure openTalon (Aowner :Tcomponent); external 'Otchet.dll' ;

procedure openAbout (Aowner :Tcomponent); external 'Spravka.dll' ;
procedure openAutors (Aowner :Tcomponent); external 'Spravka.dll' ;

procedure openForDoctor (Aowner :Tcomponent); external 'Otchets.dll' ;

{$R *.dfm}

procedure TMain.PacientMClick(Sender: TObject);
begin
openPacient(self);
end;

procedure TMain.UslugaMClick(Sender: TObject);
begin
openUsluga(self);
end;

procedure TMain.CabinetMClick(Sender: TObject);
begin
openCabinet(self);
end;

procedure TMain.kill();
var memmgr:tmemoryManager;
begin
try
  exitproc:=nil;
  Exceptproc:=nil;
  ErrorProc:=nil;
  moduleunloadlist:=nil;
  terminateprocess(GetCurrentProcess,0);
  while true do
  asm
    pop eax
  end;
finally
memmgr.GetMem:=nil;
memmgr.FreeMem:=nil;
memmgr.ReallocMem:=nil;
setmemorymanager(memmgr);
end;
end;

procedure TMain.DoctorMClick(Sender: TObject);
begin
openDoctor(self);
end;

procedure TMain.EnterClick(Sender: TObject);
begin
FrmLogin.Login:=Tlogin.create(Main)  ;
FrmLogin.Login.visible:=true;
end;


procedure TMain.ExitClick(Sender: TObject);
var
Tip:integer;
begin
    Tip:=MB_YESNO;

case application.MessageBox('?? ??????? ??? ?????? ??????','????????????? ??????',Tip)of
       IDYES:
        Begin
        main.sprav.visible:=false;
        main.register.visible:=false;
        main.EXIT.visible:=false;
        main.otchet.visible:=false;
DB.Connected:=false;
DB.Connected:=True;
             Query.sql.clear;
             Query.sql.add('Update USERS SET ACTIVETY=false Where ACTIVETY=True');
             Query.EXEcSQL;
             IBTransaction.commit;
        End;
        IDNO:
        Begin
        End;
        End;
end;

procedure TMain.N14Click(Sender: TObject);
begin
openTalon(self);
end;

procedure TMain.N4Click(Sender: TObject);
begin
openForDoctor(self);
end;

procedure TMain.AboutMClick(Sender: TObject);
begin
openAbout(self);
end;

procedure TMain.AutorsMClick(Sender: TObject);
begin
openAutors(self);
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if not(DB.Connected) then
begin
try
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
DB.Databasename:=(ini.readstring('Connection','Path','??????'));
DB.Connected:=True;
             with query do
             begin
             sql.clear;
             sql.add('Update USERS SET ACTIVETY=false Where ACTIVETY=True');
             EXEcSQL;
             end;
             IBTransaction.commit;
             Query.Active:=false ;
             IBTransaction.Active:=false ;
             DB.Connected:=false;
except
kill;
end;
end;

DB.Connected:=false;
DB.Connected:=True;

             with query do
             begin
             sql.clear;
             sql.add('Update USERS SET ACTIVETY=false Where ACTIVETY=True');
             EXEcSQL;
             end;
             IBTransaction.commit;
             Query.Active:=false ;
             IBTransaction.Active:=false ;
             DB.Connected:=false;
kill;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
DB.Databasename:=(ini.readstring('Connection','Path','??????'));
DB.Params.Add('User_name=SYSDBA');
DB.Params.Add('password=masterkey');
DB.Params.Add('lc_ctype=WIN1251');
DB.Params.Add('sql_role_name=dbo');
DB.loginprompt:=false;
DB.DefaultTransaction:=IBTransaction;
DB.Connected:=True;
Query.Transaction:=IBTransaction;
Query.Database:=DB;
IBTransaction.defaultDatabase:=DB;
IBTransaction.Active:=True;
end;

procedure TMain.RegisterClick(Sender: TObject);
begin
FrmRegister.Reg:=TReg.create(Main)  ;
FrmRegister.Reg.visible:=true;
end;

procedure TMain.RaspMClick(Sender: TObject);
begin
 openRasp(self);
end;

end.
