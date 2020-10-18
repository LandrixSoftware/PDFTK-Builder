program PdftkBuilder;

uses
  Forms,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PDFTK Builder';
  Application.HelpFile := 'PdftkBuilder.html';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
