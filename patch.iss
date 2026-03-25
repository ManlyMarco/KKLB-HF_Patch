; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;-------------Full game name for naming patch itself and desktop icons
#define NAME "KoiKoi Love Blossoms"
;---------------------------------------------Current HF Patch version
#define VERSION "1.3"
;--Don't include any files in the build to make it go fast for testing
#define DEBUG
;---Skip file verification for easier testing, COMMENT OUT FOR RELEASE
#define NOVERIFY
;--------------------------------------------------------Configuration
; The main executable name without the .exe
#define GameName "KoiKoiMonogatari"
; Set to empty if the game has no steam version
#define GameNameSteam "KoiKoiMonogatariVR"
; Set CompanyName to empty if the game has no registry keys
#define CompanyName "" ;ApricotHeart
;---------------------------------------------------------------------
#include "HelperLib\Common.iss"
;---------------------------------------------------------------------
; Used for post install run links, comment out to hide
;#define WikiLink 
#define RepoLink "https://github.com/ManlyMarco/KKLB-HF_Patch"
; Can be KoiDiscordLink, IsDiscordLink, or a normal link
#define DiscordLink KoiDiscordLink
;---------------------------------------------------------------------

[Setup]
AppName=HF Patch for KoiKoi Love Blossoms
OutputBaseFilename=KoiKoi Love Blossoms HF Patch v{#VERSION}

;lzma2/ultra64 | zip | lzma2/fast
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
;Usual settings: 208576 273
LZMADictionarySize=262144
LZMANumFastBytes=273
LZMANumBlockThreads=14
DiskSpanning=yes

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"

[Types]
Name: "full";     Description: "{cm:fullInstall}" 
Name: "extra";    Description: "{cm:extraInstall}"
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

[Components]
Name: "Patch"; Description: "Unlock R18 content (adds Explicit Mode in main menu)"; Types: full extra custom bare none; Flags: fixed

[Files]
#ifndef DEBUG
Source: "Input\_Patch\vr\hpatch_v7\*";    DestDir: "{app}"      ; Flags: onlyifdoesntexist recursesubdirs solidbreak; Components: Patch; Check: VersionIsVR
;innosetup is deduplicating these two, only one copy of files is stored
Source: "Input\_Patch\nonvr\hpatch_v7\*"; DestDir: "{app}"      ; Flags: onlyifdoesntexist recursesubdirs;            Components: Patch; Check: VersionIsNonVR
Source: "Input\_Patch\nonvr\hpatch_v7\*"; DestDir: "{app}\NonVR"; Flags: onlyifdoesntexist recursesubdirs;            Components: Patch; Check: VersionIsSteamNonVR
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\KKLB_SimpleUncensor_Texture.png"; DestDir: "{app}\BepInEx\plugins"; Flags: ignoreversion solidbreak;   Components: Feature\SimpleUncensor
#endif

; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; This include should be here because the patch files above can be overwritten by this include, and the Files section below overwrites some config files that this include extracts
#include "components.iss"

; #include "HelperLib\DirectXredist.iss"

[Files]
Source: "Input\BepInEx_config\*";         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak;   Components: BepInEx
Source: "Input\BepInEx_config_nonvr\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;   Components: BepInEx; Check: VersionIsSteamNonVR
Source: "Input\BepInEx_config_dev\*";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;   Components: BepInEx\Dev

[InstallDelete]
; Handle BepInEx / HF patch previously installed directly inside the NonVR folder
Type: filesandordirs; Name: "{app}\NonVR\BepInEx"; Components: BepInEx
Type: filesandordirs; Name: "{app}\NonVR\BepInEx_Shim_Backup"; Components: BepInEx
Type: files; Name: "{app}\NonVR\Plugin Readme.md"
Type: files; Name: "{app}\NonVR\version"
Type: files; Name: "{app}\NonVR\*.log"
Type: files; Name: "{app}\NonVR\*.pdb"
Type: files; Name: "{app}\NonVR\changelog.txt"
Type: files; Name: "{app}\NonVR\HF_Patch_log.txt"
Type: files; Name: "{app}\NonVR\output_log.txt"
Type: files; Name: "{app}\NonVR\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\NonVR\version.dll"; Components: BepInEx
Type: files; Name: "{app}\NonVR\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\NonVR\doorstop_config.ini"; Components: BepInEx

; Clear old graphics settings just in case
Type: files; Name: "{app}\BepInEx\config\keelhauled.graphicssettings.cfg"

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked

[Icons]
Name: "{userdesktop}\KoiKoi Love Blossoms NonVR"; Filename: "{app}\KoiKoiMonogatari.exe";       IconFilename: "{app}\KoiKoiMonogatari.exe";       WorkingDir: "{app}\";       Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "Start KoiKoi Love Blossoms in Desktop mode"
Name: "{userdesktop}\KoiKoi Love Blossoms NonVR"; Filename: "{app}\NonVR\KoiKoiMonogatari.exe"; IconFilename: "{app}\NonVR\KoiKoiMonogatari.exe"; WorkingDir: "{app}\NonVR\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "Start KoiKoi Love Blossoms in Desktop mode"
Name: "{userdesktop}\KoiKoi Love Blossoms VR";    Filename: "{app}\KoiKoiMonogatariVR.exe";     IconFilename: "{app}\KoiKoiMonogatariVR.exe";     WorkingDir: "{app}\";       Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "Start KoiKoi Love Blossoms in VR mode"

[Run]
Filename: "{app}\KoiKoiMonogatari.exe"; Description: "Start KoiKoi Love Blossoms in Desktop mode"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked; Check: VersionIsNonVR
Filename: "{app}\NonVR\KoiKoiMonogatari.exe"; Description: "Start KoiKoi Love Blossoms in Desktop mode"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked; Check: VersionIsSteamNonVR
Filename: "{app}\KoiKoiMonogatariVR.exe"; Description: "Start KoiKoi Love Blossoms in VR mode"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked; Check: VersionIsVR
#include "HelperLib\CommonRun.iss"

[Code]
// --------------------------------------------------------------------------------------- Helper methods

function VersionIsVR(): Boolean;
begin
  // Have to use resources.resource because this is the only file that exists both in Steam and non-Steam releases
  Result := FileExists(ExpandConstant('{app}\KoiKoiMonogatariVR_Data\resources.resource'));
end;
function VersionIsNonVR(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\KoiKoiMonogatari_Data\data.unity3d'));
end;
function VersionIsSteamNonVR(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\NonVR\KoiKoiMonogatari_Data\data.unity3d'));
end;

// --------------------------------------------------------------------------------------- Installation Events

function OnInstallLocationTest(): Boolean; // Additional validity checks (.exe checks are already passed)
begin
  Result := True;
end;

procedure OnTasksPageOpen();  // Use to change which tasks are on by default
begin
end;

procedure OnPrepKillTasks(); // Close the game if it's running
begin
  MassTaskKill(['KoiKoiMonogatari.exe', 'KoiKoiMonogatariVR.exe']);
end;

procedure OnPrepDoCleanup(); // Remove any additional mods outside of the Bepinex folder
begin
end;

procedure OnInstallCompleted();
begin
end;
