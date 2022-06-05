unit ForPacients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPacients = class(TForm)
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
    CAB: TComboBox;
    ID_PACIENT: TComboBox;
    GroupBox1: TGroupBox;
    FirstBtn: TButton;
    LastBtn: TButton;
    BackBtn: TButton;
    NextBtn: TButton;
    DB: TIBDatabase;
    IBTransaction: TIBTransaction;
    DataSource1: TDataSource;
    TALON: TIBQuery;
    Query: TIBQuery;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pacients: TPacients;

implementation

{$R *.dfm}

end.
