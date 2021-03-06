library DLLUSER;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  ShareMem,
  System.Classes,
  FrmLogin in 'Login\FrmLogin.pas' {Login},
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  FrmRegister in 'Register\FrmRegister.pas' {Reg},
  MainFr in '..\MainForm\MainFr.pas' {Main};

{$R *.res}


procedure openLogin (Aowner :Tcomponent) ;
var Login: TLogin ;
begin
Login:=tLogin.create (Aowner) ;
Login.ShowModal ;
Login.free ;
end;
exports  openLogin;

procedure openRegister (Aowner :Tcomponent) ;
var Reg: TReg ;
begin
Reg:=tReg.create (Aowner) ;
Reg.ShowModal ;
Reg.free ;
end;
exports  openRegister;

begin
end.
