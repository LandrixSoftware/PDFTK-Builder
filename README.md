# PDFTK-Builder
PDFTK Builder is a free graphical interface to PDFTK

Latest Version: 	5.0.0 Alpha  
Date: 				18 Oct 2020  
Platform:			Windows 32-bit application  
License: 			GNU General Public License (GPL), version 3  
Dependencies:		PDFtk Server v2.02; installed PDF viewer  

This project is a fork of the origin project
http://www.angusj.com/pdftkb/ from Angus Johnson Version 3.10.0
and of the enhanced version
https://sourceforge.net/projects/pdftk-builder-enhanced from David King Version 4.1.5

## Documentation

The distribution includes documentation for both PDFTK Builder and PDFtk Server.  For an overview of the program, see the PDFTK Builder Help file.  For more detail, see the PDFTK Builder User Guide.   The Help file (.html), User Guide (.pdf), PDFtk Server Reference Manual (.pdf), and configuration file (.ini) are all accessible from the Help menu of the program.  

## Acknowledgements

* [Steward & Lee, LLC](http://www.pdflabs.com/tools/pdftk-server) (for GPL PDFtk Server executable and documentation included in the distribution)
* [Angus Johnson](http://www.angusj.com/pdftkb/) (for design and code of GPL PDFTK Builder Version 3 used as the basis of this project)
* [David King](https://sourceforge.net/projects/pdftk-builder-enhanced) (for design and code of GPL PDFTK Builder Version 4 used as the basis of this project)
* [Embarcadero Inc.](https://www.embarcadero.com/) (for free license of Delphi Starter Edition used for this FOSS project)


---

## Version History

### 5.0.0, 18 Oct 2020

fork

### 4.1.5, 13 Oct 2019
* **Bugfix**: 
Fixed user interface issue where those tools on the ‘Tool Sets’ tab that do not output PDF files (e.g., ‘Dump Data’) were erroneously enabling or affecting the ‘View’, ‘Locate’ and ‘Pipe’ output buttons.  
* **Added (2 Nov 2019)**:  File [libiconv2.dll](http://gnuwin32.sourceforge.net/packages/libiconv.htm) added to download file PdftkBuilder-4.1.5-portable.zip.  This GNU Win32 dll is used by pdftk.exe to convert between character encodings in international environments.  No changes made to PDFtk Builder 4.1.5 executable.

### 4.1.4, 18 Sep 2019
* **Added**: 
'Split File' tab now supports producing output PDF files in chunks of N pages. Default output is individual page files (N=1).

### 4.1.3, 13 Sep 2019
* **Added**: 
'Rotate Pages' tab now supports entry of a list of page ranges for rotate, extract and delete options when PdftkVersion >= 2.00 (default). For PdftkVersion < 2.00, pages entry remains a single page range with separate edit boxes for the start and end pages. 

### 4.1.2, 28 Jul 2019
* Initial public release.   
* **Added**: 
**(1)** Options on 'Rotate Pages' tab to delete and extract the range of pages; **(2)** PDFtk Server manual to Help menu.
* **Update**: **(1)** 'Shuffle' option renamed 'Interleave' on 'Join Files' tab; **(2)** 'Del' key added as hotkey to 'Remove' file in 'Join Files' list (when focus not on 'Pages' edit box); **(3)** .html and .pdf files relocated to 'docs' subfolder; **(4)** Ctrl-J, -S, -M, -R, -T, -P hotkeys for switching tabs, etc. restored without restoring 'View' menu deleted in v4.0.0.  
  
### 4.1.1, 26 Oct 2018
* **Added**: 
Page rotations can now be made compatible with PDFtk versions < 2.00 by setting PDFtk version in the .ini file.  
  
### 4.1.0, 17 Jul 2018
* **Added**: 
**(1)** Drag and drop support for source and secondary input files on other 4 tab sheets; **(2)** context menu (right-click) with items to extract pages from selected file, open file location, display file properties; **(3)** double click to view the selected source PDF file in the 'Join Files' list; **(4)** additional page numbering options, including left and center positions, page range, starting number, and prefix/suffix text with text placeholders; **(5)** 'Uncompress' and 'Compress' operations to 'Tool Sets'; **(6)** dual input PDF file capability to 'Launch' action; **(7)** 'Compare' action to use external PDF text compare tool, such as WinMerge; **(8)** 'Odd/Even' option to 'Split File'; **(9)** Help menu items to view/edit .ini file and view User Guide (.pdf).
* **Update**: 
Incorporated following cosmetic changes from v3.9.6, Mar 2018:  **(1)** save and restore last closed position of main form, **(2)** preserve top position of main form when opening/closing document protection panel, **(3)** add arrow button for opening/closing document protection panel.
* **Bugfix**: 
Retrofitted applicable bugfixes from v3.9.6, Mar 2018 through v3.10.0, Jul 2018.
  
### 4.0.0, 28 Nov 2017
* Initial enhanced version of PDFTK Builder (based on v3.9.4, Apr 2015).
* **Added**: 
**(1)** 'Shuffle' option to 'Join Files'; 	**(2)** file name only display mode, second column for P (pages) and T (truncated file name) indicators, and increased size of grid to display more rows and longer file names in 'Join Files' list; **(3)** capability to use 'Join File' list as sequential source for other tab sheets; **(4)** Alt-Shift-S, -M, -R, -T keys to 'Join Files' tab sheet to forward selected source document to another tab sheet; **(5)** capability to manually copy and paste input file names through the clipboard;  **(6)** labels to display input file names and page counts on Split, Mark Pages, Rotate Pages and Tools tabs; **(7)** edit boxes to specify page range and button to change output folder to 'Split File' tab sheet;  **(8)** 'multibackground' / 'multistamp' capability (automatically used for background/stamp files with multiple pages); **(9)** options for position, mirroring, and page orientation for page numbers;  **(10)** 'Misc Tools' tab sheet with 12 new functions; **(11)** 'View', 'Locate' and 'Pipe' buttons to output panel; **(12)** page count and file size to status bar message and copy of file path to clipboard when output file saved.
* **Update**: 
**(1)** Replaced PDFtk v1.41, Nov 2006 with PDFtk Server v2.02, Jul 2013; **(2)** incorporated revised rotation syntax from PDFtk v1.45; **(3)** dropped 'View' menu and use of Ctrl key for switching tab sheets; **(4)** replaced use of ctrl-A for selecting all items in Join Files list with 'Reset' button; **(5)** changed opening position of window from desktop center to screen center to fix main form from spanning dual monitors.
* **Bugfix**: 
Removed extraneous auto re-sorting of source PDF list after file added via drag and drop (*error in v3.9.4, Apr 2015; fixed in v3.9.7, Mar 2018*).  