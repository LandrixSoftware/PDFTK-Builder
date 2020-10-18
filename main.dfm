object MainForm: TMainForm
  Left = 451
  Top = 100
  ActiveControl = btnSrcTools
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PDFTK Builder'
  ClientHeight = 611
  ClientWidth = 549
  Color = clBtnFace
  Constraints.MinHeight = 418
  Constraints.MinWidth = 332
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    549
    611)
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 14
    Top = 7
    Width = 523
    Height = 290
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = tsTools
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    TabStop = False
    OnChange = PageControl1Change
    object tsCollate: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Join Files'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnResize = tsCollateResize
      object lblSourcePDFDocs: TLabel
        Left = 14
        Top = 7
        Width = 141
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Source PDF Document(s)'
        FocusControl = StringGrid1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lFilename: TLabel
        Left = 14
        Top = 196
        Width = 323
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        AutoSize = False
        Caption = '                                                                '
      end
      object lPages: TLabel
        Left = 361
        Top = 196
        Width = 42
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        Caption = '  Pa&ges'
        Enabled = False
        FocusControl = ePages
      end
      object lblSelected: TLabel
        Left = 158
        Top = 7
        Width = 70
        Height = 15
        AutoSize = False
        Caption = '...'
      end
      object lblMode: TLabel
        Left = 252
        Top = 7
        Width = 30
        Height = 15
        Caption = 'Mode'
      end
      object bAdd: TButton
        Left = 14
        Top = 224
        Width = 72
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '&Add ...'
        TabOrder = 7
        OnClick = bAddClick
      end
      object bDelete: TButton
        Left = 96
        Top = 224
        Width = 72
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'R&emove'
        Enabled = False
        TabOrder = 8
        OnClick = bDeleteClick
      end
      object bMoveUp: TButton
        Left = 262
        Top = 224
        Width = 72
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Move &Up'
        Enabled = False
        TabOrder = 10
        OnClick = bMoveUpClick
      end
      object bMoveDown: TButton
        Left = 345
        Top = 224
        Width = 72
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Move &Down'
        Enabled = False
        TabOrder = 11
        OnClick = bMoveDownClick
      end
      object StringGrid1: TStringGrid
        Left = 15
        Top = 27
        Width = 484
        Height = 155
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ColCount = 2
        DefaultColWidth = 100
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnClick = StringGrid1Click
        OnDblClick = bViewClick
      end
      object ePages: TEdit
        Left = 406
        Top = 192
        Width = 93
        Height = 23
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CharCase = ecLowerCase
        Enabled = False
        TabOrder = 6
        OnChange = ePagesChange
      end
      object btnSort: TButton
        Left = 179
        Top = 224
        Width = 72
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'S&ort'
        TabOrder = 9
        OnClick = btnSortClick
      end
      object cbShuffle: TCheckBox
        Left = 328
        Top = 5
        Width = 75
        Height = 17
        Caption = 'Interleave'
        TabOrder = 2
        OnClick = cbShuffleClick
      end
      object bView: TButton
        Left = 427
        Top = 224
        Width = 72
        Height = 24
        Caption = 'View-&1'
        TabOrder = 12
        OnClick = bViewClick
      end
      object btnResetAll: TButton
        Left = 469
        Top = 3
        Width = 30
        Height = 20
        Caption = 'All'
        TabOrder = 4
        OnClick = btnResetAllClick
      end
      object btnResetCollate: TButton
        Left = 413
        Top = 3
        Width = 50
        Height = 20
        Caption = 'Reset'
        TabOrder = 3
        OnClick = btnResetCollateClick
      end
      object btnGridMode: TButton
        Left = 285
        Top = 3
        Width = 20
        Height = 20
        Caption = '1'
        TabOrder = 1
        OnClick = btnGridModeClick
      end
      object btnRepairPageCount: TButton
        Left = 345
        Top = 194
        Width = 20
        Height = 20
        Caption = '?'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = btnRepairPageCountClick
      end
    end
    object tsSplit: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Split File'
      object LblSrcSplitFilename: TLabel
        Left = 25
        Top = 82
        Width = 465
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Source Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSplitFolder: TLabel
        Left = 25
        Top = 227
        Width = 465
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Output Folder Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedSplit: TLabel
        Left = 25
        Top = 11
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Selected Filename'
      end
      object lblSplitPagesFrom: TLabel
        Left = 147
        Top = 121
        Width = 90
        Height = 15
        AutoSize = False
        Caption = 'Split pages from'
      end
      object lblSplitPagesTo: TLabel
        Left = 302
        Top = 121
        Width = 10
        Height = 15
        AutoSize = False
        Caption = 'to'
      end
      object lblSplitChunkSize: TLabel
        Left = 175
        Top = 159
        Width = 62
        Height = 15
        Caption = 'Chunk Size'
      end
      object lblSplitChunkSizePages: TLabel
        Left = 302
        Top = 159
        Width = 35
        Height = 15
        Caption = 'pages'
      end
      object btnSrcSplit: TButton
        Left = 150
        Top = 52
        Width = 215
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'S&ource PDF Document ...'
        TabOrder = 0
        OnClick = btnSrcSplitClick
      end
      object btnSplitView: TButton
        Left = 415
        Top = 52
        Width = 75
        Height = 25
        Caption = 'View-&1'
        TabOrder = 5
        OnClick = btnSplitViewClick
      end
      object btnSplitReset: TButton
        Left = 25
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 2
        OnClick = btnSplitResetClick
      end
      object cbSrcSplit: TCheckBox
        Left = 200
        Top = 30
        Width = 120
        Height = 17
        Caption = '&Use Join Files List'
        TabOrder = 1
        OnClick = cbSrcSplitClick
      end
      object btnSplitFolder: TButton
        Left = 148
        Top = 196
        Width = 215
        Height = 25
        Caption = '&Change Output Folder ...'
        TabOrder = 9
        OnClick = btnSplitFolderClick
      end
      object btnSplitViewFolder: TButton
        Left = 415
        Top = 196
        Width = 75
        Height = 25
        Caption = 'Ope&n'
        TabOrder = 10
        OnClick = btnSplitViewFolderClick
      end
      object btnCopySrcSplitFrom: TButton
        Left = 113
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 3
        OnClick = btnCopySrcBackgroundFromClick
      end
      object btnCopySrcSplitTo: TButton
        Left = 378
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 4
        OnClick = btnCopySrcBackgroundToClick
      end
      object eSplitPagesFrom: TEdit
        Left = 247
        Top = 118
        Width = 45
        Height = 22
        AutoSize = False
        TabOrder = 6
        OnChange = eSplitPagesFromChange
      end
      object eSplitPagesTo: TEdit
        Left = 323
        Top = 118
        Width = 45
        Height = 22
        AutoSize = False
        TabOrder = 7
        OnChange = eSplitPagesToChange
      end
      object cbSplitOddEven: TCheckBox
        Left = 419
        Top = 121
        Width = 97
        Height = 17
        Caption = 'Odd/Even'
        TabOrder = 8
        OnClick = cbSplitOddEvenClick
      end
      object eSplitChunkSize: TEdit
        Left = 247
        Top = 156
        Width = 45
        Height = 23
        TabOrder = 11
        OnChange = eSplitChunkSizeChange
      end
    end
    object tsBackground: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Mark Pages'
      ImageIndex = 1
      object lblSource_background_filename: TLabel
        Left = 25
        Top = 82
        Width = 465
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Source Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBackgroundFilename: TLabel
        Left = 25
        Top = 223
        Width = 465
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Background Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedBackground: TLabel
        Left = 25
        Top = 11
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Selected Filename'
      end
      object lblNumTo: TLabel
        Left = 95
        Top = 210
        Width = 10
        Height = 15
        Caption = 'to'
        Visible = False
      end
      object btnNumOptions: TSpeedButton
        Left = 439
        Top = 154
        Width = 20
        Height = 20
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnClick = btnNumOptionsClick
      end
      object lblNumOptions: TLabel
        Left = 56
        Top = 190
        Width = 371
        Height = 15
        Caption = 
          '   Page Range               Starting Number                     ' +
          '[Prefix][%p][Suffix]'
        Visible = False
      end
      object btnNumPortrait: TSpeedButton
        Left = 285
        Top = 153
        Width = 20
        Height = 24
        Caption = 'P'
        OnClick = btnNumPortraitClick
      end
      object lblNumHint: TLabel
        Left = 2
        Top = 241
        Width = 510
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Hint: P/L=Portrait/Landscape; Text placeholders: %p=page #, %t=t' +
          'otal pages, %d=date, %n=file name '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btnSrcBackground: TButton
        Left = 150
        Top = 52
        Width = 215
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'S&ource PDF Document ...'
        TabOrder = 0
        OnClick = btnSrcBackgroundClick
      end
      object btnBackground: TButton
        Left = 150
        Top = 193
        Width = 215
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Background or Stamp P&DF Page ...'
        TabOrder = 11
        OnClick = btnBackgroundClick
      end
      object cbPageOneOnly: TCheckBox
        Left = 106
        Top = 155
        Width = 170
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'First Pa&ge'
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 84
        Top = 111
        Width = 346
        Height = 35
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 6
        object rbBackground: TRadioButton
          Left = 22
          Top = 10
          Width = 98
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Bac&kground'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbPageNumberClick
        end
        object rbStamp: TRadioButton
          Left = 135
          Top = 10
          Width = 65
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'St&amp'
          TabOrder = 0
          OnClick = rbPageNumberClick
        end
        object rbPageNumber: TRadioButton
          Left = 221
          Top = 10
          Width = 110
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '&Number Pages'
          TabOrder = 2
          OnClick = rbPageNumberClick
        end
      end
      object btnBackgroundView: TButton
        Left = 415
        Top = 52
        Width = 75
        Height = 25
        Caption = 'View-&1'
        TabOrder = 5
        OnClick = btnBackgroundViewClick
      end
      object btnBackgroundReset: TButton
        Left = 25
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 2
        OnClick = btnBackgroundResetClick
      end
      object btnBackgroundViewStamp: TButton
        Left = 415
        Top = 193
        Width = 75
        Height = 25
        Caption = 'View-&2'
        TabOrder = 12
        OnClick = btnBackgroundViewStampClick
      end
      object btnBackgroundResetStamp: TButton
        Left = 25
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 10
        OnClick = btnBackgroundResetStampClick
      end
      object comboPageNumber: TComboBox
        Left = 307
        Top = 153
        Width = 105
        Height = 23
        TabOrder = 9
        Text = 'Top-Left'
        OnChange = comboPageNumberChange
        Items.Strings = (
          'Top-Left'
          'Top-Center'
          'Top-Right'
          'Bottom-Left'
          'Bottom-Center'
          'Bottom-Right')
      end
      object cbSrcBackground: TCheckBox
        Left = 200
        Top = 30
        Width = 120
        Height = 17
        Caption = '&Use Join Files List'
        TabOrder = 1
        OnClick = cbSrcBackgroundClick
      end
      object cbMirror: TCheckBox
        Left = 219
        Top = 155
        Width = 50
        Height = 18
        Caption = 'Mirror'
        TabOrder = 8
      end
      object btnCopySrcBackgroundTo: TButton
        Left = 378
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 4
        OnClick = btnCopySrcBackgroundToClick
      end
      object btnCopySrcBackgroundFrom: TButton
        Left = 113
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 3
        OnClick = btnCopySrcBackgroundFromClick
      end
      object eNumPagesFrom: TEdit
        Left = 40
        Top = 207
        Width = 45
        Height = 23
        ParentCustomHint = False
        TabOrder = 13
        Visible = False
        OnChange = eNumPagesFromChange
      end
      object eNumPagesTo: TEdit
        Left = 116
        Top = 207
        Width = 45
        Height = 23
        TabOrder = 14
        Visible = False
        OnChange = eNumPagesToChange
      end
      object eNumStart: TEdit
        Left = 201
        Top = 207
        Width = 45
        Height = 23
        TabOrder = 15
        Visible = False
        OnChange = eNumStartChange
      end
      object eNumPrefix: TEdit
        Left = 285
        Top = 207
        Width = 190
        Height = 23
        TabOrder = 16
        Visible = False
      end
      object btnCopyBackgroundFrom: TButton
        Left = 113
        Top = 193
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 17
        OnClick = btnCopyBackgroundFromClick
      end
      object btnCopyBackgroundTo: TButton
        Left = 378
        Top = 193
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 18
        OnClick = btnCopyBackgroundToClick
      end
    end
    object tsRotate: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Rotate Pages'
      ImageIndex = 3
      object lblRotatePagesFrom: TLabel
        Left = 136
        Top = 121
        Width = 105
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        Caption = 'Rotate pages from '
        FocusControl = eRotPagesFrom
      end
      object lblRotatePagesTo: TLabel
        Left = 302
        Top = 121
        Width = 10
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        Caption = 'to'
        FocusControl = eRotPagesTo
      end
      object lblSrcRotateFilename: TLabel
        Left = 25
        Top = 82
        Width = 465
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Source Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedRotate: TLabel
        Left = 25
        Top = 11
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Selected Filename'
      end
      object lblRotatePages: TLabel
        Left = 116
        Top = 117
        Width = 74
        Height = 15
        Caption = 'Rotate pages'
      end
      object eRotPagesFrom: TEdit
        Left = 247
        Top = 118
        Width = 45
        Height = 22
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CharCase = ecLowerCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = eRotPagesFromChange
      end
      object btnSrcRotate: TButton
        Left = 150
        Top = 52
        Width = 215
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'S&ource PDF Document ...'
        TabOrder = 0
        OnClick = btnSrcRotateClick
      end
      object GroupBox2: TGroupBox
        Left = 56
        Top = 155
        Width = 410
        Height = 38
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 8
        object rbRotLeft: TRadioButton
          Left = 19
          Top = 11
          Width = 91
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'L&eft 90'#186
          TabOrder = 1
          OnClick = rbRotLeftClick
        end
        object rbRotRight: TRadioButton
          Left = 90
          Top = 11
          Width = 94
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Ri&ght 90'#186
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbRotRightClick
        end
        object rbRot180: TRadioButton
          Left = 168
          Top = 11
          Width = 85
          Height = 15
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '&Down 180'#186
          TabOrder = 2
          OnClick = rbRotateDownClick
        end
        object rbRotExtract: TRadioButton
          Left = 280
          Top = 10
          Width = 60
          Height = 17
          Caption = 'Extract'
          TabOrder = 3
          OnClick = rbRotExtractClick
        end
        object rbRotDelete: TRadioButton
          Left = 342
          Top = 10
          Width = 113
          Height = 17
          Caption = 'Delete'
          TabOrder = 4
          OnClick = rbRotDeleteClick
        end
      end
      object eRotPagesTo: TEdit
        Left = 323
        Top = 118
        Width = 45
        Height = 22
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        CharCase = ecLowerCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = eRotPagesToChange
      end
      object btnRotateView: TButton
        Left = 415
        Top = 52
        Width = 75
        Height = 25
        Caption = 'View-&1'
        TabOrder = 5
        OnClick = btnRotateViewClick
      end
      object btnRotateReset: TButton
        Left = 25
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 2
        OnClick = btnRotateResetClick
      end
      object cbSrcRotate: TCheckBox
        Left = 200
        Top = 30
        Width = 120
        Height = 17
        Caption = '&Use Join Files List'
        TabOrder = 1
        OnClick = cbSrcRotateClick
      end
      object btnCopySrcRotateTo: TButton
        Left = 378
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 4
        OnClick = btnCopySrcBackgroundToClick
      end
      object btnCopySrcRotateFrom: TButton
        Left = 113
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 3
        OnClick = btnCopySrcBackgroundFromClick
      end
      object eRotPages: TEdit
        Left = 200
        Top = 114
        Width = 200
        Height = 23
        TabOrder = 9
        OnChange = eRotPagesChange
      end
    end
    object tsTools: TTabSheet
      Caption = '&Tool Sets'
      ImageIndex = 4
      object lblSelectedTools: TLabel
        Left = 25
        Top = 11
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Selected Filename'
      end
      object lblSrcToolsFilename: TLabel
        Left = 25
        Top = 82
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Source Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblToolsFile2Filename: TLabel
        Left = 25
        Top = 223
        Width = 465
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Attachment Filename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblDecryptPassword: TLabel
        Left = 137
        Top = 162
        Width = 60
        Height = 15
        AutoSize = False
        Caption = 'Password'
        Visible = False
      end
      object lblApplication: TLabel
        Left = 78
        Top = 163
        Width = 60
        Height = 15
        Caption = 'Application'
      end
      object lblToolsSet: TLabel
        Left = 10
        Top = 103
        Width = 18
        Height = 15
        AutoSize = False
        Caption = 'Set'
      end
      object lblAdvancedHint: TLabel
        Left = 2
        Top = 241
        Width = 510
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Advanced Template Hint'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eDecryptPassword: TEdit
        Left = 200
        Top = 158
        Width = 127
        Height = 23
        AutoSize = False
        TabOrder = 9
        Visible = False
      end
      object cbSrcTools: TCheckBox
        Left = 200
        Top = 30
        Width = 120
        Height = 17
        Caption = '&Use Join Files List'
        TabOrder = 1
        OnClick = cbSrcToolsClick
      end
      object btnSrcTools: TButton
        Left = 150
        Top = 52
        Width = 215
        Height = 25
        Caption = 'S&ource PDF Document ...'
        TabOrder = 0
        OnClick = btnSrcToolsClick
      end
      object btnToolsReset: TButton
        Left = 25
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 2
        OnClick = btnToolsResetClick
      end
      object btnToolsView: TButton
        Left = 415
        Top = 52
        Width = 75
        Height = 25
        Caption = 'View-&1'
        TabOrder = 5
        OnClick = btnToolsViewClick
      end
      object GroupBox3: TGroupBox
        Left = 40
        Top = 111
        Width = 435
        Height = 35
        TabOrder = 7
        object rbTools4: TRadioButton
          Left = 328
          Top = 10
          Width = 90
          Height = 17
          Caption = 'Unpac&k Files'
          TabOrder = 0
          OnClick = rbTools4Click
        end
        object rbTools1: TRadioButton
          Left = 23
          Top = 10
          Width = 90
          Height = 17
          Caption = '&Dump Data'
          TabOrder = 1
          OnClick = rbTools4Click
        end
        object rbTools2: TRadioButton
          Left = 123
          Top = 10
          Width = 90
          Height = 17
          Caption = 'Updat&e Info'
          TabOrder = 2
          OnClick = rbTools4Click
        end
        object rbTools3: TRadioButton
          Left = 223
          Top = 10
          Width = 90
          Height = 17
          Caption = 'Atta&ch File'
          TabOrder = 3
          OnClick = rbTools4Click
        end
      end
      object btnToolsFile2: TButton
        Left = 150
        Top = 193
        Width = 215
        Height = 25
        Caption = '&Attachment File ...'
        TabOrder = 17
        Visible = False
        OnClick = btnToolsFile2Click
      end
      object btnToolsFile2Reset: TButton
        Left = 25
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 15
        Visible = False
        OnClick = btnToolsFile2ResetClick
      end
      object btnToolsFile2Open: TButton
        Left = 415
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Ope&n'
        TabOrder = 18
        Visible = False
        OnClick = btnToolsFile2OpenClick
      end
      object btnCopySrcToolsTo: TButton
        Left = 378
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 4
        OnClick = btnCopySrcBackgroundToClick
      end
      object btnCopySrcToolsFrom: TButton
        Left = 113
        Top = 52
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 3
        OnClick = btnCopySrcBackgroundFromClick
      end
      object comboApplication: TComboBox
        Left = 150
        Top = 159
        Width = 215
        Height = 23
        TabOrder = 10
        Text = '                   Select Application ...          '
        OnClick = comboApplicationClick
        Items.Strings = (
          'App1 - Undefined'
          'App2 - Undefined'
          'App3 - Undefined'
          'App4 - Undefined'
          'App5 - Undefined')
      end
      object btnLaunchApp: TButton
        Left = 378
        Top = 158
        Width = 112
        Height = 25
        Caption = 'Launch App'
        TabOrder = 11
        OnClick = btnLaunchAppClick
      end
      object btnRbTools: TButton
        Left = 31
        Top = 100
        Width = 20
        Height = 20
        Caption = '1'
        TabOrder = 6
        OnClick = btnRbToolsClick
      end
      object btnAdvancedReset: TButton
        Left = 25
        Top = 158
        Width = 75
        Height = 25
        Caption = 'Reset'
        TabOrder = 12
        OnClick = btnAdvancedResetClick
      end
      object btnAdvancedFilter: TButton
        Left = 108
        Top = 193
        Width = 35
        Height = 25
        Caption = 'PDF'
        TabOrder = 16
        OnClick = btnAdvancedFilterClick
      end
      object btnAdvancedTemplate: TButton
        Left = 108
        Top = 158
        Width = 35
        Height = 25
        Caption = 'T4'
        TabOrder = 13
        OnClick = btnAdvancedTemplateClick
      end
      object eAdvanced: TEdit
        Left = 150
        Top = 158
        Width = 339
        Height = 23
        TabOrder = 14
        Text = '%PDFIN% <op> %XXXFILE2% output  %PDFOUT% '
        Visible = False
      end
      object btnRbTools2: TButton
        Left = 464
        Top = 100
        Width = 20
        Height = 20
        Caption = '1'
        TabOrder = 8
        OnClick = btnRbTools2Click
      end
      object btnCopyFile2To: TButton
        Left = 378
        Top = 193
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 19
        OnClick = btnCopyFile2ToClick
      end
      object btnCopyFile2From: TButton
        Left = 113
        Top = 193
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 20
        OnClick = btnCopyFile2FromClick
      end
      object btnSwapFiles: TButton
        Left = 25
        Top = 158
        Width = 113
        Height = 25
        Caption = 'Swap Files 1-2'
        TabOrder = 21
        OnClick = btnSwapFilesClick
      end
    end
  end
  object gbDocProtect: TGroupBox
    Left = 7
    Top = 301
    Width = 519
    Height = 190
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = ' Document &Protection'
    TabOrder = 1
    OnDblClick = gbDocProtectClick
    object btnDocProtect: TSpeedButton
      Left = 496
      Top = 0
      Width = 20
      Height = 20
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = gbDocProtectClick
    end
    object cbAllowAll: TCheckBox
      Left = 14
      Top = 95
      Width = 374
      Height = 16
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 
        'As well as opening and reading, allow ALL the following actio&ns' +
        ' ...'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = cbAllowAllClick
    end
    object pnlProtection: TPanel
      Left = 14
      Top = 115
      Width = 494
      Height = 65
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object cbPrinting: TCheckBox
        Left = 19
        Top = 4
        Width = 171
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Printing'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbPrintingClick
      end
      object cbDegradedPrinting: TCheckBox
        Left = 19
        Top = 24
        Width = 171
        Height = 14
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Degraded Printing'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbPrintingClick
      end
      object cbModifyContents: TCheckBox
        Left = 19
        Top = 39
        Width = 171
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Content Modification'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbPrintingClick
      end
      object cbScreenReaders: TCheckBox
        Left = 178
        Top = 42
        Width = 115
        Height = 14
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Screen Readers'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbPrintingClick
      end
      object cbModifyAnnotations: TCheckBox
        Left = 314
        Top = 7
        Width = 165
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Annotation Modifications'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = cbPrintingClick
      end
      object cbFillIn: TCheckBox
        Left = 314
        Top = 24
        Width = 165
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Fill In'
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = cbPrintingClick
      end
      object cbAssembly: TCheckBox
        Left = 178
        Top = 6
        Width = 114
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Assembly'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = cbPrintingClick
      end
      object cbCopyContents: TCheckBox
        Left = 178
        Top = 22
        Width = 115
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Copy Contents'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = cbPrintingClick
      end
    end
    object gbPasswords: TGroupBox
      Left = 14
      Top = 29
      Width = 399
      Height = 54
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = ' Passwords '
      TabOrder = 0
      object lblOwnerPassword: TLabel
        Left = 22
        Top = 26
        Width = 36
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'O&wner'
        FocusControl = eOwnerPassword
      end
      object lblUserPassword: TLabel
        Left = 207
        Top = 26
        Width = 27
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'User'
        FocusControl = eUserPassword
      end
      object eOwnerPassword: TEdit
        Left = 65
        Top = 21
        Width = 127
        Height = 23
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 0
      end
      object eUserPassword: TEdit
        Left = 243
        Top = 21
        Width = 129
        Height = 23
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 1
      end
    end
  end
  object gbExit: TGroupBox
    Left = 14
    Top = 514
    Width = 519
    Height = 64
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    object lblSaveFilename: TLabel
      Left = 47
      Top = 41
      Width = 430
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'SaveFilename'
    end
    object btnBuild: TButton
      Left = 50
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Build'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnBuildClick
    end
    object bClose: TButton
      Left = 395
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Cancel = True
      Caption = 'E&xit'
      TabOrder = 4
      OnClick = bCloseClick
    end
    object bLocate: TButton
      Left = 223
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Locate'
      TabOrder = 2
      OnClick = bLocateClick
    end
    object bPipe: TButton
      Left = 309
      Top = 8
      Width = 75
      Height = 25
      Caption = 'P&ipe'
      TabOrder = 3
      OnClick = bPipeClick
    end
    object bViewSave: TButton
      Left = 137
      Top = 8
      Width = 75
      Height = 25
      Caption = '&View'
      TabOrder = 1
      OnClick = bViewSaveClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 585
    Width = 549
    Height = 26
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Panels = <>
    SimplePanel = True
    SimpleText = '  Version x.x'
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.pdf'
    Filter = 'PDF Files | *.pdf'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Title = 'Select PDF files ...'
    Left = 34
    Top = 248
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.pdf'
    Filter = 'PDF Files | *.pdf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Output PDF file ...'
    Left = 393
    Top = 257
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 45
    Top = 41
    object File1: TMenuItem
      Caption = '&File'
      object Close1: TMenuItem
        Caption = 'E&xit'
        OnClick = bCloseClick
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Contents1: TMenuItem
        Caption = '&Help (.html)'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object Guide1: TMenuItem
        Caption = '&User Guide (.pdf)'
        OnClick = ViewGuideClick
      end
      object PDFtk1: TMenuItem
        Caption = '&PDFtk Server (.pdf)'
        OnClick = ViewPDFtkClick
      end
      object OpenIni1: TMenuItem
        Caption = '&Settings (.ini)'
        OnClick = OpenIniClick
      end
      object About1: TMenuItem
        Caption = '&About'
        ShortCut = 8304
        OnClick = About1Click
      end
    end
  end
  object OpenDialog2: TOpenDialog
    Left = 98
    Top = 249
  end
  object PopupMenu1: TPopupMenu
    Left = 114
    Top = 41
    object popView: TMenuItem
      Caption = 'View File'
      OnClick = bViewClick
    end
    object popLocate: TMenuItem
      Caption = 'Locate File'
      OnClick = popLocateClick
    end
    object popCopyPath: TMenuItem
      Caption = 'Copy Path'
      OnClick = popCopyPathClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popExtract: TMenuItem
      AutoHotkeys = maManual
      Caption = '&Extract Pages'
      OnClick = popExtractClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object popSplit: TMenuItem
      Caption = 'Split File'
      OnClick = popSplitClick
    end
    object popMark: TMenuItem
      Caption = 'Mark Pages'
      OnClick = popMarkClick
    end
    object popRotate: TMenuItem
      Caption = 'Rotate Pages'
      OnClick = popRotateClick
    end
    object popTools: TMenuItem
      Caption = 'Tool Sets'
      OnClick = popToolsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popProperties: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Properties'
      OnClick = popPropertiesClick
    end
  end
end
