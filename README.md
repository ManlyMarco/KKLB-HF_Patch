![KKLB_patch_preview](https://github.com/ManlyMarco/KKLB-HF_Patch/assets/39247311/0d79320f-2999-46e0-8b7d-4561f9246cbe)

# HF Patch for KoiKoi Love Blossoms
An unofficial patch for KoiKoi Love Blossoms (恋来い温泉物語, KoiKoiMonogatari) by Apricot Heart. It fully unlocks and uncensors the game and includes other useful mods.

HF Patch does not contain the game, only mods. You have to buy the game separately. You can buy the game [on Steam](https://store.steampowered.com/app/1840350/KoiKoi_VR_Love_Blossoms/) or [on DLsite](https://www.dlsite.com/pro/work/=/product_id/VJ01000460.html). Both of these versions are pretty much identical and this patch will work no matter which version you buy.

This game is available in both VR and non-VR (desktop) versions. By purchasing the game you will get both versions. Non-VR version is available as [free DLC on Steam](https://store.steampowered.com/app/2340340/DLCKoiKoi_Love_Blossoms_NonVR_Edition/), and as a separate download on DLsite.

If the game is in Japanese, make sure you have the latest version and go to Settings (button with a cog icon in main menu) and select English in the dropdown setting at the bottom of the list.

[**Read the full HF Patch manual**](https://gist.github.com/ManlyMarco/31b78470b8e190686c7ed9686c237e3f) to learn more about what it is, what it does, how to use it, and how to solve common issues.

## Important notes, please read
- The included uncensor is very basic: It removes the heart censors, replaces female body texture with a custom one, and changes the meat stick color to match the rest of the male body. It doesn't modify character models and the vag texture is very basic (it can be edited by hand, it's inside the `BepInEx\plugins` folder).
- HF Patch does not contain the full game, paid expansions or any other pirated content. You have to buy the game and expansions separately.
- If you want to use the Non-VR mode on Steam, install the free Non-VR DLC from your steam library before installing this patch.
- This patch works with both Steam and DLsite versions of the game (they are basically identical). It works on both VR and non-VR versions.
- On Steam, you can run the game .exe directly if you don't want to be seen playing it on Steam.
- To run the game without VR on Steam, you have to install the NonVR DLC from your Steam library. Afterwards you have to browse local game files and look for the "NonVR" folder and run `KoiKoiMonogatari.exe` (NOT `KoiKoiMonogatariVR.exe`).
- None of the included mods modify game files. You can completely disable all mods by removing the `winhttp.dll` file and\or the `BepInEx` folder from the game directory.
- If you want to make your own mods, check [BepInEx docs](https://docs.bepinex.dev) and [KKLB_SimpleUncensor source code](https://github.com/ManlyMarco/KKLB_SimpleUncensor).
- There is no warranty on this patch or on any of the included mods. You are installing this patch at your own risk.
- If you want to run the game under Wine/Proton (Linux, SteamOS, macOS, etc.), read [this](https://github.com/Mantas-2155X/illusion-wine-guide) and [this](https://docs.bepinex.dev/articles/advanced/proton_wine.html).*

## Download
Check the [Releases](https://github.com/ManlyMarco/KKLB-HF_Patch/releases) page for download links.

If the default install path of the patch doesn't work (if for example you moved your Steam library to a different folder), you have to point the patch to where the game is installed. If you have the game on Steam and are not sure where to look: Find the game in the library, then go to `Properties > Local files > Browse` and point the patch to the folder than opens (it should have `KoiKoiMonogatariVR.exe` in it).

Read [the full manual](https://gist.github.com/ManlyMarco/31b78470b8e190686c7ed9686c237e3f) for detailed download and install instructions.

## What mods are included?
You can see a list of all included plugins and links to their websites and authors [here](https://github.com/ManlyMarco/KKLB-HF_Patch/blob/master/Plugin%20Readme.md).

## Discussion and help
If you need any help [check the Steam discussions](https://steamcommunity.com/app/1840350/discussions/), or visit the [Koikatsu discord server](https://discord.gg/zS5vJYS) if you have a more general modding question. Make sure to search for your issue to see if someone didn't already answer it.

## How to build
At least Visual Studio 2017 is needed for the helper library and latest unicode Inno Setup compiler is needed for the patch itself. All necessary mods have to be placed inside correct subfolders of the Input directory to compile. Because of massive size, they are not included here.

You can support development of HF Patch and many of the included plugins through my Patreon page: https://www.patreon.com/ManlyMarco
