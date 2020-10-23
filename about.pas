unit about;

(*******************************************************************************

Application:      PDFTK Builder
Description:      A graphical user interface to the Windows version of PDFtk
Module:           Main
Version:          5.0.0
Date:             18 Oct 2020
Target Platform:  Windows 32-bit
Author:           Sven Harazim
Credits:          David King (PDFtk Builder Enhanced 4.1.5)
                  Angus Johnson (PDFtk Builder 2.05-3.10.0)
Copyright:        © 2020, Sven Harazim
                  © 2018-2019, David King
                  © 2005-2018, Angus Johnson
                  http://www.angusj.com/pdftkb/
License:          GNU GPL ver 3 (See http://www.gnu.org/copyleft/gpl.html)

Dependencies:     PDFtk Server (pdftk.exe) must be installed to run program.
                  See https://www.pdflabs.com/tools/pdftk-server/
                  To use pdftk.exe versions earlier than 2.00, set
                  PdftkVersion in the .ini file to the version number.
                  PDF reader must be available to use 'View' buttons.

*******************************************************************************)


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, ExtCtrls;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblUrl: TLabel;
    Label3: TLabel;
    Button1: TButton;
    lblVersion: TLabel;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure lblUrlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.lblUrlClick(Sender: TObject);
var
  str: string;
begin
  TLabel(Sender).cursor := crAppStart;
  application.processmessages;
  str := TLabel(Sender).Caption;
  ShellExecute(0, nil, PChar(str), Nil, Nil, SW_NORMAL);
  TLabel(Sender).cursor := crHandPoint;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Image1.Picture.Icon.Assign(application.Icon);
end;

end.
