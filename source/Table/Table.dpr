library Table;

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
  System.Classes,
  frmDoctor in 'Doctor\frmDoctor.pas' {Doctor},
  frmRasp in 'Rasp\frmRasp.pas' {Rasp},
  FrmUsluga in 'Usluga\FrmUsluga.pas' {Usluga},
  FrmPacient in 'Pacient\FrmPacient.pas' {Pacient},
  Cabinet in 'Cabinet\Cabinet.pas' {frmcab},
  All in 'All.pas',
  frmTable in 'frmTable.pas' {FrTable};

{$R *.res}



procedure openTable (Aowner :Tcomponent) ;
var frTable: TfrTable ;
begin
frTable:=tfrTable.create (Aowner) ;
frTable.ShowModal ;
frTable.free ;
end;
exports  openTable;

procedure openDoctor (Aowner :Tcomponent) ;
var doctor: Tdoctor ;
begin
doctor:=tdoctor.create (Aowner) ;
doctor.ShowModal ;
doctor.free ;
end;
exports  openDoctor;

procedure openUsluga (Aowner :Tcomponent) ;
var Usluga: TUsluga ;
begin
Usluga:=tUsluga.create (Aowner) ;
Usluga.ShowModal ;
Usluga.free ;
end;
exports  openUsluga;

procedure openPacient (Aowner :Tcomponent) ;
var Pacient: TPacient ;
begin
Pacient:=tPacient.create (Aowner) ;
Pacient.ShowModal ;
Pacient.free ;
end;
exports  openPacient;

procedure openCabinet (Aowner :Tcomponent) ;
var frmcab: Tfrmcab ;
begin
frmcab:=tfrmcab.create (Aowner) ;
frmcab.ShowModal ;
frmcab.free ;
end;
exports  openCabinet;

procedure openRasp (Aowner :Tcomponent) ;
var Rasp: TRasp ;
begin
Rasp:=tRasp.create (Aowner) ;
Rasp.ShowModal ;
Rasp.free ;
end;
exports  openRasp;

begin
end.
