unit FrmRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, inifiles, IBX.IBCustomDataSet,
  IBX.IBTable, IBX.IBDatabase, IBX.IBSQL, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TReg = class(TForm)
    Startbtn: TButton;
    Editlogin: TEdit;
    EditPassword: TEdit;
    DB: TIBDatabase;
    Trans: TIBTransaction;
    Query: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure StartbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    Login:string;
    Password:string;
  end;
var
  Reg: TReg;
ini:tinifile;
implementation

{$R *.dfm}

procedure TReg.FormCreate(Sender: TObject);
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
DB.Databasename:=(ini.readstring('Connection','Path','??????'));
DB.Params.Add('User_name=SYSDBA');
DB.Params.Add('password=masterkey');
DB.Params.Add('lc_ctype=WIN1251');
DB.Params.Add('sql_role_name=dbo');
DB.loginprompt:=false;
DB.DefaultTransaction:=Trans;
DB.Connected:=True;
Query.Transaction:=Trans;
Query.Database:=DB;
Trans.defaultDatabase:=DB;
Trans.Active:=True;
end;

procedure TReg.StartbtnClick(Sender: TObject);
begin

if Length(EditLogin.text)=0 then showmessage('???? ?????? ??????') else
if Length(EditPassword.text)=0 then showmessage('???? ?????? ??????') else
  begin
    Login:=(EditLogin.text);
    Password:=EditPassword.text;
    Query.SQL.Clear;
    Query.SQL.Add('Select * from USERS');
    Query.open;
    Query.Locate('Login', Login, [loPartialKey]);
     if not (Login = Query.FieldValues['Login']) then
     begin
     Query.SQL.Add('INSERT INTO USERS VALUES (GEN_ID(USERSgen, 1), '+QuotedStr(login)+', '+QuotedStr(password)+');');
     Query.SQL.Clear;
     Query.SQL.Add('Select * from USERS');
     TRANS.COMMIT;
     Query.SQL.Clear;

     Showmessage('?? ??????? ?????? ????????????: '+ Login);
     end
     else Showmessage('????? ????? ??? ??????????!');
  end;
end;

end.
