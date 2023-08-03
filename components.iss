[Components]
Name: "BepInEx";                               Description: "BepInEx v5.4.21.0 (Plugin framework)"                                                 ; Types: full extra custom bare; Flags: fixed
Name: "BepInEx\Dev";                           Description: "Show log window (Can be changed later from F1 settings, search for console)"          
Name: "BepInEx\MessageCenter";                 Description: "Message Center v1.1.1 (Allows plugins to show messages in top left corner of the game)"; Types: full extra custom bare
Name: "BepInEx\ConfigurationManager";          Description: "Configuration Manager v18.0.1 (Can change plugin settings. Press F1 to open, not visible inside HMD)"; Types: full extra custom bare
Name: "BepInEx\CatchUnityEventExceptions";     Description: "Catch Unity Event Exceptions v1.0 (Prevents some bugs from affecting the game or plugins)"; Types: full extra
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Name: "Content";                               Description: "Additional content (Needed to properly load most character cards and scenes)"         ; Types: full extra
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Name: "FIX";                                   Description: "{cm:CompFIX}"                                                                         ; Types: extra
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "Feature";                               Description: "Improvements and additional features"                                                 ; Types: extra
Name: "Feature\SimpleUncensor";                Description: "Simple Uncensor for KoiKoi v1.0 (Removes the heart censors, replaces female body texture, fixes dick color)"; Types: full extra
Name: "Feature\EnableResize";                  Description: "Enable Resize v3.0 (Allows resizing of game window, enable in F1 menu)"               ; Types: full extra
Name: "Feature\MuteInBackground";              Description: "Mute In Background v1.1 (Mute the game when not focused)"                             ; Types: full extra
Name: "Feature\KKLB_Tweaks";                   Description: "Graphical tweaks for KoiKoi Love Blossoms v1.0 (Improves the best quality setting (Performance = 1))"; Types: full extra
Name: "Feature\GraphicsSettings";              Description: "Graphics Settings v1.3 (More settings to make graphics more or less demanding)"       ; Types: full extra
Name: "Feature\LoveMachine";                   Description: "LoveMachine v3.12.0 (Adds support for some computer-controlled sex toys)"             ; Types: extra
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Name: "MISC";                                  Description: "{cm:CompMISC}"                                                                        
Name: "MISC\FPS";                              Description: "FPS Counter v3.1 (Useful for performance testing)"                                    ; Types: full extra
Name: "MISC\Trainer";                          Description: "Runtime Unity Editor v5.0 (Tool for making arbitrary modifications to the game, press F12 or Pause key)"; Types: full extra
Name: "MISC\Trainer\CheatTools";               Description: "Cheat Tools v3.3 (In-game trainer, can unlock all chapters and clothes, press F12 and look left)"; Types: full extra

[Files]
Source: "Input\_Plugins\_out\BepInEx.ConfigurationManager\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\ConfigurationManager; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx.MessageCenter\*";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\MessageCenter; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx.CatchUnityEventExceptions\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\CatchUnityEventExceptions; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx_x64\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\FPSCounter\*";                 DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\FPS; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\RuntimeUnityEditor_BepInEx5\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\Trainer; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\KKLB_CheatTools\*";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: MISC\Trainer\CheatTools; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx.EnableResize\*";       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\EnableResize; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx.MuteInBackground\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\MuteInBackground; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\BepInEx.GraphicsSettings\*";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\GraphicsSettings; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\KKLB_SimpleUncensor\*";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\SimpleUncensor; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\LoveMachine_for_KoiKoi_VR_Love_Blossoms\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\LoveMachine; Excludes: "manifest.xml"
Source: "Input\_Plugins\_out\KKLB_Tweaks\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Feature\KKLB_Tweaks; Excludes: "manifest.xml"