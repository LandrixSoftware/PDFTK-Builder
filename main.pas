unit main;

(*******************************************************************************

Application:      PDFTK Builder Enhanced
Description:      A graphical user interface to the Windows version of PDFtk
Module:           Main
Version:          4.1.5
Date:             13 Oct 2019
Compiler:         Delphi 10.2 (Tokyo)
Target Platform:  Windows 32-bit
Author:           David King
Credits:          Angus Johnson (PDFtk Builder 2.05-3.10.0)
Copyright:        © 2018-2019, David King
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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles, ShlObj, ShellApi, ActiveX, ComCtrls, Grids, Menus, StrUtils,
  AnsiStrings, ExtCtrls, IOUtils, FileCtrl, ClipBrd, zlib, Buttons;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    Guide1: TMenuItem;
    PDFtk1: TMenuItem;
    OpenIni1: TMenuItem;
    About1: TMenuItem;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    SaveDialog1: TSaveDialog;

    tsCollate: TTabSheet;
    lblSelected: TLabel;
    btnGridMode: TButton;
    lblMode: TLabel;
    cbShuffle: TCheckBox;
    btnResetAll: TButton;
    btnResetCollate: TButton;
    lblSourcePDFDocs: TLabel;
    StringGrid1: TStringGrid;
    lFilename: TLabel;
    btnRepairPageCount: TButton;
    lPages: TLabel;
    ePages: TEdit;
    bAdd: TButton;
    bDelete: TButton;
    btnSort: TButton;
    bMoveUp: TButton;
    bMoveDown: TButton;
    bView: TButton;
    PopupMenu1: TPopupMenu;
    popView: TMenuItem;
    popLocate: TMenuItem;
    popCopyPath: TMenuItem;
    N1: TMenuItem;
    popExtract: TMenuItem;
    N3: TMenuItem;
    popSplit: TMenuItem;
    popMark: TMenuItem;
    popRotate: TMenuItem;
    popTools: TMenuItem;
    N2: TMenuItem;
    popProperties: TMenuItem;

    tsSplit: TTabSheet;
    lblSelectedSplit: TLabel;
    cbSrcSplit: TCheckBox;
    btnSrcSplit: TButton;
    btnSplitView: TButton;
    btnSplitReset: TButton;
    btnCopySrcSplitFrom: TButton;
    btnCopySrcSplitTo: TButton;
    LblSrcSplitFilename: TLabel;
    lblSplitPagesFrom: TLabel;
    eSplitPagesFrom: TEdit;
    lblSplitPagesTo: TLabel;
    eSplitPagesTo: TEdit;
    lblSplitChunkSize: TLabel;
    eSplitChunkSize: TEdit;
    btnSplitFolder: TButton;
    lblSplitFolder: TLabel;
    btnSplitViewFolder: TButton;
    cbSplitOddEven: TCheckBox;

    tsBackground: TTabSheet;
    lblSelectedBackground: TLabel;
    cbSrcBackground: TCheckBox;
    btnSrcBackground: TButton;
    btnBackgroundView: TButton;
    btnBackgroundReset: TButton;
    btnCopySrcBackgroundTo: TButton;
    btnCopySrcBackgroundFrom: TButton;
    lblSource_background_filename: TLabel;
    btnBackground: TButton;
    btnBackgroundViewStamp: TButton;
    btnBackgroundResetStamp: TButton;
    lblBackgroundFilename: TLabel;
    btnCopyBackgroundFrom: TButton;
    btnCopyBackgroundTo: TButton;
    GroupBox1: TGroupBox;
    rbBackground: TRadioButton;
    rbStamp: TRadioButton;
    rbPageNumber: TRadioButton;
    cbPageOneOnly: TCheckBox;
    comboPageNumber: TComboBox;
    cbMirror: TCheckBox;
    eNumPagesFrom: TEdit;
    eNumPagesTo: TEdit;
    eNumStart: TEdit;
    eNumPrefix: TEdit;
    lblNumOptions: TLabel;
    lblNumTo: TLabel;
    btnNumOptions: TSpeedButton;
    btnNumPortrait: TSpeedButton;
    lblNumHint: TLabel;

    tsRotate: TTabSheet;
    lblSelectedRotate: TLabel;
    cbSrcRotate: TCheckBox;
    btnSrcRotate: TButton;
    btnRotateView: TButton;
    btnRotateReset: TButton;
    btnCopySrcRotateTo: TButton;
    btnCopySrcRotateFrom: TButton;
    lblSrcRotateFilename: TLabel;
    lblRotatePages: TLabel;
    eRotPages: TEdit;
    lblRotatePagesFrom: TLabel;
    eRotPagesFrom: TEdit;
    lblRotatePagesTo: TLabel;
    eRotPagesTo: TEdit;
    GroupBox2: TGroupBox;
    rbRotLeft: TRadioButton;
    rbRotRight: TRadioButton;
    rbRot180: TRadioButton;
    rbRotExtract: TRadioButton;
    rbRotDelete: TRadioButton;

    tsTools: TTabSheet;
    lblSelectedTools: TLabel;
    cbSrcTools: TCheckBox;
    btnSrcTools: TButton;
    btnToolsReset: TButton;
    btnToolsView: TButton;
    btnCopySrcToolsTo: TButton;
    btnCopySrcToolsFrom: TButton;
    lblSrcToolsFilename: TLabel;
    GroupBox3: TGroupBox;
    rbTools1: TRadioButton;
    rbTools2: TRadioButton;
    rbTools3: TRadioButton;
    rbTools4: TRadioButton;
    btnRbTools: TButton;
    btnRbTools2: TButton;
    lblToolsSet: TLabel;
    btnToolsFile2: TButton;
    btnToolsFile2Reset: TButton;
    btnToolsFile2Open: TButton;
    lblToolsFile2Filename: TLabel;
    btnCopyFile2To: TButton;
    btnCopyFile2From: TButton;
    btnSwapFiles: TButton;
    eDecryptPassword: TEdit;
    lblDecryptPassword: TLabel;
    comboApplication: TComboBox;
    btnLaunchApp: TButton;
    lblApplication: TLabel;
    eAdvanced: TEdit;
    btnAdvancedReset: TButton;
    btnAdvancedFilter: TButton;
    btnAdvancedTemplate: TButton;
    lblAdvancedHint: TLabel;

    btnDocProtect: TSpeedButton;
    pnlProtection: TPanel;
    gbPasswords: TGroupBox;
    lblOwnerPassword: TLabel;
    eOwnerPassword: TEdit;
    lblUserPassword: TLabel;
    eUserPassword: TEdit;
    gbDocProtect: TGroupBox;
    cbAllowAll: TCheckBox;
    cbPrinting: TCheckBox;
    cbDegradedPrinting: TCheckBox;
    cbModifyContents: TCheckBox;
    cbScreenReaders: TCheckBox;
    cbModifyAnnotations: TCheckBox;
    cbFillIn: TCheckBox;
    cbAssembly: TCheckBox;
    cbCopyContents: TCheckBox;
    gbExit: TGroupBox;
    btnBuild: TButton;
    bViewSave: TButton;
    bLocate: TButton;
    bPipe: TButton;
    bClose: TButton;
    lblSaveFilename: TLabel;
    lblSplitChunkSizePages: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure OpenIniClick(Sender: TObject);
    procedure ViewGuideClick(Sender: TObject);
    procedure ViewPDFtkClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);

    procedure btnGridModeClick(Sender: TObject);
    procedure cbShuffleClick(Sender: TObject);
    procedure btnResetAllClick(Sender: TObject);
    procedure btnResetCollateClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure tsCollateResize(Sender: TObject);
    procedure ePagesChange(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure bMoveUpClick(Sender: TObject);
    procedure bMoveDownClick(Sender: TObject);
    procedure bViewClick(Sender: TObject);
    procedure popLocateClick(Sender: Tobject);
    procedure popCopyPathClick(Sender: TObject);
    procedure popExtractClick(Sender: TObject);
    procedure popSplitClick(Sender: Tobject);
    procedure popMarkClick(Sender: Tobject);
    procedure popRotateClick(Sender: Tobject);
    procedure popToolsClick(Sender: Tobject);
    procedure popPropertiesClick(Sender: TObject);

    procedure cbSrcSplitClick(Sender: TObject);
    procedure btnSrcSplitClick(Sender: TObject);
    procedure btnSplitViewClick(Sender: TObject);
    procedure btnSplitResetClick(Sender: TObject);
    procedure eSplitPagesFromChange(Sender: TObject);
    procedure eSplitPagesToChange(Sender: TObject);
    procedure cbSplitOddEvenClick(Sender: TObject);
    procedure eSplitChunkSizeChange(Sender: TObject);
    procedure btnSplitFolderClick(Sender: TObject);
    procedure btnSplitViewFolderClick(Sender: TObject);

    procedure cbSrcBackgroundClick(Sender: TObject);
    procedure btnSrcBackgroundClick(Sender: TObject);
    procedure btnBackgroundClick(Sender: TObject);
    procedure btnBackgroundViewClick(Sender: TObject);
    procedure btnBackgroundViewStampClick(Sender: TObject);
    procedure btnBackgroundResetClick(Sender: TObject);
    procedure btnBackgroundResetStampClick(Sender: TObject);
    procedure btnCopySrcBackgroundFromClick(Sender: TObject);
    procedure btnCopySrcBackgroundToClick(Sender: TObject);
    procedure btnCopyBackgroundFromClick(Sender: TObject);
    procedure btnCopyBackgroundToClick(Sender: TObject);
    procedure rbPageNumberClick(Sender: TObject);
    procedure comboPageNumberChange(Sender: TObject);
    procedure btnNumPortraitClick(Sender: TObject);
    procedure btnNumOptionsClick(Sender: TObject);
    procedure eNumPagesFromChange(Sender: TObject);
    procedure eNumPagesToChange(Sender: TObject);
    procedure eNumStartChange(Sender: TObject);

    procedure cbSrcRotateClick(Sender: TObject);
    procedure btnSrcRotateClick(Sender: TObject);
    procedure btnRotateViewClick(Sender: TObject);
    procedure btnRotateResetClick(Sender: TObject);
    procedure eRotPagesChange(Sender: TObject);
    procedure eRotPagesFromChange(Sender: TObject);
    procedure eRotPagesToChange(Sender: TObject);
    procedure rbRotRightClick(Sender: TObject);
    procedure rbRotLeftClick(Sender: TObject);
    procedure rbRotateDownClick(Sender: TObject);
    procedure rbRotExtractClick(Sender: TObject);
    procedure rbRotDeleteClick(Sender: TObject);

    procedure cbSrcToolsClick(Sender: TObject);
    procedure btnSrcToolsClick(Sender: TObject);
    procedure btnToolsResetClick(Sender: TObject);
    procedure btnToolsViewClick(Sender: TObject);
    procedure btnToolsFile2Click(Sender: TObject);
    procedure btnToolsFile2OpenClick(Sender: TObject);
    procedure btnToolsFile2ResetClick(Sender: TObject);
    procedure btnCopyFile2ToClick(Sender: TObject);
    procedure btnCopyFile2FromClick(Sender: TObject);
    procedure btnSwapFilesClick(Sender: TObject);
    procedure btnRepairPageCountClick(Sender: TObject);
    procedure btnLaunchAppClick(Sender: TObject);
    procedure rbTools4Click(Sender: TObject);
    procedure btnRbToolsClick(Sender: TObject);
    procedure btnRbTools2Click(Sender: TObject);
    procedure comboApplicationClick(Sender: TObject);
    procedure btnAdvancedTemplateClick(Sender: TObject);
    procedure btnAdvancedFilterClick(Sender: TObject);
    procedure btnAdvancedResetClick(Sender: TObject);

    procedure gbDocProtectClick(Sender: TObject);
    procedure cbAllowAllClick(Sender: TObject);
    procedure cbPrintingClick(Sender: TObject);

    procedure btnBuildClick(Sender: TObject);
    procedure bViewSaveClick(Sender: TObject);
    procedure bLocateClick(Sender: TObject);
    procedure bPipeClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);

  private
    fFileList: TStringList;
    fDropFile: string;
    fErrorCode: string;
    fExtract : boolean;
    fAltShift : boolean;
    fPaste : boolean;
    fPipe : boolean;
    fPipeFullpath : string;
    fPrevPage : string;
    fSplitSrc : string;
    fSplitSrcPageCount : integer;
    fSplitPagesFrom : integer;
    fSplitPagesTo : integer;
    fSplitLastFilePageFrom : integer;
    fSplitChunkSize : integer;
    fSplitFolder : string;
    fSrcBackground : string;
    fSrcBackgroundPageCount : integer;
    fBackground : string;
    fBackgroundPageCount : integer;
    fNumOptions : boolean;
    fNumPagesFrom : integer;
    fNumPagesTo : integer;
    fNumStart : integer;
    fNumPortrait: boolean;
    fNumPageSize: TSize;    //page size x, y = width, height (in points)
    fNumOffset: TSize;      //page number offset x, y from left, bottom edge
    fNumSize: integer;      //page number font size (in points)
    NumPageSize: TSize;
    NumOffset: TSize;
    fNumDateTimeFormat: string;
    fSrcRotate : string;
    fRotatePageCnt: integer;
    fRotPagesFrom : integer;
    fRotPagesTo : integer;
    fSrcTools : string;
    fToolsPageCount : integer;
    fToolsFolder : string;
    fToolsSet : integer;
    fToolsIndex : integer;
    fToolsIndexSet1 : integer;
    fToolsIndexSet2 : integer;
    fToolsIndexSet3 : integer;
    fToolsIndexSet4 : integer;
    fToolsAction : string;
    fAttachment : string;
    fAttachmentShort : string;
    fSecondaryInputFile : string;
    fSecondaryInputFileShort : string;
    fFile2Paste : string;
    fLaunchFile2 : string;
    fLaunchFile2Short : string;
    fCompareFile2 : string;
    fCompareFile2Short : string;
    fCompareSwap : boolean;
    fUnpackFolder : string;
    fAdvancedOp : string;
    fAdvancedHint : string;
    fSaveFile : string;
    fPdftkVersion : string;
    fPdftkPath : string;
    fPdfExe : string;
    fPdfArg : string;
    fTxtExe : string;
    fTxtArg : string;
    fCompareExe : string;
    fCompareArg : string;
    fApp1Item : string;
    fApp1Exe : string;
    fApp1Arg : string;
    fApp2Item : string;
    fApp2Exe : string;
    fApp2Arg : string;
    fApp3Item : string;
    fApp3Exe : string;
    fApp3Arg : string;
    fApp4Item : string;
    fApp4Exe : string;
    fApp4Arg : string;
    fApp5Item : string;
    fApp5Exe : string;
    fApp5Arg : string;

    fFormOldWindowProc: TWndMethod;
    procedure FormNewWindowProc(var Message: TMessage);
    
    procedure RefreshGrid(RowSelected: integer);
    procedure ClearFileList;
    procedure ClearButtonsAndLabels;
    procedure UpdateButtonsAndMenus(RowSelected: integer);
    function FmtPagesString(PagesStr: string; const maxPageNum : integer; out IsValid: boolean; const fileMarker: string = ''): string;
    function FmtOrderedPagesString(PagesStr: string; const maxPageNum : integer; out IsValid: boolean; const fileMarker: string = ''; const complementPages: boolean = false; const pageRotation: string = 'right'): string;
    function TruncateString(const s2 : string; pos, width : integer) : string;
    procedure DeleteAllTmpFiles;
    procedure LoadIniFileInfo;
    procedure SaveIniFileInfo;
    procedure ViewFile(const sFile, sAppExe : string);
    procedure DoCollateFiles;
    procedure DoSplitFile;
    procedure DoBackgroundStamp(IsBackgroundOp: boolean);
    procedure DoPageNumber;
    procedure DoRotate;
    procedure ClearDisplayToolsSet;
    procedure DisplayToolsSet;
    procedure DoDecrypt;
    procedure DoRepair;
    procedure DoAdvanced;
    procedure DoDumpData;
    procedure DoUpdate;
    procedure DoAttach;
    procedure DoUnpack;
    procedure DoDumpFields;
    procedure DoGenFDF;
    procedure DoFillForm;
    procedure DoFlatten;
    procedure DoUncompress;
    procedure DoCompress;
    procedure IsSaveFileInUse;
    
    function GetRepairedPageCount(const inputfile : string) : integer;
    // function GetRepairedPageCount_0(const inputfile : string) : integer;
    // function GetRepairedPageCount_1(const inputfile : string) : integer;
    // function GetCatPageCount(const inputfile : string) : integer;
    // function GetCatPageCount_1(const inputfile : string) : integer;
    // function GetDumpPageCount(const inputfile : string) : integer;

  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;   
  end;

  PSourceFileRec = ^TSourceFileRec;
  TSourceFileRec = record
    FullPath: string;
    Filename: string;
    Pages: string;
    PageCount: integer;
  end;

var
  MainForm: TMainForm;
  Path, tmpPath, user: string;
  Origin: TPoint;
  Expanded : boolean;
  ErrorNum: DWORD;
  allowParams, ownerParam, userParam: string;

  const
  PAGES_NOT_COUNTED = -2;
  PAGECOUNT_NOT_FOUND = -1;

implementation

uses About;

{$R *.dfm}
{$R page.res}

type
  TVS_FIXEDFILEINFO = record
    dwSignature: DWORD ;
    dwStrucVersion: DWORD ;
    dwFileVersionMS: DWORD ;
    dwFileVersionLS: DWORD ;
    dwProductVersionMS: DWORD ;
    dwProductVersionLS: DWORD ;
    dwFileFlagsMask: DWORD ;
    dwFileFlags: DWORD ;
    dwFileOS: DWORD ;
    dwFileType: DWORD ;
    dwFileSubtype: DWORD ;
    dwFileDateMS: DWORD ;
    dwFileDateLS: DWORD ;
  end;

  TVS_VERSION_INFO = packed record
    Length          :WORD;
    wValueLength    :WORD;
    wType           :WORD;
    szKey:array[0..Length('VS_VERSION_INFO')] of WideChar;
    Padding1        :array[0..0] of Word;
    FixedInfo       :TVS_FIXEDFILEINFO;
  end;

//------------------------------------------------------------------------------

function DPIScale(value: integer): integer;
begin
  result := value * Screen.PixelsPerInch div 96;
end;

//------------------------------------------------------------------------------

function GetUsername: string;  
var  
 len: DWORD;  
begin  
 len := 1024;  
 SetLength(result,len);  
 if windows.GetUserName(PChar(result),len) then  
   SetLength(result,len-1) //returned len includes terminating null char  
 else  
   result := '';  
end; 

//------------------------------------------------------------------------------

function GetVersion(): string;
var
  rs: TResourceStream;
  vsvi: TVS_VERSION_INFO;
begin
  result := '';
  rs := TResourceStream.CreateFromID(hInstance, 1, RT_VERSION);
  try
    rs.read(vsvi, sizeof(vsvi));
    if vsvi.wValueLength <> sizeof(vsvi.FixedInfo) then exit;
    with vsvi.FixedInfo do
      result := format('%d.%d.%d', [dwFileVersionMS shr 16,
        dwFileVersionMS and $FFFF, dwFileVersionLS shr 16])
  finally
    rs.Free;
  end;
end;

//------------------------------------------------------------------------------

const
  NEVER_GIVE_UP = 0; //GiveUpTimeOutSecs param constant for WinExecAndWait32()

function WinExecAndWait32(const DosCommand: string;
  ShowWindow, GiveUpTimeOutSecs: Word; out textOutput: string): DWord;
const
  BufferSize = 8192;
var
  StartUpInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  OutputReadPipeHdl, OutputWritePipeHdl: THandle;
  SecAttribs: TSecurityAttributes;
  Buffer: PAnsiChar;
  timeCnt, BytesRead, BytesAvailable, WaitResult: DWord;
  PipeCreated, ProcessCreated: boolean;

begin
  //nb: 1. The max command line length for CreateProcess() is 32767 characters.

  Result := DWORD(-1); //ie result when unable to create process

  if GiveUpTimeOutSecs = NEVER_GIVE_UP then
    GiveUpTimeOutSecs := $FFFF; //(ie about 18hrs so not quite never :))

  SecAttribs.nLength := SizeOf(TSecurityAttributes) ;
  SecAttribs.bInheritHandle := true;
  SecAttribs.lpSecurityDescriptor := nil;

  PipeCreated := CreatePipe(OutputReadPipeHdl,
    OutputWritePipeHdl, @SecAttribs, BufferSize);

  StartUpInfo.cb := Sizeof(StartUpInfo);
  StartUpInfo.wShowWindow := ShowWindow;

  Buffer := AllocMem(BufferSize + 1);
  try
    if PipeCreated then
    begin
      fillChar( startUpInfo, sizeof(startUpInfo), 0);
      startUpInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      startUpInfo.hStdInput := 0;
      startUpInfo.hStdOutput := OutputWritePipeHdl;
      startUpInfo.hStdError := OutputWritePipeHdl;
      ProcessCreated := CreateProcess(nil, PWideChar(dosCommand),
        @SecAttribs, @SecAttribs, true, NORMAL_PRIORITY_CLASS,
        nil, nil, startUpInfo, ProcessInfo);
      textOutput := '';
    end else
    begin
      startUpInfo.dwFlags := STARTF_USESHOWWINDOW;
      ProcessCreated := CreateProcess(nil, PWideChar(dosCommand),
        nil, nil, false, NORMAL_PRIORITY_CLASS or CREATE_NEW_CONSOLE,
        nil, nil, startUpInfo, ProcessInfo);
    end;

    if ProcessCreated then
    begin
      timeCnt := 0;
      repeat
        WaitResult := WaitForSingleObject(ProcessInfo.hProcess, 100) ;

        if PipeCreated then
        begin
          //nb: a full pipe buffer would cause an endless loop ...
          if not PeekNamedPipe(OutputReadPipeHdl,
            nil, 0, nil, @BytesAvailable, nil) then break;
          if (BytesAvailable > 0) then
          begin
            //Interestingly, it appears that if the default pipe buffer is larger
            //that that supplied in CreatePipe(), then the default size is used.
            BytesRead := 0;
            if BytesAvailable > BufferSize then
              ReadFile(OutputReadPipeHdl, Buffer[0], BufferSize, BytesRead, nil)
            else
              ReadFile(OutputReadPipeHdl, Buffer[0], BytesAvailable, BytesRead, nil);
            Buffer[BytesRead]:= #0;
            OemToAnsi(Buffer, Buffer) ;
            textOutput := textOutput + string(Buffer);
          end;
        end;

        Application.ProcessMessages;
        inc(timeCnt, 100);
      until (WaitResult <> WAIT_TIMEOUT) or (timeCnt > GiveUpTimeOutSecs *1000);

      if not GetExitCodeProcess(ProcessInfo.hProcess, Result)
        and (result = STILL_ACTIVE) then
          TerminateProcess(ProcessInfo.hProcess, result);

      CloseHandle( ProcessInfo.hProcess );
      CloseHandle( ProcessInfo.hThread );
    end;

    if PipeCreated then
    begin
      CloseHandle(OutputWritePipeHdl);
      CloseHandle(OutputReadPipeHdl);
    end;
  finally
    FreeMem(Buffer) ;
  end;
end;

//------------------------------------------------------------------------------

type
  PPdfObj = ^TPdfObj;
  TPdfObj = record
    number,
    offset: integer;
    filePtr: pAnsiChar;
    stmObjNum: integer;
  end;

function ReversePngFilter(var buffer: PAnsiChar; row_size, buffer_cnt: integer): integer;
var
  i: integer;
  p, end_buff: PAnsiChar;
  filterType: AnsiChar;

  function paeth(c, b, a: byte): byte;
  var
    p,pa,pb,pc: byte;
  begin
    //a = left, b = above, c = upper left
    p := (a + b - c) and $FF;
    pa := abs(p - a);
    pb := abs(p - b);
    pc := abs(p - c);
    if (pa <= pb) and (pa <= pc) then result := a
    else if pb <= pc then result := b
    else result := c;
  end;

  function Average(a, b: byte): byte;
  begin
    //a = left, b = above
    result := (a + b) shr 1;
  end;

begin
  //result will be new buffer length ...
  result := buffer_cnt;
  p := buffer;
  end_buff := buffer + buffer_cnt;
  while p < end_buff do
  begin
    filterType := p^;
    dec(result);
    dec(end_buff);
    move((p +1)^, p^, end_buff - p);
    case filterType of
      #0:
        ;//no filtering used for this row
      #1:
        begin
          //'sub' filtering
          for i := 1 to row_size -1 do
            (p+i)^ := AnsiChar(chr((ord((p+i)^) + ord((p+i -1)^)) and $FF));
        end;
      #2:
        begin
          //'up' filtering
          if p > buffer then //leave top row alone
            for i := 0 to row_size -1 do
              (p+i)^ := AnsiChar(chr((ord((p+i)^) + ord((p+i - row_size)^)) and $FF));
        end;
      #3:
        begin
          //'average' filtering
          if p = buffer then //ie top row
            for i := 1 to row_size -1 do
              (p+i)^ := AnsiChar(chr((ord((p+i)^) + average(ord((p+i -1)^), 0)) and $FF))
          else
          begin
            p^ := AnsiChar(chr((ord((p)^) + average(0, ord((p - row_size)^))) and $FF));
            for i := 1 to row_size -1 do
              (p+i)^ := AnsiChar(chr((ord((p+i)^) +
                average(ord((p+i -1)^), ord((p+i - row_size)^))) and $FF));
          end;
        end;
      #4:
        begin
          //'paeth' filtering
          if p = buffer then //ie top row
            for i := 1 to row_size -1 do
              (p+i)^ := AnsiChar(chr((ord((p+i)^) + paeth(ord((p+i -1)^), 0, 0)) and $FF))
          else
          begin
            p^ := AnsiChar(chr((ord((p)^) + paeth(0, ord((p - row_size)^), 0)) and $FF));
            for i := 1 to row_size -1 do
              (p+i)^ := AnsiChar(chr((ord((p+i)^) + paeth(ord((p+i -1)^),
                ord((p+i - row_size)^), ord((p+i - row_size -1)^))) and $FF));
          end;
        end;
    end;
    inc(p, row_size);
  end;
  ReallocMem(buffer, result);
end;

//------------------------------------------------------------------------------

function GetPdfPageCount(const filename: string): integer;
var
  ms: TMemoryStream;
  i, j, k, cnt, pagesNum, rootNum, predictor, filterColCnt: integer;
  indexArray: array of integer;
  w1,w2,w3: integer;
  p, pEnd, pSaved, pTmp2, buffer, buffPtr: PAnsiChar;
  PdfObj: PPdfObj;
  PdfObjList: TList;

////////////////////////////////////////////////////////////////////////////////
// Summary of steps taken to parse a PDF doc for its page count :-              
// (Who'd have thought it'd take about 1000 lines of code to do that!?)  
////////////////////////////////////////////////////////////////////////////////

