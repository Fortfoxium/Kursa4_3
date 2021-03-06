unit Frmtalon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,filectrl,  inifiles, IBX.IBDatabase,
  Vcl.Menus;

type
  TTalon = class(TForm)
    NewTalon: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ID_TALON: TEdit;
    DateZap: TDateTimePicker;
    DatATALON: TDateTimePicker;
    TIMEZAP: TEdit;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource1: TDataSource;
    TALON: TIBQuery;
    Query: TIBQuery;
    CAB: TComboBox;
    ID_PACIENT: TComboBox;
    GroupBox1: TGroupBox;
    FirstBtn: TButton;
    LastBtn: TButton;
    BackBtn: TButton;
    NextBtn: TButton;
    GroupBox2: TGroupBox;
    DeleteBtn: TButton;
    GroupBox3: TGroupBox;
    TableBtn: TButton;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure readdate();
    procedure updates();
    procedure refresh();
    procedure Combobox();
  Function FindAndPasteTextDoc(findtext_, pastetext_:string):boolean;
  Function OpenDoc(file_:string):boolean;
  Function StartOfDoc: boolean;
    procedure NewTalonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure TableBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     App:variant;      //?????????? ??????????, ????? ??????? ?? ? ??? ????????
  end;

var
  Talon: TTalon;
  data:array[0..5] of string;

implementation


uses ComObj, ActiveX, Ally,TableTalon;

procedure openNewTalo (Aowner :Tcomponent); external 'Otchet.dll' ;
procedure openFrmTABLETALON (Aowner :Tcomponent); external 'Otchet.dll' ;

{$R *.dfm}


Function TTalon.OpenDoc(file_:string):boolean;
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

Function TTalon.FindAndPasteTextDoc(findtext_, pastetext_:string):boolean;
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



Function TTalon.StartOfDoc: boolean;
begin
StartOfDoc:=true;
try
App.Selection.End:=0;
App.Selection.Start:=0;
except
StartOfDoc:=false;
end;
end;

procedure TTalon.readdate;
Begin
   ID_TALON.Text:=TALON.FieldByName('ID_TALON').Value;
   DateZap.Date:=TALON.FieldByName('DateZap').Value;
   TIMEZAP.Text:=timetostr(TALON.FieldByName('TIMEZAP').Value);
   DatATalon.Date:=TALON.FieldByName('DatATalon').Value;
   if TALON.Fieldbyname('CAB').IsNull then CAB.itemindex:=0
   else
   begin
   QUERY.SQL.clear;
   QUERY.SQL.ADD('SELECT * FROM CABINET WHERE CAB='+TALON.Fieldbyname('CAB').AsString);
   QUERY.open;
   CAB.ItemIndex:=CAB.items.indexof(TALON.Fieldbyname('CAB').AsString+', '+QUERY.FieldByName('NAME_CAB').AsString);
   end;

   if TALON.Fieldbyname('ID_PACIENT').IsNull then ID_PACIENT.itemindex:=0
   else
   begin
   QUERY.SQL.clear;
   QUERY.SQL.ADD('SELECT * FROM PACIENT WHERE ID_PACIENT='+TALON.Fieldbyname('ID_PACIENT').AsString);
   QUERY.open;
   ID_PACIENT.ItemIndex:=ID_PACIENT.items.indexof(TALON.Fieldbyname('ID_PACIENT').AsString+', '+QUERY.FieldByName('Name').AsString+', '+QUERY.FieldByName('fName').AsString+', '+QUERY.FieldByName('otchName').AsString);
   end;



End;

procedure TTalon.Button1Click(Sender: TObject);
var
Fname_doc, name_doc, otchname_doc,name,fname,otchname,Street,building,Apart, id_Cab,pacient, nameCab,id_med_usl:string;
Tip:integer;
ini:tinifile;
savestring:string;
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
savestring:=ini.readstring('Save','SavePath','??????');

