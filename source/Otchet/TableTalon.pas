unit TableTalon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrmTABLETALON = class(TForm)
    DB: TIBDatabase;
    DataSource: TDataSource;
    Query: TIBQuery;
    IBTransaction: TIBTransaction;
    Scr: TScrollBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Lab:array of tlabel;
  LabName:array of tlabel;
  end;

var
  FrmTABLETALON: TFrmTABLETALON;

implementation

{$R *.dfm}
 USES Ally;
procedure TFrmTABLETALON.FormCreate(Sender: TObject);
var

i:integer;    n,Stolb,w,Stroka, heightlabe:integer;
begin
  Connection(DB,IBTransaction, query);
  with query do
  begin
     sql.Clear;
            sql.add('SELECT * FROM Talon Order by ID_Talon ASC');
            open;
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

end.
