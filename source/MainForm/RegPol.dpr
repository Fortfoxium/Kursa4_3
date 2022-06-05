program RegPol;

uses
  Vcl.Forms,
  MainFr in 'MainFr.pas' {Main},
  FrmLogin in '..\DLLofUSERS\Login\FrmLogin.pas' {Login},
  FrmRegister in '..\DLLofUSERS\Register\FrmRegister.pas' {Reg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
