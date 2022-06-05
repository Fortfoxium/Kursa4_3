program RegPol;











uses
  Vcl.Forms,
  Main in 'MainForm\Main.pas' {MAINFORM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMAINFORM, MAINFORM);
  Application.Run;
end.
