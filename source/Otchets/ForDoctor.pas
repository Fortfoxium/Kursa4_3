unit ForDoctor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,inifiles,filectrl, Vcl.ComCtrls,
  Vcl.Menus;

type
  TDoctors = class(TForm)
    ID_MED_USL: TComboBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DB: TIBDatabase;
    Trans: TIBTransaction;
    DataSource: TDataSource;
    Query: TIBQuery;
    print: TButton;
    DateTimePicker1: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
  Function OpenDoc(file_:string):boolean;
    procedure ID_MED_USLChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure printClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Ex: Variant;
  ServerIsRunning: boolean;
  end;

var
  Doctors: TDoctors;
  FIO: array of string;

implementation

{$R *.dfm}

uses ally, ComObj, ActiveX;

Function TDoctors.OpenDoc(file_:string):boolean;
Var Doc_:variant;
begin
OpenDoc:=true;
try
Doc_:=Ex.WorkBooks;
Doc_.Open(ExtractFilePath(Paramstr(0))+file_);
except
OpenDoc:=false;
end;
End;

procedure TDoctors.printClick(Sender: TObject);
Var
A,b,i:integer;
savestring:string;
Tip:integer;  ini:tinifile;
begin
ini:=tinifile.create(ExtractFilePath(Paramstr(0))+'CONFIG.INI');
savestring:=ini.readstring('Save','SavePath','??????');
  setlength(FIO,query.RecordCount);
  i:=0;
  while not(query.eof) do
  begin
    FIO[i]:=(Query.Fields[0].asString+' '+Query.Fields[1].asString+' '+Query.Fields[2].asString);
    inc(i);
    Query.Next;
  end;
  Ex := CreateOleObject('Excel.Application');
  OpenDoc('.\..\doc\???????\??????.xlsx');
    Ex.ActiveWorkBook.Worksheets[1].Cells[2,2].Value :=ID_MED_USL.text;
  for B := 2 to 3 do
  begin
    for A := 4 to Query.RecordCount+3 do
    begin
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b].Borders[7].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b].Borders[8].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b].Borders[9].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b].Borders[10].LineStyle := 1;
Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+1].Borders[7].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+1].Borders[8].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+1].Borders[9].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+1].Borders[10].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+2].Borders[7].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+2].Borders[8].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+2].Borders[9].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,b+2].Borders[10].LineStyle := 1;
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,2].Value :=FIO[A-4];
    Ex.ActiveWorkBook.Worksheets[1].Cells[a,3].Value :=Query.Fields[3].asString;
         if (A=Query.RecordCount+3) and (B=2) then
         begin
           Ex.ActiveWorkBook.Worksheets[1].Cells[a+1,b].Value:='???? ??????: '+datetostr(now());
           Ex.ActiveWorkBook.Worksheets[1].Cells[a+1,b+2].Value:='????: ';
         end;
    Query.First;
    end;
  end;              if (savestring='') or (savestring='??????') then
              begin
  try
  Ex.ActiveWorkBook.SaveAs(ExtractFilePath(Application.ExeName)+'.\..\DOC\?????? ?????????\?????? ????????? ?? '+FormatDateTime('dd.mm.yy',Now())+' '+ID_MED_USL.text+'.xlsx');
  finally
  showmessage('????????? ???? ?? ??????, ??????? ???? ???????? ? ??????????? ?????: '+ExtractFilePath(Application.ExeName)+'.\..\DOC\?????? ?????????\?????? ????????? ?? '+FormatDateTime('dd.mm.yy',Now())+' '+ID_MED_USL.text+'.xlsx')
  end;
              end else begin
                  try
                                  Ex.ActiveWorkBook.saveas(savestring+FormatDateTime('dd.mm.yy',Now())+' '+ID_MED_USL.text+'.xlsx');
                                finally
                                  showmessage('???? ???????? ???: '+savestring+'?????? ????????? ?? '+FormatDateTime('dd.mm.yy',Now())+' '+ID_MED_USL.text+'.xlsx')
                                end;
              end;

    Tip:=MB_YESNO;
case application.MessageBox('?????? ??????? ?? ?????? ???? ?????','??????',Tip) of
                             IDYES:
                                Begin
                                 Ex.ActiveWorkBook.SaveAs(savestring+'.\..\DOC\?????? ?????????\?????? ????????? ?? '+FormatDateTime('dd.mm.yy',Now())+' '+ID_MED_USL.text+'.xlsx');
                                 Ex.visible:=true;
                                 Ex.ActiveSheet.PrintOut;
                                End;
                              IDNO:
                                Begin
                                End;
                             end;
                                Ex.quit;
                                Ex:=unassigned;
  end;

procedure TDoctors.DateTimePicker1Change(Sender: TObject);
begin
 With Query do
  begin
   SQL.clear;
   SQL.Add('SELECT P.NAME AS "??? ????????",P.FNAME AS "??????? ????????",P.OtchNAME AS "???????? ????????", T.TIMEZAP AS "????? ??????", U.MED_USL AS "??????????????? ??????" FROM USLUGA U, PACIENT P, TALON T, CABINET C WHERE (U.MED_USL='+QuotedStr(ID_MED_USL.text)+') AND (P.ID_PACIENT=T.ID_PACIENT) AND (T.CAB=C.CAB) AND (C.ID_MED_USL=U.ID_MED_USL) AND (T.DATEZAP='+QuotedStr(datetostr(datetimepicker1.date))+')');                                //+QuotedStr(DateTostr(Now()))+
   open;
  end;
  if query.IsEmpty then print.Enabled:=false else print.Enabled:=true;
  Label2.Caption:='??????? ?? ?????? '+ID_MED_USL.text+' ???????? '+inttostr(Query.RecordCount)+' ?????????'
end;

procedure TDoctors.FormCreate(Sender: TObject);
begin
Connection(DB,Trans,query);
 With QUERY do
  begin
   SQL.clear;
   SQL.Add('SELECT * FROM USLUGA');
   open;
   first;
  end;
  ID_MED_USL.items.add('?? ???????');
  while not(QUERY.EOF) do
    begin
     ID_MED_USL.items.add(QUERY.FieldByName('MED_USl').AsString);
     QUERY.next;
    end;
  ID_MED_USL.ItemIndex:=0;
   QUERY.SQL.clear;
end;

procedure TDoctors.ID_MED_USLChange(Sender: TObject);
begin
 With Query do
  begin
   SQL.clear;
   SQL.Add('SELECT P.NAME AS "??? ????????",P.FNAME AS "??????? ????????",P.OtchNAME AS "???????? ????????", T.TIMEZAP AS "????? ??????", U.MED_USL AS "??????????????? ??????" FROM USLUGA U, PACIENT P, TALON T, CABINET C WHERE (U.MED_USL='+QuotedStr(ID_MED_USL.text)+') AND (P.ID_PACIENT=T.ID_PACIENT) AND (T.CAB=C.CAB) AND (C.ID_MED_USL=U.ID_MED_USL) AND (T.DATEZAP='+QuotedStr(datetostr(datetimepicker1.date))+')');                                //+QuotedStr(DateTostr(Now()))+
   open;
  end;
  if query.IsEmpty then print.Enabled:=false else print.Enabled:=true;
  Label2.Caption:='??????? ?? ?????? '+ID_MED_USL.text+' ???????? '+inttostr(Query.RecordCount)+' ?????????'


end;

procedure TDoctors.N2Click(Sender: TObject);
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

end.
