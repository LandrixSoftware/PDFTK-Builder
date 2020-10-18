object AboutForm: TAboutForm
  Left = 550
  Top = 428
  BorderStyle = bsSingle
  Caption = 'PDFTK Builder - About'
  ClientHeight = 217
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 16
  object Label1: TLabel
    Left = 81
    Top = 24
    Width = 153
    Height = 26
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'PDFTK Builder'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 81
    Top = 117
    Width = 129
    Height = 15
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'A graphical front-end for'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 44
    Top = 130
    Width = 198
    Height = 15
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'the open source PDF Toolkit (PDFtk)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblUrl: TLabel
    Left = 20
    Top = 149
    Width = 262
    Height = 14
    Cursor = crHandPoint
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    AutoSize = False
    Caption = 'https://www.pdflabs.com/tools/pdftk-server/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lblUrlClick
  end
  object Label3: TLabel
    Left = 24
    Top = 67
    Width = 245
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    AutoSize = False
    Caption = 'Copyright '#169' 2017-19 by David King'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblVersion: TLabel
    Left = 81
    Top = 48
    Width = 144
    Height = 15
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 41
    Top = 25
    Width = 31
    Height = 33
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoSize = True
  end
  object Label5: TLabel
    Left = 24
    Top = 98
    Width = 245
    Height = 16
    Cursor = crHandPoint
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    AutoSize = False
    Caption = 'http://www.sourceforge.net'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lblUrlClick
  end
  object Label6: TLabel
    Left = 24
    Top = 80
    Width = 245
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taCenter
    AutoSize = False
    Caption = 'Copyright '#169' 2005-18 by Angus Johnson'#10
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 88
    Top = 48
    Width = 130
    Height = 15
    Caption = 'Enhanced Version 4.1.5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 107
    Top = 178
    Width = 75
    Height = 24
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Cancel = True
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
