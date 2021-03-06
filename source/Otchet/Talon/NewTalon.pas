unit NewTalon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, Vcl.ComCtrls,filectrl,  inifiles,Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFrmNewTalon = class(TForm)
    NoPacient: TLabel;
    DB: TIBDatabase;
    Trans: TIBTransaction;
    DataSource: TDataSource;
    Query: TIBQuery;
    Panel1: TPanel;
    NamePac: TEdit;
    Fname: TEdit;
    OTCHNAME: TEdit;
    Date_Born: TDateTimePicker;
    Panel2: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ID_MED_USL: TComboBox;
    Days: TComboBox;
    Hours: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Labelf: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
  Function FindAndPasteTextDoc(findtext_, pastetext_:string):boolean;
  Function OpenDoc(file_:string):boolean;
  Function StartOfDoc: boolean;
    procedure NoPacientMouseLeave(Sender: TObject);
    procedure NoPacientMouseEnter(Sender: TObject);
    procedure NoPacientClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ID_MED_USLChange(Sender: TObject);
    procedure DaysChange(Sender: TObject);
    procedure NamePacKeyPress(Sender: TObject; var Key: Char);
    procedure OTCHNAMEChange(Sender: TObject);
    procedure FnameChange(Sender: TObject);
    procedure NamePacChange(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     App:variant;      //?????????? ??????????, ????? ??????? ?? ? ??? ????????
  end;
const
  week:array[1..7] of string = ('???????????','???????????','???????','?????','???????','???????','???????');
var
  FrmNewTalon: TFrmNewTalon;
  dat:Tdate;
  ID_PACIENT, ID_CAB:integer;
    Key:byte;
    NamePaci, FnamePac,otchnamePac:string;

implementation

uses ComObj, ActiveX, ally;
procedure openNewPacient (Aowner :Tcomponent); external 'Otchet.dll' ;

{$R *.dfm}


Function TFrmNewTalon.OpenDoc(file_:string):boolean;
Var Doc_:variant;
begin
OpenDoc:=true;
try
Doc_:=App.Documents;
Doc_.Open(ExtractFilePath(Paramstr(0))+file_);
except
OpenDoc:=false;
end;
End;

procedure TFrmNewTalon.OTCHNAMEChange(Sender: TObject);
begin
if (Fname.text='') and (Otchname.text='') and (namepac.text='')then  begin

end
else
  begin
  With QUERY do
    begin
     SQL.clear;
     SQL.Add('SELECT * FROM pacient WHERE Name='+QuotedStr(NamePac.Text)+' and FNAME='+QuotedStr(FName.Text)+' and OTCHNAME='+QuotedStr(OtchName.Text)+' and DATE_BORN='+QuotedStr(DateToStr(DATE_BORN.Date))+';');
     open;
     first;
    end;
    if QUERY.IsEmpty then statusbar1.Panels[0].Text:='?????? ???????? ??? ? ???? ??????' else  statusbar1.Panels[0].Text:='????? ??????? ???? ? ???? ??????'


  end;

end;

Function TFrmNewTalon.FindAndPasteTextDoc(findtext_, pastetext_:string):boolean;
begin
FindAndPasteTextDoc:=true;
try
App.Selection.Find.Forward:=true;
App.Selection.Find.Text:= findtext_;
if App.Selection.Find.Execute then begin
App.Selection.Delete;
App.Selection.InsertAfter (pastetext_);
end else FindAndPasteTextDoc:=false;
except
FindAndPasteTextDoc:=false;
end;
End;



procedure TFrmNewTalon.FnameChange(Sender: TObject);
begin
if (Fname.text='') and (Otchname.text='') and (namepac.text='')then  begin

end
else
  begin
  With QUERY do
    begin
     SQL.clear;
     SQL.Add('SELECT * FROM pacient WHERE Name='+QuotedStr(NamePac.Text)+' and FNAME='+QuotedStr(FName.Text)+' and OTCHNAME='+QuotedStr(OtchName.Text)+' and DATE_BORN='+QuotedStr(DateToStr(DATE_BORN.Date))+';');
     open;
     first;
    end;
    if QUERY.IsEmpty then statusbar1.Panels[0].Text:='?????? ???????? ??? ? ???? ??????' else  statusbar1.Panels[0].Text:='????? ??????? ???? ? ???? ??????'


  end;
end;

Function TFrmNewTalon.StartOfDoc: boolean;
begin
StartOfDoc:=true;
try
App.Selection.End:=0;
App.Selection.Start:=0;
except
StartOfDoc:=false;
end;
end;


procedure TFrmNewTalon.Button1Click(Sender: TObject);
var
i:integer;
strin,timezap, starttime,endtime,savestring:string;
Tip:integer;
Name_CAB, Street, Apart, building, Fname_doc, name_doc, OtchName_doc:string;
ini:tinifile;
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
savestring:=ini.readstring('Save','SavePath','??????');
if (not(NamePac.text='')) or (not(fName.text='')) or (not(otchName.text='')) then
    begin
    key:=1;
     FnamePac:=fName.text;
     NamePaci:=NamePac.text;
     otchnamePac:=otchName.text;
    end;
    Tip:=MB_YESNO;
 if (NamePac.text='') or (FName.text='') or (OtchName.text='') or (ID_MED_USL.text='') or (DAYS.text='') or (Hours.text='') then showmessage('???? ?? ???????????? ????? ?? ?????????')
 else
 begin
 With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM pacient WHERE Name='+QuotedStr(NamePac.Text)+' and FNAME='+QuotedStr(FName.Text)+' and OTCHNAME='+QuotedStr(OtchName.Text)+' and DATE_BORN='+QuotedStr(DateToStr(DATE_BORN.Date))+';');
   open;
   first;
  end;
  if Query.isEmpty then
    begin
      case application.MessageBox('?????? ???????? ???. ?? ?????? ???????? ?????? ????????. ??????? ????','?????????????',Tip) of
           IDYES:
              Begin
                openNewPacient(SELF);
              End;
            IDNO:
              Begin

              End;
      End;
    end
  else
    begin
      Street:=Query.fieldbyname('Street').AsString;
      building:=Query.fieldbyname('building').AsString;
      Apart:=Query.fieldbyname('Apart').AsString;
      i:=1;
      while not (DAYS.Text[i]=' ') do
        begin
        if True then

          strin:=strin+DAYS.Text[i];
          inc(i);
        end;

      ID_PACIENT:=QUERY.Fields[0].AsInteger;
      With QUERY do
        begin
         SQL.clear;
         SQL.Add('SELEct C.CAB, C.NAME_CAB FROM CABINET C,USLUGA U where (U.Med_USL='+QuotedStr(ID_Med_USL.text)+') and (U.ID_MED_USL=C.ID_MED_USL)');
         open;
         first;
        end;
      Name_CAB:=QUERY.Fields[1].AsString;
      ID_CAb:=QUERY.Fields[0].AsInteger;
        With QUERY do
        begin
         SQL.clear;
         SQL.Add('SELECT D.FNAME_DOC, D.NAME_DOC, D.OtchNAME_DOC FROM DOCTOR D,CABINET C,USLUGA U where (U.Med_USL='+QuotedStr(ID_Med_USL.text)+') and (U.ID_MED_USL=C.ID_MED_USL) and (C.ID_DOCTOR=D.ID_DOCTOR)');
         open;
         first;
        end;
        Fname_doc:=QUERY.Fields[0].AsString;
        name_doc:=QUERY.Fields[1].AsString;
        otchname_doc:=QUERY.Fields[2].AsString;
       With QUERY do
        begin
         SQL.clear;
         SQL.Add('SELECT * FROM TALON WHERE  (DATEZAP='+QuotedStr(strin)+') AND  (TIMEZAP='+QuotedStr(HOURS.Text)+') AND (DATATALON=CURRENT_TIMESTAMP) AND ( CAB='+inttostr(ID_CAB)+') AND ( ID_PACIENT='+inttostr(ID_PACIENT)+')');
         open;
         close;
         end;
         if not(query.IsEmpty) then Showmessage('????? ?????? ??? ??????????')
         Else
         begin
          With QUERY do
            begin
             SQL.clear;
             SQL.Add('Insert into TALON VALUES (GEN_ID(TALONgen, 1),'+QuotedStr(strin)+','+QuotedStr(HOURS.Text)+',CURRENT_TIMESTAMP,'+inttostr(ID_CAB)+','+inttostr(ID_PACIENT)+')');
             ExecSQL;
             close;
            end;
          trans.active:=true;
          trans.commit;
          case application.MessageBox('????? ??????, ?????? ??????? ??? ? Word?','?????????????',Tip) of
           IDYES:
            Begin
              App:=CreateOleObject('Word.Application'); //?????????
              App.visible:=false;
              OpenDoc('.\..\doc\???????\?????.docX');
              StartOfDoc; while not
              FindAndPasteTextDoc('###???????& ',Fname.text) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###???&',namepac.text) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###????????&',otchname.text) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###?????&',Street) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###???&',building) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###????????&',Apart) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###???????&',Name_CAB) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###??????????&',strin) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###???????????&',hours.text) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###????????????&',Fname_doc) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###????????&',name_doc) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###?????????????&',otchname_doc) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###??????&',ID_MED_USL.text) do;
              StartOfDoc; while not
              FindAndPasteTextDoc('###????&',dateToStr(now())) do;
              if (savestring='') or (savestring='??????') then
              begin
                                 try
                                 app.Activedocument.saveas(ExtractFilePath(Application.ExeName)+'.\..\DOC\??????\'+dateToStr(now())+' '+namePac.Text+' '+fname.Text+' '+otchname.Text+' '+ID_MED_USL.text+'.rtf');
                                finally
                                  showmessage('????????? ???? ?? ??????, ??????? ???? ???????? ? ??????????? ?????: '+ExtractFilePath(Application.ExeName)+'.\..\DOC\??????\'+dateToStr(now())+' '+namePac.Text+' '+fname.Text+' '+otchname.Text+' '+ID_MED_USL.text+'.rtf')
                                end;
              end
              else
              begin

                                try
                                 app.Activedocument.saveas(savestring+dateToStr(now())+' '+namePac.Text+' '+fname.Text+' '+otchname.Text+' '+ID_MED_USL.text+'.rtf');
                                finally
                                  showmessage('???? ???????? ???: '+savestring+dateToStr(now())+' '+namePac.Text+' '+fname.Text+' '+otchname.Text+' '+ID_MED_USL.text+'.rtf')
                                end;
              end;
                                 case application.MessageBox('?????? ??????? ?? ?????? ???? ?????','??????',Tip) of
                                 IDYES:
                                    Begin
                                     app.Activedocument.saveas(savestring+dateToStr(now())+' '+namePac.Text+' '+fname.Text+' '+otchname.Text+' '+ID_MED_USL.text+'.rtf');
                                     app.visible:=true;
                                     app.Activedocument.printout
                                    End;
                                  IDNO:
                                    Begin

                                    End;
                                 end;
                                    app.quit;
                                    app:=unassigned;
      HOURS.items.Clear;
            End;
            IDNO:
              Begin

              End;
          End;
         end;
     QUERY.Active:=false;
     QUERY.Active:=true;
      HOURS.items.Clear;
 With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT T.TIMEZAP, R.HOURS_Start,R.HOURS_END FROM TALON T, RASP R, cabinet c, DOCTOR d, USLUGA u WHERE (DATEZAP='+quotedstr(strin)+') and (c.id_med_usl=U.id_med_usl) and (u.Med_usl='+quotedstr(ID_MED_USL.Text)+') and (t.CAB=c.cab) and (c.id_Doctor=d.id_doctor) and (d.id_rasp=r.id_rasp)');
   open;
   first;
  end;
 starttime:=QUery.FieldByName('HOURS_Start').AsString;
 endtime:=(QUery.FieldByName('HOURS_END').AsString);
 timezap:=string(starttime);
  if QUERY.isempty then
   begin
    With QUERY do
        begin
        close;
         SQL.clear;
         SQL.Add('SELECT R.HOURS_Start,R.HOURS_END FROM TALON T, RASP R, cabinet c, DOCTOR d, USLUGA u WHERE (c.id_med_usl=U.id_med_usl) and (u.Med_usl='+quotedstr(ID_MED_USL.Text)+') and (t.CAB=c.cab) and (c.id_Doctor=d.id_doctor) and (d.id_rasp=r.id_rasp)');
         open;
         first;
        end;
         starttime:=QUery.FieldByName('HOURS_Start').AsString;
         endtime:=(QUery.FieldByName('HOURS_END').AsString);
         timezap:=string(starttime);
         while not (timezap=endtime) do
           begin
               HOURS.items.add(timezap);
               timezap:=timetostr(Strtotime(timezap)+10/(24*60)) ;
           end;
   end
            else
    begin
    query.First;
       while not (timezap=endtime) do
         begin
           if Query.Locate('timezap', strtotime(timezap), [loPartialKey]) then
             begin
             end
         else
         begin
           HOURS.items.add(timezap);
         end;
             timezap:=timetostr(Strtotime(timezap)+10/(24*60)) ;
           query.next;
         end;

    end;
    end;
 end;
end;

procedure TFrmNewTalon.DaysChange(Sender: TObject);
var
i:integer;
strin,timezap, starttime,endtime:string;
begin
HOURS.Clear;
Hours.Enabled:=true;
  i:=1;
  while not (DAYS.Text[i]=' ') do
    begin
      strin:=strin+DAYS.Text[i];
      inc(i);
    end;
 With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT T.TIMEZAP, R.HOURS_Start,R.HOURS_END FROM TALON T, RASP R, cabinet c, DOCTOR d, USLUGA u WHERE (DATEZAP='+quotedstr(strin)+') and (c.id_med_usl=U.id_med_usl) and (u.Med_usl='+quotedstr(ID_MED_USL.Text)+') and (t.CAB=c.cab) and (c.id_Doctor=d.id_doctor) and (d.id_rasp=r.id_rasp)');
   open;
   first;
  end;
 starttime:=QUery.FieldByName('HOURS_Start').AsString;
 endtime:=(QUery.FieldByName('HOURS_END').AsString);
 timezap:=string(starttime);
  if QUERY.isempty then
   begin
    With QUERY do
        begin
        close;
         SQL.clear;
         SQL.Add('SELECT R.HOURS_Start, R.HOURS_END FROM TALON T, RASP R, cabinet c, DOCTOR d, USLUGA u WHERE (c.id_med_usl=U.id_med_usl) and (u.Med_usl='+quotedstr(ID_MED_USL.Text)+') and (t.CAB=c.cab) and (c.id_Doctor=d.id_doctor) and (d.id_rasp=r.id_rasp)');
         open;
         first;
        end;
         starttime:=QUery.FieldByName('HOURS_Start').AsString;
         endtime:=(QUery.FieldByName('HOURS_END').AsString);
         timezap:=string(starttime);
         while not (timezap=endtime) do
           begin
               HOURS.items.add(timezap);
               timezap:=timetostr(Strtotime(timezap)+10/(24*60)) ;
           end;
      end
            else
    begin
      query.first;
       while not (timezap=endtime) do
         begin
             if Query.Locate('timezap', strtotime(timezap), [loPartialKey]) then
               begin
               end
           else
           begin
             HOURS.items.add(timezap);
           end;
             timezap:=timetostr(Strtotime(timezap)+10/(24*60)) ;
              query.next;
         end;

    end;


end;

procedure TFrmNewTalon.FormCreate(Sender: TObject);
begin
Connection(DB,Trans,query);

  With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM USLUGA');
   open;
  end;
   QUERY.first;
  while not(QUERY.EOF) do
    begin
     ID_MED_USL.items.add(QUERY.FieldByName('MED_USl').AsString);
     QUERY.next;
    end;

end;

procedure TFrmNewTalon.ID_MED_USLChange(Sender: TObject);
Var
i, y, st, en:integer;
begin
HOURS.Clear;
Days.Items.Clear;
Days.Enabled:=true;
 With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT R.DAYS_START, R.DAYS_END FROM RASP R, Cabinet c, Doctor d, USLUGA U where U.MED_USL='+Quotedstr(ID_MED_USl.text)+' and C.ID_MED_USl=U.ID_MED_USl and D.ID_DOCTOR=C.ID_DOCTOR and D.ID_RASP=R.ID_RASP');
   open;
   first;
  end;

dat:=date();
st:=0;
en:=0;
      if (QUERY.FieldByName('DAYS_START').AsString=QUERY.FieldByName('DAYS_END').AsString) then
        begin
          for i := 0 to 29 do
            begin
              dat:=dat+1;
              if (week[Dayofweek(dat)]=QUERY.FieldByName('DAYS_START').AsString) then
                DAYS.items.add(datetostr(dat)+' '+QUERY.FieldByName('DAYS_START').AsString);
            end;
        end
      else
        begin
          for y := 1 to 7 do
            begin
             if week[y]=QUERY.FieldByName('DAYS_START').AsString then st:=y;
             if week[y]=QUERY.FieldByName('DAYS_end').AsString then en:=y;
            end;
          for i := 0 to 29 do begin
              dat:=dat+1;
             for y:=st to en do
             begin
             if Dayofweek(dat)=y then  begin
             DAYS.items.add(datetostr(dat)+' '+WEEK[y]);
             end;
             end;
          end;
        end;
end;

procedure TFrmNewTalon.N2Click(Sender: TObject);
var
chosenderictory:string;
ini:tinifile;
begin
if selectdirectory('???????? ???? ??????????','',chosenderictory) then
begin
  Showmessage('????? ????: '+chosenderictory);

  ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
  ini.WriteString('SAVE', 'SavePath',chosenderictory+'\');
  freeandnil(ini);
end;


end;

procedure TFrmNewTalon.NamePacChange(Sender: TObject);
begin
if (Fname.text='') and (Otchname.text='') and (namepac.text='')then begin end
else
  begin
  With QUERY do
    begin
     SQL.clear;
     SQL.Add('SELECT * FROM pacient WHERE Name='+QuotedStr(NamePac.Text)+' and FNAME='+QuotedStr(FName.Text)+' and OTCHNAME='+QuotedStr(OtchName.Text)+' and DATE_BORN='+QuotedStr(DateToStr(DATE_BORN.Date))+';');
     open;
     first;
    end;
    if QUERY.IsEmpty then statusbar1.Panels[0].Text:='?????? ???????? ??? ? ???? ??????' else statusbar1.Panels[0].Text:='????? ??????? ???? ? ???? ??????'
  end;
end;

procedure TFrmNewTalon.NamePacKeyPress(Sender: TObject; var Key: Char);
begin

 if CharInSet(key,['0'..'9', '.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','?','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure TFrmNewTalon.NoPacientClick(Sender: TObject);
var
Tip:integer;
begin
    Tip:=MB_YESNO;

case application.MessageBox('?? ??????? ??? ?????? ???????? ?????? ?????????','?????????????',Tip)of
       IDYES:
        Begin
        openNewPacient(SELF);
        End;
        IDNO:
        Begin
        End;
        End;
end;
procedure TFrmNewTalon.NoPacientMouseEnter(Sender: TObject);
begin

NoPacient.Font.Color:=clPurple;
end;
procedure TFrmNewTalon.NoPacientMouseLeave(Sender: TObject);
begin
NoPacient.Font.Color:=clHotLight;
end;
end.