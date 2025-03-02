program Rooster_p;

uses
  System.StartUpCopy,
  FMX.Forms,
  Rooster_u in 'Rooster_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
