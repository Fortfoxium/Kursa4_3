library Otchet;

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
  Frmtalon in 'Talon\Frmtalon.pas' {Talon},
  NewTalon in 'Talon\NewTalon.pas' {FrmNewTalon},
  FrmNewPacient in 'Talon\FrmNewPacient.pas' {NewPacient},
  ally in 'ally.pas',
  TableTalon in 'TableTalon.pas' {FrmTABLETALON};

{$R *.res}

procedure openTalon (Aowner :Tcomponent) ;
var Talon: TTalon ;
begin
Talon:=tTalon.create (Aowner) ;
Talon.ShowModal ;
Talon.free ;
end;
exports  openTalon;

procedure openNewPacient (Aowner :Tcomponent) ;
var NewPacient: TNewPacient ;
begin
NewPacient:=tNewPacient.create (Aowner) ;
NewPacient.ShowModal ;
NewPacient.free ;
end;
exports  openNewPacient;

procedure openFrmTABLETALON (Aowner :Tcomponent) ;
var FrmTABLETALON: TFrmTABLETALON ;
begin
FrmTABLETALON:=tFrmTABLETALON.create (Aowner) ;
FrmTABLETALON.ShowModal ;
FrmTABLETALON.free ;
end;
exports  openFrmTABLETALON;

procedure openNewTalo (Aowner :Tcomponent) ;
var frmnewTalon: TfrmnewTalon ;
begin
frmnewTalon:=tfrmnewTalon.create (Aowner) ;
frmnewTalon.ShowModal ;
frmnewTalon.free ;
end;
exports  openNewTalo;
begin
end.
