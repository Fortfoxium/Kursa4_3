unit FrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShareMem,
  Data.DB, FireDAC.Comp.DataSet, inifiles,
  IBX.IBCustomDataSet, IBX.IBTable, IBX.IBDatabase, IBX.IBQuery;

type
  TLogin = class(TForm)
    Startbtn: TButton;
    Editlogin: TEdit;
    EditPassword: TEdit;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    Button1: TButton;
    Query: TIBQuery;
    procedure StartbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Login:string;
    Password:string;
  end;

var
  Login: TLogin;
  ini:tinifile;

implementation


{$R *.dfm}

uses MainFr;



procedure TLogin.Button1Click(Sender: TObject);
begin
EditLogin.text:='SYSDBA';
EditPassword.text:='masterkey';
end;

procedure TLogin.FormCreate(Sender: TObject);
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

procedure TLogin.StartbtnClick(Sender: TObject);
var
Tip:integer;
begin
with query do
begin
     sql.clear;
     sql.add('Select * from USERS');
     open;
end;
if EditLogin.text='' then showmessage('???? ?????? ??????') else
if EditPassword.text='' then showmessage('???? ?????? ??????') else
  begin
    Login:=(EditLogin.text);
    Password:=EditPassword.text;
    Query.Locate('Login', Login, [loPartialKey]);
     if (Login = Query.FieldValues['Login']) and (Password = Query.FieldValues['Pass']) then
     begin
     Showmessage('?? ????? ??? '+ Login);
     DB.Connected:=false;
     DB.Params.Add('User_name='+Login);
     DB.Params.Add('password='+Password);
     DB.defaultTransaction:=IBTransaction;
     DB.Connected:=True;
     IBTransaction.active:=true;
      with query do
      begin
         sql.clear;
         sql.add('Select * from USERS where ACTIVETY=true');
         open;
      end;
     if query.IsEmpty then
     begin
     Query.sql.clear;
     Query.sql.add('Update USERS SET ACTIVETY=true Where Login='+QuotedStr(Login)+' and Pass='+QuotedStr(Password));
     Query.EXEcSQL;
     IBTransaction.commit;
        main.sprav.visible:=true;
        if (login='SYSDBA') or (login='GLAVOPER') then main.register.visible:=true else main.register.visible:=false;
        main.EXIT.visible:=true;
        main.otchet.visible:=true;
        main.N2.visible:=true;
        close;
     end
     else
     begin
         Tip:=MB_YESNO;
        case application.MessageBox('?? ??????? ??? ?????? ??????? ?????????????','?????????????',Tip)of
          IDYES:
           Begin
           WITH QUERY DO
           BEGIN
             sql.clear;
             sql.add('Update USERS SET ACTIVETY=false Where ACTIVETY=True');
             EXEcSQL;
             IBTransaction.commit;
             sql.clear;
             sql.add('Update USERS SET ACTIVETY=true Where Login='+QuotedStr(Login)+' and Pass='+QuotedStr(Password));
             EXEcSQL;
             IBTransaction.commit;
           END;
           close;
        main.sprav.visible:=true;
        if (login='SYSDBA') or (login='GLAVOPER') then main.register.visible:=true else main.register.visible:=false;
        main.EXIT.visible:=true;
        main.otchet.visible:=true;
        main.N2.visible:=true;
           End;
        IDNO:
           Begin
           End;
        End;
     end;

     // ??? ?????
     end
     else begin
     Showmessage('?????? ??? ????? ????????????');
     Login:='';
     Password:='';
     end;

end;

end;

end.