BoxId(CAB,id_Cab);
BoxId(id_pacient,pacient);

      With QUERY do
        begin
         SQL.clear;
         SQL.Add('SELEct U.Med_USL, D.Fname_doc, D.name_doc, D.otchname_doc, C.Name_cab FROM CABINET C,USLUGA U,TALON t, DOCTOR D where (t.Cab='+(Id_CAB)+') and (t.Cab=c.Cab) and (C.ID_MED_USL=U.ID_MED_USL) AND (C.ID_DOCTOR=D.ID_DOCTOR) ');
         open;
         first;
        end;
        id_med_usl:=QUERY.Fields[0].AsString;
        Fname_doc:=QUERY.Fields[1].AsString;
        name_doc:=QUERY.Fields[2].AsString;
        otchname_doc:=QUERY.Fields[3].AsString;
        nameCab:=QUERY.Fields[4].AsString;
        With QUERY do
        begin
         SQL.clear;
         SQL.Add('SELECT D.FNAME, D.NAME, D.OtchNAME, d.Street, d.building, d.Apart FROM Pacient D, Talon t where (t.id_pacient=d.id_pacient) and (t.Id_pacient='+pacient+')');
         open;
         first;
        end;
        Fname:=QUERY.Fields[0].AsString;
        name:=QUERY.Fields[1].AsString;
        otchname:=QUERY.Fields[2].AsString;
        Street:=QUERY.Fields[3].AsString;
        building:=QUERY.Fields[4].AsString;
        Apart:=QUERY.Fields[5].AsString;

               App:=CreateOleObject('Word.Application'); //?????????
              OpenDoc('.\..\doc\???????\?????.docX');
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###???????& ',Fname) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###???&',name) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###????????&',otchname) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###?????&',Street) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###???&',building) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###????????&',Apart) do;
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###???????&',nameCab) do;   //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###??????????&',dateToStr(Datezap.date)) do;  //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###???????????&',TimeZap.text) do;       //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###????????????&',Fname_doc) do;          //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###????????&',name_doc) do;            //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###?????????????&',otchname_doc) do;      //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###??????&',ID_MED_USL) do;             //
                           StartOfDoc; while not
                            FindAndPasteTextDoc('###????&',dateToStr(Datatalon.date)) do;
                              Tip:=MB_YESNO;
                             case application.MessageBox('?????? ????????? ???? ???? ?? ???????????','??????????',Tip) of
                             IDYES:
                                Begin
                                     if (savestring='') or (savestring='??????') then
                                   begin
                                     try              //
                                app.Activedocument.saveas(ExtractFilePath(Application.ExeName)+'.\..\DOC\??????\'+dateToStr(now())+' '+name+' '+fname+' '+otchname+' '+ID_MED_USL+'.rtf');

                                finally
                                  showmessage('????????? ???? ?? ??????, ??????? ???? ???????? ? ??????????? ?????: '+ExtractFilePath(Application.ExeName)+'.\..\DOC\??????\'+dateToStr(now())+' '+name+' '+fname+' '+otchname+' '+ID_MED_USL+'.rtf')
                                end;
                                   end else
                                   begin
                                     try              //
                                app.Activedocument.saveas(savestring+dateToStr(now())+' '+name+' '+fname+' '+otchname+' '+ID_MED_USL+'.rtf');

                                finally
                                  showmessage('???? ???????? ???: '+savestring+dateToStr(now())+' '+name+' '+fname+' '+otchname+' '+ID_MED_USL+'.rtf')
                                end;
                                   end;

                                End;
                              IDNO:
                                Begin

                                End;
                             End;
                             case application.MessageBox('?????? ??????? ?? ?????? ???? ?????','??????',Tip) of
                             IDYES:
                                Begin
                                 app.Activedocument.saveas(savestring+dateToStr(now())+' '+name+' '+fname+' '+otchname+' '+ID_MED_USL+'.rtf');
                                 app.visible:=true;
                                 app.Activedocument.printout
                                End;
                              IDNO:
                                Begin

                                End;
                             End;
                                app.quit;
                                app:=unassigned;
end;

procedure TTalon.COMBOBOX;
Begin
  With TALON do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM CABINET');
   open;
   first;
  end;
  CAB.items.add('?? ???????');
  while not(TALON.EOF) do
    begin
     CAB.items.add(TALON.FieldByName('CAB').AsString+', '+TALON.FieldByName('NAME_CAB').AsString);
     TALON.next;
    end;


  With TALON do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM PACIENT');
   open;
   first;
  end;
  ID_PACIENT.items.add('?? ???????');
  while not(TALON.EOF) do
    begin
     ID_PACIENT.items.add(TALON.FieldByName('ID_PACIENT').AsString+', '+TALON.FieldByName('Name').AsString+', '+TALON.FieldByName('fName').AsString+', '+TALON.FieldByName('otchName').AsString);
     TALON.next;
    end;

End;

procedure TTalon.DeleteBtnClick(Sender: TObject);
begin
MBox(2,query, TALON, IBTransaction, Data);

refresh();
TALON.first;
readdate;
end;

procedure TTalon.refresh;
Begin
  With TALON do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM TALON Order by ID_TALON ASC');
   open;
  end;
End;

procedure TTalon.TableBtnClick(Sender: TObject);
begin
OPENFrmTABLETALON(self);
end;

procedure TTalon.updates;
begin
  data[0]:=ID_TALON.Text;
  data[1]:=datetostr(DateZap.Date);
  data[2]:=TIMEZAP.Text;
  data[3]:=datetostr(DatATalon.Date);
  BoxId(CAB,data[4]);
  BoxId(ID_PACIENT,data[5]);
End;

procedure TTalon.BackBtnClick(Sender: TObject);
begin
TALON.Prior;
readdate;
end;

procedure TTalon.FirstBtnClick(Sender: TObject);
begin
TALON.first;
readdate;
end;

procedure TTalon.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
COMBOBOX;
refresh();
readdate;
end;

procedure TTalon.LastBtnClick(Sender: TObject);
begin
TALON.last;
readdate;
end;

procedure TTalon.N2Click(Sender: TObject);
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

procedure TTalon.NewTalonClick(Sender: TObject);
begin
openNewTalo(self);
end;

procedure TTalon.NextBtnClick(Sender: TObject);
begin
TALON.next;
readdate;
end;

end.
