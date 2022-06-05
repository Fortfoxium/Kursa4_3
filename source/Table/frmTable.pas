unit frmTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrTable = class(TForm)
    DataSource: TDataSource;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    Query: TIBQuery;
    Scr: TScrollBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrTable: TFrTable;
  key:integer;
  Lab:array of tlabel;
  LabName:array of tlabel;

implementation

{$R *.dfm}

USES all;

procedure TFrTable.FormCreate(Sender: TObject);
var
i:integer;    n,Stolb,w, heightlabe:integer;
begin
  Connection(DB,IBTransaction, query);
    with query do
      begin
          sql.clear;
        case key of
          1:
          begin
            sql.add('SELECT ID_MED_USL AS "����� ���. ������", MED_USL AS "�������� ����������� ������" FROM USLUGA Order by ID_MED_USL ASC');
            open;
          end;
          2:
          begin
            sql.add('SELECT ID_RASP AS "����� ����������", DAYS_start AS "��� ������ ������", DAYS_end AS "��� ��������� ������", HOURS_end AS "���� ��������� ������", HOURS_start AS "���� ������ ������"  FROM RASP Order by ID_RASP ASC');
            open;
          end;
          3:
          begin
            sql.add('SELECT ID_PACIENT AS "����� ��������", FNAME AS "������� ��������",NAME AS "��� ��������",'
            +'OtchNAME AS "�������� ��������",Date_Born AS "���� ��������", ID_CART AS "����� ������������ �����",'
             +'EMAIL AS "����������� ����� ��������", TEL AS "������� ��������", OMS AS "��� ��������", STREET AS'
             +'"����� ���������� ��������", BUILDING AS "����� ����", POL AS "��� ��������", APART AS "����� ��������"'
             +'FROM PACIENT Order by ID_PACIENT ASC');
            open;
          end;
          4:
          begin
            sql.add('SELECT ID_DOCTOR AS "����� ������a", FNAME_DOC AS "������� �����", NAME_DOc AS "��� �����", OTChNAME_DOC AS "�������� �����", ID_RASP AS "ID ����������" FROM DOCTOR Order by ID_DOCTOR ASC');
            open;
          end;
          5:
          begin
            sql.add('SELECT CAB AS "����� ��������", NAME_CAB AS "�������� ��������", Id_doctor AS "ID �����", Id_med_usl AS "ID ���. ������" FROM CABINET Order by CAB ASC');
            open;
          end;
    end;
   n:=query.FieldCount;
setlength(LabName,n);
w:=20;
for i:=0 to n-1 do
 begin
  LabName[i]:=TLabel.Create(Self);
  with LabName[i] do
   begin
    Parent:=Scr;
    Top:=20;
    Height:=30;
    Font.Name:='Curier New';
    Font.Color:=clBlue;
    Font.Style:=[fsBold];
    Caption:=query.Fields[i].FieldName;
    Left:=W;
    w:=canvas.TextWidth(Caption)+w+90;
    name:='labName'+inttostr(i);
   end;
 end;
setlength(Lab,query.RecordCount*n);
HeightLabe:=30;
   while not( query.eof) do
   begin
    HeightLabe:=HeightLabe+15;
      for Stolb:=0 to n-1 do
       begin
        Lab[Stolb]:=TLabel.Create(Self);
        with Lab[Stolb] do
         begin
         if Stolb=0 then font.color:=clred;
          Parent:=Scr;
          Top:=HeightLabe;
          Left:=labname[Stolb].left;
          Height:=30;
          Font.Name:='Curier New';
          Caption:=query.Fields[stolb].AsString;
         end;
       end;
       query.Next;
   end;
  end;
end;

end.