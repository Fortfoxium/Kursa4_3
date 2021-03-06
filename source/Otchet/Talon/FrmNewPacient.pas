unit FrmNewPacient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, dateutils, Vcl.Mask;

type
  TNewPacient = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ID_PACIENT: TEdit;
    FNAME: TEdit;
    NAME: TEdit;
    OTCHNAME: TEdit;
    ID_CART: TEdit;
    EMAIL: TEdit;
    OMS: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    STREET: TEdit;
    Building: TEdit;
    APART: TEdit;
    Date_Born: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource: TDataSource;
    PACIENT: TIBQuery;
    Query: TIBQuery;
    AddBtn: TButton;
    Cancel: TButton;
    TEL: TMaskEdit;
    procedure updates();
    procedure FormCreate(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure FNAMEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPacient: TNewPacient;
  data:array[0..12] of string;

implementation

{$R *.dfm}

uses Ally, NewTalon;


procedure TnewPacient.updates;
begin
  data[0]:=ID_PACIENT.Text;
  data[1]:=FNAME.Text;
  data[2]:=NAME.Text;
  data[3]:=OtchNAME.Text;
  data[4]:=dateTostr(DATE_BORN.date);
  data[5]:=ID_CART.Text;
  if EMAIL.Text='' then data[6]:='NULL'
  else data[6]:=EMAIL.Text;
  data[7]:=TEL.Text;
  data[8]:=OMS.Text;
  data[9]:=STREET.Text;
  data[10]:=BUILDING.Text;
  if Radiogroup1.itemindex=1 then   data[11]:='?'
   else data[11]:='?';
  data[12]:=APART.Text;
End;




procedure TNewPacient.AddBtnClick(Sender: TObject);
begin
if (length(TEL.text)<13) or (length(OMS.text)<16) or (length(ID_CART.text)<5) then showmessage('????? ???????????? ????? ??? ??? ??? ????? ????????, ?? ?????????? ???????')
 else
 begin
 if (Fname.Text='') or (name.Text='') or (street.Text='') or (apart.Text='')or (ID_CART.Text='')or (TEL.Text='')or (OMS.Text='')or (building.Text='') or (otchname.Text='') then showmessage('????????? ??? ???? ? *!') else
    begin
    if (date_born.Date>Now()) then showmessage('?? ?? ?????????') else
      begin
        if (date_born.Date<IncYear(now(),18)) then showmessage('???????? ??? 18 ???!') else
        begin
          begin
            if AddBtn.Caption='??????' then
              begin
               MBox(3,query, PACIENT, IBTransaction, data);
              end;
              showmessage('?????? ??????? ?????????!') ;
              close;
          end;
        end;
      end;
    end;
 end;

end;

procedure TNewPacient.CancelClick(Sender: TObject);
begin
Close;
end;

procedure TNewPacient.FNAMEKeyPress(Sender: TObject; var Key: Char);
begin

 if CharInSet(key,['0'..'9', '.', ',','"','/','|','\','{','}','[',']','`','@','$','!','#',':','?','%','^','~',';','&','(',')','<','>','*','-','_','+','=','?']) then key :=#0;
end;

procedure TNewPacient.FormCreate(Sender: TObject);
begin
Connection(DB,IBTransaction,query);
  if not(NewTalon.key=0) then
    begin
     FNAME.text:=NewTalon.FnamePac;
     NAME.text:=NewTalon.namePaci;
     otchName.text:=NewTalon.otchnamepac;
    end;


  query.sql.Clear;
  query.sql.add('SELECT GEN_ID( PACIENTgen, 0) from RDB$DATABASE');
  query.open;
  ID_PACIENT.text:=inttostr(1+(query.fields[0].asinteger));
end;

end.
