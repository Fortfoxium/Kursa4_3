unit WordLib;

interface
    Function CreateWord : boolean;
    Function VisibleWord (visible:boolean):boolean;
    Function AddDoc:boolean;
    Function SaveDocAs(file_:string):boolean;
    Function CloseDoc:boolean;
    Function CloseWord:boolean;
    //������� ������ ������
    function SetTextToDoc(text_: string; InsertAfter_: boolean): boolean;
    //������� ������ � ��������
    //������ � ������ ���������
    Function StartOfDoc:boolean;
    //������ � ����� ���������
    Function EndOfDoc:boolean;
    //������ � ���������
    Function CreateTable(NumRows, NumColumns:integer; var index:integer):boolean;
    //������ � ��������
    //��������� �������� �����  ���� �������
    Function SetSizeTable(Table:integer; RowsHeight, ColumnsWidth:real):boolean;
    //��������� �������� �����  ������ ������
    Function SetHeightRowTable(Table,Row:integer; RowHeight:real):boolean;
    //��������� �������� �����  ������ �������
    Function SetWidthColumnTable(Table,Column: integer;  ColumnWidth:real):boolean;
    Procedure NastrTab(Nt:integer);
    //������ ������ � �������
    Function SetTextToTable(Table:integer;Row, Column:integer; text:string):boolean;
    //������ ��������� � ������ ������
    Procedure ZagTab(Nt:integer);
    //���������� ����� ������� ������  wdBorderType=1 -�����, 2=������, 3=�������, 4- ������
    Function SetLineStyleBorderTable(Table:integer;Row,Column,wdBorderType,wdBorderStyle:integer):boolean;
    //������� ������
    Procedure LineCell(Nt,Row,Column:integer);

    Var W: variant;

    implementation
Uses ComObj;

Function SetLineStyleBorderTable(Table:integer;Row,Column,wdBorderType,wdBorderStyle:integer):boolean;
begin
SetLineStyleBorderTable:=true;
try
W.ActiveDocument.Tables.Item(Table).Columns.Item(Column).Cells.Item(Row).Borders.Item(wdBorderType).LineStyle:=wdBorderStyle;
except
SetLineStyleBorderTable:=false;
end;
End;
//������� ������
    Procedure LineCell(Nt,Row,Column:integer);
    begin
       SetLineStyleBorderTable(Nt,Row,Column,1,1);
       SetLineStyleBorderTable(Nt,Row,Column,2,1);
       SetLineStyleBorderTable(Nt,Row,Column,3,1);
       SetLineStyleBorderTable(Nt,Row,Column,4,1);
    end;
//������� ��������
function AddDoc: boolean;
Var Doc_:variant;
begin
AddDoc:=true;
 try
 Doc_:=W.Documents;
 Doc_.Add;
 except
 AddDoc:=false;
 end;
end;

//������� �������� Word
function CloseDoc: boolean;
begin
CloseDoc:=true;
 try
 W.ActiveDocument.Close;
 except
 CloseDoc:=false;
 end;
end;

 //������� ���������� Word
function CloseWord: boolean;
begin
CloseWord:=true;
 try
 W.Quit;
 except
 CloseWord:=false;
 end;
end;
//������� ���������� Word
function CreateWord: boolean;
begin
CreateWord:=true;
 try
 W:=CreateOleObject('Word.Application');
 except
CreateWord:=false;
end;
end;

//������� �������
function CreateTable(NumRows, NumColumns: integer; var index: integer): boolean;
var sel_:variant;
begin
CreateTable:=true;
 try
  sel_:=W.selection;
  W.ActiveDocument.Tables.Add (Range:=sel_.Range,NumRows:=NumRows,NumColumns:=NumColumns);
  index:=W.ActiveDocument.Tables.Count;
 except
  CreateTable:=false;
 end;
end;

 //��� �������� ������� � ����� ���������
function EndOfDoc: boolean;
begin
EndOfDoc:=true;
 try
  W.ActiveDocument.Range.Select;
  W.Selection.Start:=W.Selection.End;
 except
  EndOfDoc:=false;
 end;
