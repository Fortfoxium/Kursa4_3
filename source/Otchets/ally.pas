unit ally;

interface
uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, IBX.IBTable, inifiles, sharemem, System.TypInfo;

procedure connection(DBase: TIBDatabase;IBTransaction: TIBTransaction;Query:tIBQuery);
procedure MBox(index:integer;Q: TIBQuery; Table:TIBQuery; trans:TIBTransaction; Dataar:array of string);
procedure BoxId(Ed:TCombobox; var ids:string);
implementation

procedure connection(DBase: TIBDatabase;IBTransaction: TIBTransaction;Query:tIBQuery);
var
ini:tinifile;
p,l:string;
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
DBase.Databasename:=(ini.readstring('Connection','Path','??????'));
DBase.Params.Add('User_name=SYSDBA');
DBase.Params.Add('password=masterkey');
DBase.Params.Add('lc_ctype=WIN1251');
DBase.Params.Add('sql_role_name=dbo');
DBase.loginprompt:=false;
DBase.DefaultTransaction:=IBTransaction;
DBase.Connected:=True;
IBTransaction.defaultDatabase:=DBase;
IBTransaction.Active:=True;
     Query.sql.clear;
     Query.sql.add('Select * from USERS where ACTIVETY=true');
     Query.open;
     l:=Query.FieldByName('login').asString;
     p:=Query.FieldByName('Pass').asString;
DBase.Connected:=false;
DBase.Params.Add('User_name='+l);
DBase.Params.Add('password='+p);
DBase.Connected:=True;
end;


procedure BoxId(Ed:TCombobox; var ids:string);
var
i:integer;
begin
  i:=1;
  while not (Ed.Text[i]=',') do
    begin
      Ids:=Ids+Ed.Text[i];
      inc(i);
    end;
end;

procedure MBox(index:integer; Q: TIBQuery; Table: TIBQuery; trans:TIBTransaction; Dataar:array of string);
var
Tip,i:integer;
QueryString:String;
begin
    Tip:=MB_YESNO;
     Q.SQL.clear;
    case index of
    1:begin
       case application.MessageBox('?? ??????? ??? ?????? ???????? ??? ???????','?????????????',Tip)of
       IDYES:
        Begin
         QueryString:='UPDATE '+Table.Name+' SET ';
         QueryString:=QueryString+((Table.Fields[0].Fieldname)+'='+quotedStr(Dataar[0])+', ');
         for i := 1 to Table.fieldCount-1 do
          begin
           if i=Table.fieldCount-1 then
           begin
           QueryString:=QueryString+((Table.Fields[i].Fieldname)+'='+quotedStr(Dataar[i]));
           QueryString:=QueryString+(' WHERE '+(Table.Fields[0].Fieldname)+'='+quotedStr(Dataar[0])+';');
           end
           else QueryString:=QueryString+((Table.Fields[i].Fieldname)+'='+quotedStr(Dataar[i])+', ');
          end;
          Q.SQL.Add(QueryString);
          Q.ExecSQL;
          q.close;
          Table.close;
          trans.commit;
        End;
       IDNO:;
       end;
     end;

    2:begin
       case application.MessageBox('?? ??????? ??? ?????? ??????? ??? ???????','?????????????',Tip)of
       IDYES:
         Begin
         QueryString:='DELETE FROM '+Table.Name+' WHERE ';
         QueryString:=QueryString+((Table.Fields[0].Fieldname)+'='+quotedStr(Table.Fields[0].Value)+';');
          Q.SQL.Add(QueryString);
          Q.ExecSQL;
          q.close;
          trans.active:=true;
          trans.commit;
        End;
       IDNO:;
      end;
     end;

    3:begin
       case application.MessageBox('?? ??????? ??? ?????? ???????? ??? ???????','?????????????',Tip)of
       IDYES:
          Begin
         QueryString:='INSERT INTO '+Table.Name+' VALUES (GEN_ID('+Table.Name+'gen, 1), ';
         for i := 1 to Table.fieldCount-1 do
          begin
           if i=Table.fieldCount-1 then
           begin
           QueryString:=QueryString+quotedStr(Dataar[i])+')';
           end
           else QueryString:=QueryString+quotedStr(Dataar[i])+', ';
          end;
          Q.SQL.Add(QueryString);
          Q.ExecSQL;
          q.close;
          trans.active:=true;
          trans.commit;
        End;
       IDNO:;
      end;
     end;
  end;
end;


end.