//1.  See if there's a 'Linearization dictionary' for easy parsing.
//    Mostly there isn't so ...
//2.  Locate 'startxref' at end of file
//3.  get 'xref' offset and go to xref table
//4.  depending on version the xref table may or may not be in a compressed
//    stream. If it's in a compressed stream (PDF ver 1.5+) then getting the
//    page number requires a LOT of code which is too convoluted to summarise
//    here. Otherwise it still requires a moderate amount of code ...
//5.  parse the xref table and fill a list with object numbers and offsets
//6.  handle subsections within xref table.
//7.  read 'trailer' section at end of each xref
//8.  store 'Root' object number if found in 'trailer'
//9.  if 'Prev' xref found in 'trailer' - loop back to step 3
//10. locate Root in the object list
//11. locate 'Pages' object from Root
//12. get Count from Pages.

  function GetNumber(out num: integer): boolean;
  var
    tmpStr: AnsiString;
  begin
    tmpStr := '';
    while p^ < #33 do inc(p); //skip leading CR,LF & SPC
    while (p^ in ['0'..'9']) do
    begin
      tmpStr := tmpStr + p^;
      inc(p);
    end;
    result := tmpStr <> '';
    if not result then exit;
    num := strtoint(string(tmpStr));
  end;

  function IsString(const str: AnsiString): boolean;
  var
    len: integer;
  begin
    len := length(str);
    result := CompareMem( p, PAnsiChar(str), len);
    if result then inc(p, len); //02-Feb-09: modified
  end;

  function FindStrInDict(const str: AnsiString): boolean;
  var
    nestLvl: integer;
    str1: AnsiChar;
  begin
    //nb: PDF 'dictionaries' start with '<<' and terminate with '>>'
    result := false;
    nestLvl := 0;
    str1 := str[1];
    while not result do
    begin
      while not (p^ in ['>','<',str1]) do inc(p);
      if (p^ = '<') then
      begin
        if (p+1)^ = '<' then begin inc(nestLvl); inc(p); end;
      end
      else if (p^ = '>') then
      begin
        if (p+1)^ = '>' then
        begin
          dec(nestLvl);
          inc(p);
          if nestLvl <= 0 then exit;
        end
      end else
      begin
        result := (nestLvl < 2) and IsString(str);
        if result then exit;
      end;
      inc(p);
    end;
  end;

  function FindEndOfDict: boolean;
  var
    nestLvl: integer;
  begin
    result := true;
    nestLvl := 1;
    while result do
    begin
      while not (p^ in ['>','<']) do inc(p);
      if (p^ = '<') then
      begin
        if (p+1)^ = '<' then begin inc(nestLvl); inc(p); end;
      end
      else if (p+1)^ = '>' then
      begin
        dec(nestLvl);
        if nestLvl < 0 then
          result := false
        else if nestLvl = 0 then
        begin
          inc(p, 2);
          exit; //found end of Dictionary
        end;
        inc(p); //skips first '>'
      end;
      inc(p);
    end;
    result := false;
  end;

  procedure SkipBlankSpace;
  begin
    while (p < pEnd) and (p^ < #33) do inc(p);
  end;

  function GotoObject(objNum: integer): boolean;
  var
    i: integer;
  begin
    i := 0;
    while i < PdfObjList.Count do
      if PPdfObj(PdfObjList[i]).number = objNum then break else inc(i);
    result :=  (i < PdfObjList.Count) and
      (PPdfObj(PdfObjList[i]).filePtr <> nil);
    if not result then exit;
    p := PPdfObj(PdfObjList[i]).filePtr;
    result := GetNumber(i) and (i = objNum);
  end;

  function IsCompressedObject(objNum: integer): boolean;
  var
    i: integer;
  begin
    i := 0;
    while i < PdfObjList.Count do
      if PPdfObj(PdfObjList[i]).number = objNum then break else inc(i);
    result :=  (i < PdfObjList.Count) and
      (PPdfObj(PdfObjList[i]).filePtr = nil);
  end;

  function GetCompressedObjectBuffer(objNum: integer;
    out buffer: PAnsiChar; out bufSize: integer): boolean;
  var
    i, N, First, objIdx: integer;
  begin
    result := false;
    i := 0;
    while i < PdfObjList.Count do
      if PPdfObj(PdfObjList[i]).number = objNum then break else inc(i);
    if (i = PdfObjList.Count) or
      (PPdfObj(PdfObjList[i]).filePtr <> nil) then exit;
    if not GotoObject(PPdfObj(PdfObjList[i]).stmObjNum) then exit;
    objIdx := PPdfObj(PdfObjList[i]).offset;

    pSaved := p;
    if not FindStrInDict('/Type') then exit;
    SkipBlankSpace;
    if not IsString('/ObjStm') then exit;

    p := pSaved;
    //todo - handle uncompressed streams too
    //assume all streams are compressed (though this is really optional)
    if not FindStrInDict('/Filter') then exit;
    SkipBlankSpace;
    //check that this a compression type that we can handle ...
    //nb: [/FlateDecode] is occasionally encountered with Tracker's PDF software
    if not IsString('/FlateDecode') and not IsString('[/FlateDecode]') then exit; 
    p := pSaved;
    if not FindStrInDict('/DecodeParms') or not
      FindStrInDict('/Columns') or not GetNumber(filterColCnt) then
        filterColCnt := 0; //j = column count (bytes per row)
    if filterColCnt > 0 then
    begin
      SkipBlankSpace;
      if not IsString('/Predictor') or not GetNumber(predictor) then
        predictor := 0;
    end;

    p := pSaved;
    if not FindStrInDict('/N') then exit;
    //N = number of compressed objects in stream ...
    if not GetNumber(N) or (objIdx > N) then exit;

    p := pSaved;
    if not FindStrInDict('/First') then exit;
    if not GetNumber(First) then exit; //First = first object in stream

    p := pSaved;
    if not FindStrInDict('/Length') then exit;
    if not GetNumber(k) then exit; //k = length of compressed stream
    if not FindEndOfDict then exit;
    while (p^ <> 's') do inc(p);
    if not IsString('stream') then exit;
    SkipBlankSpace;

    //decompress the stream ...
    buffer := nil;
{$IFDEF UNICODE}
    zlib.ZDecompress(p, k, pointer(buffer), bufSize);
{$ELSE}
    DecompressBuf(p, k, k*3, pointer(buffer), bufSize);
{$ENDIF}
    if (filterColCnt > 0) and (predictor > 9) then
      bufSize := ReversePngFilter(buffer, filterColCnt, bufSize);

    p := buffer;
    for i := 0 to objIdx -1 do
    begin
      if not GetNumber(k) then exit;
      if not GetNumber(k) then exit;
    end;
    if not GetNumber(k) or (k <> objNum) then exit; //check it's the right obj
    if not GetNumber(k) then exit; //k = offset of obj from first obj offset

    if objIdx = N then //ie if the last object in the stream
    begin
      p := buffer + First + k;
      bufSize := buffer + bufSize - p;
    end else
    begin
      if not GetNumber(i) then exit; //skip the next object's number
      if not GetNumber(i) then exit; //i == the next object's offset
      p := buffer + First + k;
      bufSize := (i - k); //ie next object's offset minus this object's offset
    end;
    move(p^, buffer^, bufSize);
    ReallocMem(buffer, bufSize);
    p := buffer; //nb: buffer now contains just the uncompressed object
    result := bufSize > 0;
  end;

  function Find(const str: AnsiString; search_forwards: boolean = true): boolean;
  var
    len: integer;
    c: AnsiChar;
  begin
    result := false;
    len := length(str);
    if search_forwards then
    begin
      c := str[1];
      repeat
        while (p < pEnd)  and (p^ <> c) do inc(p);
        if (p = pEnd) then exit;
        if AnsiStrings.StrLComp(p, PAnsiChar(str), len) = 0 then break;
        inc(p);
      until false;
      inc(p,len);
    end else
    begin
      c := str[len];
      repeat
        while (p > PAnsiChar(ms.Memory))  and (p^ <> c) do dec(p);
        if (p = PAnsiChar(ms.Memory)) then exit;
        if AnsiStrings.StrLComp( (p-len+1), PAnsiChar(str), len) = 0 then break;
        dec(p);
      until false;
      inc(p);
    end;
    result := true;
  end;

  function PAnsiCharToInteger(buffer: PAnsiChar; byteCnt: integer): integer;
  begin
    case byteCnt of
      1: result := ord(buffer^);
      2: result := ord(buffer^) shl 8 + ord((buffer+1)^);
      3: result := ord(buffer^) shl 16 +
        ord((buffer+1)^) shl 8 + ord((buffer+2)^);
      4: result := ord(buffer^) shl 24 +
        ord((buffer+1)^) shl 16 + ord((buffer+2)^) +
        ord((buffer+3)^);
      else result := 0;
    end;
  end;

  function GetLinearizedPageNum(out pageNum: integer): boolean;
  var
    pStart,pStop: PAnsiChar;
  begin
    pageNum := -1;
    result := false;
    pStop := p + 32;
    while (p < pStop) and (p^ <> 'o') do inc(p);
    if AnsiStrings.StrLComp( p, 'obj', 3) <> 0 then exit;
    pStart := p;
    if not FindStrInDict('/Linearized') then exit;
    p := pStart;
    if FindStrInDict('/N ') and GetNumber(pageNum) then result := true;
  end;

begin
  //on error return -1 as page count
  result := -1;
  try
    ms := TMemoryStream.Create;
    PdfObjList := TList.Create;
    screen.Cursor := crHourGlass;
    application.ProcessMessages;
    try
      ms.LoadFromFile(filename);

      p := PAnsiChar(ms.Memory);
      pEnd := PAnsiChar(ms.Memory) + ms.Size;

      //for an easy life let's hope the file has a 'linearization dictionary'
      //at the beginning of the document ...
      if GetLinearizedPageNum(result) then exit;

      //find 'startxref' ignoring '%%EOF' at end of file
      p := pEnd -5;
      if not Find('startxref', false) then exit;

      rootNum := -1; //ie flag as not yet found

      if not GetNumber(k) then exit;  //xref offset ==> k
      p :=  PAnsiChar(ms.Memory) + k;

      if AnsiStrings.StrLComp(p, 'xref', 4) <> 0 then
      begin
        //most probably a cross-reference stream (ie PDF doc ver 1.5+)
        //so LOTS of hard work to do now ...

        if not GetNumber(k) then exit; //stream obj number
        if not GetNumber(k) then exit; //stream obj revision number

        pSaved := p;
        if not FindStrInDict('/Type') then exit;
        SkipBlankSpace;
        if not IsString('/XRef') then exit;

        //todo - check for and manage /Prev too

        p := pSaved;
        if not FindStrInDict('/Root') then exit;
        SkipBlankSpace;
        if not GetNumber(rootNum) then exit;
        p := pSaved;

        //todo - handle uncompressed streams too

        //assume all streams are compressed (though this is really optional)
        if not FindStrInDict('/Filter') then exit;
        SkipBlankSpace;
        //check that this a compression type that we can handle ...
        if not IsString('/FlateDecode') then exit;
        p := pSaved;
        if not FindStrInDict('/DecodeParms') or not
          FindStrInDict('/Columns') or not GetNumber(filterColCnt) then
            filterColCnt := 0; //j = column count (bytes per row)
        if filterColCnt > 0 then
        begin
          SkipBlankSpace;
          if not IsString('/Predictor') or not GetNumber(predictor) then
            predictor := 0; //Filtering used prior to Flate (PNG filter >= 10)
        end;

        //get the stream cross-ref table field sizes ...
        p := pSaved;
        if not FindStrInDict('/W') then exit;
        SkipBlankSpace;
        if p^ <> '[' then exit;
        inc(p);
        if not GetNumber(w1) or (w1 <> 1) or not GetNumber(w2) or
          not GetNumber(w3) then exit;

        //Index [F1 N1, ..., Fn, Nn]. If absent assumes F1 = 0 & N based on size
        //(Fn: first object in table subsection; Nn: number in table subsection)
        indexArray := nil;
        p := pSaved;
        if FindStrInDict('/Index') then
        begin
          SkipBlankSpace;
          if p^ <> '[' then exit;
          inc(p);
          while true do
          begin
            k := length(indexArray);
            SetLength(indexArray, k +2);
            if not GetNumber(indexArray[k]) or
              not GetNumber(indexArray[k+1]) then exit;
            pTmp2 := p;
            if not GetNumber(i) then break;
            p := pTmp2;
          end;
        end;

        p := pSaved;
        if not FindStrInDict('/Length') then exit;
        if not GetNumber(k) then exit; //k = length of compressed stream
        if not FindEndOfDict then exit;
        while (p^ <> 's') do inc(p);
        if not IsString('stream') then exit;
        SkipBlankSpace;

        //decompress the stream ...
        buffer := nil;
        try
{$IFDEF UNICODE}
          zlib.ZDecompress(p, k, pointer(buffer), cnt);
{$ELSE}
          DecompressBuf(p, k, k*3, pointer(buffer), cnt);
{$ENDIF}
          //now de-filter the decompressed output (typically PNG filtering)
          //Filter Columns should match the byte count of /W[X Y Z]
          //The decompressed stream prefiltered size == (X Y Z +1) * entries
          //(ie allowing extra byte at the start of each column for filter type)
          //see also http://www.w3.org/TR/PNG-Filters.html

          if (filterColCnt > 0) and (predictor > 9) then
            cnt := ReversePngFilter(buffer, filterColCnt, cnt);

          //make sure the decompressed & defiltered table is a valid size ...
          if cnt mod (w1 + w2 + w3) <> 0 then exit;

          //if the Index array is empty then use the default values ...
          if length(indexArray) = 0 then
          begin
            setLength(indexArray, 2);
            indexArray[0] := 0;
            indexArray[1] := cnt div (w1 + w2 + w3);
          end;

          buffPtr := buffer;
          //loop through each subsection in the table and populate our
          //object list ...
          for i := 1 to (length(indexArray) div 2) do
          begin
            k := indexArray[i*2 -2]; //k := base object number
            for j := 1 to indexArray[i*2 -1] do
            begin
              case buffPtr^ of
                #0: ;//ignore (free object)

                #1: //uncompressed object
                  begin
                    inc(buffPtr);
                    new(PdfObj);
                    PdfObjList.Add(PdfObj);
                    PdfObj.number := k;
                    PdfObj.stmObjNum := -1;
                    PdfObj.offset := PAnsiCharToInteger(buffPtr, w2);
                    PdfObj.filePtr := PAnsiChar(ms.Memory) + PdfObj.offset;
                    dec(buffPtr, w1);
                  end;
                #2: //compressed object
                  begin
                    inc(buffPtr, w1);
                    new(PdfObj);
                    PdfObjList.Add(PdfObj);
                    PdfObj.number := k;
                    PdfObj.stmObjNum := PAnsiCharToInteger(buffPtr, w2);
                    inc(buffPtr,w2);
                    PdfObj.offset := PAnsiCharToInteger(buffPtr, w3);
                    PdfObj.filePtr := nil;
                    dec(buffPtr, w1+w2);
                  end;
              end;
              inc(buffPtr, w1 + w2 + w3);
              inc(k);
            end;
          end;
        finally
          if assigned(buffer) then FreeMem(buffer);
        end;

        if rootNum < 0 then exit;
        if not GotoObject(rootNum) then exit;

        if not FindStrInDict('/Pages') then exit;
        //get the Pages' object number, go to it and get the page count ...
        if not GetNumber(pagesNum) then exit;
        k := -1;
        if IsCompressedObject(pagesNum) then
        begin
          if not GetCompressedObjectBuffer(pagesNum, buffer, cnt) then exit;
          try
            if not FindStrInDict('/Count') or not GetNumber(k) then exit;
          finally
            FreeMem(buffer);
          end;
        end
        else if not GotoObject(pagesNum) or
          not FindStrInDict('/Count') or not GetNumber(k) then exit;

        //if we get this far the page number has been FOUND!!!
        result := k;
        exit;
      end;

      //OK, most likely a PDF doc ver 1.4 (or earlier) ...

      inc(p,4); //ie skip over 'xref'

      while true do //top of loop  //////////////////////////////
      begin
        //get base object number ==> k
        if not GetNumber(k) then exit;
        //get object count ==> cnt
        if not GetNumber(cnt) then exit;
        //it is possible to have 0 objects in a section
        SkipBlankSpace;

        //add all objects in section to list ...
        for cnt := 0 to cnt-1 do
        begin
          new(PdfObj);
          PdfObjList.Add(PdfObj);
          PdfObj.number := k + cnt;
          if not GetNumber(PdfObj.offset) then exit;
          PdfObj.filePtr := PAnsiChar(ms.Memory) + PdfObj.offset;
          //while each entry SHOULD be exactly 20 bytes, not all PDF document
          //creators seems to adhere to this :( ...
          while not (p^ in [#10,#13]) do inc(p);
          while (p^ in [#10,#13]) do inc(p);
        end;
        //check for and process further subsections ...
        if p^ in ['0'..'9'] then continue;

        // parse 'trailer dictionary' ...
        if not IsString('trailer') then exit;
        pSaved := p;
        // get Root (aka Catalog) ...
        if (rootNum = -1) and FindStrInDict('/Root') then
          if not GetNumber(rootNum) then exit;
        p := pSaved;
        if not FindStrInDict('/Prev') then break; //no more xrefs

        //next xref offset ==> k
        if not GetNumber(k) then exit;
        p :=  PAnsiChar(ms.Memory) + k +4;

      end; //bottom of loop /////////////////////////////////////

      //Make sure we've got Root's object number ...
      if rootNum < 0 then exit;
      if not GotoObject(rootNum) then exit;

      if not FindStrInDict('/Pages') then exit;
      //get Pages object number then goto pagesNum ...
      if not GetNumber(pagesNum) or not GotoObject(pagesNum) then exit;
      if not FindStrInDict('/Count') then exit;
      if not GetNumber(cnt) then exit;
      //occasionally the 'count' value is an indirect object
      if GetNumber(k) and IsString(' R') then
      begin
        if not GotoObject(cnt) then exit;
        if not GetNumber(k) or //skip the generation num
          not IsString(' obj') or
          not GetNumber(cnt) then exit;
      end;
      result := cnt; //FOUND!!!!!!

    finally
      screen.Cursor := crDefault;
      for k := 0 to PdfObjList.Count -1 do
        dispose(PPdfObj(PdfObjList[k]));
      PdfObjList.Free;
      ms.Free;
    end;
  except
    //nb: errors are flagged by returning -1
  end;
end;

//------------------------------------------------------------------------------

procedure ExecuteCommand(const command: string);
var
  txtOutput: string;
begin
  screen.Cursor := crHourGlass;
  application.ProcessMessages;
  try
    ErrorNum := WinExecAndWait32(command, SW_HIDE, 0, txtOutput);
    if ErrorNum <> 0 then
      raise Exception.Create(txtOutput);
  finally
    screen.Cursor := crDefault;
  end;
end;

//------------------------------------------------------------------------------

{$IFNDEF UNICODE}
function CharInSet(c: Char; const theSet: TSysCharset): Boolean;
begin
  result := c in theSet;
end;
{$ENDIF}

//------------------------------------------------------------------------------

function GetTempDirectory: string;
var
  tempFolder: array[0..MAX_PATH] of char;
begin
  if GetTempPath(MAX_PATH, @tempFolder) = 0 then
    raise Exception.Create('GetTempPath: Invalid temp path')
  else
    result := tempFolder;
end;

//------------------------------------------------------------------------------

procedure ProcessError(const ErrorMessage: string);
begin
  if (ErrorNum <> 0) then
    application.MessageBox(pchar('Operation failed.'#10+'Error number: $'+
      inttohex(ErrorNum,8)+#10+ ErrorMessage),
      pchar(application.Title), MB_ICONSTOP)
  else
    application.MessageBox(pchar(ErrorMessage),
      pchar(application.Title), MB_ICONSTOP);
end;

//------------------------------------------------------------------------------

function FileSize(const aFilename: String): Int64;
  var
    info: TWin32FileAttributeData;
  begin
    result := -1;

    if NOT GetFileAttributesEx(PWideChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

    result := Int64(info.nFileSizeLow);
  end;

//------------------------------------------------------------------------------

function GetTextWidth(AText: string; AFontSize: integer): integer;
var
  bmp: TBitmap;
  widthPixels, widthPoints : double;
begin
  bmp := TBitmap.Create;
  try
    bmp.Canvas.Font.Name := 'Arial';  // Font equivalent to Helvetica
    bmp.Canvas.Font.Size := AFontSize;
    widthPixels := bmp.Canvas.TextWidth(AText);
    widthPoints := (72 / bmp.Canvas.Font.PixelsPerInch) * widthPixels;
    result := round(widthPoints);
  finally
    bmp.Free;
  end;
end;


//------------------------------------------------------------------------------
//          TMainForm (General) Methods
//------------------------------------------------------------------------------

procedure TMainForm.FormCreate(Sender: TObject);
var
  desktopRect : TRect;
begin
  user := GetUsername;
  if user = '' then user := 'user';

  fFileList := TStringList.Create;
  LoadIniFileInfo;
  path := extractFilePath(paramstr(0));
  if FileExists(path+'pdftk.exe') then fPdftkPath := path;
  tmpPath := GetTempDirectory;
  ChDir(tmpPath);
  CreateDir('pdftkb');
  tmpPath := tmpPath + 'pdftkb\';
  ChDir(path);
  fRotatePageCnt := -1;

  //hook the StringGrid message handler to catch WM_DROPFILES ...
  fFormOldWindowProc := MainForm.WindowProc;
  MainForm.WindowProc := FormNewWindowProc;

  //fixup layout ...
  statusbar1.SimpleText := '  Version ' + GetVersion();
  PageControl1.ActivePage := tsCollate;
  StatusBar1.Height := DPIScale(20);
  StringGrid1.DefaultRowHeight := DPIScale(18);
  // TStringGrid option goRangeSelect is not used with StringGrid1 in pdftkb 4
  ClearButtonsAndLabels;
  fSaveFile := '';
  comboPageNumber.ItemIndex := 5;
  if not Expanded then
  begin
    Expanded := true;
    gbDocProtectClick(nil);
  end else
    btnDocProtect.Caption := #9650;

  //if possible restore the last closed position...
  //nb: Screen.DesktopRect works across *multiple* screens with coords relative
  //to position of topleft corner of primary monitor (that may be on the right).
  desktopRect := Screen.DesktopRect;
  if (origin.X > desktopRect.Left) and (origin.Y > desktopRect.Top) and
    (origin.X + self.Width < desktopRect.Width - desktopRect.Left) and
    (origin.Y + self.Height < desktopRect.Height - desktopRect.Top) then
  begin
    Position := poDesigned;
    Left := origin.X;
    Top := origin.Y;
  end else
    Position := poScreenCenter;  
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  btnResetCollateClick(nil);
end;

//------------------------------------------------------------------------------

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ClearFileList;
  fFileList.Free;
  DeleteAllTmpFiles;
  //RemoveDir(tmpPath);
  MainForm.WindowProc := fFormOldWindowProc;
end;

//------------------------------------------------------------------------------

procedure TMainForm.CreateWnd;
begin
  inherited;
  DragAcceptFiles(MainForm.Handle, True);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DestroyWnd;
begin
  DragAcceptFiles(MainForm.Handle, False);
  inherited;
end;

//------------------------------------------------------------------------------

procedure TMainForm.FormNewWindowProc(var Message: TMessage);
var
  i, cnt: integer;
  fpdf: boolean;
  filename : array [0..MAX_PATH] of char;
  SourceFileRec: PSourceFileRec;
begin
  //handle drag and drop of pdf files onto the StringGrid control ...
  if Message.Msg = WM_DROPFILES then
  begin
    if PageControl1.ActivePage = tsCollate then
      begin
      cnt := dragqueryfile(message.WParam, $FFFFFFFF, filename, MAX_PATH);
      for i := 0 to cnt-1 do
      begin
        dragqueryfile (message.WParam, i, filename, MAX_PATH);
        if fileexists(filename) and SameText(ExtractFileExt(filename),'.pdf') then
        begin
          new(SourceFileRec);
          SourceFileRec.FullPath := filename;
          SourceFileRec.Filename := ExtractFilename(filename);
          SourceFileRec.PageCount := PAGES_NOT_COUNTED;
          fFileList.AddObject(SourceFileRec.FullPath, pointer(SourceFileRec));
        end;
      end;
      dragfinish(message.WParam);
      RefreshGrid(StringGrid1.Selection.Top);
      UpdateButtonsAndMenus(StringGrid1.Selection.Top);
      tsCollateResize(nil); //in case the vertical scrollbar appears
      Message.Result := 0;
      end
    else
      begin
      dragqueryfile (message.WParam, 0, filename, MAX_PATH);
      dragfinish(message.WParam);
      Message.Result := 0;
      fPDF := fileexists(filename) and (SameText(ExtractFileExt(filename),'.pdf'));
      if fileexists(filename) then
        begin
        fDropFile := format('"%s"', [filename]);
        if ((GetKeyState(VK_SHIFT) < 0) or (GetKeyState(VK_MENU) < 0)) then
          begin
            if (PageControl1.ActivePage = tsBackground) and fPDF then
              begin
              if (NOT rbPageNumber.Checked)
              then btnCopyBackgroundFromClick(nil);
              end;
            if (PageControl1.ActivePage = tsTools) and fPDF then
              begin
              if (fToolsAction = 'Launch') or (fToolsAction = 'Compare')
              then btnCopyFile2FromClick(nil);
              end;
            if (PageControl1.ActivePage = tsTools) then
              begin
              if (fToolsAction = 'Attach File')
              then btnCopyFile2FromClick(nil);
              if (fToolsAction = 'Advanced') then
                begin // Advanced does not have btnCopyFile2From so use btnToolsFile2
                fPaste := true;
                btnToolsFile2Click(nil);
                end;
              end;
          end
          else
          if fPDF then btnCopySrcBackgroundFromClick(nil);
        end;
      end;
    end
  else fFormOldWindowProc(Message);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DeleteAllTmpFiles;
var
  i: integer;
  sr: TSearchRec;
begin
  i := FindFirst(tmpPath+'*.*', faAnyFile, sr);
  while i = 0 do
  begin
    SetFileAttributes(pchar(tmpPath+sr.Name), 0); //remove read-only etc
    DeleteFile(tmpPath+sr.Name);
    i := FindNext(sr);
  end;
  FindClose(sr);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClearButtonsAndLabels;
begin
  StringGrid1.Enabled := true;
  bAdd.Enabled := true;
  btnRepairPageCount.Visible := false;

  btnSplitView.Enabled := false;
  cbSrcSplit.Checked := false;
  lblSelectedSplit.Caption := '';
  fSplitSrc := '';
  fSplitSrcPageCount := 0;
  lblSrcSplitFilename.Caption := '';
  eSplitPagesFrom.Text := '';
  eSplitPagesTo.Text := '';
  btnSplitFolder.Enabled := false;
  btnSplitViewFolder.Enabled := false;
  lblSplitFolder.Caption := '';
  fSplitFolder := '';

  btnBackgroundView.Enabled := false;
  rbStamp.Checked := true;
  cbPageOneOnly.Checked := false;
  cbSrcBackground.Checked := false;
  lblSelectedBackground.Caption := '';
  fSrcBackground := '';
  lblSource_background_filename.Caption := '';
  fSrcBackgroundPageCount := 0;
  eNumPagesFrom.Text := '';
  eNumPagesTo.Text := '';
  eNumStart.Text := '';
  btnBackgroundViewStamp.Enabled := false;
  fBackground := '';
  fBackgroundPageCount := 0;
  lblBackgroundFilename.Caption := '';
  fNumPortrait := false;  // Orientation toggle, btnNumPortraitClick(nil) below will toggle it to true
  comboPageNumber.ItemIndex := 5;  // Starting Page Number Position, 5 = Bottom-Right
  btnNumPortraitClick(nil);

  btnRotateView.Enabled := false;
  rbRotRight.Checked := true;
  cbSrcRotate.Checked := false;
  lblSelectedRotate.Caption := '';
  fSrcRotate := '';
  lblSrcRotateFilename.Caption := '';
  eRotPages.Text := '';
  eRotPagesFrom.Text := '';
  eRotPagesTo.Text := '';

  btnToolsView.Enabled := false;
  rbTools1.Checked := true;
  fToolsSet := 1;
  fToolsIndex := 1;
  fToolsIndexSet1 := 1;  // Dump Data-Update Info-Attach File-Unpack Files
  fToolsIndexSet2 := 5;  // Decrypt-Repair-Uncompress-Compress
  fToolsIndexSet3 := 9;  // Dump Fields-Gen FDF-Fill Form-Flatten
  fToolsIndexSet4 := 13; // Advanced-Launch-Compare-Spare
  btnRbTools.Caption := '1';
  cbSrcTools.Checked := false;
  lblSelectedTools.Caption := '';
  fSrcTools := '';
  fToolsPageCount := 0;
  lblSelectedTools.Caption := '';
  lblSrcToolsFilename.Caption := '';
  lblDecryptPassword.Visible := false;
  eDecryptPassword.Visible := false;
  eDecryptPassword.Text := '';
  comboApplication.Visible := false;
  lblApplication.Visible := false;
  btnLaunchApp.Visible := false;
  btnToolsFile2Reset.Visible := false;
  btnToolsFile2.Visible := false;
  btnToolsFile2Open.Visible := false;
  lblToolsFile2Filename.Visible := false;
  lblToolsFile2Filename.Caption := '';
  btnCopyFile2From.Visible := false;
  btnCopyFile2To.Visible := false;
  fUnpackFolder := '';
  btnAdvancedReset.Visible := false;
  btnAdvancedTemplate.Visible := false;
  btnAdvancedFilter.Visible := false;
  btnAdvancedTemplate.Caption := 'T3';
  btnAdvancedTemplateClick(nil);
  btnAdvancedFilter.Caption := 'ANY';
  lblAdvancedHint.Visible := false;

  fErrorCode := '';
  Clipboard.Clear;
  fPrevPage := 'tsCollate';
  fPaste := false;
  fPipe := false;
  fAltShift := false;
  fExtract := false;
  lblSaveFilename.Caption := '';
  btnBuild.Enabled := false;
  bViewSave.Enabled :=false;
  bLocate.Enabled := false;
  bPipe.Enabled := false;
  bClose.Enabled := true;
end;

//------------------------------------------------------------------------------

procedure TMainForm.UpdateButtonsAndMenus(RowSelected: integer);
begin
  if PageControl1.ActivePage = tsCollate then
  begin
    if fFileList.Count = 0 then
    begin
      btnBuild.Enabled := false;
      bDelete.Enabled := false;
      bView.Enabled := false;
      cbShuffle.Checked := false;
      btnSort.Enabled := false;
      bMoveUp.Enabled := false;
      bMoveDown.Enabled := false;
      ePages.Enabled := false;
      lPages.Enabled := false;
      ePages.Enabled := false;
    end else
    begin
      btnBuild.Enabled := true;
      bDelete.Enabled := true;
      bView.Enabled := true;
      if (fFileList.Count <2) then cbShuffle.Checked := false;
      btnSort.Enabled := fFileList.Count > 1;
      bMoveUp.Enabled := (RowSelected > 0) and
        (StringGrid1.Selection.Top = StringGrid1.Selection.Bottom);
      bMoveDown.Enabled := (RowSelected < StringGrid1.RowCount -1) and
        (StringGrid1.Selection.Top = StringGrid1.Selection.Bottom);
      ePages.Enabled := (fFileList.Count < 27);
      lPages.Enabled := ePages.Enabled;
    end;
  end
  else if PageControl1.ActivePage = tsSplit then
  begin
    btnBuild.Enabled := fileExists(fSplitSrc);
  end
  else if PageControl1.ActivePage = tsBackground then
  begin
    btnBuild.Enabled := fileExists(fSrcBackground) and
      (fileExists(fBackground) or rbPageNumber.Checked);
  end
  else if PageControl1.ActivePage = tsRotate then
  begin
    btnBuild.Enabled := fileExists(fSrcRotate)
  end
  else if PageControl1.ActivePage = tsTools then
  begin
    btnBuild.Enabled := fileExists(fSrcTools) and
      (fileExists(fAttachment) or
       ((fToolsAction <> 'Attach File') and
        (fToolsAction <> 'Launch') and (fToolsAction <> 'Compare')));
     if ((fToolsAction = 'Advanced') and (NOT FileExists(fSecondaryInputFile)) and
       (btnAdvancedTemplate.Caption > 'T3')) then btnBuild.Enabled := false;
   end;
  statusbar1.SimpleText := '  Version ' + GetVersion();
  if SaveDialog1.FileName = '' then
    begin
      bViewSave.Enabled :=false;
      bLocate.Enabled := false;
      bPipe.Enabled := false;
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('P')) and ((ssAlt in Shift) OR (ssCtrl in Shift)) then
    gbDocProtectClick(nil);
  if (PageControl1.ActivePage = tsCollate) then
    begin
      if (Key = Ord('S')) and (ssAlt in Shift) and (ssShift in Shift) then
      begin
        fAltShift := true;
        PageControl1.ActivePage := tsSplit;
        btnSrcSplitClick(nil);
      end
      else if (Key = Ord('M')) and (ssAlt in Shift) and (ssShift in Shift) then
      begin
        fAltShift := true;
        PageControl1.ActivePage := tsBackground;
        btnSrcBackgroundClick(nil);
      end
      else if (Key = Ord('R')) and (ssAlt in Shift) and (ssShift in Shift) then
      begin
        fAltShift := true;
        PageControl1.ActivePage := tsRotate;
        btnSrcRotateClick(nil);
      end
      else if (Key = Ord('T')) and (ssAlt in Shift) and (ssShift in Shift) then
      begin
        fAltShift := true;
        PageControl1.ActivePage := tsTools;
        btnSrcToolsClick(nil);
      end
      else if (KEY = VK_DELETE) AND StringGrid1.Focused then
      begin
        bDeleteClick(nil);
      end

      // [3.9.6] ctrl-A (Select All) added in 3.9.6 allowed multi-row range
      // selection (TStringGrid option goRangeSelect) but only worked with
      // 'Remove' function.  Not retrofitted into v4 due to limited utility
      // (use 'Reset' btn instead) and problems caused elsewhere in v4 when
      //  multirange is enabled.

      // else if (Key = Ord('A')) and (ssCtrl in Shift) and (StringGrid1.RowCount > 1) then
      // begin
      //   sel := StringGrid1.Selection;
      //   sel.Top := 0;
      //   sel.Bottom := fFileList.Count -1;
      //   StringGrid1.Selection := sel;
      //  StringGrid1Click(nil);
      // end

    end;

  // Ctrl key equivalents to Alt-J, -S, -M, -R, -T and P (in lieu of View menu in v3.10)
	if (Key = Ord('J')) and (ssCtrl in Shift) then PageControl1.ActivePage := tsCollate else
	if (Key = Ord('S')) and (ssCtrl in Shift) then PageControl1.ActivePage := tsSplit else
	if (Key = Ord('M')) and (ssCtrl in Shift) then PageControl1.ActivePage := tsBackground else
	if (Key = Ord('R')) and (ssCtrl in Shift) then PageControl1.ActivePage := tsRotate else
	if (Key = Ord('T')) and (ssCtrl in Shift) then PageControl1.ActivePage := tsTools;

end;

//------------------------------------------------------------------------------

procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  UpdateButtonsAndMenus(StringGrid1.Selection.Top);

  // Following code deleted when btnBuild Caption changed from Save to Build
  // if PageControl1.ActivePage = tsSplit then
  //   btnBuild.Caption := 'S&ave' else
  //   btnBuild.Caption := 'S&ave As';

  if (PageControl1.ActivePage = tsCollate) then
    begin
      fPrevPage := 'tsCollate';
    end
  else if (PageControl1.ActivePage = tsSplit) then
    begin
      if (GetKeyState(VK_SHIFT) < 0) and  (fPrevPage = 'tsCollate') then
        begin
          fPrevPage := 'tsSplit';
          fAltShift := true;
          btnSrcSplitClick(nil);
        end
      else
        begin
         fPrevPage := 'tsSplit';
         fAltShift := false;
         cbSrcSplitClick(nil);
        end;
    end
  else if (PageControl1.ActivePage = tsBackground) then
    begin
      if (GetKeyState(VK_SHIFT) < 0) and (fPrevPage = 'tsCollate') then
        begin
          fPrevPage := 'tsBackground';
          fAltShift := true;
          btnSrcBackgroundClick(nil);
        end
      else
        begin
          fPrevPage := 'tsBackground';
          fAltShift := false;
          cbSrcBackgroundClick(nil);
        end;
    end
  else if (PageControl1.ActivePage = tsRotate) then
    begin
      if (GetKeyState(VK_SHIFT) < 0) and (fPrevPage = 'tsCollate') then
        begin
          fPrevPage := 'tsRotate';
          fAltShift := true;
          btnSrcRotateClick(nil);
        end
      else
        begin
          fPrevPage := 'tsRotate';
          fAltShift := false;
          cbSrcRotateClick(nil);
        end;
    end
  else if (PageControl1.ActivePage = tsTools) then
    begin
      if (GetKeyState(VK_SHIFT) < 0) and (fPrevPage = 'tsCollate') then
        begin
          fPrevPage := 'tsTools';
          fAltShift := true;
          btnSrcToolsClick(nil);
        end
      else
        begin
          fPrevPage := 'tsTools';
          fAltShift := false;
          cbSrcToolsClick(nil);
        end;
    DisplayToolsSet;
    end;
end;


//------------------------------------------------------------------------------
//         TMainForm Menu Bar Methods
//------------------------------------------------------------------------------

procedure TMainForm.About1Click(Sender: TObject);
begin
  with TAboutForm.Create(self) do
  try
    lblVersion.Caption := 'Enhanced Version ' + GetVersion();
    showModal;
  finally
    free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.Contents1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', pchar(Path + 'docs\PdftkBuilder.html'), Nil, Nil, SW_NORMAL);
  // Following change in 3.10.0 (13 Jul 2018) not adopted since it relies on internet access to display help file
  // ShellExecute(0, nil, 'http://www.angusj.com/pdftkb/', Nil, Nil, SW_NORMAL);
end;

//------------------------------------------------------------------------------

procedure TMainForm.OpenIniClick(Sender: TObject);
begin
  ViewFile(Path + 'PdftkBuilder.ini', fTxtExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ViewGuideClick(Sender: TObject);
begin
  ViewFile(Path + 'docs\PdftkBuilder.pdf', fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ViewPDFtkClick(Sender: TObject);
begin
  ViewFile(Path + 'docs\PdftkServer.pdf', fPdfExe);
end;


//------------------------------------------------------------------------------
//          TMainForm Document Protection Panel Methods
//------------------------------------------------------------------------------

procedure TMainForm.gbDocProtectClick(Sender: TObject);
begin
  if Expanded then
  begin
    gbDocProtect.Height := DPIScale(28);
    Height := Height - DPIScale(168);
    btnDocProtect.Caption := #9660;
  end else
  begin
    gbDocProtect.Height := DPIScale(190);
    Height := Height + DPIScale(168);
    btnDocProtect.Caption := #9650;
  end;
  Expanded := not Expanded;
  gbPasswords.Enabled := Expanded;
  pnlProtection.Enabled := Expanded;
  cbAllowAll.Enabled := Expanded;
end;

//------------------------------------------------------------------------------

procedure TMainForm.cbAllowAllClick(Sender: TObject);
begin
  if not cbAllowAll.Focused then exit;
  cbPrinting.Checked := cbAllowAll.Checked;
  cbDegradedPrinting.Checked := cbAllowAll.Checked;
  cbModifyContents.Checked := cbAllowAll.Checked;
  cbAssembly.Checked := cbAllowAll.Checked;
  cbCopyContents.Checked := cbAllowAll.Checked;
  cbScreenReaders.Checked := cbAllowAll.Checked;
  cbModifyAnnotations.Checked := cbAllowAll.Checked;
  cbFillIn.Checked := cbAllowAll.Checked;
end;

//------------------------------------------------------------------------------

procedure TMainForm.cbPrintingClick(Sender: TObject);
begin
  //if any checkbox is unticked then make sure 'all actions' is unticked too.
  if (Sender is TCheckbox) and
    TCheckbox(Sender).Focused and not TCheckbox(Sender).Checked then
      cbAllowAll.Checked := false;
end;


//------------------------------------------------------------------------------
//          TMainForm tsCollate (Join Files) Methods
//------------------------------------------------------------------------------

procedure TMainForm.RefreshGrid(RowSelected: integer);
var
  i, savePageCount : integer;
  s, s2 : string;
begin
  with StringGrid1 do
    if fFileList.Count = 0 then
    begin
      lblSelected.Caption := '';
      RowCount := 1;
      Cells[0,0] := '';
      Cells[1,0] := '';
      lFilename.caption := '';
      ePages.Text := '';
    end else
    begin
      RowCount := fFileList.Count;
      for i := 0 to fFileList.Count -1 do
        begin
          // Cells[0,i] = Filename, truncate if too long for width of col 0
          // Cells[1,i] = Page Range/Truncation Indicator ('P','T','PT' or '')
          if btnGridMode.Caption = '1' then
            s := PSourceFileRec(fFileList.Objects[i]).Filename;
          if btnGridMode.Caption = '2' then
            s := PSourceFileRec(fFileList.Objects[i]).Fullpath;
          s2 := s;
          if btnGridMode.Caption = '1' then
            s := TruncateString(s, 36, (ColWidths[0] - 20));
          Cells[0,i] := s;
          if (PSourceFileRec(fFileList.Objects[i]).Pages <> '') then
            cells[1,i] := 'P' else cells[1,i] := '';
          if (PSourceFileRec(fFileList.Objects[i]).PageCount = PAGECOUNT_NOT_FOUND) then
            cells[1,i] := cells[1,i] + '?';
          if ((s <> s2) and (length(cells[1,i])<2)) then cells[1,i] := cells[1,i] + 'T';
        end;

    lblSelected.Caption := '> ' + inttostr(RowSelected + 1) + ' of ' +
      inttostr(fFileList.Count);

      if StringGrid1.Selection.Bottom > StringGrid1.Selection.Top then
      begin
        lFilename.caption := Format('(%d %s)',
          [StringGrid1.Selection.Bottom - StringGrid1.Selection.Top + 1,
          'files selected']);
      end else      
      with PSourceFileRec(fFileList.Objects[RowSelected])^ do
      begin
        ePages.Text := Pages;
        //get pageCount if not already tried or if previously not found ...
        savePageCount := PageCount;
        if (PageCount = PAGES_NOT_COUNTED) or (PageCount = PAGECOUNT_NOT_FOUND) then
          PageCount := GetPdfPageCount(FullPath);

        // Run GetRepairedPageCount if GetPDFPageCount cannot find page count when the
        // the file was selected in the stringgrid with Join Files active
        // GetRepairedPageCount is only tried once - on initial failure to find pagecount

        if (PageCount = PAGECOUNT_NOT_FOUND) and (savePageCount = PAGES_NOT_COUNTED)  then
          begin
            // Disable buttons and grid while pdftk runs to get pageCount
            bAdd.Enabled := false;
            btnBuild.Enabled := false;
            bDelete.Enabled := false;
            bView.Enabled := false;
            btnSort.Enabled := false;
            bMoveUp.Enabled := false;
            bMoveDown.Enabled := false;
            StringGrid1.Enabled := false;
            PageCount := GetRepairedPageCount(FullPath);
            if PageCount < 1 then cells[1,RowSelected] := '?' + cells[1,RowSelected];
            // Re-enable buttons
            StringGrid1.Enabled := true;
            bAdd.Enabled := true;
            UpdateButtonsAndMenus(StringGrid1.Selection.Top);
          end;

         // Display selected filename and pagecount, truncate long filenames
        if PageCount < 1 then btnRepairPageCount.Visible := true
          else btnRepairPageCount.Visible := false;
        if PageCount < 1 then
          s := format('%s  (?)',[Filename])
        else if PageCount = 1 then
          s := format('%s  (1)',[Filename])
        else
          s := format('%s  (%d)',[Filename, PageCount]);
        lFilename.caption := TruncateString(s, 28, lFilename.Width - 10);
      end;
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.tsCollateResize(Sender: TObject);
var
  w: integer;
  //i,j, w: integer;
begin
  StringGrid1.ColWidths[1] := 24;
  w := StringGrid1.ClientWidth - StringGrid1.ColWidths[1] - 1;
  //w := StringGrid1.ClientWidth;
  //with StringGrid1 do
  //  for i := 0 to RowCount -1 do
  //  begin
  //    j := canvas.TextWidth(Cells[0,i])+4;
  //    if j > w then w := j;
  //  end;
  StringGrid1.ColWidths[0] := w;
end;

//------------------------------------------------------------------------------

procedure TMainForm.StringGrid1Click(Sender: TObject);
begin
  UpdateButtonsAndMenus(StringGrid1.Selection.Top);
  RefreshGrid(StringGrid1.Selection.Top);
end;

//------------------------------------------------------------------------------

function TMainForm.TruncateString(const s2 : string; pos, width : integer) : string;
var
  s : string;
  i : integer;
begin
  with StringGrid1 do
  s := s2;
  i := self.Canvas.TextWidth(s);
  while i > width do
    begin
      delete(s,pos,1);
      i := self.Canvas.TextWidth(s);
    end;
  if s <> s2 then
    begin
     delete(s,pos,2);
     insert('...', s, pos);
    end;
  result := s;

end;

//------------------------------------------------------------------------------

procedure TMainForm.ClearFileList;
var
  i: integer;
begin
  for i := 0 to fFileList.Count -1 do
    dispose(PSourceFileRec(fFileList.Objects[i]));
  fFileList.Clear;
end;

//------------------------------------------------------------------------------

procedure  TMainForm.IsSaveFileInUse;
var
  HFileRes: HFILE;
  s: string;
begin
  if FileExists(SaveDialog1.FileName) then
  begin
    HFileRes := CreateFile(PChar(SaveDialog1.FileName),
                 GENERIC_READ or GENERIC_WRITE,
                 0,
                 nil,
                 OPEN_EXISTING,
                 FILE_ATTRIBUTE_NORMAL,
                 0);
    if (HFileRes = INVALID_HANDLE_VALUE) then
      begin
        s :=     'WARNING! The selected output file is open in another app' + #13#10;
        s := s + 'or attempting to write to a folder requiring more permissions.' + #13#10;
        s := s + 'Close the other app or change the folder and then retry.';
        showmessage(s);
        exit;
      end else 
        CloseHandle (HFileRes); 
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnRepairPageCountClick(Sender: TObject);
var
  RowSelected : integer;
  s : string;
begin
    if fFileList.Count > 0 then
    begin
      RowSelected := StringGrid1.Selection.Top;
      with PSourceFileRec(fFileList.Objects[RowSelected])^ do
      begin

        //get pageCount if not already tried or if previously not found ...
        if (PageCount = PAGES_NOT_COUNTED) or (PageCount = PAGECOUNT_NOT_FOUND) then
          PageCount := GetPdfPageCount(FullPath);

        if (PageCount < 1) then
          begin
            // Disable buttons and grid while pdftk runs to get pageCount
            bAdd.Enabled := false;
            btnBuild.Enabled := false;
            bDelete.Enabled := false;
            bView.Enabled := false;
            btnSort.Enabled := false;
            bMoveUp.Enabled := false;
            bMoveDown.Enabled := false;
            StringGrid1.Enabled := false;
            PageCount := GetRepairedPageCount(FullPath);
            s := StringGrid1.cells[1,RowSelected];
            s := StringReplace(s, '?', '', [rfReplaceAll, rfIgnoreCase]);
            if PageCount > 0 then StringGrid1.cells[1,RowSelected] := s;
            // Re-enable buttons
            StringGrid1.Enabled := true;
            bAdd.Enabled := true;
            UpdateButtonsAndMenus(StringGrid1.Selection.Top);
          end;

         // Display selected filename and pagecount, truncate long filenames
        if PageCount < 1 then
          s := format('%s  (?)',[Filename])
        else if PageCount = 1 then
          s := format('%s  (1)',[Filename])
        else
          s := format('%s  (%d)',[Filename, PageCount]);
        lFilename.caption := TruncateString(s, 28, lFilename.Width - 10);
        if PageCount > 0 then btnRepairPageCount.Visible := false;
      end;
    end;
end;

//------------------------------------------------------------------------------

// GetRepairedPageCount is tried when GetPdfPageCount returns a page count of
// PAGECOUNT_NOT_FOUND (-1).  It runs pdftk to repair a copy of the file and then
// runs GetPdfPageCount to see if the page count can be found in the repaired file.

// A valid page count appears only critical to Join and Rotate page range validation.
// These functions can take noticeable time for large documents. Therefore, some
// controls are grayed out to avoid user interaction while the function is running.

// An * denotes a variant of the secondary page count function that is not
// currently used. Its code has been commented out but retained for reference below

// There are three versions of GetRepairedPageCount which can be substituted
// as desired without altering the surrounding code where the function is called
// GetRepairedPageCount   - get repaired page count without altering original file
// *GetRepairedPageCount_1 - get repaired page count, replace file, original renamed _bak
// *GetRepairedPageCount_0 - dummy call (returns original page count, no repair attempted)

// GetCatPageCount substitutes cat rather repair (filter mode) to fix the copy of the file
// Cat can also fix page count not found but with less growth in file size than repair
// and thus is preferable to repair if the original file is being replaced
// *GetCatPageCount    - get page count by running pdftk cat without altering original file
// *GetCatPageCount_ 1 - get page count by running pdftk cat, replace file, original renamed _bak

// GetDumpPageCount runs dumps_data and searches the text report for the 'NumberOfPages: ' value
// *GetDumpPageCount - get page count by running pdftk dump_data, does not alter original file


function TMainForm.GetRepairedPageCount(const inputfile : string) : integer;
var
  s: string;
begin
  // Repair a copy of file to get repaired page count, dont alter original file
  ChDir(tmpPath);
  CopyFile(pchar(inputfile), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  result := GetPdfPageCount(tmpPath+'dst.pdf');
end;

// The following variants of secondary page count functions are based on pdftk
// repair, cat or dump_data operations and are not currently used

(*
function TMainForm.GetRepairedPageCount_0(const inputfile : string) : integer;
begin
  // Dummy version of function - returns page count of original file (not found)
  result := GetPdfPageCount(inputfile);
end;
*)

(*
function TMainForm.GetRepairedPageCount_1(const inputfile : string) : integer;
var
  s: string;
begin
  // Repair a copy of file using filter mode, copy it back to original file and
  // return its repaired page count
  ChDir(tmpPath);
  CopyFile(pchar(inputfile), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  s := ChangeFileExt(inputfile, '_bak.pdf');
  RenameFile(inputfile, s);
  s := tmpPath+'dst.pdf';
  CopyFile(pchar(s), pchar(inputfile),false);
  result := GetPdfPageCount(inputfile);
end;
*)

(*
function TMainForm.GetCatPageCount(const inputfile : string) : integer;
var
  s: string;
begin
  // Cat copy of file to get page count, dont alter original file
  ChDir(tmpPath);
  CopyFile(pchar(inputfile), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf cat output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  result := GetPdfPageCount(tmpPath+'dst.pdf');
end;
*)

(*
function TMainForm.GetCatPageCount_1(const inputfile : string) : integer;
var
  s: string;
begin
  // Catenate a copy of file, copy it back to original and return its page count
  ChDir(tmpPath);
  CopyFile(pchar(inputfile), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf cat output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  s := ChangeFileExt(inputfile, '_bak.pdf');
  RenameFile(inputfile, s);
  s := tmpPath+'dst.pdf';
  CopyFile(pchar(s), pchar(inputfile),false);
  result := GetPdfPageCount(inputfile);
end;
*)

(*
function TMainForm.GetDumpPageCount(const inputfile : string) : integer;
var
  i, iPageCount: integer;
  s: string;
  sl: TStringList;
begin
  // Dump metadata of file to get page count, dont alter original file
  ChDir(tmpPath);
  CopyFile(pchar(inputfile), 'src.pdf', false);
  s := format('"%spdftk.exe" src.pdf dump_data output dump_data.txt %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);
  iPageCount := -1;
  sl := TStringList.Create;
  try
    sl.LoadFromFile('dump_data.txt');
    for i :=0 to sl.Count-1 do
      if Pos('NumberOfPages: ', sl[i]) <> 0 then
      begin
        s := sl[i];
	      s := AnsiRightStr(s, length(s) - 15);
        iPageCount := StrToInt(s);
        break;
      end;
  finally
    sl.Free;
  end;
  result := iPageCount;
end;
*)

//------------------------------------------------------------------------------

procedure TMainForm.btnGridModeClick(Sender: TObject);
begin
  if btnGridMode.Caption = '1' then btnGridMode.Caption := '2'
  else
  if btnGridMode.Caption = '2' then btnGridMode.Caption := '1';
  StringGrid1.SetFocus;
  RefreshGrid(StringGrid1.Selection.Top);
end;

//------------------------------------------------------------------------------

procedure TMainForm.cbshuffleClick(Sender: TObject);
begin
    if((cbShuffle.Checked) and (fFileList.Count <2)) then cbShuffle.Checked := false;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnResetCollateClick(Sender: TObject);
begin
  ClearFileList;
  if SaveDialog1.FileName = '' then
    begin
    lblSaveFilename.Caption := '';
    btnBuild.Enabled := false;
    bViewSave.Enabled :=false;
    bLocate.Enabled := false;
    bPipe.Enabled := false;
    bClose.Enabled := true;
    end;
  StringGrid1.Enabled := true;
  StringGrid1.SetFocus;
  bAdd.Enabled := true;
  RefreshGrid(0);
  UpdateButtonsandMenus(0);
  tsCollateResize(nil); //in case vert scrollbar appears
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnResetAllClick(Sender: TObject);
begin
  ClearFileList;
  ClearButtonsAndLabels;
  fSaveFile := '';
  comboPageNumber.ItemIndex := 0;
  rbStamp.Checked := true;
  DeleteAllTmpFiles;
  StringGrid1.Enabled := true;
  StringGrid1.SetFocus;
  bAdd.Enabled := true;
  RefreshGrid(0);
  UpdateButtonsandMenus(0);
  tsCollateResize(nil); //in case vert scrollbar appears
end;

//------------------------------------------------------------------------------

procedure TMainForm.ePagesChange(Sender: TObject);
var
  i, maxPageNum: integer;
  isValidPageRange: boolean;
begin
  if not ePages.Focused then exit;
  btnBuild.Enabled := true;
  i := StringGrid1.Selection.Top;
  if (i >= fFileList.Count) then exit;
  PSourceFileRec(fFileList.Objects[i]).Pages := ePages.Text;
  RefreshGrid(i);
  maxPageNum := PSourceFileRec(fFileList.Objects[i]).PageCount;
  if maxPageNum < 0 then maxPageNum := 99999;  //suppress error check if no page count
  FmtPagesString(ePages.Text, maxPageNum, isValidPageRange);
  if isValidPageRange then
    ePages.Font.Color := clBlack else
    ePages.Font.Color := clRed;
end;

//------------------------------------------------------------------------------

// FmtPagesString() tidies up (formats) page ranges ready for pdftk.exe so that
// each range is separated by a space and finishes with a space
// eg - Input: "1, 3-6,19, 21 - 28" Output: "1 3-6 19 21-28 "

function TMainForm.FmtPagesString(PagesStr: string; const maxPageNum : integer; out IsValid: boolean; const fileMarker: string = ''): string;
var
  i, len: integer;
  rngeStrt, rngeEnd: string;

  procedure SkipSpaces;
  begin
    while (i <= len) and (PagesStr[i] = ' ') do inc(i);
  end;

  function GetNumber(var num: string): boolean;
  begin
    num := '';
    while (i <= len) and CharInSet(PagesStr[i], ['0'..'9']) do
    begin
      num := num + PagesStr[i];
      inc(i);
    end;
	result := num <> '';
	if result then result := strtoint(num) <= maxPageNum;
  end;

begin
  IsValid := false;
  result := '';
  len := length(PagesStr);
  i := 1;
  while i <= len do
  begin
    SkipSpaces;
    if (i > len) then break;
    if not GetNumber(rngeStrt) then exit;
    SkipSpaces;
    if (i <= len) and (PagesStr[i] = '-') then
    begin
      inc(i);
      SkipSpaces;
      if not GetNumber(rngeEnd) then exit;
      SkipSpaces;
      result := result + fileMarker + rngeStrt + '-' + rngeEnd + ' ';
    end
    else
      result := result + fileMarker + rngeStrt + ' ';

    if (i > len) then break
    else if CharInSet(PagesStr[i], [',',';',':']) then
    begin
      inc(i);
      continue;
    end else
      exit;
  end;
  if result = '' then result := ' ';
  IsValid := true;
end;

//------------------------------------------------------------------------------

procedure TMainForm.bAddClick(Sender: TObject);
var
  i: integer;
  SourceFileRec: PSourceFileRec;
  sl: TStringlist;
begin
  if GetKeyState(VK_SHIFT) < 0 then
    begin
      // Shift-Add button adds a copy of the selected file to the source list
      i := StringGrid1.Selection.Top;
      new(SourceFileRec);
      SourceFileRec.FullPath := PSourceFileRec(fFileList.Objects[i]).FullPath;
      SourceFileRec.Filename := PSourceFileRec(fFileList.Objects[i]).Filename;
      SourceFileRec.PageCount := PSourceFileRec(fFileList.Objects[i]).PageCount;
      fFileList.AddObject(SourceFileRec.FullPath, pointer(SourceFileRec));
    end
  else
    begin
      // Add button (without Shift) adds the file(s) selected in an Open dialog
      OpenDialog1.Options := OpenDialog1.Options + [ofAllowMultiSelect];
      if not OpenDialog1.Execute then exit;

      //we can't sort OpenDialog1.Files so copy the filenames to a TStringlist ...
      sl := TStringlist.Create;
      try
        sl.Assign(OpenDialog1.Files);
        sl.sort;
        for i := 0 to sl.Count -1 do
        begin
          new(SourceFileRec);
          SourceFileRec.FullPath := sl[i];
          SourceFileRec.Filename := ExtractFilename(sl[i]);
          SourceFileRec.PageCount := PAGES_NOT_COUNTED;
          fFileList.AddObject(SourceFileRec.FullPath, pointer(SourceFileRec));
        end;
      finally
        sl.Free;
      end;
    end;
  RefreshGrid(StringGrid1.Selection.Top);
  UpdateButtonsAndMenus(StringGrid1.Selection.Top);
  tsCollateResize(nil); //in case vert scrollbar appears
end;

//------------------------------------------------------------------------------

procedure TMainForm.bDeleteClick(Sender: TObject);
// This 'Remove' button proc was generalized in pdftkb 3.9.6 to support selection of more
// than one row; i.e., ranges.  However, since StringGrid1 in pdftkb v4 intentionally does 
// not use the related goRangeSelect option, only one row will ever be selected in v4 
// (Selection.Top = Selection.Bottom) and the 'for' loop will execute for only one iteration.
var
  i,j: integer;
begin
  i := StringGrid1.Selection.Top;
  for j := StringGrid1.Selection.Bottom downto i do
  begin
    dispose(PSourceFileRec(fFileList.Objects[j]));
    fFileList.Delete(j);
  end;
  if i >= fFileList.Count then i := fFileList.Count -1;
  RefreshGrid(i);
  UpdateButtonsAndMenus(i);
  tsCollateResize(nil); //in case vert scrollbar appears
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSortClick(Sender: TObject);
begin
  fFileList.Sort;
  RefreshGrid(StringGrid1.Selection.Top);
end;

//------------------------------------------------------------------------------

procedure TMainForm.bMoveUpClick(Sender: TObject);
var
  i, j, rows: integer;
  sel: TGridRect;
  SourceFileRec: PSourceFileRec;
begin
  sel := StringGrid1.Selection;
  rows := sel.Top;
  if rows = 0 then exit;  // check since Shift-Alt-U not sent by button
  if GetKeyState(VK_SHIFT) <0 then rows := sel.Top else rows := 1;
  i := 0; // Suppress compiler warning that var i  might not have been initialized
  for j :=1 to rows do
  begin
    i := sel.Top;
    SourceFileRec := pointer(fFileList.Objects[i]);
    fFileList.Delete(i);
    fFileList.InsertObject(i-1,SourceFileRec.FullPath,pointer(SourceFileRec));
    dec(sel.Top);
    dec(sel.Bottom);
  end;
  if rows = 1 then RefreshGrid(i-1) else RefreshGrid(0);
  StringGrid1.Selection := sel;
  if sel.Top < StringGrid1.TopRow then StringGrid1.TopRow := sel.Top;
  if rows = 1 then UpdateButtonsAndMenus(i-1) else UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.bMoveDownClick(Sender: TObject);
var
  i, j, rows: integer;
  sel: TGridRect;
  SourceFileRec: PSourceFileRec;
begin
  sel := StringGrid1.Selection;
  rows := sel.Bottom;
  if rows = fFileList.Count -1 then exit;  // check since Shift-Alt-D not sent by button
  if GetKeyState(VK_SHIFT) <0 then rows := fFileList.Count - 1 - rows else rows := 1;
  i := 0;  // Suppress compiler warning that var i  might not have been initialized
  for j :=1 to rows do
  begin
    i := sel.Top;
    SourceFileRec := pointer(fFileList.Objects[i]);
    fFileList.Delete(i);
    fFileList.InsertObject(i+1,SourceFileRec.FullPath,pointer(SourceFileRec));
    inc(sel.Top);
    inc(sel.Bottom);
  end;
  if rows =1 then RefreshGrid(i+1) else RefreshGrid(fFileList.Count - 1);
  StringGrid1.Selection := sel;
  with StringGrid1 do
    if sel.Bottom  >= TopRow + VisibleRowCount then
      StringGrid1.TopRow := sel.Bottom - VisibleRowCount + 1;
  if rows = 1 then UpdateButtonsAndMenus(i+1) else UpdateButtonsAndMenus(fFileList.Count - 1);
end;

//------------------------------------------------------------------------------

procedure TMainForm.bViewClick(Sender: TObject);
var
  i: integer;
  s: string;
begin
  i := StringGrid1.Selection.Top;
  s := PSourceFileRec(fFileList.Objects[i]).FullPath;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.ViewFile(const sFile, sAppExe : string);
var
  sFile2 : string;
begin
  if NOT FileExists(sFile) then exit;
  sFile2 := format('"%s"', [sFile]);
  if sAppExe = '' then ShellExecute(0, 'open', PChar(sFile2), Nil, Nil, SW_NORMAL) else
    begin
      if (sAppExe = fPdfExe) AND (fPdfArg <> '')
        then sFile2 := AnsiReplaceStr(fPdfArg, '%PDFFILE%', SFile2)
        else if (sAppExe = fTxtExe) AND (fTxtArg <> '')
        then sFile2 := AnsiReplaceStr(fTxtArg, '%TXTFILE%', SFile2);
      ShellExecute(0, 'open', PChar(sAppExe), PChar(sFile2), Nil, SW_NORMAL);
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.popLocateClick(Sender: TObject);
var
  sel : TGridRect;
  sFullPath : string;
begin
  sel := StringGrid1.Selection;
  sFullPath :=  PSourceFileRec(fFileList.Objects[sel.Top]).FullPath;
  ShellExecute(Application.Handle, 'open', 'explorer.exe',
    pChar('/select,"' + sFullPath +'"'), nil, SW_SHOWNORMAL);
end;

procedure TMainForm.popCopyPathClick(Sender: TObject);
var
  sel : TGridRect;
  sFullPath : string;
begin
  sel := StringGrid1.Selection;
  sFullPath :=  PSourceFileRec(fFileList.Objects[sel.Top]).FullPath;
  ClipBoard.AsText := format('"%s"', [sFullPath])
end;

procedure TMainForm.popExtractClick(Sender: TObject);
begin
  fExtract := true;
  btnBuildClick(nil);
end;

procedure TMainForm.popSplitClick(Sender: TObject);
begin
  fAltShift := true;
  PageControl1.ActivePage := tsSplit;
  btnSrcSplitClick(nil);
end;

procedure TMainForm.popMarkClick(Sender: TObject);
begin
  fAltShift := true;
  PageControl1.ActivePage := tsBackground;
  btnSrcBackgroundClick(nil);
end;

procedure TMainForm.popRotateClick(Sender: TObject);
begin
  fAltShift := true;
  PageControl1.ActivePage := tsRotate;
  btnSrcRotateClick(nil);
end;

procedure TMainForm.popToolsClick(Sender: TObject);
begin
  fAltShift := true;
  PageControl1.ActivePage := tsTools;
  btnSrcToolsClick(nil);
end;

procedure TMainForm.popPropertiesClick(Sender: TObject);
var
  sel : TGridRect;
  sFullPath : string;
  Info : TShellExecuteInfo;
begin
  sel := StringGrid1.Selection;
  sFullPath :=  PSourceFileRec(fFileList.Objects[sel.Top]).FullPath;
  with Info do
  begin
    cbSize := SizeOf(Info);
    fMask := SEE_MASK_NOCLOSEPROCESS or
             SEE_MASK_INVOKEIDLIST or
             SEE_MASK_FLAG_NO_UI;
    wnd  := Application.Handle;
    lpVerb := 'properties';
    lpFile := pChar(sFullPath);
    lpParameters := nil;
    lpDirectory := nil;
    nShow := 0;
    hInstApp := 0;
    lpIDList := nil;
  end;
  ShellExecuteEx(@Info);
  //ShellExecute(Application.Handle, 'Properties', pChar(sFullPath),'','',SW_SHOWNORMAL);
  //ShellExecute(Application.Handle, 'open', 'explorer.exe',
  //  pChar('/select,"' + sFullPath +'"'), nil, SW_SHOWNORMAL);
end;


//------------------------------------------------------------------------------
//          TMainForm tsSplit (Split File) Methods
//------------------------------------------------------------------------------

procedure TMainForm.cbSrcSplitClick(Sender: TObject);
var
  sfullpath, sfilename, spagecount : string;
  row, w : integer;
begin
  if cbSrcSplit.Checked then
    begin
      if fFileList.Count < 1 then
        begin
          lblSelectedSplit.Caption := '';
          exit
        end;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      sfilename := extractFilename(sfullpath);
      spagecount := inttostr(PSourceFileRec(fFileList.Objects[row]).PageCount);
      if spagecount = '-1' then spagecount := '?';
      sfilename := sfilename + ' (' + spagecount + ', ' +
        inttostr(row + 1) + '/' + inttostr(fFileList.Count) +')';
      w := lblSelectedSplit.Width - 40;
      lblSelectedSplit.Caption := TruncateString(sfilename, 36, w);
    end
  else
    begin
      lblSelectedSplit.Caption := '';
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSrcSplitClick(Sender: TObject);
var
  sel : TGridRect;
  s, sfullpath, sfilename, sfullpath2, sfilename2, spagecount2 : string;
  pagecount, row, w : integer;
begin
  if fPipe then
    begin
      fPipe := false;
      sfullpath := fPipeFullpath;
    end
  else if fPaste then
    begin
      if fDropFile <> '' then sfullpath:= fDropFile
        else sfullpath := Clipboard.AsText;
      fPaste := false; fDropFile := '';
      w := length(sfullpath);
      if w < 7 then exit;
      sfullpath := copy(sfullpath,2,w-2);
      if (extractFileExt(sfullpath) <> '.pdf') then exit;
      if (NOT FileExists(sfullpath)) then exit;
    end
  else if (fFileList.Count = 0) and fAltShift then
    begin
      fAltShift := false;
      exit;
    end
  else if (fFileList.Count > 0) and fAltShift then
    begin
      fAltShift := false;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
    end
  else if (fFileList.Count > 0) and cbSrcSplit.Checked then
    begin
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      if row < (fFileList.Count -1) then
        begin
        sel := StringGrid1.Selection;
        inc(sel.Top);
        inc(sel.Bottom);
        RefreshGrid(row+1);
        StringGrid1.Selection := sel;
        sfullpath2 := PSourceFileRec(fFileList.Objects[row+1]).FullPath;
        sfilename2 := extractFilename(sfullpath2);
        spagecount2 := inttostr(PSourceFileRec(fFileList.Objects[row+1]).PageCount);
        if spagecount2 = '-1' then spagecount2 := '?';
        sfilename2 := sfilename2 + ', (' + spagecount2 + ', ' +
          inttostr(row + 2) + '/' + inttostr(fFileList.Count) +')';
        w := lblSelectedSplit.Width - 40;
        lblSelectedSplit.Caption := TruncateString(sfilename2, 36, w);
        end;
    end
  else
    begin
      if (fFilelist.Count = 0) and cbSrcSplit.Checked then
        begin
           lblSrcSplitFilename.Caption := '';
           // cbSrcSplit.Checked := false;
        end;
      OpenDialog1.Options := OpenDialog1.Options - [ofAllowMultiSelect];
      if not OpenDialog1.Execute then exit;
      sfullpath := OpenDialog1.FileName
    end;
  btnSplitView.Enabled := true;
  fSplitSrc := sfullpath;
  fSplitFolder := extractFileDir(sfullpath);
  lblSplitFolder.Caption := fSplitFolder;
  sfilename := extractFilename(sfullpath);
  pagecount :=GetPdfPageCount(sfullpath);
  if pagecount < 1 then
    begin
    btnSrcSplit.Enabled := false;
    btnSplitView.Enabled := false;
    pagecount := GetRepairedPageCount(sfullpath);
    btnSplitView.Enabled := true;
    btnSrcSplit.Enabled := true;
    end;
  if pagecount < 1 then
    begin
    s := format('%s (?)', [sfilename]);
    pagecount := 1;
    end
  else
    s := format ('%s (%d)', [sfilename, pagecount]);
  fSplitSrcPageCount := pagecount;
  w := LblSrcSplitFilename.Width - 40;
  lblSrcSplitFilename.Caption := TruncateString(s, 36, w);
  eSplitPagesFrom.Text := '1';
  eSplitPagesTo.Text := IntToStr(fSplitSrcPageCount);
  eSplitChunkSize.Text := '1';
  fSplitChunkSize := 1;
  btnSplitFolder.Enabled := true;
  btnSplitViewFolder.Enabled := true;
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSplitViewClick(Sender: TObject);
var
  s: string;
begin
  s := fSplitSrc;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSplitResetClick(Sender: TObject);
begin
  btnSrcSplit.SetFocus;
  fSplitSrc := '';
  fSplitSrcPageCount := 0;
  lblSrcSplitFilename.Caption := '';
  btnSplitView.Enabled := false;
  cbSrcSplit.Checked := false;
  eSplitPagesFrom.Text := '';
  eSplitPagesTo.Text := '';
  eSplitChunkSize.Text := '';
  fSplitChunkSize := 1;
  lblSplitFolder.Caption := '';
  fSplitFolder := '';
  btnSplitFolder.Enabled := false;
  btnSplitViewFolder.Enabled := false;
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSplitFolderClick(Sender: TObject);
var
  dir : string;
begin
  dir := fSplitFolder;
  if SelectDirectory(dir,[sdAllowCreate,sdPerformCreate,sdPrompt],0) then
    begin
      fSplitFolder := dir;
      lblSplitFolder.Caption := fSplitFolder;
    end
  else exit;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSplitViewFolderClick(Sender: TObject);
var
  s : string;
begin
  s := fSplitFolder;
  if s<>'' then ShellExecute(0, PChar('explore'), PChar(s), Nil, Nil, SW_NORMAL);
end;

//------------------------------------------------------------------------------

procedure TMainForm.eSplitPagesFromChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fSplitSrcPageCount);
  if (eSplitPagesTo.Text <> '') then OkVal := okVal and (val <= fSplitPagesTo);
  fSplitPagesFrom := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = 1 then edit.Font.Color := clBlack;

  if (eSplitPagesTo.Text <> '') then
  begin
  if ((fSplitPagesTo <= fSplitSrcPageCount) and (fSplitPagesFrom <= fSplitPagesTo)) then
    eSplitPagesTo.Font.Color := clBlack;
  end;

  btnBuild.Enabled := (fSplitSrc <> '') and
    (eSplitPagesFrom.Font.Color = clBlack) and (eSplitPagesTo.Font.Color = clBlack) and
    ((eSplitChunkSize.Font.Color = clBlack) or cbSplitOddEven.Checked);
end;

procedure TMainForm.eSplitPagesToChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fSplitSrcPageCount);
  OkVal := okVal and (val >= fSplitPagesFrom);
  fSplitPagesTo := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = fSplitSrcPageCount then edit.Font.Color := clBlack;
  if ((fSplitPagesFrom >= 1) and (fSplitPagesTo >= fSplitPagesFrom)) then
    eSplitPagesFrom.Font.Color := clBlack;
  btnBuild.Enabled := (fSplitSrc <> '') and
    (eSplitPagesFrom.Font.Color = clBlack) and (eSplitPagesTo.Font.Color = clBlack) and
    ((eSplitChunkSize.Font.Color = clBlack) or cbSplitOddEven.Checked);
end;

procedure TMainForm.eSplitChunkSizeChange(Sender: TObject);
var
  val: integer;
begin
  val := StrToIntDef(eSplitChunkSize.Text, -1);
  if (val > 0) and (val <= fSplitSrcPageCount) then
    eSplitChunkSize.Font.Color := clBlack else eSplitChunkSize.Font.Color := clRed;
  if (eSplitChunkSize.Font.Color = clBlack) then fSplitChunkSize := val;
  btnBuild.Enabled := (fSplitSrc <> '') and
    (eSplitPagesFrom.Font.Color = clBlack) and (eSplitPagesTo.Font.Color = clBlack) and
    ((eSplitChunkSize.Font.Color = clBlack) or cbSplitOddEven.Checked);
end;

procedure TMainForm.cbSplitOddEvenClick(Sender: TObject);
begin
  btnBuild.Enabled := (fSplitSrc <> '') and
    (eSplitPagesFrom.Font.Color = clBlack) and (eSplitPagesTo.Font.Color = clBlack) and
    ((eSplitChunkSize.Font.Color = clBlack) or cbSplitOddEven.Checked);
end;

//------------------------------------------------------------------------------
//          TMainForm tsBackground (Mark Pages) Methods
//------------------------------------------------------------------------------

procedure TMainForm.cbSrcBackgroundClick(Sender: TObject);
var
  sfullpath, sfilename, spagecount : string;
  row, w : integer;
begin
  if cbSrcBackground.Checked then
    begin
      if fFileList.Count < 1 then
        begin
          lblSelectedBackground.Caption := '';
          exit
        end;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      sfilename := extractFilename(sfullpath);
      spagecount := inttostr(PSourceFileRec(fFileList.Objects[row]).PageCount);
      if spagecount = '-1' then spagecount := '?';
      sfilename := sfilename + ' (' + spagecount + ', ' +
        inttostr(row + 1) + '/' + inttostr(fFileList.Count) +')';
      w := lblSelectedBackground.Width - 40;
      lblSelectedBackground.Caption := TruncateString(sfilename, 36, w);
    end
  else
    begin
      lblSelectedBackground.Caption := '';
    end;
end;

//-----------------------------------------------------------------------------

procedure TMainForm.btnSrcBackgroundClick(Sender: TObject);
var
  sel : TGridRect;
  s, sfullpath, sfilename, sfullpath2, sfilename2, spagecount2 : string;
  pagecount, row, w : integer;
begin
  if fPipe then
    begin
      fPipe := false;
      sfullpath := fPipeFullpath;
    end
  else if fPaste then
    begin
      if fDropFile <> '' then sfullpath:= fDropFile
        else sfullpath := Clipboard.AsText;
      fPaste := false; fDropFile := '';
      w := length(sfullpath);
      if w < 7 then exit;
      sfullpath := copy(sfullpath,2,w-2);
      if (extractFileExt(sfullpath) <> '.pdf') then exit;
      if (NOT FileExists(sfullpath)) then exit;
    end
  else if (fFileList.Count = 0) and fAltShift then
    begin
      fAltShift := false;
      exit;
    end
  else if (fFileList.Count > 0) and fAltShift then
    begin
      fAltShift := false;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
    end
  else if (fFileList.Count > 0) and cbSrcBackground.Checked then
    begin
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      if row < (fFileList.Count -1) then
        begin
        sel := StringGrid1.Selection;
        inc(sel.Top);
        inc(sel.Bottom);
        RefreshGrid(row+1);
        StringGrid1.Selection := sel;
        sfullpath2 := PSourceFileRec(fFileList.Objects[row+1]).FullPath;
        sfilename2 := extractFilename(sfullpath2);
        spagecount2 := inttostr(PSourceFileRec(fFileList.Objects[row+1]).PageCount);
        if spagecount2 = '-1' then spagecount2 := '?';
        sfilename2 := sfilename2 + ' (' + spagecount2 + ', ' +
          inttostr(row + 2) + '/' + inttostr(fFileList.Count) +')';
        w := lblSelectedBackground.Width - 40;
        lblSelectedBackground.Caption := TruncateString(sfilename2, 36, w);
        end;
    end
  else
    begin
      if (fFilelist.Count = 0) and cbSrcBackground.Checked then
        begin
           lblSource_background_filename.Caption := '';
           cbSrcBackground.Checked := false;
        end;
      OpenDialog1.Options := OpenDialog1.Options - [ofAllowMultiSelect];
      if not OpenDialog1.Execute then exit;
      sfullpath := OpenDialog1.FileName
    end;
  fSrcBackground := sfullpath;
  btnBackgroundView.Enabled := true;
  sfilename := extractFilename(sfullpath);
  pagecount :=GetPdfPageCount(sfullpath);
  if pagecount < 1 then
    begin
    btnSrcBackground.enabled := false;
    btnBackgroundView.enabled := false;
    pagecount := GetRepairedPageCount(sfullpath);
    btnBackgroundView.enabled := true;
    btnSrcBackground.enabled := true;
    end;

  if pagecount <1 then
    s := format('%s (?)', [sfilename])
  else
    s := format ('%s (%d)', [sfilename, pagecount]);
  w := lblSource_background_filename.Width - 40;
  lblSource_background_filename.Caption := TruncateString(s, 36, w);
  if pagecount < 1 then fSrcBackgroundPageCount := 1
    else fSrcBackgroundPageCount := pagecount;
  eNumPagesFrom.Text := '1';
  eNumPagesTo.Text := IntToStr(fSrcBackgroundPageCount);
  eNumStart.Text := '1';
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnBackgroundViewClick(Sender: TObject);
var
  s: string;
begin
  s := fSrcBackground;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnBackgroundResetClick(Sender: TObject);
begin
  btnSrcBackground.SetFocus;
  fSrcBackground := '';
  lblSource_background_filename.Caption := '';
  fSrcBackgroundPageCount := 1;
  btnBackgroundView.Enabled := false;
  cbSrcBackground.Checked := false;
  eNumPagesFrom.Text := '';
  eNumPagesTo.Text := '';
  eNumStart.Text := '';
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopySrcBackgroundFromClick(Sender: TObject);
begin
  fPaste := true;
  if PageControl1.ActivePage = tsSplit then
    begin
      btnSrcSplitClick(nil);
    end
  else if PageControl1.ActivePage = tsBackground then
    begin
      btnSrcBackgroundClick(nil);
    end
  else if PageControl1.ActivePage = tsRotate then
    begin
      btnSrcRotateClick(nil);
    end
  else if PageControl1.ActivePage = tsTools then
    begin
      btnSrcToolsClick(nil);
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopySrcBackgroundToClick(Sender: TObject);
var
  k: integer;
  sExt: string;
begin
  if PageControl1.ActivePage = tsSplit then ClipBoard.AsText := format('"%s"', [fSplitSrc])
  else if PageControl1.ActivePage = tsBackground then ClipBoard.AsText := format('"%s"', [fSrcBackground])
  else if PageControl1.ActivePage = tsRotate then ClipBoard.AsText := format('"%s"', [fSrcRotate])
  else if PageControl1.ActivePage = tsTools then
    begin
    if ((GetKeyState(VK_SHIFT) < 0) AND (btnAdvancedTemplate.Caption = 'T1')) then
      begin
        // Determine number of digits (2, 3 or 4) in page number suffix
        k := Length(IntToStr(fToolsPageCount));
        if ((fToolsPageCount < 1) or (k > 4)) then exit;
        sExt := '_%02d.pdf';
        if k = 3 then sExt := '_%03d.pdf'
        else if k = 4 then sExt := '_%04d.pdf';
        ClipBoard.AsText := format('"%s"', [ChangeFileExt(extractFileName(fSrcTools), sExt)]);
      end
    else ClipBoard.AsText := format('"%s"', [fSrcTools]);
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.rbPageNumberClick(Sender: TObject);
begin
  if rbPageNumber.Checked then
  begin
    // Number pages
    btnBackground.Caption := 'Background or Stamp PDF File ...';
    btnBackground.Visible := false;
    lblBackgroundFilename.Visible := false;
    btnBackgroundResetStamp.Visible := false;
    btnBackgroundViewStamp.Visible :=false;
    btnCopyBackgroundFrom.Visible := false;
    btnCopyBackgroundTo.Visible := false;
    cbPageOneOnly.Caption := 'Skip first pa&ge';
    // cbPageOneOnly.Checked := false;
    cbMirror.Visible := true;
    // cbMirror.Checked := false;
    comboPageNumber.Visible := true;
    if fNumOptions then
    begin
      lblNumOptions.Visible := true;
      eNumPagesTo.Visible := true;
      eNumPagesFrom.Visible := true;
      lblNumTo.Visible := true;
      eNumStart.Visible := true;
      eNumPrefix.Visible := true;
      btnNumPortrait.Visible := true;
      lblNumHint.Visible := true
    end;
    btnNumOptions.Visible := true
  end else if rbBackground.Checked then
  begin
    // Background
    btnBackground.Caption := 'Background P&DF File ...';
    btnBackground.Visible := true;
    lblBackgroundFilename.Visible := true;
    btnBackgroundResetStamp.Visible := true;
    btnBackgroundViewStamp.Visible := true;
    btnCopyBackgroundFrom.Visible := true;
    btnCopyBackgroundTo.Visible := true;
    cbPageOneOnly.Caption := 'Background first pa&ge only';
    // cbPageOneOnly.Checked := false;
    cbMirror.Visible := false;
    comboPageNumber.Visible := false;
    btnNumOptions.Visible := false;
    lblNumOptions.Visible := false;
    eNumPagesTo.Visible := false;
    eNumPagesFrom.Visible := false;
    lblNumTo.Visible := false;
    eNumStart.Visible := false;
    eNumPrefix.Visible := false;
    btnNumPortrait.Visible := false;
    lblNumHint.Visible := false
   end else
  begin
    // Stamp
    btnBackground.Caption := 'Stamp P&DF File ...';
    btnBackground.Visible := true;
    lblBackgroundFilename.Visible := true;
    btnBackgroundResetStamp.Visible := true;
    btnBackgroundViewStamp.Visible := true;
    btnCopyBackgroundFrom.Visible := true;
    btnCopyBackgroundTo.Visible := true;
    cbPageOneOnly.Caption := 'Stamp first pa&ge only';
    // cbPageOneOnly.Checked := false;
    cbMirror.Visible := false;
    comboPageNumber.Visible := false;
    btnNumOptions.Visible := false;
    lblNumOptions.Visible := false;
    eNumPagesTo.Visible := false;
    eNumPagesFrom.Visible := false;
    lblNumTo.Visible := false;
    eNumStart.Visible := false;
    eNumPrefix.Visible := false;
    btnNumPortrait.Visible := false;
    lblNumHint.Visible := false
  end;
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnBackgroundClick(Sender: TObject);
var
  s, sfullpath, sfilename : string;
  pagecount, w : integer;
begin
  if fPaste then
  begin
    if fDropFile <> '' then sfullpath:= fDropFile
      else sfullpath := Clipboard.AsText;
    fPaste := false; fDropFile := '';
    w := length(sfullpath);
    if w < 7 then exit;
    sfullpath := copy(sfullpath,2, w-2);
    if (extractFileExt(sfullpath) <> '.pdf') then exit;
    if (NOT FileExists(sfullpath)) then exit;
  end else
  begin
    OpenDialog1.Options := OpenDialog1.Options - [ofAllowMultiSelect];
    if not OpenDialog1.Execute then exit;
    fBackground := OpenDialog1.FileName;
    sfullpath := OpenDialog1.FileName;
  end;
  fBackground := sfullpath;
  btnBackgroundViewStamp.Enabled := true;
  sfilename := extractFilename(sfullpath);
  pagecount :=GetPdfPageCount(sfullpath);
  if pagecount < 1 then pagecount := GetRepairedPageCount(sfullpath);
  if pagecount <1 then
    s := format('%s (?)', [sfilename])
  else
    s := format ('%s (%d)', [sfilename, pagecount]);
  w := lblBackgroundFilename.Width - 40;
  lblBackgroundFilename.Caption := TruncateString(s, 36, w);
  if pagecount < 2 then fBackgroundPageCount := 1
    else fBackgroundPageCount := pagecount;
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnBackgroundResetStampClick(Sender: TObject);
begin
  btnBackground.SetFocus;
  fBackground := '';
  lblBackgroundFilename.Caption := '';
  fBackgroundPageCount := 1;
  btnBackgroundViewStamp.Enabled := false;
  UpdateButtonsAndMenus(0);
end;

//-----------------------------------------------------------------------------

procedure TMainForm.btnBackgroundViewStampClick(Sender: TObject);
var
  s: string;
begin
  s := fBackground;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopyBackgroundFromClick(Sender: TObject);
begin
  fpaste := true;
  btnBackgroundClick(nil);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopyBackgroundToClick(Sender: TObject);
begin
  ClipBoard.AsText := format('"%s"', [fBackground])
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnNumPortraitClick(Sender: TObject);
begin
  fNumPortrait := not fNumPortrait;
  if not fNumPortrait then btnNumPortrait.Caption := 'L'
    else btnNumPortrait.Caption := 'P';
  comboPageNumberChange(nil);
end;

//------------------------------------------------------------------------------

procedure TMainForm.comboPageNumberChange(Sender: TObject);
begin
  // ComboIndex = 0-5 Top Left, Center, Right; Bottom Left, Center, Right
  // Swap page width (PageSize.cx) and height (PageSize.cy) if page orientation
  // changed from portrait (normal) orientation to landscape.

  // If page orientation not Portrait (i.e., Landscape) swap x and y page sizes
  if not fNumPortrait then
  begin
    NumPageSize.cx := fNumPageSize.cy;
    NumPageSize.cy := fNumPageSize.cx;
  end else
  begin
    NumPageSize.cx := fNumPageSize.cx;
    NumPageSize.cy := fNumPageSize.cy;
  end;

  case comboPageNumber.ItemIndex of
  0:  begin
      // Top-Left
      NumOffset.cx := fNumOffset.cx;
      NumOffset.cy := NumPageSize.cy - fNumOffset.cy;
      end;
  1:  begin
      // Top-Center
      NumOffset.cx := NumPageSize.cx DIV 2;
      NumOffset.cy := NumPageSize.cy - fNumOffset.cy;
       end;
  2:  begin
      // Top-Right
      NumOffset.cx := NumPageSize.cx - fNumOffset.cx;
      NumOffset.cy := NumPageSize.cy - fNumOffset.cy;
      end;
  3:  begin
      // Bottom-Left
      NumOffset.cx := fNumOffset.cx;
      NumOffset.cy := fNumOffset.cy - fNumSize;
      end;
  4:  begin
      // Bottom-Center
      NumOffset.cx := NumPageSize.cx DIV 2;
      NumOffset.cy := fNumOffset.cy - fNumSize;
      end;
  5:  begin
      // Bottom-Right
      NumOffset.cx := NumPageSize.cx - fNumOffset.cx;
      NumOffset.cy := fNumOffset.cy - fNumSize;
      end;
    end;

  ComboPageNumber.Text := comboPageNumber.items[comboPageNumber.ItemIndex];
  if PageControl1.ActivePage = tsBackground then rbPageNumber.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnNumOptionsClick(Sender: TObject);
begin
  if fNumOptions then
  begin
    lblNumOptions.Visible := false;
    eNumPagesTo.Visible := false;
    eNumPagesFrom.Visible := false;
    lblNumTo.Visible := false;
    eNumStart.Visible := false;
    eNumPrefix.Visible := false;
    btnNumPortrait.Visible := false;
    lblNumHint.Visible := false;
    btnNumOptions.Caption := '+'
  end else
  begin
    lblNumOptions.Visible := true;
    eNumPagesTo.Visible := true;
    eNumPagesFrom.Visible := true;
    lblNumTo.Visible := true;
    eNumStart.Visible := true;
    eNumPrefix.Visible := true;
    btnNumPortrait.Visible := true;
    lblNumHint.Visible := true;
    btnNumOptions.Caption := '-'
  end;
  fNumOptions := not fNumOptions;
end;

//------------------------------------------------------------------------------

procedure TMainForm.eNumPagesFromChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fSrcBackgroundPageCount);
  if (eNumPagesTo.Text <> '') then OkVal := okVal and (val <= fNumPagesTo);
  fNumPagesFrom := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = 1 then edit.Font.Color := clBlack;

  if (eNumPagesTo.Text <> '') then
  begin
  if ((fNumPagesTo <= fSrcBackgroundPageCount) and (fNumPagesFrom <= fNumPagesTo)) then
    eNumPagesTo.Font.Color := clBlack;
  end;

  // Update the default Starting Number to the updated number of the From page
  if (eNumPagesFrom.Font.Color = clBlack) then
  begin
    eNumStart.Font.Color := clBlack;
    eNumStart.Text := edit.Text;
    fNumStart := fNumPagesFrom;
  end;

  btnBuild.Enabled := (fSrcBackground <> '') and (eNumStart.Font.Color = clBlack) and
    (eNumPagesFrom.Font.Color = clBlack) and (eNumPagesTo.Font.Color = clBlack);
end;

procedure TMainForm.eNumPagesToChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fSrcBackgroundPageCount);
  OkVal := okVal and (val >= fNumPagesFrom);
  fNumPagesTo := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = fSrcBackgroundPageCount then edit.Font.Color := clBlack;
  if ((fNumPagesFrom >= 1) and (fNumPagesTo >= fNumPagesFrom)) then
    eNumPagesFrom.Font.Color := clBlack;
  btnBuild.Enabled := (fSrcBackground <> '') and (eNumStart.Font.Color = clBlack) and
    (eNumPagesFrom.Font.Color = clBlack) and (eNumPagesTo.Font.Color = clBlack);
end;

procedure TMainForm.eNumStartChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= 9999);
  fNumStart := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  btnBuild.Enabled := (fSrcBackground <> '') and (eNumStart.Font.Color = clBlack) and
    (eNumPagesFrom.Font.Color = clBlack) and (eNumPagesTo.Font.Color = clBlack);
end;


//------------------------------------------------------------------------------
//          TMainForm tsRotate (Rotate Pages) Methods
//------------------------------------------------------------------------------

procedure TMainForm.cbSrcRotateClick(Sender: TObject);
var
  sfullpath, sfilename, spagecount : string;
  row, w : integer;
begin
  if cbSrcRotate.Checked then
    begin
      if fFileList.Count < 1 then
        begin
          lblSelectedRotate.Caption := '';
          exit
        end;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      sfilename := extractFilename(sfullpath);
      spagecount := inttostr(PSourceFileRec(fFileList.Objects[row]).PageCount);
      if spagecount = '-1' then spagecount := '?';
      sfilename := sfilename + ' (' + spagecount + ', ' +
        inttostr(row + 1) + '/' + inttostr(fFileList.Count) +')';
      w := lblSelectedRotate.Width - 40;
      lblSelectedRotate.Caption := TruncateString(sfilename, 36, w);
    end
  else
    begin
      lblSelectedRotate.Caption := '';
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSrcRotateClick(Sender: TObject);
var
  sel : TGridRect;
  s, sfullpath, sfilename, sfullpath2, sfilename2, spagecount2 : string;
  row, w : integer;
begin
  if fPipe then
    begin
      fPipe := false;
      sfullpath := fPipeFullpath;
    end
  else if fPaste then
    begin
      if fDropFile <> '' then sfullpath:= fDropFile
        else sfullpath := Clipboard.AsText;
      fPaste := false; fDropFile := '';
      w := length(sfullpath);
      if w < 7 then exit;
      sfullpath := copy(sfullpath,2,w-2);
      if (extractFileExt(sfullpath) <> '.pdf') then exit;
      if (NOT FileExists(sfullpath)) then exit;
    end
  else if (fFileList.Count = 0) and fAltShift then
    begin
      fAltShift := false;
      exit;
    end
  else if (fFileList.Count > 0) and fAltShift then
    begin
      fAltShift := false;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
    end
  else if (fFileList.Count > 0) and cbSrcRotate.Checked then
    begin
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      if row < (fFileList.Count -1) then
        begin
          sel := StringGrid1.Selection;
          inc(sel.Top);
          inc(sel.Bottom);
          RefreshGrid(row+1);
          StringGrid1.Selection := sel;
          sfullpath2 := PSourceFileRec(fFileList.Objects[row+1]).FullPath;
          sfilename2 := extractFilename(sfullpath2);
          spagecount2 := inttostr(PSourceFileRec(fFileList.Objects[row+1]).PageCount);
          if spagecount2 = '-1' then spagecount2 := '?';
          sfilename2 := sfilename2 + ' (' + spagecount2 + ', ' +
            inttostr(row + 2) + '/' + inttostr(fFileList.Count) +')';
          w := lblSelectedRotate.Width - 40;
          lblSelectedRotate.Caption := TruncateString(sfilename2, 36, w);
        end;
    end
  else
    begin
      if (fFilelist.Count = 0) and cbSrcRotate.Checked then
        begin
           lblSrcRotateFilename.Caption := '';
           cbSrcRotate.Checked := false;
        end;
      OpenDialog1.Options := OpenDialog1.Options - [ofAllowMultiSelect];
      if not OpenDialog1.Execute then exit;
      sfullpath := OpenDialog1.FileName
    end;
  btnRotateView.Enabled := true;
  fSrcRotate := sfullpath;
  sfilename := extractFilename(sfullpath);
  fRotatePageCnt := GetPdfPageCount(sfullpath);
  if fRotatePageCnt < 1 then
    begin
      btnSrcRotate.enabled := false;
      btnRotateView.enabled := false;
      fRotatePageCnt := GetRepairedPageCount(sfullpath);
      btnRotateView.enabled := true;
      btnSrcRotate.Enabled := true;
     end;
  eRotPages.Text := '1-' + IntToStr(fRotatePageCnt);
  eRotPagesFrom.Text := '1';
  eRotPagesTo.Text := IntToStr(fRotatePageCnt);
  fRotPagesFrom := 1;
  fRotPagesTo := fRotatePageCnt;
  if fRotatePageCnt <1 then
    s := format('%s (?)', [sfilename])
  else
    s := format ('%s (%d)', [sfilename, FRotatePageCnt]);
  w := lblSrcRotateFilename.Width - 40;
  lblSrcRotateFilename.Caption := TruncateString(s, 36, w);
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnRotateResetClick(Sender: TObject);
begin
  btnSrcRotate.SetFocus;
  fSrcRotate := '';
  lblSrcRotateFilename.Caption := '';
  btnRotateView.Enabled := false;
  rbRotRight.Checked := true;
  cbSrcRotate.Checked := false;
  eRotPages.Text := '';
  eRotPagesFrom.Text := '';
  eRotPagesTo.Text := '';
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnRotateViewClick(Sender: TObject);
var
  s: string;
begin
  s := fSrcRotate;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

// FmtOrderedPagesString() tidies up (formats) page ranges ready for pdftk.exe so that
// each range is separated by a space and finishes with a space and
// eg - Input: "1, 3-6,19, 21 - 28" Output: "1 3-6 19 21-28 "
// DIFFERS from the unordered FmtPagesString() function for tsCollate as follows
// requires page ranges be in increasing order, no duplication of pages or reverse order allowed
// can return the complement pages string to support deleting list of pages (complement = retained page ranges)
// can append rotation to each page range in the list for use with pdftk v2 rotate command

function TMainForm.FmtOrderedPagesString(PagesStr: string; const maxPageNum : integer;
out IsValid: boolean; const fileMarker: string = ''; const complementPages: boolean = false; const pageRotation : string = 'right'): string;
var
  i, len, numval, prevEndNum: integer;
  rngeStrt, rngeEnd, num, complementPagesStr: string;
  getnumber: boolean;

  procedure SkipSpaces;
  begin
    while (i <= len) and (PagesStr[i] = ' ') do inc(i);
  end;

begin
  IsValid := false;
  result := ''; complementPagesStr := '';
  len := length(PagesStr);
  i := 1; prevEndNum := 0;
  while i <= len do
  begin
    SkipSpaces;
    if (i > len) then break;
    num := '';
    while (i <= len) and CharInSet(PagesStr[i], ['0'..'9']) do
    begin
      num := num + PagesStr[i];
      inc(i);
    end;
    getnumber := num <> '';
    if getnumber then numval := strtoint(num);
    if getnumber then getnumber := (numval <= maxPageNum) and (numval > prevEndNum);
    if not getnumber then exit;
    if numval > (prevEndNum + 1) then complementPagesStr := complementPagesStr + fileMarker + inttostr(prevEndNum+1);
    if numval > (prevEndNum + 2) then complementPagesStr := complementPagesStr + '-' + inttostr(numval-1);
    if numval > (prevEndNum + 1) then complementPagesStr := complementPagesStr + ' ';
    rngeStrt := num; prevEndNum := numval;

    // if not GetNumber(rngeStrt) then exit;

    SkipSpaces;
    if (i <= len) and (PagesStr[i] = '-') then
    begin
      inc(i);
      SkipSpaces;

      num := '';
      while (i <= len) and CharInSet(PagesStr[i], ['0'..'9']) do
      begin
        num := num + PagesStr[i];
        inc(i);
      end;
      getnumber := num <> '';
      if getnumber then numval := strtoint(num);
      if getnumber then getnumber := (numval <= maxPageNum) and (numval >= prevEndNum);
      if not getnumber then exit;
      rngeEnd := num; prevEndNum := numval;

      // if not GetNumber(rngeEnd) then exit;

      SkipSpaces;
      result := result + fileMarker + rngeStrt + '-' + rngeEnd + pageRotation + ' ';
    end
    else
      result := result + fileMarker + rngeStrt + pageRotation + ' ';

    if (i > len) then break
    else if CharInSet(PagesStr[i], [',',';',':']) then
    begin
      inc(i);
      continue;
    end else
      exit;
  end;
  if result = '' then result := ' ';
  IsValid := true;

  if numval < maxPageNum then complementPagesStr := complementPagesStr + fileMarker + inttostr(prevEndNum+1);
  if numval < (maxPageNum - 1) then complementPagesStr := complementPagesStr + '-' + inttostr(maxPageNum);
  if numval < maxPageNum then complementPagesStr := complementPagesStr + ' ';
  if complementPagesStr = '' then complementPagesStr := ' ';
  if complementPages then result := complementPagesStr;

end;

//------------------------------------------------------------------------------

procedure TMainForm.eRotPagesChange(Sender: TObject);
var
  isValidPageRange: boolean;
begin
  if not eRotPages.Focused then exit;
  if fRotatePageCnt < 0 then exit;
  FmtOrderedPagesString(eRotPages.Text, fRotatePageCnt, isValidPageRange, '', false, '');
  if isValidPageRange then
    eRotPages.Font.Color := clBlack else
    eRotPages.Font.Color := clRed;
  btnBuild.Enabled := (fSrcRotate <> '') and (eRotPages.Font.Color = clBlack);
end;

//------------------------------------------------------------------------------

procedure TMainForm.eRotPagesFromChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fRotatePageCnt);
  if (eRotPagesTo.Text <> '') then OkVal := okVal and (val <= fRotPagesTo);
  fRotPagesFrom := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = 1 then edit.Font.Color := clBlack;

  if (eRotPagesTo.Text <> '') then
  begin
  if ((fRotPagesTo <= fRotatePageCnt) and (fRotPagesFrom <= fRotPagesTo)) then
    eRotPagesTo.Font.Color := clBlack
  end;

  btnBuild.Enabled := (fSrcRotate <> '') and
    (eRotPagesFrom.Font.Color = clBlack) and (eRotPagesTo.Font.Color = clBlack);
end;

procedure TMainForm.eRotPagesToChange(Sender: TObject);
var
  val: integer;
  edit: TEdit;
  OkVal: boolean;
begin
  edit := TEdit(Sender);
  val := StrToIntDef(Edit.Text, -1);
  OkVal := (val > 0) and (val <= fRotatePageCnt);
  OkVal := okVal and (val >= fRotPagesFrom);
  fRotPagesTo := val;
  if OkVal then
    edit.Font.Color := clBlack else
    edit.Font.Color := clRed;
  if val = fRotatePageCnt then edit.Font.Color := clBlack;
  if ((fRotPagesFrom >= 1) and (fRotPagesTo >= fRotPagesFrom)) then
    eRotPagesFrom.Font.Color := clBlack;
  btnBuild.Enabled := (fSrcRotate <> '') and
    (eRotPagesFrom.Font.Color = clBlack) and (eRotPagesTo.Font.Color = clBlack);
end;

procedure TMainForm.rbRotLeftClick(Sender: TObject);
begin
  lblRotatePages.Caption := 'Rotate pages';
  lblRotatePagesFrom.Caption := 'Rotate pages from';
end;

procedure TMainForm.rbRotRightClick(Sender: TObject);
begin
  lblRotatePages.Caption := 'Rotate pages';
  lblRotatePagesFrom.Caption := 'Rotate pages from';
end;

procedure TMainForm.rbRotateDownClick(Sender: TObject);
begin
  lblRotatePages.Caption := 'Rotate pages';
  lblRotatePagesFrom.Caption := 'Rotate pages from';
end;

procedure TMainForm.rbRotExtractClick(Sender: TObject);
begin
  lblRotatePages.Caption := 'Extract pages';
  lblRotatePagesFrom.Caption := 'Extract pages from';
end;

procedure TMainForm.rbRotDeleteClick(Sender: TObject);
begin
  lblRotatePages.Caption := 'Delete pages';
  lblRotatePagesFrom.Caption := 'Delete pages from';
end;

//------------------------------------------------------------------------------
//          TMainForm tsTools (Tool Sets) Methods
//------------------------------------------------------------------------------

procedure TMainForm.cbSrcToolsClick(Sender: TObject);
var
  sfullpath, sfilename, spagecount : string;
  row, w : integer;
begin
  if cbSrcTools.Checked then
    begin
      if fFileList.Count < 1 then
        begin
          lblSelectedTools.Caption := '';
          exit
        end;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      sfilename := extractFilename(sfullpath);
      spagecount := inttostr(PSourceFileRec(fFileList.Objects[row]).PageCount);
      if spagecount = '-1' then spagecount := '?';
      sfilename := sfilename + ' (' + spagecount + ', ' +
        inttostr(row + 1) + '/' + inttostr(fFileList.Count) +')';
      w := lblSelectedTools.Width - 40;
      lblSelectedTools.Caption := TruncateString(sfilename, 36, w);
    end
  else
    begin
      lblSelectedTools.Caption := '';
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSrcToolsClick(Sender: TObject);
var
  sel : TGridRect;
  s, sfullpath, sfilename, sfullpath2, sfilename2, spagecount2 : string;
  pagecount, row, w : integer;
begin
  if fPipe then
    begin
      fPipe := false;
      sfullpath := fPipeFullpath;
    end
  else if fPaste then
    begin
      if fDropFile <> '' then sfullpath:= fDropFile
        else sfullpath := Clipboard.AsText;
      fPaste := false; fDropFile := '';
      w := length(sfullpath);
      if w < 7 then exit;
      sfullpath := copy(sfullpath,2,w-2);
      if (extractFileExt(sfullpath) <> '.pdf') then exit;
      if (NOT FileExists(sfullpath)) then exit;
    end
  else if (fFileList.Count = 0) and fAltShift then
    begin
      fAltShift := false;
      exit;
    end
  else if (fFileList.Count > 0) and fAltShift then
    begin
      fAltShift := false;
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
    end
  else if (fFileList.Count > 0) and cbSrcTools.Checked then
    begin
      row := StringGrid1.Selection.Top;
      sfullpath := PSourceFileRec(fFileList.Objects[row]).FullPath;
      if row < (fFileList.Count -1) then
        begin
        sel := StringGrid1.Selection;
        inc(sel.Top);
        inc(sel.Bottom);
        RefreshGrid(row+1);
        StringGrid1.Selection := sel;
        sfullpath2 := PSourceFileRec(fFileList.Objects[row+1]).FullPath;
        sfilename2 := extractFilename(sfullpath2);
        spagecount2 := inttostr(PSourceFileRec(fFileList.Objects[row+1]).PageCount);
        if spagecount2 = '-1' then spagecount2 := '?';
        sfilename2 := sfilename2 + ' (' + spagecount2 + ', ' +
          inttostr(row + 2) + '/' + inttostr(fFileList.Count) +')';
        w := lblSelectedTools.Width - 40;
        lblSelectedTools.Caption := TruncateString(sfilename2, 36, w);
        end;
    end
  else
    begin
      if (fFilelist.Count = 0) and cbSrcTools.Checked then
        begin
           lblSrcToolsFilename.Caption := '';
           cbSrcTools.Checked := false;
        end;
      OpenDialog1.Options := OpenDialog1.Options - [ofAllowMultiSelect];
      if not OpenDialog1.Execute then exit;
      sfullpath := OpenDialog1.FileName
    end;
  fSrcTools := sfullpath;
  fToolsFolder := extractFileDir(sfullpath);
  fUnpackFolder := fToolsFolder;
  btnToolsFile2.Enabled := true;
  btnToolsView.Enabled := true;
  sfilename := extractFilename(sfullpath);
  pagecount :=GetPdfPageCount(sfullpath);
  if pagecount < 1 then pagecount := GetRepairedPageCount(sfullpath);
  // If pagecount not found flag file for user attention
  if pagecount <1 then
    s := format('%s (?)', [sfilename])
  else
    s := format ('%s (%d)', [sfilename, pagecount]);
  w := lblSrcToolsFilename.Width - 40;
  lblSrcToolsFilename.Caption := TruncateString(s, 36, w);
  if pagecount < 1 then fToolsPageCount := 1
    else fToolsPageCount := pagecount;
  if fToolsAction = 'Compare' then btnSwapFiles.Enabled := (fSrcTools <> '') AND (fCompareFile2 <> '');
  UpdateButtonsAndMenus(0);
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnToolsResetClick(Sender: TObject);
begin
  btnSrcTools.SetFocus;
  fSrcTools := '';
  fToolsFolder := '';
  lblSrcToolsFilename.Caption := '';
  fToolsPageCount := 1;
  btnToolsView.Enabled := false;
  cbSrcTools.Checked := false;
  fUnpackFolder := fToolsFolder;
  if  (fToolsAction = 'Unpack Files') OR ((fToolsAction = 'Advanced') and (btnAdvancedTemplate.Caption = 'T1')) then
    begin
      btnToolsFile2.Enabled := false;
      btnToolsFile2Open.Enabled := false;
      lblToolsFile2Filename.Caption := fToolsFolder;
    end;
  if fToolsAction = 'Compare' then btnSwapFiles.Enabled := (fSrcTools <> '') AND (fCompareFile2 <> '');
  UpdateButtonsAndMenus(0);
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnToolsViewClick(Sender: TObject);
var
  s: string;
begin
  s := fSrcTools;
  ViewFile(s, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnRbToolsClick(Sender: TObject);
begin
  // Cycle forward thru ToolsSet 1-2-3-4, set rb button captions, restore checked state
  if fToolsSet = 1 then
    begin
    fToolsSet := 2; // fToolsIndex = 5, 6, 7, 8
    btnRbTools.Caption := '2';
    btnRbTools2.Caption := '2';
    rbTools1.Caption := '&Decrypt';
    rbTools2.Caption := 'R&epair';
    rbTools3.Caption := 'U&ncompress';
    rbTools4.Caption := '&Compress';
    fToolsIndex := fToolsIndexSet2;
    end
  else if fToolsSet = 2 then
    begin
    fToolsSet := 3; // fToolsIndex = 9, 10, 11, 12
    btnRbTools.Caption := '3';
    btnRbTools2.Caption := '3';
    rbTools1.Caption := '&Dump Fields';
    rbTools2.Caption := '&Gen FDF';
    rbTools3.Caption := 'Fill&_Form';
    rbTools4.Caption := 'Flatte&n';
    fToolsIndex := fToolsIndexSet3;
    end
  else if fToolsSet = 3 then
    begin
    fToolsSet := 4; // fToolsIndex = 13, 14, 15, 16
    btnRbTools.Caption := '4';
    btnRbTools2.Caption := '4';
    rbTools1.Caption := '&Advanced';
    rbTools2.Caption := 'Laun&ch';
    rbTools3.Caption := 'Compar&e';
    rbTools3.Enabled := (fCompareExe <> '');
    rbTools4.Caption := 'Spare';
    rbTools4.Enabled := false;
    fToolsIndex := fToolsIndexSet4;
    end
  else if fToolsSet = 4 then
    begin
    fToolsSet := 1; // fToolsIndex = 1, 2, 3, 4
    btnRbTools.Caption := '1';
    btnRbTools2.Caption := '1';
    rbTools1.Caption := '&Dump Data';
    rbTools2.Caption := 'Updat&e Info';
    rbTools3.Caption := 'Atta&ch File';
    rbTools3.Enabled := true;
    rbTools4.Caption := 'Unpac&k Files';
    rbTools4.Enabled := true;
    fToolsIndex := fToolsIndexSet1;
    end;
  case (fToolsIndex mod 4) of
    1:  begin rbTools1.Checked := true; rbTools1.SetFocus; end;
    2:  begin rbTools2.Checked := true; rbTools2.SetFocus; end;
    3:  begin rbTools3.Checked := true; rbTools3.SetFocus; end;
    0:  begin rbTools4.Checked := true; rbTools4.SetFocus; end;
  end;
  DisplayToolsSet;
end;

procedure TMainForm.btnRbTools2Click(Sender: TObject);
begin
  // Cycle in reverse thru ToolsSet 4-3-2-1 set rb button captions, restore checked state
  if fToolsSet = 1 then
    begin
    fToolsSet := 4; // fToolsIndex = 13, 14, 15, 16
    btnRbTools.Caption := '4';
    btnRbTools2.Caption := '4';
    rbTools1.Caption := '&Advanced';
    rbTools2.Caption := 'Laun&ch';
    rbTools3.Caption := 'Compar&e';
    rbTools3.Enabled := (fCompareExe <> '');
    rbTools4.Caption := 'Spare';
    rbTools4.Enabled := false;
    fToolsIndex := fToolsIndexSet4;
    end
  else if fToolsSet = 2 then
    begin
    fToolsSet := 1; // fToolsIndex = 1, 2, 3, 4
    btnRbTools.Caption := '1';
    btnRbTools2.Caption := '1';
    rbTools1.Caption := '&Dump Data';
    rbTools2.Caption := 'Updat&e Info';
    rbTools3.Caption := 'Atta&ch File';
    rbTools4.Caption := 'Unpac&k Files';
    fToolsIndex := fToolsIndexSet1;
     end
  else if fToolsSet = 3 then
    begin
    fToolsSet := 2; // fToolsIndex = 5, 6, 7, 8
    btnRbTools.Caption := '2';
    btnRbTools2.Caption := '2';
    rbTools1.Caption := '&Decrypt';
    rbTools2.Caption := 'R&epair';
    rbTools3.Caption := 'U&ncompress';
    rbTools4.Caption := '&Compress';
    fToolsIndex := fToolsIndexSet2;
    end
  else if fToolsSet = 4 then
    begin
    fToolsSet := 3; // fToolsIndex = 9, 10, 11, 12
    btnRbTools.Caption := '3';
    btnRbTools2.Caption := '3';
    rbTools1.Caption := '&Dump Fields';
    rbTools2.Caption := '&Gen FDF';
    rbTools3.Caption := 'Fill&_Form';
    rbTools3.Enabled := true;
    rbTools4.Caption := 'Flatte&n';
    rbTools4.Enabled := true;
    fToolsIndex := fToolsIndexSet3;
    end;
  case (fToolsIndex mod 4) of
    1:  begin rbTools1.Checked := true; rbTools1.SetFocus; end;
    2:  begin rbTools2.Checked := true; rbTools2.SetFocus; end;
    3:  begin rbTools3.Checked := true; rbTools3.SetFocus; end;
    0:  begin rbTools4.Checked := true; rbTools4.SetFocus; end;
  end;
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.rbTools4Click(Sender: TObject);
begin
  if Sender = rbTools4 then fToolsIndex := 4 else
  if Sender = rbTools3 then fToolsIndex := 3 else
  if Sender = rbTools2 then fToolsIndex := 2 else
  if Sender = rbTools1 then fToolsIndex := 1;
  fToolsIndex := fToolsIndex + (4 * (fToolsSet - 1));
  if fToolsIndex < 5 then fToolsIndexSet1 := fToolsIndex
    else if fToolsIndex < 9 then fToolsIndexSet2 := fToolsIndex
    else if fToolsIndex < 13 then fToolsIndexSet3 := fToolsIndex
    else fToolsIndexSet4 := fToolsIndex;
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.ClearDisplayToolsSet;
begin
  lblDecryptPassword.Visible := false;
  eDecryptPassword.Visible := false;
  comboApplication.Visible := false;
  lblApplication.Visible := false;
  btnLaunchApp.Visible := false;
  btnToolsFile2Reset.Visible := false;
  btnCopyFile2From.Visible := false;
  btnCopyFile2To.Visible := false;
  btnToolsFile2.Visible := false;
  btnToolsFile2Open.Visible := false;
  lblToolsFile2Filename.Visible := false;
  btnSwapFiles.Visible := false;
  btnAdvancedReset.Visible := false;
  btnAdvancedTemplate.Visible := false;
  btnAdvancedFilter.Visible := false;
  eAdvanced.Visible := false;
  lblAdvancedHint.Visible := false;
end;


procedure TMainForm.DisplayToolsSet;
begin
  case fToolsIndex of
    1:  begin
        fToolsAction := 'Dump Data';
        ClearDisplayToolsSet;
        end;
    2:  begin
        fToolsAction := 'Update Info';
        ClearDisplayToolsSet;
        end;
    3:  begin
        fToolsAction := 'Attach File';
        ClearDisplayToolsSet;
        // Show Attachment unique controls
        btnToolsFile2Reset.Visible := true;
        btnToolsFile2Reset.Enabled := true;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Enabled := true;
        btnToolsFile2.Caption := '&Attachment File ...';
        lblToolsFile2Filename.Visible := true;
        lblToolsFile2Filename.Caption := fAttachmentShort;
        btnCopyFile2From.Visible := true;
        btnCopyFile2To.Visible := true;
        btnToolsFile2Open.Visible := true;
        if lblToolsFile2Filename.Caption = '' then
          btnToolsFile2Open.Enabled := false
        else btnToolsFile2Open.Enabled := true;
        end;
    4:  begin
        fToolsAction := 'Unpack Files';
        ClearDisplayToolsSet;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Caption := 'Chan&ge Output Folder ...';
        btnToolsFile2Open.Visible := true;
        if fUnpackFolder = '' then
          begin
            btnToolsFile2.Enabled := false;
            btnToolsFile2Open.Enabled := false;
          end
        else
          begin
            btnToolsFile2.Enabled := true;
            btnToolsFile2Open.Enabled := true;
          end;
        lblToolsFile2Filename.Visible := true;
        lblToolsFile2Filename.Caption := fUnpackFolder;
        end;
    5:  begin
        fToolsAction := 'Decrypt';
        ClearDisplayToolsSet;
        // Show Decrypt unique controls
        lblDecryptPassword.Visible := true;
        eDecryptPassword.Visible := true;
        end;
    6:  begin
        fToolsAction := 'Repair';
        ClearDisplayToolsSet;
        end;
    7:  begin
        fToolsAction := 'Uncompress';
        ClearDisplayToolsSet;
        end;
    8:  begin
        fToolsAction := 'Compress';
        ClearDisplayToolsSet;
        end;
     9: begin
        fToolsAction := 'Dump Fields';
        ClearDisplayToolsSet;
        end;
    10: begin
        fToolsAction := 'Gen FDF';
        ClearDisplayToolsSet;
        end;
    11: begin
        fToolsAction := 'Fill Form';
        ClearDisplayToolsSet;
        end;
    12: begin
        fToolsAction := 'Flatten';
        ClearDisplayToolsSet;
        end;
    13: begin
        fToolsAction := 'Advanced';
        ClearDisplayToolsSet;
        // Show Advanced unique controls
        btnToolsFile2Reset.Visible := true;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Caption := 'Secondar&y Input File ...';
        btnToolsFile2Open.Visible := true;
        btnToolsFile2Open.Caption := 'Ope&n';
        lblToolsFile2Filename.Visible := true;
        lblToolsFile2Filename.Caption := fSecondaryInputFileShort;
        btnAdvancedReset.Visible := true;
        btnAdvancedTemplate.Visible := true;
        btnAdvancedFilter.Visible := true;
        eAdvanced.Visible := true;
        lblAdvancedHint.Visible := true;
        lblAdvancedHint.Caption := fAdvancedHint;
        if btnAdvancedTemplate.Caption = 'T1' then
          begin
            btnToolsFile2Reset.Visible := false;
            if fSrcTools <> '' then btnToolsFile2.Enabled := true
              else btnToolsFile2.Enabled := false;
            btnToolsFile2.Caption := 'Chan&ge Output Folder ...';
            if fSrcTools <> '' then btnToolsFile2Open.Enabled := true
              else btnToolsFile2Open.Enabled := false;
            if ((fSrcTools <> '') AND (lblToolsFile2Filename.Caption = '')) then
              begin
                lblToolsFile2Filename.Caption := fToolsFolder;
                fSecondaryInputFile := fToolsFolder;
              end;
            btnAdvancedFilter.Visible := false;
          end
        else if ((btnAdvancedTemplate.Caption = 'T2') OR (btnAdvancedTemplate.Caption = 'T3')) then
          begin
            btnToolsFile2.Visible := false;
            lblToolsFile2Filename.Visible := false;
            btnToolsFile2Reset.Visible := false;
            btnToolsFile2Open.Visible := false;
            btnAdvancedFilter.Visible := false;
          end;
        end;
     14: begin
        fToolsAction := 'Launch';
        ClearDisplayToolsSet;
        // Show Launch App unique controls
        comboApplication.Visible := true;
        lblApplication.Visible := true;
        btnLaunchApp.Visible := true;
        btnLaunchApp.Caption := 'Launch App';
        btnLaunchApp.Enabled := true;
        case comboApplication.ItemIndex of
        -1: btnLaunchApp.Enabled := false;
         0: btnLaunchApp.Enabled := (fApp1Exe <> '');
         1: btnLaunchApp.Enabled := (fApp2Exe <> '');
         2: btnLaunchApp.Enabled := (fApp3Exe <> '');
         3: btnLaunchApp.Enabled := (fApp4Exe <> '');
         4: btnLaunchApp.Enabled := (fApp5Exe <> '');
        end;
        // Note - File2 controls are not suppressed even if app has only one input file (%PDFIN%)
        // File2 will simply be ignored since there is no file2 placeholder to replace with entered file
        btnToolsFile2Reset.Visible := true;
        btnToolsFile2Reset.Enabled := true;
        btnCopyFile2From.Visible := true;
        btnCopyFile2To.Visible := true;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Enabled := true;
        btnToolsFile2.Caption := 'Secondary Input File ...';
        lblToolsFile2Filename.Visible := true;
        lblToolsFile2Filename.Caption := fLaunchFile2Short;
        btnToolsFile2Open.Visible := true;
        btnToolsFile2Open.Enabled := (fLaunchFile2 <> '');
        btnToolsFile2Open.Caption := 'View-&2';
        end;
    15: begin
        fToolsAction := 'Compare';
        ClearDisplayToolsSet;
        if fCompareExe <> '' then
        begin
        // Show Compare unique controls
        btnToolsFile2Reset.Visible := true;
        btnToolsFile2Reset.Enabled := true;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Enabled := true;
        btnCopyFile2From.Visible := true;
        btnCopyFile2To.Visible := true;
        btnToolsFile2.Visible := true;
        btnToolsFile2.Enabled := true;
        if fCompareSwap then btnToolsFile2.Caption := 'Input File 1 ...'
          else btnToolsFile2.Caption := 'Input File 2 ...';
        lblToolsFile2Filename.Visible := true;
        lblToolsFile2Filename.Caption := fCompareFile2Short;
        btnToolsFile2Open.Visible := true;
        btnToolsFile2Open.Caption := 'View-&2';
        btnToolsFile2Open.Enabled := (fCompareFile2 <> '');
        btnSwapFiles.Visible := true;
        btnSwapFiles.Enabled := (fSrcTools <> '') AND (fCompareFile2 <> '');
        btnLaunchApp.Visible := true;
        btnLaunchApp.Caption := 'Run Compare';
        btnLaunchApp.Enabled := (fSrcTools <> '') AND (fCompareFile2 <> '');
        end;
        end;
    16: begin
        fToolsAction := 'Spare';
        ClearDisplayToolsSet;
        end;
  end;
  UpdateButtonsAndMenus(0);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnToolsFile2Click(Sender: TObject);
var
  sfullpath, sfilename, dir : string;
  pagecount, w : integer;
begin
  if fPaste then
      begin
      if fDropFile <> '' then fFile2Paste := fDropFile else fFile2Paste := ClipBoard.AsText;
      fPaste := false; fDropFile := '';
      if fFile2Paste = '' then exit;
      w := length(fFile2Paste);
      if w < 7 then exit;
      if (AnsiLeftStr(fFile2Paste,1) <> '"') or (AnsiRightStr(fFile2Paste,1) <> '"') then exit;
      fFile2Paste := copy(fFile2Paste,2,w-2);
      // Launch and Compare expect PDF files, Attach File does not care
      if (NOT ((fToolsAction = 'Attach File') or (fToolsAction = 'Advanced')))
        and (extractFileExt(fFile2Paste) <> '.pdf') then exit;
      if (NOT FileExists(fFile2Paste)) then exit;
    end;
  if fToolsAction = 'Attach File' then
  begin
    if fFile2Paste = '' then
    begin
      OpenDialog2.Options := OpenDialog1.Options - [ofAllowMultiSelect];
      if not OpenDialog2.Execute then exit;
      fAttachment := OpenDialog2.FileName;
    end else
    fAttachment := fFile2Paste;
    btnToolsFile2Open.Enabled := true;
    sfullpath := fAttachment;
    sfilename := extractFilename(sfullpath);
    w := lblToolsFile2Filename.Width - 40;
    fAttachmentShort := TruncateString(sfilename, 36, w);
    lblToolsFile2Filename.Caption := fAttachmentShort;
    UpdateButtonsAndMenus(0);
  end
  else if fToolsAction = 'Launch' then
  begin
    if fFile2Paste = '' then
    begin
      if not OpenDialog1.Execute then exit;
      fLaunchFile2 := OpenDialog1.FileName;
    end
    else fLaunchFile2 := fFile2Paste;
    btnToolsFile2Open.Enabled := true;
    sfullpath := fLaunchFile2;
    sfilename := extractFilename(sfullpath);
    pagecount :=GetPdfPageCount(sfullpath);
    if pagecount <1 then
      sfilename := format('%s (?)', [sfilename])
    else
      sfilename := format('%s (%d)', [sfilename, pagecount]);
    w := lblToolsFile2Filename.Width - 40;
    fLaunchFile2Short := TruncateString(sfilename, 36, w);
    lblToolsFile2Filename.Caption := fLaunchFile2Short;
    UpdateButtonsAndMenus(0);
  end
  else if fToolsAction = 'Compare' then
  begin
    if fFile2Paste = '' then
    begin
      if not OpenDialog1.Execute then exit;
      fCompareFile2 := OpenDialog1.FileName;
    end
    else fCompareFile2 := fFile2Paste;
    btnToolsFile2Open.Enabled := true;
    sfullpath := fCompareFile2;
    sfilename := extractFilename(sfullpath);
    pagecount :=GetPdfPageCount(sfullpath);
    if pagecount <1 then
      sfilename := format('%s (?)', [sfilename])
    else
      sfilename := format('%s (%d)', [sfilename, pagecount]);
    w := lblToolsFile2Filename.Width - 40;
    fCompareFile2Short := TruncateString(sfilename, 36, w);
    lblToolsFile2Filename.Caption := fCompareFile2Short;
    btnSwapFiles.Enabled := (fSrcTools <> '') AND (fCompareFile2 <> '');
    UpdateButtonsAndMenus(0);
  end
  else if fToolsAction = 'Advanced' then
  begin
    if btnAdvancedTemplate.Caption = 'T1' then
      begin
        dir := fToolsFolder;
        if SelectDirectory(dir,[sdAllowCreate,sdPerformCreate,sdPrompt],0) then
          begin
            fSecondaryInputFile := dir;
            lblToolsFile2Filename.Caption := fSecondaryInputFile;
          end
        else exit;
      end
    else if (btnAdvancedTemplate.Caption = 'T4') or (btnAdvancedTemplate.Caption = 'T5') then
      begin
        fSecondaryInputFile := fFile2Paste;
        if fFile2Paste = '' then
        begin
          OpenDialog2.Options := OpenDialog1.Options - [ofAllowMultiSelect];
          if not OpenDialog2.Execute then exit;
          fSecondaryInputFile := OpenDialog2.FileName;
        end;
        btnToolsFile2Open.Enabled := true;
        sfullpath := fSecondaryInputFile;
        sfilename := extractFilename(sfullpath);
        w := lblToolsFile2Filename.Width - 40;
        fSecondaryInputFileShort := TruncateString(sfilename, 36, w);
        lblToolsFile2Filename.Caption := fSecondaryInputFileShort;
        UpdateButtonsAndMenus(0);
      end;
  end
  else if fToolsAction = 'Unpack Files' then
  begin
    dir := fToolsFolder;
    if SelectDirectory(dir,[sdAllowCreate,sdPerformCreate,sdPrompt],0) then
      begin
        fUnpackFolder := dir;
        lblToolsFile2Filename.Caption := fUnpackFolder;
      end
    else exit;
  end;
  fFile2Paste := '';
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnToolsFile2OpenClick(Sender: TObject);
var
  s: string;
begin
  if fToolsAction = 'Launch' then
    begin
      s := fLaunchFile2;
      ViewFile(s, fPdfExe);
    end
  else if fToolsAction = 'Compare' then
    begin
      s := fCompareFile2;
      ViewFile(s, fPdfExe);
    end
  else if fToolsAction = 'Attach File' then
    begin
      s := fAttachment;
      if s <> '' then ShellExecute(0, 'open', PChar(s), Nil, Nil, SW_NORMAL);
    end
  else if fToolsAction = 'Unpack Files' then
    begin
      s := fUnpackFolder;
      if s <>'' then ShellExecute(0, PChar('explore'), PChar(s), Nil, Nil, SW_NORMAL);
    end
  else if fToolsAction = 'Advanced' then
    begin
      s := fSecondaryInputFile;
      if s = '' then exit;
      if btnToolsFile2.Caption = 'Change Output Folder ...' then
        ShellExecute(0, PChar('explore'), PChar(s), Nil, Nil, SW_NORMAL)
      else ShellExecute(0, 'open', PChar(s), Nil, Nil, SW_NORMAL);
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnToolsFile2ResetClick(Sender: TObject);
begin
  if fToolsAction = 'Launch' then
    begin
      fLaunchFile2 := '';
      fLaunchFile2Short := '';
      lblToolsFile2Filename.Caption := '';
      btnToolsFile2Open.Enabled := false;
      btnLaunchApp.Enabled := true;
    end
  else if fToolsAction = 'Compare' then
    begin
      fCompareFile2 := '';
      fCompareFile2Short := '';
      lblToolsFile2Filename.Caption := '';
      btnToolsFile2Open.Enabled := false;
      btnSwapFiles.Enabled := false;
      btnLaunchApp.Enabled := false;
    end
  else if fToolsAction = 'Attach File' then
    begin
      fAttachment := '';
      fAttachmentShort := '';
      lblToolsFile2Filename.Caption := '';
      btnToolsFile2Open.Enabled := false;
    end
  else if fToolsAction = 'Unpack Files' then
    begin
      fUnpackFolder := fToolsFolder;
      lblToolsFile2Filename.Caption := fUnpackFolder;
      if fUnpackFolder = '' then btnToolsFile2Open.Enabled := false
        else btnToolsFile2Open.Enabled := true;
    end
  else if fToolsAction = 'Advanced' then
    begin
      fSecondaryInputFile := '';
      fSecondaryInputFileShort := '';
      lblToolsFile2Filename.Caption := '';
      btnToolsFile2Open.Enabled := false;
    end;
  UpdateButtonsAndMenus(0);
  DisplayToolsSet;
  btnToolsFile2.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopyFile2FromClick(Sender: TObject);
begin
  fpaste := true;
  btnToolsFile2Click(nil);
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnCopyFile2ToClick(Sender: TObject);
begin
  if fToolsAction = 'Attach File' then ClipBoard.AsText := format('"%s"', [fAttachment])
  else if fToolsAction = 'Launch' then ClipBoard.AsText := format('"%s"', [fLaunchFile2])
  else if fToolsAction = 'Compare' then ClipBoard.AsText := format('"%s"', [fCompareFile2])
  else exit;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnSwapFilesClick(Sender: TObject);
begin
  if fToolsAction = 'Compare' then fCompareSwap := NOT fCompareSwap;
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.comboApplicationClick(Sender: TObject);
begin
  if PageControl1.ActivePage = tsTools then rbTools2.SetFocus; //rbTools2 = Launch
  DisplayToolsSet;
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnLaunchAppClick(Sender: TObject);
var
  sapp, sarg : string;
begin
  if FToolsAction = 'Launch' then

  begin
  case comboApplication.ItemIndex of
  0:  begin
      sapp := fApp1Exe;
      sarg := fApp1Arg;
      end;
  1:  begin
      sapp := fApp2Exe;
      sarg := fApp2Arg;
      end;
  2:  begin
      sapp := fApp3Exe;
      sarg := fApp3Arg;
      end;
  3:  begin
      sapp := fApp4Exe;
      sarg := fApp4Arg;
      end;
  4:  begin
      sapp := fApp5Exe;
      sarg := fApp5Arg;
      end;
  end;
  end else if fToolsAction = 'Compare' then
      begin
      sapp := fCompareExe;
      sarg := fCompareArg;
      end;

  if sapp = '' then exit;
  if (NOT FileExists(sapp)) then exit;
  if (fToolsAction = 'Compare') and fCompareSwap then
    begin
    sarg := AnsiReplaceStr(sarg, '%PDFIN%', '"' + fCompareFile2 + '"');
    sarg := AnsiReplaceStr(sarg, '%PDFFILE2%', '"' + fSrcTools + '"');
    end
  else if (fToolsAction = 'Compare') then
    begin
    sarg := AnsiReplaceStr(sarg, '%PDFIN%', '"' + fSrcTools + '"');
    sarg := AnsiReplaceStr(sarg, '%PDFFILE2%', '"' + fCompareFile2 + '"');
    end
  else
    begin
    sarg := AnsiReplaceStr(sarg, '%PDFIN%', '"' + fSrcTools + '"');
    sarg := AnsiReplaceStr(sarg, '%PDFFILE2%', '"' + fLaunchFile2 + '"');
    end;
  sarg := ' ' + sarg;
  if (fSrcTools = '') then ShellExecute(0, 'open', pChar(sapp), Nil, Nil, SW_NORMAL)
    else ShellExecute(0, 'open', pChar(sapp), pChar(sarg), Nil, SW_NORMAL);

end;

//------------------------------------------------------------------------------

procedure TMainForm.btnAdvancedFilterClick(Sender: TObject);
begin
  if btnAdvancedFilter.Caption = 'PDF' then btnAdvancedFilter.Caption := 'TXT'
  else if btnAdvancedFilter.Caption = 'TXT' then btnAdvancedFilter.Caption := 'ANY'
  else if btnAdvancedFilter.Caption = 'ANY' then btnAdvancedFilter.Caption := 'PDF'
end;

//------------------------------------------------------------------------------

procedure TMainForm.btnAdvancedResetClick(Sender: TObject);
var
  sTemplate : string;
  Template : integer;
begin
  sTemplate := btnAdvancedTemplate.Caption;
  Template := strtoint(AnsiRightStr(sTemplate,1));
  case Template of
  1: begin btnAdvancedTemplate.Caption := 'T5'; btnAdvancedTemplateClick(nil); end;
  2: begin btnAdvancedTemplate.Caption := 'T1'; btnAdvancedTemplateClick(nil); end;
  3: begin btnAdvancedTemplate.Caption := 'T2'; btnAdvancedTemplateClick(nil); end;
  4: begin btnAdvancedTemplate.Caption := 'T3'; btnAdvancedTemplateClick(nil); end;
  5: begin btnAdvancedTemplate.Caption := 'T4'; btnAdvancedTemplateClick(nil); end;
  end;
end;

//------------------------------------------------------------------------------

(* PDFtk Command Templates (T1, T2, T3, T4, T5) and Applicable Operations:

   T1: %PDFTK% %PDFIN% <Op> output %FOLDER%
      1: Folder: burst, unpack_files (files output to %FOLDER%, burst output section 
         specifies file name, e.g. output page_%03d.pdf)

   T2: %PDFTK% %PDFIN% <Op> output %TXTOUT%
      1: %TXTOUT%: dump_data, dump_data_utf8, dump_data_fields, dump_data_fields_utf8,
         dump_data_annots, generate_fdf (output .TXT file to %PDFIN% folder with same name
         as %PDFIN% but with .pdf ext replaced with _data.txt, _data_utf8.txt,  _fields.txt,
          _fields_utf8.txt, _annots.txt, _fdf.txt)

   T3: %PDFTK% %PDFIN% <Op> output %PDFOUT%
      1: %PDFOUT: none (filter mode), cat, rotate

   T4: %PDFTK% %PDFIN% <Op> %XXXFILE2% output %PDFOUT%
      1: %PDFFILE2%: background, multibackground, stamp, multistamp
      2: %TXTFILE2%: update_info, update_info_utf8, fill_form (same file names as in T2)
      3: %ANYFILE2%: attach_files

    T5. %PDFTK% A=%PDFIN% B=%PDFFILE2% <Op> output %PDFOUT%
      1: %PDFFILE2%: cat, shuffle
*)

procedure TMainForm.btnAdvancedTemplateClick(Sender: TObject);
begin
  if btnAdvancedTemplate.Caption = 'T5' then
    begin
    btnAdvancedTemplate.Caption := 'T1';
    eAdvanced.Text := '%PDFIN% <op> output %FOLDER%';
    lblAdvancedHint.Caption := 'HINT:  T1 <op>: burst, unpack_files (default output folder = PDFIN folder)';
    btnAdvancedFilter.Visible := false;
    if fToolsFolder <> '' then btnToolsFile2.Enabled := true
      else btnToolsFile2.Enabled := false;
    btnToolsFile2.Caption := 'Chan&ge Output Folder ...';
    btnToolsFile2Reset.Visible := false;
    fSecondaryInputFile := '';
    fSecondaryInputFileShort := '';
    lblToolsFile2Filename.Caption := '';
    btnToolsFile2Open.Enabled := false;
    end
  else if btnAdvancedTemplate.Caption = 'T1' then
    begin
    btnAdvancedTemplate.Caption := 'T2';
    eAdvanced.Text := '%PDFIN% <op> output %TXTOUT%';
    lblAdvancedHint.Caption := 'HINT:  T2 <op>: dump_data[_utf8], dump_data_fields[_utf8], dump_data_annots, generate_fdf';
    btnAdvancedFilter.Visible := true;
    btnAdvancedFilter.Enabled := false;
    btnToolsFile2.Enabled := false;
    btnToolsFile2.Caption := 'Secondary Input File ...';
    btnToolsFile2Reset.Visible := true;
    end
  else if btnAdvancedTemplate.Caption = 'T2' then
    begin
    btnAdvancedTemplate.Caption := 'T3';
    eAdvanced.Text := '%PDFIN% <op> output %PDFOUT%';
    lblAdvancedHint.Caption := 'HINT:  T3 <op>: none (filter mode) | cat, rotate';
    btnAdvancedFilter.Enabled := false;
    btnToolsFile2.Enabled := false;
    end
  else if btnAdvancedTemplate.Caption = 'T3' then
    begin
    btnAdvancedTemplate.Caption := 'T4';
    eAdvanced.Text := '%PDFIN% <op> %XXXFILE2% output %PDFOUT%';
    lblAdvancedHint.Caption := 'HINT:  T4 XXX <op>: PDF: [multi](background, stamp) | TXT: update_info, fill_form | ANY: attach_files';
    btnAdvancedFilter.Enabled := true;
    btnAdvancedFilter.Caption := 'ANY';
    btnToolsFile2.Enabled := true;
    fSecondaryInputFile := '';
    fSecondaryInputFileShort := '';
    lblToolsFile2Filename.Caption := '';
    btnToolsFile2Open.Enabled := false;
    end
  else if btnAdvancedTemplate.Caption = 'T4' then
    begin
    btnAdvancedTemplate.Caption := 'T5';
    eAdvanced.Text := 'A=%PDFIN% B=%PDFFILE2% <op> output %PDFOUT%';
    lblAdvancedHint.Caption := 'HINT:  T5 <op>: cat, shuffle';
    btnAdvancedFilter.Enabled := false;
    btnAdvancedFilter.Caption := 'PDF';
    btnToolsFile2.Enabled := true;
    fSecondaryInputFile := '';
    fSecondaryInputFileShort := '';
    lblToolsFile2Filename.Caption := '';
    btnToolsFile2Open.Enabled := false;
    end;
  fAdvancedHint := lblAdvancedHint.Caption;
  btnToolsFile2Reset.Enabled := true;
  if lblToolsFile2Filename.Caption <> '' then btnToolsFile2Open.Enabled := true else btnToolsFile2Open.Enabled := false;
  DisplayToolsSet;
end;


//------------------------------------------------------------------------------
//          TMainForm Build-Do Methods
//------------------------------------------------------------------------------

procedure TMainForm.DoCollateFiles;
var
  sel : TGridRect;
  i, iPageCount: integer;
  c: Char;
  s, sFullPath, sPages, fileParams, action, actionParams: string;
  IsValidPageRanges: boolean;
begin
  if((cbShuffle.Checked) and (fFileList.Count >1)) then action := 'shuffle'
     else action := 'cat';

  ChDir(tmpPath);

  //nb: Since PDFTK 1.41 has limited 'file handles' (ie A..Z), if there are
  //more than 26 files, we simply collate the files using the '*' wildcard
  //char. (However, using '*' prevents page selection for individual files.)

  //Note: Limitation to 26 single character handles was removed in
  //pdftk 1.45, Dec 2012 with addition of multicharacter handles.  
  //However, no corresponding changes have been made to PDFTK Builder.

  if fExtract then
  begin
    // Extract specified page range for the selected file (popup menu item)
    // Mimic Join files loop below but with single iteration for selected file
    fExtract := false;
    sel := StringGrid1.Selection;
    sFullPath :=  PSourceFileRec(fFileList.Objects[sel.Top]).FullPath;
    sPages := PSourceFileRec(fFileList.Objects[sel.Top]).Pages;
    iPageCount := PSourceFileRec(fFileList.Objects[sel.Top]).PageCount;
    actionParams := '';
    fileParams := '';
    i := 0;
    c := chr(ord('A')+ i);
    s := Format('src%s.pdf', [c]);
    CopyFile(pchar(sFullPath), pchar(s), false);
    fileParams := format('%s %s="%s"',[fileParams, c, s]);
    actionParams := actionParams + c + FmtPagesString(sPages, iPageCount, IsValidPageRanges);
    if not IsValidPageRanges then
      raise Exception.CreateFmt('Invalid page range specified for selected file',[]);
    s := format('"%spdftk.exe" %s %s %s output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, fileParams, action, actionParams, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end else

  if fFileList.Count > 26 then
  begin
    //copy all the pdf files into a temp folder ready for collating
    //while preserving sort order (but ignoring any page ranges) ...
    for i := 0 to fFileList.Count -1 do
      with PSourceFileRec(fFileList.Objects[i])^ do
        CopyFile(
          pchar(FullPath),
          pchar(format('src%3.3d.pdf',[i+1])),
          false);
    s := format('"%spdftk.exe" src*.pdf %s output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, action, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end else

  begin
    // Join files (max = 26) in the StringGrid1 list using page ranges if any
    actionParams := '';
    fileParams := '';
    for i := 0 to fFileList.Count -1 do
      with PSourceFileRec(fFileList.Objects[i])^ do
      begin
        c := chr(ord('A')+ i);
        s := Format('src%s.pdf', [c]);
        CopyFile(pchar(FullPath), pchar(s), false);
        fileParams := format('%s %s="%s"',[fileParams, c, s]);
        actionParams := actionParams + c + FmtPagesString(Pages, PageCount, IsValidPageRanges);
        if not IsValidPageRanges then
          raise Exception.CreateFmt('Invalid page range specified (file %d)', [i+1]);
      end;
    // showmessage('fileParams = ' + fileParams);
    // showmessage('actionParams = ' + actionParams);
    s := format('"%spdftk.exe" %s %s %s output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, fileParams, action, actionParams, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end;

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile('dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoSplitFile;
var
  i,j,k, iSplitFileSize: integer;
  s, sfile, savedName: string;
  sr: TSearchRec;
begin
  ChDir(tmpPath);
  //circumvent unicode filename issues ...
  CopyFile(pchar(fSplitSrc), 'src.pdf', false);

  if cbSplitOddEven.Checked then
  begin
    // Split specified page range into two files (_odd and _even)
    s := format('%spdftk.exe A="%s" cat A%d-%dodd output "%s" %s %s %s dont_ask',
      [fPdftkPath, 'src.pdf', fSplitPagesFrom, fSplitPagesTo, 'src_odd.pdf',
      allowParams, ownerParam, userParam]);
    executeCommand(s);
    s := format('%spdftk.exe A="%s" cat A%d-%deven output "%s" %s%s %s dont_ask',
      [fPdftkPath, 'src.pdf', fSplitPagesFrom, fSplitPagesTo, 'src_even.pdf',
      allowParams, ownerParam, userParam]);
    executeCommand(s);
    savedName := fSplitFolder + '\' + extractFileName(fSplitSrc);
    savedName := ChangeFileExt(savedName, '');
    if FileExists(savedName + '_odd.pdf') then DeleteFile(savedName + '_odd.pdf');
    RenameFile(tmpPath+'src_odd.pdf', savedName + '_odd.pdf');
    if FileExists(savedName + '_even.pdf') then DeleteFile(savedName + '_even.pdf');
    RenameFile(tmpPath+'src_even.pdf', savedName + '_even.pdf');
    SaveDialog1.FileName := savedName + '_even.pdf';
  end else
  begin
    // Split specified page range into individual page files (_nn, _nnn, _nnnn)
    // Note: Doc report file also generated by burst op is discarded by leaving
    // it in temp folder when using split action

    // To reduce number of burst output files, run cat to discard pages not in
    // page range before bursting the file
    if ((fSplitPagesFrom > 1) OR (fSplitPagesTo < fSplitSrcPageCount)) then
      begin
        RenameFile('src.pdf', 'input.pdf');
        s := format('%spdftk.exe A="%s" cat A%d-%d output "%s" %s %s %s dont_ask',
          [fPdftkPath, 'input.pdf', fSplitPagesFrom, fSplitPagesTo, 'src.pdf',
          allowParams, ownerParam, userParam]);
        executeCommand(s);
      end;
    if fSplitChunkSize = 1 then
    begin
      s := format('%spdftk.exe A="%s" burst output "%s" %s %s %s dont_ask',
        [fPdftkPath, 'src.pdf', 'src_%04d.pdf', allowParams, ownerParam, userParam]);
      executeCommand(s);
    end else
    begin
      j := 1 - fSplitChunkSize; i := 0; k := fSplitChunkSize -1;
      iSplitFileSize := fSplitPagesTo - fSplitPagesFrom + 1;
      while i < iSplitFileSize do
        begin
          j := j + fSplitChunkSize;
          i := j + k;
          if (i > iSplitFileSize) then i := iSplitFileSize;
          sfile := format('src_%.4d.pdf',[j]);
          // showmessage('sfile: ' + sfile);
          s := format('%spdftk.exe A="%s" cat A%d-%d output %s %s %s %s dont_ask',
            [fPdftkPath, 'src.pdf', j, i, sfile, allowParams, ownerParam, userParam]);
          // showmessage('s: ' + s);
          executeCommand(s);
        end;
    end;

    // Rename temp page files to use source file name and suffix with correct number of digits
    // and to move files to destination folder, deleting any existing files if necessary
    k := Length(IntToStr(fSplitSrcPageCount));  // k = number of digits in page number
    if k = 1 then k := 2;
    j := fSplitPagesFrom - fSplitChunkSize;
    savedName := fSplitFolder + '\' + extractFileName(fSplitSrc);
    savedName := ChangeFileExt(savedName, '');
    i := FindFirst('src_*.*', faAnyFile, sr);
    while i = 0 do
    begin
      j := j + fSplitChunkSize;
      SetFileAttributes(pchar(sr.Name), 0); //remove read-only etc
      if k = 2 then s := format('%s_%2.2d.pdf', [savedName, j])
        else if k = 3 then s := format('%s_%3.3d.pdf', [savedName, j])
        else s := format('%s_%4.4d.pdf', [savedName, j]);
      if FileExists(s) then DeleteFile(s);
      RenameFile(sr.Name, s);
      i := FindNext(sr);
    end;
    fSplitLastFilePageFrom := j;

    FindClose(sr);
    if k = 2 then SaveDialog1.FileName := Format('%s_%2.2d.pdf', [savedName, fSplitLastFilePageFrom])
    else if k = 3 then SaveDialog1.FileName := Format('%s_%3.3d.pdf', [savedName, fSplitLastFilePageFrom])
    else SaveDialog1.FileName := Format('%s_%4.4d.pdf', [savedName, fSplitLastFilePageFrom]);
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoBackgroundStamp(IsBackgroundOp: boolean);
var
  action, s: string;
begin
  if IsBackgroundOp then action := 'background' else action := 'stamp';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcBackground), 'src.pdf', false);
  CopyFile(pchar(fBackground), 'src2.pdf', false);

  if cbPageOneOnly.Checked and
    (fSrcBackgroundPageCount > 1) then
  begin
    //split off page 1 to tmp1.pdf ...
    s := format('"%spdftk.exe" A=src.pdf cat A1 output tmp1.pdf %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);
    //create tmp3.pdf from backgrounded page 1 ...
    s := format('%spdftk.exe tmp1.pdf %s src2.pdf output tmp3.pdf %s %s %s dont_ask',
      [fPdftkPath, action, allowParams, ownerParam, userParam]);
    executeCommand(s);

    //split off page 2 to end to tmp2.pdf ...
    s := format('"%spdftk.exe" A=src.pdf cat A2-end output tmp2.pdf %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);
    //join the result back into one pdf document ...
    s := format('"%spdftk.exe" A=tmp3.pdf B=tmp2.pdf cat A B output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end else
  begin
    if (fBackgroundPageCount > 1) then action := 'multi' + action;
    executeCommand(format('%spdftk.exe src.pdf %s src2.pdf output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, action, allowParams, ownerParam, userParam]));
  end;
  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile('dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoPageNumber;
var
  i, j, startPage, stopPage, startNum, pageCount, textWidth, OffsetEven, OffsetOdd: integer;
  s, sPrefix, sSuffix, sPageNum: string;
  s2, s3: AnsiString;
  insertPageNumber: boolean;
  today: TDateTime;
  rs: TResourceStream;
begin
  ChDir(tmpPath);
  if fNumOptions then
  begin
    insertPageNumber := false;
    startPage := fNumPagesFrom;
    stopPage := fNumPagesTo;
    startNum := fNumStart;
    sPrefix := eNumPrefix.Text;
    sSuffix := '';
    if AnsiContainsText(sPrefix,'%d') then
    begin
      today := now;
      s := FormatDateTime(fNumDateTimeFormat, today);
      sPrefix := AnsiReplaceStr(sPrefix, '%d', s);
    end;
    if AnsiContainsText(sPrefix,'%n') then
    begin
      s := ExtractFileName(fSrcBackground);
      sPrefix := AnsiReplaceStr(sPrefix, '%n', s);
    end;
    if AnsiContainsText(sPrefix,'%t') then
    begin
      s := inttostr(fSrcBackgroundPageCount);
      sPrefix := AnsiReplaceStr(sPrefix, '%t', s);
    end;
    if AnsiContainsText(sPrefix, '%p') then
      begin
        insertPageNumber := true;
        i := Pos('%p', sPrefix);
        textWidth := length(sPrefix);
        if textWidth > (i+1) then sSuffix := AnsiRightStr(sPrefix, textWidth - (i+1));
        sPrefix := AnsiLeftStr(sPrefix, i-1)
      end;
  end else
  begin
    insertPageNumber := true;
    startPage := 1;
    stopPage := fSrcBackgroundPageCount;
    startNum := 1;
    sPrefix := '';
    sSuffix := '';
  end;

  if startPage > fSrcBackgroundPageCount then
    raise Exception.Create('Error - there are no pages to number');
  //load blank page PDF from resource that has page number template ...
  rs := TResourceStream.Create(hInstance, 'PAGE', 'TEXT');
  try
    setLength(s2, rs.Size);
    rs.Read(s2[1], rs.Size);

    CopyFile(pchar(fSrcBackground), 'src.pdf', false);
    s := format('"%spdftk.exe" src.pdf burst output src%%04d.pdf dont_ask', [fPdftkPath]);
    executeCommand(s);


    if fNumOptions and (stopPage < fSrcBackgroundPageCount) then
      begin
        for i := (stopPage + 1) to fSrcBackgroundPageCount do
        RenameFile(format('src%4.4d.pdf', [i]), format('dst%4.4d.pdf', [i]));
      end;
    if fNumOptions and (startPage > 1) then
      begin
        for i := 1 to (startPage -1) do
        RenameFile(format('src%4.4d.pdf', [i]), format('dst%4.4d.pdf', [i]));
      end;
    if cbPageOneOnly.Checked then //don't stamp the first page
      begin
        RenameFile(format('src%4.4d.pdf', [startPage]), format('dst%4.4d.pdf', [StartPage]));
        startPage := startPage + 1;
        startNum := startNum + 1;
      end;

    i := startPage;
    j := startNum;
    while (i <= stopPage) do
    begin
      // create a page numbered pdf...
      if insertPageNumber then sPageNum := sPrefix + inttostr(j) + sSuffix
        else sPageNum := sPrefix;
      textWidth := GetTextWidth(sPageNum, fNumSize);
      // if position = right, offset the page number text to the left by its text length
      // if position = center, divide the text offset by 2
      if (NumOffset.cx < ((NumPageSize.cx div 2) - 1)) then
      begin
        // Left
        OffsetOdd := 0;
        OffsetEven := textWidth;
      end
      else if (NumOffset.cx > ((NumPageSize.cx div 2) + 1)) then
      begin
        // Right
        OffsetOdd := textWidth;
        OffsetEven := 0;
      end else
      begin
        // Center
        OffsetOdd := textWidth div 2;
        OffsetEven := OffsetOdd
      end;
      // OffsetOdd := 0; //For test purposes only
      // OffsetEven := 0; //For test purposes only
      if (odd(j) or (NOT cbMirror.Checked)) then
        s3 := AnsiString(Format(string(s2), [fNumSize, NumOffset.cx - OffsetOdd, NumOffset.cy,
          SPageNum, NumPageSize.cx, NumPageSize.cy]))
      else
        s3 := AnsiString(Format(string(s2), [fNumSize, (NumPageSize.cx-NumOffset.cx - OffsetEven), NumOffset.cy,
          sPageNum, NumPageSize.cx, NumPageSize.cy]));

      with TFileStream.Create('1.pdf', fmCreate) do
      try Write(s3[1], length(s3)); finally free; end;
      //stamp each src page with the numbered page ...
      s := format('"%spdftk.exe" src%4.4d.pdf stamp 1.pdf output dst%4.4d.pdf dont_ask',
        [fPdftkPath, i, i]);
      executeCommand(s);
      inc(i);
      inc(j);
    end;
  finally
    rs.Free;
  end;
  s := format('"%spdftk.exe" dst*.pdf cat output dst.pdf %s %s %s dont_ask',
    [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);
  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;
//------------------------------------------------------------------------------

procedure TMainForm.DoRotate;
var
  i, j : integer;
  s, action, actionParams : string;
  isValid :  boolean;
begin
  // Rotate tab operations process a single range of pages (i-j).  Op is selected
  // by one of five radio buttons:  rbRotExtract, Delete, Right (default), Left, Down

  fErrorCode := 'R01';
  if fPdftkVersion < '2.00' then
  begin
    i := strtoint(eRotPagesFrom.Text);
    j := strtoint(eRotPagesTo.Text);
    if (i<1) or (j<i) or (j>fRotatePageCnt) then exit; // should not occur
  end;

  fErrorCode := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcRotate), 'src.pdf', false);

// Process Extract Pages using cat command
if rbRotExtract.Checked then
begin
  if fPdftkVersion < '2.00' then
    begin
      if j > i then
      actionParams := format('%d-%d', [i,j]) else
      actionParams := format('%d', [i]);
    end else
      actionparams := FmtOrderedPagesString(eRotPages.Text, fRotatePageCnt, IsValid, '', false, '');
  // showmessage('Extract: ' + actionParams);
  s := format('"%spdftk.exe" src.pdf cat %s output dst.pdf %s %s %s dont_ask',
    [fPdftkPath, actionParams, allowParams, ownerParam, userParam]);
  executeCommand(s);
end else

// Process Delete Pages using cat command with complement pages string
if rbRotDelete.Checked then
begin
  if fPdftkVersion < '2.00' then
  begin
    if i = 1 then
      begin
        fErrorCode := 'R02 - No pages/file saved';
        if j=fRotatePageCnt then exit;  // All pages deleted - no file needs to be built
        fErrorCode := '';
        actionParams := format('%d-%d', [j+1, fRotatePageCnt]);
      end
    else
      begin
        if j < fRotatePageCnt then
          actionParams := format('1-%d %d-%d', [i-1, j+1, fRotatePageCnt]) else
          actionParams := format('1-%d', [i-1]);
    end;
  end else
  begin  // Version 2.00 or greater
    actionParams := FmtOrderedPagesString(eRotPages.Text, fRotatePageCnt, IsValid, '', true, '');
    // showmessage('Delete: ' + actionParams);
    fErrorCode := 'R02 - No pages/file saved'; // All pages deleted - no file needs to be built
    if actionParams = ' ' then exit;
  end;
  fErrorCode := '';
  s := format('"%spdftk.exe" src.pdf cat %s output dst.pdf %s %s %s dont_ask',
    [fPdftkPath, actionParams, allowParams, ownerParam, userParam]);
  executeCommand(s);
end else

// Rotate pages using 'cat' command for PDFtk version < 2.00 and 'rotate' command for version >= 2.00
begin

  // Rotate range of pages (rbRotRight, Left, or Down selected)
  // pdftk 1.45 or later use rot syntax = right, left, down (vs. R, L, D)
  if rbRotRight.Checked then
    action := 'right'
  else if rbRotLeft.Checked then
    action := 'left'
  else
    action := 'down';

  // earlier pdftk versions (e.g., 1.41) use rot syntax = R, L, D
  if fPdftkVersion < '1.45' then
    begin
    if rbRotRight.Checked then
      action := 'R'
    else if rbRotLeft.Checked then
      action := 'L'
    else
      action := 'D'
    end;

  if fPdftkVersion >= '2.00' then
  begin
    //use 'rotate' cmd with multiple page ranges with pdftk versions 2.xx
    actionParams := FmtOrderedPagesString(eRotPages.Text, fRotatePageCnt, IsValid, '', false, action);
    // showmessage('Rotate: ' + actionParams);
    s := format('"%spdftk.exe" src.pdf rotate %s output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, actionParams, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end else
  begin
    // use 'cat' cmd with pdftk versions 1.xx, requires up to 3 page ranges
    if i = 1 then
      actionParams := ''
    else if i = 2 then
      actionParams := '1 '
    else
      actionParams := format('1-%d ', [i-1]);
    if j > i then
      actionParams := actionParams + format('%d-%d%s', [i,j, action]) else
      actionParams := actionParams + format('%d%s', [i,action]);
    if j = fRotatePageCnt then
      //do nothing
    else if j = fRotatePageCnt -1 then
      actionParams := actionParams + format(' %d', [fRotatePageCnt])
    else
      actionParams := actionParams + format(' %d-%d', [j+1, fRotatePageCnt]);
    // showmessage('Rotate: ' + actionParams);
    s := format('"%spdftk.exe" src.pdf cat %s output dst.pdf %s %s %s dont_ask',
      [path, actionParams, allowParams, ownerParam, userParam]);
    executeCommand(s);
  end;
end;

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoDecrypt;
var
  action, s, sPassword: string;
begin
  action := '';
  sPassword := eDecryptPassword.text;
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf input_pw %s output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, sPassword, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoRepair;
var
  action, s: string;
begin
  action := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoUncompress;
var
  action, s: string;
begin
  action := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf uncompress %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoCompress;
var
  action, s: string;
begin
  action := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf compress %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

(* DoAdvanced presents one of following five pdftk command templates for the user to edit:

 T1-4:  %PDFTK% %PDFIN            <Op> %XXXFILE2% output (%PDFOUT% or %TXTOUT% or %FOLDER%)
   T5:  %PDFTK% %PDFIN %PDFFILE2% <Op>            output  %PDFOUT%

Note: %PDFTK% (pdftk.exe full path) is suppressed in the version of the editable
template displayed to the user of the Advanced tool.

PDFtk Command Templates (T1, T2, T3, T4, T5) and Applicable Operations:

<Op> denotes the place where the user should insert the pdftk operator:

  none/filter mode (T3)
  attach_files (T4), unpack_files (T1),
  background (T4), stamp (T4), multibackground (T4), multistamp (T4),
  burst (T1),
  cat (T3, T5), shuffle (T5), rotate (T3),
  dump_data (T2), dump_data_utf8 (T2), update_info (T4), update_info_utf8 (T4),
  dump_data_fields (T2), dump_data_fields_utf8 (T2), dump_data_annots (T2),
  fill_form (T4), generate_fdf (T2)

The templates include files and folders but do not show <places> for optional arguments
which can be added by the user depending on the operation (<Op>).  These arguments are
not checked by the pdftkb advanced tool code below but may be rejected when pdftk runs
to execute the supplied command string if user has made an error.

  %PDFIN% = Source PDF file on Tools tab sheet
  %PDFFILE2% = Secondary input file on Tools tab sheet (applies to T5/cat, shuffle)
  %ANYFILE2% = Secondary inpuut file on Tools tab sheet (applies to T4/attach_files)
  %PDFOUT% = PDF file selected from Build save dialog on Tools tab sheet
  %TXTOUT% = Text output file (auto-named based on %PDFIN% and operation; applies to T2/dump*, generate_fdf))
  %TXTFILE2% = input text file (uses same auto-name as corresponding %TXTOUT% file; applies to T4/update_info, fill_form)
  %FOLDER% = Output folder (defaults to %PDFIN% folder byt can be changed by user; applies to T1/burst, unpack_files)

  T1: %PDFTK% %PDFIN% <Op> output %FOLDER%
      1: Folder: burst, unpack_files (files output to %FOLDER%, burst output section specifies file name, e.g. output page_%03d.pdf)

  T2: %PDFTK% %PDFIN% <Op> output %TXTOUT%
      1: %TXTOUT%: dump_data, dump_data_utf8, dump_data_fields, dump_data_fields_utf8,
         dump_data_annots, generate_fdf (output .TXT file to %PDFIN% folder with same name
         as %PDFIN% but with .pdf ext replaced with _data.txt, _data_utf8.txt,  _fields.txt,
          _fields_utf8.txt, _annots.txt, _fdf.txt)

  T3: %PDFTK% %PDFIN% <Op> output %PDFOUT%
      1: %PDFOUT: none (filter mode), cat, rotate

  T4: %PDFTK% %PDFIN% <Op> %XXXFILE2% output %PDFOUT%
      1: %PDFFILE2%: background, multibackground, stamp, multistamp
      2: %TXTFILE2%: update_info, update_info_utf8, fill_form (same file names as in T2)
      3: %ANYFILE2%: attach_files

   T5. %PDFTK% A=%PDFIN% B=%PDFFILE2% <Op> output %PDFOUT%
      1: %PDFFILE2%: cat, shuffle

*)

procedure TMainForm.DoAdvanced;
var
  Op : TStringList;
  sr : TSearchRec;
  action, dataExt, s, sDir, sDump, sOp, sOpTemplate, sPdftk, sTemplate, sFilter: string;
  i, index, numMatches : integer;
  //RenameNeeded: Boolean;
begin
  action := '';
  fErrorCode := 'A01';
  // RenameNeeded := false;
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := eAdvanced.Text;
  sTemplate := btnAdvancedTemplate.Caption;

  // Check that %PDFIN% has not been edited out (present in all T1 - T5)
  if NOT AnsiContainsText(s, '%PDFIN%') then exit;

  // Placeholders <op> and XXX in %XXXFILE2% need to be edited (replaced) by user
  fErrorCode := 'A02';
  if AnsiContainsText(s, '<op>') then exit;     // (T1 - T5)
  fErrorCode := 'A03';
  if AnsiContainsText(s, '%XXXFILE2') AND (sTemplate <> 'T4') then exit; // (T4)
  if AnsiContainsText(s, '%XXXFILE2') then
  begin
    sFilter := btnAdvancedFilter.Caption;
    if (sFilter = 'PDF') then s := AnsiReplaceStr(s, '%XXXFILE2%', '%PDFFILE2%')
    else if (sFilter = 'TXT') then s := AnsiReplaceStr(s, '%XXXFILE2%', '%TXTFILE2%')
    else if (sFilter = 'ANY') then s := AnsiReplaceStr(s, '%XXXFILE2%', '%ANYFILE2%');
    eAdvanced.Text := s;
  end;

  // Find at most one valid pdftk <Op> in command string
  fErrorCode := 'A04';
  Op := TStringList.Create;
  Op.CommaText := 'attach_files, background, burst, cat, dump_data, dump_data_annots, dump_data_fields, dump_data_fields_utf8, dump_data_utf8, fill_form, generate_fdf, multibackground, multistamp, rotate, shuffle, stamp, unpack_files, update_info, update_info_utf8';
  index := -1; numMatches :=0;
  for i := 0 to Op.Count - 1 do
    begin
      If AnsiContainsText(s, Op[i]) then
        begin
          index := i;
          numMatches := numMatches +1;
        end;
    end;
  if numMatches > 1 then exit;
  if numMatches = 0 then sOp := '' else sOp := Op[index];
  Op.Free;
  fAdvancedOp := sOp;

  // Check that %PDFOUT% is still present in T3-T5 and not in T1-T2
  fErrorCode := 'A05';
  if (sTemplate < 'T3') AND AnsiContainsText(s, '%PDFOUT%') then exit;
  if (sTemplate > 'T2') AND (NOT AnsiContainsText(s, '%PDFOUT%')) then exit;

  // T2-T5 still contains the word 'output', T1 can contain 'output' and %FOLDER% or neither
  if (sTemplate <> 'T1') AND (NOT AnsiContainsText(s, 'output')) then exit;

  // %FOLDER% is only valid in T1
  if (sTemplate > 'T1') AND AnsiContainsText(s, '%FOLDER%') then exit;

  //  %TXTOUT% is only valid in T2
  if (sTemplate <> 'T2') AND AnsiContainsText(s, '%TXTOUT%') then exit;

  // Check that FILE2% is still present in T4-T5 and not in T1-T3
  if (sTemplate < 'T4') AND AnsiContainsText(s, 'FILE2%') then exit;
  if (sTemplate > 'T3') AND (NOT AnsiContainsText(s, 'FILE2%')) then exit;

  // Check that user-specified <op> is valid choice for templates T1-T5
  fErrorCode := 'A06';
  sOpTemplate := 'burst, unpack_files';
  if AnsiContainsText(sOpTemplate, sOp) AND (sTemplate <> 'T1') then exit;
  sOpTemplate := 'dump_data, dump_data_utf8, dump_fields, dump_fields_utf8, dump_annots, generate_fdf';
  if AnsiContainsText(sOpTemplate, sOp) AND (sTemplate <> 'T2') then exit;
  if (sOp = '') AND (sTemplate <> 'T3') then exit;
  if (sOp = 'rotate') AND (sTemplate <> 'T3') then exit;
  if (sOp = 'cat') AND (NOT((sTemplate = 'T3') OR (sTemplate = 'T5'))) then exit;
  sOpTemplate := 'background, multibackground, stamp, multistamp';
  if AnsiContainsText(sOpTemplate, sOp) AND AnsiContainsText(s, '%PDFFILE2%') AND (sTemplate <> 'T4') then exit;
  sOpTemplate := 'update_info, update_info_utf8, fill_form';
  if AnsiContainsText(sOpTemplate, sOp) AND AnsiContainsText(s, '%TXTFILE2%') AND (sTemplate <> 'T4') then exit;
  if (sOp = 'attach_files') AND AnsiContainsText(s, '%ANYFILE2%') AND (sTemplate <> 'T4') then exit;
  sOpTemplate := 'cat, shuffle';
  if AnsiContainsText(sOpTemplate, sOp) AND AnsiContainsText(s, '%PDFFILE2%') AND (sTemplate <> 'T5') then exit;

  // Check that not more than one %XXXFILE2% is present (T4, T5)
  fErrorCode := 'A07';
  if AnsiContainsText(s, '%PDFFILE2%') then
    begin
    if (AnsiContainsText(s, '%TXTFILE2%') OR AnsiContainsText(s, '%ANYFILE2%')) then exit;
    if (fSecondaryInputFile = '') OR (NOT FileExists(fSecondaryInputFile)) then exit;
    if extractFileExt(fSecondaryInputFile) <> '.pdf' then exit;
    CopyFile(pchar(fSecondaryInputFile), pchar('file2.pdf'), false);
    end;
  if AnsiContainsText(s, '%TXTFILE2%') then
    begin
    if (AnsiContainsText(s, '%PDFFILE2%') OR AnsiContainsText(s, '%ANYFILE2%')) then exit;
    if (sOp <> 'update_info') OR (sOp <> 'fill_form') then exit;
    if (fSecondaryInputFile = '') OR (NOT FileExists(fSecondaryInputFile)) then exit;
    if NOT ((extractFileExt(fSecondaryInputFile) = '.txt') OR (extractFileExt(fSecondaryInputFile) = '.fdf')) then exit;
    CopyFile(pchar(fSecondaryInputFile), pchar('file2.txt'), false);
    end;
  if AnsiContainsText(s, '%ANYFILE2%') then
    begin
    if (AnsiContainsText(s, '%PDFFILE2%') OR AnsiContainsText(s, '%TXTFILE2%')) then exit;
    if (sOp <> 'attach_files') then exit;
    if (fSecondaryInputFile = '') OR (NOT FileExists(fSecondaryInputFile)) then exit;
    end;

  fErrorCode := ''; // No errors encountered in parsing edited command template

  if AnsiContainsText(s, '%TXTOUT%') then
    begin
      if sOp = 'dump_data' then dataExt := '_data.txt' else
      if sOp = 'dump_data_fields' then dataExt := '_fields.txt' else
      if sOp = 'dump_annots' then dataExt := '_annots.txt' else
      if sOp = 'dump_data_utf8' then dataExt := '_data_utf8.txt' else
      if sOp = 'dump_data_fields_utf8' then dataExt := '_fields_utf8.txt' else
      if sOp = 'generate_fdf' then dataExt := '_fdf.txt' else exit;
    end;

//  if AnsiContainsText(s, '%PDFOUT%') then
//    begin
//      if NOT SaveDialog1.Execute then exit;
//      if fSrcTools = SaveDialog1.FileName then RenameNeeded := true else RenameNeeded := false;
//    end;

  s := AnsiReplaceStr(s, '%PDFIN%', 'src.pdf');
  s := AnsiReplaceStr(s, '%PDFOUT%', 'dst.pdf');
  s := AnsiReplaceStr(s, '%TXTOUT%', '"' + ChangeFileExt(fSrcTools, dataExt) + '"');
  s := AnsiReplaceStr(s, '%PDFFILE2%', 'file2.pdf');
  s := AnsiReplaceStr(s, '%TXTFILE2%', 'file2.txt');
  s := AnsiReplaceStr(s, '%ANYFILE2%', '"' + fSecondaryInputFile + '"');
  if (sOp = 'unpack_files') then s := AnsiReplaceStr(s, '%FOLDER%', '"' + fSecondaryInputFile + '"');
  if (sOp = 'burst') then s := AnsiReplaceStr(s, '%FOLDER%', '');

  sPdftk := '"' + path + 'pdftk.exe' + '"';
  s := sPdftk + ' ' + s;

  s := format('%s %s %s %s dont_ask', [s, allowParams, ownerParam, userParam]);
  showMessage(s);
  executeCommand(s);

  s := eAdvanced.Text;
  if AnsiContainsText(s, '%PDFOUT%') then
    begin
//      if RenameNeeded then
//        begin
//          s := ChangeFileExt(SaveDialog1.FileName, '_bak.pdf');
//          RenameFile(SaveDialog1.FileName, s);
//        end;
//      s := tmpPath+'dst.pdf';
//      CopyFile(pchar(s), pchar(SaveDialog1.FileName),false);
      if FileExists(SaveDialog1.FileName) then
        DeleteFile(SaveDialog1.FileName);
      RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
    end;

  if sOp = 'burst'then
    begin
      // Rename and move the doc_data.txt dump file produced by burst to destination folder
      // fSecondaryInputFile contains the path for the destination folder %FOLDER%
      DeleteFile('src.pdf');
      if AnsiContainsText(eAdvanced.Text, '%FOLDER%') then
      begin
        // %FOLDER% present implies only file name spec (in quotes) entered for page files
        // Move the individual page files to the destination folder
        // Page files may be named differently than source file, e.g. pg_%04d.pdf
        s := tmpPath + 'doc_data.txt';
        sDump := ExtractFileName(fSrcTools);
        sDump := fSecondaryInputFile + '\' + ChangeFileExt(sDump, '_data.txt');
        if FileExists(sDump) then
          DeleteFile(sDump);
        RenameFile(s, sDump);
        i := FindFirst('*.pdf', faAnyFile, sr);
        while i = 0 do
        begin
          SetFileAttributes(pchar(sr.Name), 0); //remove read-only etc
          fSaveFile := fSecondaryInputFile + '\' + sr.Name;
          if FileExists(fSaveFile) then
            DeleteFile(fSaveFile);
          RenameFile(sr.Name, fSaveFile);
          i := FindNext(sr);
        end;
      FindClose(sr);
      end
      else
      begin
      // %FOLDER% not present implies full path spec (in quotes) entered for page files
      // Extract full path of page files delimited by quotes, then find last page file in folder
        s := eAdvanced.Text;
        i := Pos('"',s);
        s := AnsiMidStr(s, i+1, length(s)-i);
        i := Pos('"',s);
        s := AnsiLeftStr(s, i-1);
        sDump := ExtractFileName(fSrcTools);
        sDir := extractFileDir(s);
        sDump := sDir + '\' + ChangeFileExt(sDump, '_data.txt');
        if FileExists(sDump) then
          DeleteFile(sDump);
        RenameFile(sDir + '\' + 'doc_data.txt', sDump);
        i := Pos('%0',s);
        s := AnsiLeftStr(s, i-1);
        s := s + '*.pdf';
        i := FindFirst(s, faAnyFile, sr);
        while i = 0 do
        begin
          SetFileAttributes(pchar(sr.Name), 0); //remove read-only etc
          fSaveFile := sDir + '\' + sr.Name;
          i := FindNext(sr);
        end;
      FindClose(sr);
      end;
      SaveDialog1.FileName := fSaveFile;
    end;

end;

//------------------------------------------------------------------------------

procedure TMainForm.DoDumpData;
var
  action, s, sDumpFile: string;
begin
  action := 'dump_data';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf dump_data output dump_data.txt %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);

  sDumpFile := ChangeFileExt(fSrcTools, '_data.txt');
  s := tmpPath+'dump_data.txt';
  CopyFile(pchar(s), pchar(sDumpFile),false);
  ViewFile(sDumpFile, fTxtExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoUpdate;
var
  action, s, sUpdateFile: string;
begin
  action := 'update_info';
  sUpdateFile := ChangeFileExt(fSrcTools, '_data.txt');
  fErrorCode := 'D01';
  if not FileExists(sUpdateFile) then exit;
  fErrorCode := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);
  CopyFile(pchar(sUpdateFile), 'update_info.txt', false);

  s := format('"%spdftk.exe" src.pdf update_info update_info.txt output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoAttach;
var
  action, s, sAttachment: string;
begin
  action := 'attach_files';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);
  sAttachment := extractFilename(fAttachment);
  CopyFile(pchar(fAttachment), pchar(sAttachment), false);

  s := format('"%spdftk.exe" src.pdf attach_files "%s" output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, sAttachment, allowParams, ownerParam, userParam]);
    executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoUnpack;
var
  action, s: string;
begin

  action := 'unpack_files';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf unpack_files output "%s" dont_ask',
      [fPdftkPath, fUnpackFolder]);
    executeCommand(s);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoDumpFields;
var
  action, s, sDumpFile: string;
begin
  action := 'dump_fields';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf dump_data_fields output dump_data_fields.txt %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);

  sDumpFile := ChangeFileExt(fSrcTools, '_fields.txt');
  s := tmpPath+'dump_data_fields.txt';
  CopyFile(pchar(s), pchar(sDumpFile),false);
  ViewFile(sDumpFile, fTxtExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoGenFDF;
var
  action, s, sFdfFile: string;
begin
  action := 'dump_data';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf generate_fdf output fdf.txt %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
    executeCommand(s);

  sFdfFile := ChangeFileExt(fSrcTools, '_fdf.txt');
  s := tmpPath+'fdf.txt';
  CopyFile(pchar(s), pchar(sFdfFile),false);
  ViewFile(sFdfFile, fTxtExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoFillForm;
var
  action, s, sUpdateFile: string;
begin
  action := 'fill_form';
  sUpdateFile := ChangeFileExt(fSrcTools, '_fdf.txt');
  fErrorCode := 'D02';
  if not FileExists(sUpdateFile) then exit;
  fErrorCode := '';  
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);
  CopyFile(pchar(sUpdateFile), 'fill_form.txt', false);

  s := format('"%spdftk.exe" src.pdf fill_form fill_form.txt output dst.pdf %s %s %s dont_ask',
      [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;

//------------------------------------------------------------------------------

procedure TMainForm.DoFlatten;
var
  action, s: string;
begin
  action := '';
  ChDir(tmpPath);
  CopyFile(pchar(fSrcTools), 'src.pdf', false);

  s := format('"%spdftk.exe" src.pdf output dst.pdf flatten %s %s %s dont_ask',
   [fPdftkPath, allowParams, ownerParam, userParam]);
  executeCommand(s);

  if FileExists(SaveDialog1.FileName) then
    DeleteFile(SaveDialog1.FileName);
  RenameFile(tmpPath + 'dst.pdf', SaveDialog1.FileName);
end;


//------------------------------------------------------------------------------
//          TMainForm Build-Button Methods
//------------------------------------------------------------------------------

procedure TMainForm.btnBuildClick(Sender: TObject);
var
  sel : TGridRect;
  s, sfullpath, sfilename, scurPath, ssize : string;
  pagecount, fsize, w : integer;
  pdfGenerated, pdfGenerated_1, pdfGenerated_2: boolean;
begin
  statusbar1.SimpleText := '  Version ' + GetVersion();
  ErrorNum := 0;
  btnBuild.Enabled := false;
  scurPath := GetCurrentDir;
  try try
    if not FileExists(fPdftkPath+'pdftk.exe') then
      raise Exception.Create('pdftk.exe not found in the app folder (default) or .ini-configured path.');

    if (eUserPassword.text = '') then
      userParam := '' else
      userParam := 'user_pw ' + eUserPassword.text;

    if (eOwnerPassword.text = '') then
      ownerParam := '' else
      ownerParam := 'owner_pw ' + eOwnerPassword.text;

    allowParams := '';
    if (ownerParam <> '') or (userParam <> '') then
    begin
      if cbAllowAll.Checked then
        allowParams := 'allow allfeatures '
      else
      begin
        if cbPrinting.Checked then allowParams := allowParams + 'printing ';
        if cbDegradedPrinting.Checked then allowParams := allowParams + 'degradedprinting ';
        if cbModifyContents.Checked then allowParams := allowParams +'modifycontents ';
        if cbAssembly.Checked then allowParams := allowParams +'assembly ';
        if cbCopyContents.Checked then allowParams := allowParams +'copycontents ';
        if cbScreenReaders.Checked then allowParams := allowParams +'screenreaders ';
        if cbModifyAnnotations.Checked then allowParams := allowParams +'modifyannotations ';
        if cbFillIn.Checked then allowParams := allowParams +'fillin ';
        if allowParams <> '' then allowParams := 'allow ' + allowParams;
      end;
    end;

    DeleteAllTmpFiles;
    // ForceDirectories(tmpPath);

    if (PageControl1.ActivePage = tsCollate) and (fFileList.Count > 0) then
      begin
      sel := StringGrid1.Selection;
      SaveDialog1.FileName :=  PSourceFileRec(fFileList.Objects[sel.Top]).FullPath;
      end
    else if (PageControl1.ActivePage = tsBackground) then
      SaveDialog1.Filename := fSrcBackground
    else if (PageControl1.ActivePage = tsRotate) then
      SaveDialog1.FileName := fSrcRotate
    else if (PageControl1.ActivePage = tsTools) then
      SaveDialog1.FileName := fSrcTools;

    // Before building, check that default output PDF file is not already open in another app
       
    if PageControl1.ActivePage = tsCollate then
    begin
      if (fFileList.Count = 0) or not SaveDialog1.Execute then exit;
      IsSaveFileInUse;
      DoCollateFiles;                                //JOIN
    end
    else if PageControl1.ActivePage = tsSplit then
      DoSplitFile                                   //SPLIT
    else if PageControl1.ActivePage = tsBackground then
    begin
      if not fileExists(fSrcBackground) or
        not SaveDialog1.Execute then exit;
      IsSaveFileInUse;
      if rbPageNumber.Checked then
        DoPageNumber else                           //PAGE NUMBER
        DoBackgroundStamp(rbBackground.Checked);    //BACKGROUND/STAMP
    end
    else if PageControl1.ActivePage = tsRotate then
    begin
      if not SaveDialog1.Execute then exit;
      IsSaveFileInUse;
      DoRotate;                                     //ROTATE
    end
    else if PageControl1.ActivePage = tsTools then
    begin
      if fToolsAction = 'Dump Data' then DoDumpData
      else if fToolsAction = 'Unpack Files' then DoUnpack
      else if fToolsAction = 'Dump Fields' then DoDumpFields
      else if fToolsAction = 'Gen FDF' then DoGenFDF
      else if (fToolsAction = 'Advanced') AND (btnAdvancedTemplate.Caption = 'T2') then DoAdvanced
      else if not SaveDialog1.Execute then exit;
      IsSaveFileInUse;
      if fToolsAction = 'Update Info' then DoUpdate
      else if fToolsAction = 'Attach File' then DoAttach
      else if fToolsAction = 'Decrypt' then DoDecrypt
      else if fToolsAction = 'Repair' then DoRepair
      else if fToolsAction = 'Uncompress' then DoUncompress
      else if fToolsAction = 'Compress' then DoCompress
      else if fToolsAction = 'Fill Form' then DoFillForm
      else if fToolsAction = 'Flatten' then DoFlatten
      else if fToolsAction = 'Advanced' then DoAdvanced;
    end;

    pdfGenerated := (PageControl1.ActivePage <> tsTools);
    pdfGenerated_1 := (PageControl1.ActivePage = tsTools) AND
      (NOT AnsiContainsText('Unpack Files, Dump Data, Dump Fields, Gen FDF, Advanced, Launch, Compare', fToolsAction));
    pdfGenerated_2 := (PageControl1.ActivePage = tsTools) AND (fToolsAction = 'Advanced') AND
      (NOT (Leftstr(fAdvancedOp, 4) = 'dump')) AND (NOT (fAdvancedOp = 'generate_fdf'));
    pdfGenerated := pdfGenerated OR pdfGenerated_1 OR pdfGenerated_2;

    // Display ouput PDF file name, pages and size on status bar if PDF created or modified
    if pdfGenerated AND (fErrorCode = '') then
    begin
    sfullpath := SaveDialog1.FileName;
    ClipBoard.AsText := '"' + sfullpath + '"';
  	fSaveFile := sfullpath;
    bViewSave.Enabled :=true;
    bLocate.Enabled := true;
    bPipe.Enabled := true;
    sfilename := extractFilename(sfullpath);
    pagecount :=GetPdfPageCount(sfullpath);
    // if pagecount < 1 then pagecount := GetRepairedPageCount(sfullpath);
    if pagecount <1 then
      s := format('%s (?)', [sfilename])
    else
      s := format ('%s (%d)', [sfilename, pagecount]);
    w := lblSaveFilename.Width - 40;
    lblSaveFilename.Caption := TruncateString(s, 36, w);
    s := TruncateString(s, 36, w-10);
    fsize := FileSize(sfullPath);
    fsize := (fsize shr 10) + 1;
    ssize := inttostr(fsize);
    if length(ssize) = 4 then insert(',', ssize, 2);
    statusbar1.SimpleText := '  ' + s + ' saved. [' + ssize + ' KB]';
    end;

    if (fErrorCode <> '') then
    begin
      statusbar1.SimpleText := '  ' + 'ERROR ' + fErrorCode;
      fErrorCode := '';
    end;

  except
    on E: Exception do
      ProcessError(E.Message);
  end;
  finally
    ChDir(scurPath);
    btnBuild.Enabled := true;
    DeleteAllTmpFiles;
  end;

end;

//------------------------------------------------------------------------------

procedure TMainForm.bViewSaveClick(Sender: TObject);
begin
  ViewFile(fSaveFile, fPdfExe);
end;

//------------------------------------------------------------------------------

procedure TMainForm.bLocateClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'explorer.exe',
    pChar('/select,"' + fSaveFile +'"'), nil, SW_SHOWNORMAL);
end;

//------------------------------------------------------------------------------

procedure TMainForm.bPipeClick(Sender: TObject);
var
  sfullpath, sfilename : string;
  pagecount : integer;
  SourceFileRec: PSourceFileRec;
begin
  sfullpath := fSaveFile;
  fPipe := true;
  fPipeFullpath := sfullpath;
  if PageControl1.ActivePage = tsCollate
  then
    begin
      fPipe := false;
      sfilename := extractFilename(sfullpath);
      pagecount :=GetPdfPageCount(sfullpath);
      if pagecount < 1 then pagecount := GetRepairedPageCount(sfullpath);
      new(SourceFileRec);
      SourceFileRec.FullPath := sfullpath;
      SourceFileRec.Filename := sfilename;
      SourceFileRec.PageCount := pagecount;
      fFileList.AddObject(SourceFileRec.FullPath, pointer(SourceFileRec));
      RefreshGrid(StringGrid1.Selection.Top);
      UpdateButtonsAndMenus(StringGrid1.Selection.Top);
      tsCollateResize(nil); //in case vert scrollbar appears
    end
  else if PageControl1.ActivePage = tsSplit then
    begin
      btnSrcSplitClick(nil);
    end
  else if PageControl1.ActivePage = tsBackground then
    begin
      btnSrcBackgroundClick(nil);
    end
  else if PageControl1.ActivePage = tsRotate then
    begin
      btnSrcRotateClick(nil);
    end
  else if PageControl1.ActivePage = tsTools then
    begin
      btnSrcToolsClick(nil);
    end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.bCloseClick(Sender: TObject);
begin
  close;
end;

//------------------------------------------------------------------------------

procedure TMainForm.LoadIniFileInfo;
var
  sfullpath, fn : string;
  pagecount : integer;
begin
  fn := ChangeFileExt(paramstr(0),'.ini');
  with TIniFile.Create(fn) do
  try
    // Retrieve position (offset from top left corner of desktop) where main form was last closed ...
    origin.X := ReadInteger(user, 'PosLeft', 0);
    origin.Y := ReadInteger(user, 'PosTop', 0);
    Expanded := ReadBool(user, 'Expanded', false);
    
    // Retrieve default stamp file (if any)
    fBackground := ReadString(user,'BackgroundFile','');
    if (fBackground <> '') and not FileExists(fBackground) then
      fBackground := '';
    if (fBackground <> '') then
      begin
        sfullpath := fBackground;
        pagecount :=GetPdfPageCount(sfullpath);
        if pagecount < 1 then pagecount := GetRepairedPageCount(sfullpath);
        if pagecount < 2 then fBackgroundPageCount := 1
          else fBackgroundPageCount := pagecount
      end;

    // Page numbering params are (SizeX Y, OffsetX Y, FontSize) in units of 'points' (
    // 1/72 inch), i.e., page width and height, horizontal offset (left/right margin)
    // and vertical offset (header/footer height), and font size
    // Settings in .ini file are only for portrait orientation.  Corresponding
    // values for landscape mode are calculated by program from the .ini values.

    // Default settings (SizeX Y, OffsetX Y, FontSize) for ISO A4 paper are :
    //     595, 842, 72, 36, 10     (Typical A4 page margins are 25 mm = 1" = 72 pts)
    // Edit .ini file to change paper size - ref. https://en.wikipedia.org/wiki/Paper_size
    // Default settings for letter size paper are:
    //     612, 792, 72, 36, 10     (8.5x11, x=1 in, y=0.5 in, font=10 pt)

    // fNumPageSize.cx := ReadInteger('Numbering', 'PageWidth', 595);
    // fNumPageSize.cy := ReadInteger('Numbering', 'PageHeight', 842);
    // fNumOffset.cx := ReadInteger('Numbering', 'NumOffsetX', 72);
    // fNumOffset.cy := ReadInteger('Numbering', 'NumOffsetY', 36);
    // fNumSize := ReadInteger('Numbering', 'NumSize', 10);

    fNumPageSize.cx := ReadInteger('Numbering', 'PageWidth', 595);
    fNumPageSize.cy := ReadInteger('Numbering', 'PageHeight', 842);
    fNumOffset.cx := ReadInteger('Numbering', 'NumOffsetX', 72);
    fNumOffset.cy := ReadInteger('Numbering', 'NumOffsetY', 36);
    fNumSize := ReadInteger('Numbering', 'NumSize', 10);
    fNumDateTimeFormat := ReadString('Numbering', 'DateTimeFormat', 'ddddd');

    // Initialize page number position to default (.ini) Portrait-Bottom-Right
    NumPageSize.cx := fNumPageSize.cx;
    NumPageSize.cy := fNumPageSize.cy;
    NumOffset.cx := fNumOffset.cx;
    NumOffset.cy := fNumOffset.cy;

    fPdftkVersion := ReadString('Applications','PdftkVersion','2.02');
    if fPdftkVersion = '' then fPdftkVersion := '2.02';
    if fPdftkVersion < '2.00' then
    begin
      lblRotatePages.Visible := false;
      eRotPages.Visible := false;
    end else
    begin
      lblRotatePagesFrom.Visible := false;
      lblRotatePagesTo.Visible := false;
      eRotPagesFrom.Visible := false;
      eRotPagesTo.Visible := false;
    end;
    fPdftkPath := ReadString('Applications','PdftkPath','');
    fPdfExe :=   ReadString('Applications','PdfExe','');
    if (NOT FileExists(fPdfExe)) then fPdfExe := '';
    // if no app specified (i.e., use default app), no Arg can be specified
    if fPdfExe = '' then fPdfArg := '' else fPdfArg := ReadString('Applications','PdfArg','');
    // For non-default xxxApp, xxxArg must always contain the file placeholder %XXXFILE%
    if (fPdfExe <> '') AND (NOT AnsiContainsText(fPdfArg, '%PDFFILE%')) then fPdfArg := '%PDFFILE%';
    fTxtExe :=   ReadString('Applications','TxtExe','');
    if (NOT FileExists(fTxtExe)) then fTxtExe := '';
    if fTxtExe = '' then fTxtArg := '' else fTxtArg := ReadString('Applications','TxtArg','');
    if (fTxtExe <> '') AND (NOT AnsiContainsText(fTxtArg, '%TXTFILE%')) then fTxtArg := '%TXTFILE%';
    fCompareExe := ReadString('Applications','CompareExe','');
    fCompareArg := ReadString('Applications','CompareArg','');
    fApp1Item := ReadString('Applications','App1Item','');
    fApp1Exe :=  ReadString('Applications','App1Exe','');
    fApp1Arg :=  ReadString('Applications','App1Arg','');
    fApp2Item := ReadString('Applications','App2Item','');
    fApp2Exe :=  ReadString('Applications','App2Exe','');
    fApp2Arg :=  ReadString('Applications','App2Arg','');
    fApp3Item := ReadString('Applications','App3Item','');
    fApp3Exe :=  ReadString('Applications','App3Exe','');
    fApp3Arg :=  ReadString('Applications','App3Arg','');
    fApp4Item := ReadString('Applications','App4Item','');
    fApp4Exe :=  ReadString('Applications','App4Exe','');
    fApp4Arg :=  ReadString('Applications','App4Arg','');
    fApp5Item := ReadString('Applications','App5Item','');
    fApp5Exe :=  ReadString('Applications','App5Exe','');
    fApp5Arg :=  ReadString('Applications','App5Arg','');    

    if fApp1Item = '' then fApp1Exe := '';
    if fApp2Item = '' then fApp2Exe := '';
    if fApp3Item = '' then fApp3Exe := '';
    if fApp4Item = '' then fApp4Exe := '';
    if fApp5Item = '' then fApp5Exe := '';

    if fApp1Exe = '' then comboApplication.Items[0] := '1 - Undefined'
      else comboApplication.Items[0] := fApp1Item;
    if fApp2Exe = '' then comboApplication.Items[1] := '2 - Undefined'
      else comboApplication.Items[1] := fApp2Item;
    if fApp3Exe = '' then comboApplication.Items[2] := '3 - Undefined'
      else comboApplication.Items[2] := fApp3Item;
    if fApp4Exe = '' then comboApplication.Items[3] := '4 - Undefined'
      else comboApplication.Items[3] := fApp4Item;
    if fApp5Exe = '' then comboApplication.Items[4] := '5 - Undefined'
      else comboApplication.Items[4] := fApp5Item;

  finally
    free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.SaveIniFileInfo;
var
  fn: string;
begin
  fn := ChangeFileExt(paramstr(0),'.ini');
  with TIniFile.Create(fn) do
  try                     
    WriteInteger(user, 'PosLeft', left);
    WriteInteger(user, 'PosTop', top);
    WriteString(user,'BackgroundFile', fBackground);
    WriteBool(user, 'Expanded', expanded);

    //Do not alter .ini page number dimensions from portrait, bottom right
    //WriteInteger('Numbering', 'PageWidth', fNumPageSize.cx);
    //WriteInteger('Numbering', 'PageHeight', fNumPageSize.cy);
    //WriteInteger('Numbering', 'NumOffsetX', fNumOffset.cx);
    //WriteInteger('Numbering', 'NumOffsetY', fNumOffset.cy);
    //WriteInteger('Numbering', 'NumSize', fNumSize);

  finally
    free;
  end;
end;

//------------------------------------------------------------------------------

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SaveIniFileInfo;
end;

//------------------------------------------------------------------------------

//Below is a workaround for a Windows bug ...
//when opening an Open/Save dialog more than once and hovering over a filename
//causing a hint window to popup, the application will crash on Windows XP Sp2.
//(If you're sceptical about this being a Windows bug then check it out
//in Notepad.exe.)

initialization
  OleInitialize(nil);

finalization
  OleUninitialize;

end.






