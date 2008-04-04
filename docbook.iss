; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0A22D345-DFA9-45B8-AC92-57F2E933BA7D})
AppName=Short Attention Span Docbook
AppVerName=Short Attention Span Docbook 1.0
AppPublisher=NAPCS LLC
AppPublisherURL=http://www.napcs.com
AppSupportURL=http://www.napcs.com
AppUpdatesURL=http://www.napcs.com
DefaultDirName=c:\docbook
DefaultGroupName=Short Attention Span Docbook
AllowNoIcons=yes
OutputBaseFilename=docbook_setup
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
        
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\docbook\jars\*"; DestDir: "{app}\jars"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\docbook\template\*"; DestDir: "{app}\template"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\docbook\xsl\*"; DestDir: "{app}\xsl"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\docbook\generate"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\docbook\generate.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\docbook\docbook.pdf"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\docbook\hhc.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,Short Attention Span Docbook}"; Filename: "{uninstallexe}"
Name: "{group}\ Readme"; Filename: "{app}\docbook.pdf"

[Tasks]
Name: modifypath; Description: Add application directory to your system path;

[Code]
function ModPathDir(): TArrayOfString;
var
    Dir: TArrayOfString;
begin
    setArrayLength(Dir, 1)
    Dir[0] := ExpandConstant('{app}');
    Result := Dir;
end;
#include "modpath.iss"