end;

//��������� ������ - ������ ��������
procedure NastrTab(Nt:integer);
begin
       //�������� ������� ������� �������
       SetWidthColumnTable(Nt,1,80);
       SetWidthColumnTable(Nt,2,65);
       SetWidthColumnTable(Nt,3,75);
       SetWidthColumnTable(Nt,4,75);
       SetWidthColumnTable(Nt,5,70);
       SetWidthColumnTable(Nt,6,70);
       SetWidthColumnTable(Nt,7,70);
       SetWidthColumnTable(Nt,8,75);
       SetWidthColumnTable(Nt,9,70);
       SetWidthColumnTable(Nt,10,70);
end;

//���������� ��������� Word
function SaveDocAs(file_: string): boolean;
begin
 SaveDocAs:=true;
 try
 W.ActiveDocument.SaveAs(file_);
 except
 SaveDocAs:=false;
 end;
end;

//��������� �������� �����  ������ ������
function SetHeightRowTable(Table, Row: integer; RowHeight: real): boolean;
begin
SetHeightRowTable:=true;
 try
  W.ActiveDocument.Tables.Item(Table).Rows.item(Row).Height:=RowHeight;
 except
  SetHeightRowTable:=false;
 end;
end;

//��������� �������� �����  �������
function SetSizeTable(Table: integer; RowsHeight, ColumnsWidth: real): boolean;
begin
SetSizeTable:=true;
 try
  W.ActiveDocument.Tables.Item (Table).Columns.Width:=ColumnsWidth;
  W.ActiveDocument.Tables.Item(Table). Rows.Height:=RowsHeight;
 except
SetSizeTable:=false;
 end;
end;

//������ ������ ������ ��������������� � ��������
function SetTextToDoc(text_: string; InsertAfter_: boolean): boolean;
var Rng_:variant;
begin
 SetTextToDoc:=true;
 try
 Rng_:=W.ActiveDocument.Range;
 Rng_.Font.Name:='Arial';
 Rng_.Font.Size:=9;
 if InsertAfter_
  then Rng_.InsertAfter(text_)
  else Rng_.InsertBefore(text_);
 except
 SetTextToDoc:=false;
 end;
 end;

//������ ������ � �������
function SetTextToTable(Table, Row, Column: integer; text: string): boolean;
begin
SetTextToTable:=true;
 try
     W.ActiveDocument.Tables.Item(Table).Columns.Item(Column).Cells.Item(Row).Range.Text:=text;
 except
 SetTextToTable:=false;
 end;
end;

 //��������� �������� �����  ������ �������
function SetWidthColumnTable(Table, Column: integer; ColumnWidth: real): boolean;
begin
SetWidthColumnTable:=true;
 try
  W.ActiveDocument.Tables.Item(Table).Columns.
   Item(Column).Width:=ColumnWidth;
 except
  SetWidthColumnTable:=false;
 end;
end;

//��� �������� ������� � ������
function StartOfDoc: boolean;
begin
StartOfDoc:=true;
 try
  W.Selection.End:=0;
  W.Selection.Start:=0;
 except
  StartOfDoc:=false;
  end;
end;
//������ ������ ������ �������
procedure ZagTab(Nt: integer);
begin
       SetTextToTable(Nt,1,1,'������');
       SetTextToTable(Nt,1,2,'�����');
       SetTextToTable(Nt,1,3,'�����');
       SetTextToTable(Nt,1,4,'����');
       SetTextToTable(Nt,1,5,'������ 1');
       SetTextToTable(Nt,1,6,'������');
       SetTextToTable(Nt,1,7,'������ 2');
       SetTextToTable(Nt,1,8,'������');
       SetTextToTable(Nt,1,9,'����');
       SetTextToTable(Nt,1,10,'�������');
end;

//��������� ��������� Word
function VisibleWord(visible: boolean): boolean;
begin
 VisibleWord:=true;
 try
 W.visible:= visible;
 except
 VisibleWord:=false;
 end;
end;


end.
