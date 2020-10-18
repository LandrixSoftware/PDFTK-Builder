unit about;

(*******************************************************************************

Application:      PDFTK Builder Enhanced
Module:           About
Version:          4.1.5
Date:             13 Oct 2019
Author:           David King
Credits:          Angus Johnson (PDFtk Builder 2.05-3.99)
Copyright:        © 2018-19, David King
                  Portion © 2005-2019, Angus Johnson
                  http://www.angusj.com/pdftkb/
License:          GNU GPL ver 3 (See http://www.gnu.org/copyleft/gpl.html)

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
  private
    { Private declarations }
  public
    { Public declarations }
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

// FormCreate is from v3.9.5 and requires version caption to be manually updated on form
// AJ's mods to automate version number and adjust DPI in v3.9.7-3.10.0 not incorporated

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Image1.Picture.Icon.Assign(application.Icon);
end;

end.
