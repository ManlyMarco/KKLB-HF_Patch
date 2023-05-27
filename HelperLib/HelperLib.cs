/*
    Copyright (C) 2023  ManlyMarco

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using KKManager.Util.ProcessWaiter;
using RGiesecke.DllExport;

namespace HelperLib
{
    public class HelperLib
    {
        private const string LogFileName = "HF_Patch_log.txt";

        private static void AppendLog(string targetDirectory, object message)
        {
            try
            {
                File.AppendAllText(Path.Combine(targetDirectory, LogFileName), message.ToString() + Environment.NewLine);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        [DllExport("SetConfigDefaults", CallingConvention = CallingConvention.StdCall)]
        public static void SetConfigDefaults([MarshalAs(UnmanagedType.LPWStr)] string path)
        {

        }

        [DllExport("WriteVersionFile", CallingConvention = CallingConvention.StdCall)]
        public static void WriteVersionFile([MarshalAs(UnmanagedType.LPWStr)] string path, [MarshalAs(UnmanagedType.LPWStr)] string version)
        {
            var verPath = Path.Combine(path, @"version");
            try
            {
                //var contents = File.Exists(verPath) ? File.ReadAllText(verPath) : string.Empty;
                //var versionList = contents.Split(';').Select(x => x.Trim()).Where(x => !string.IsNullOrEmpty(x)).ToList();
                //versionList.Add("HF Patch v" + version);
                //
                //var existingVersions = new HashSet<string>();
                //// Only keep latest copy of any version, remove older duplicates
                //var filteredVersionList = versionList.AsEnumerable().Reverse().Where(x => existingVersions.Add(x)).Reverse().ToArray();
                //var result = string.Join("; ", filteredVersionList);

                var result = "HF Patch v" + version;
                // Prevent crash when overwriting hidden file
                if (File.Exists(verPath)) File.SetAttributes(verPath, FileAttributes.Normal);
                File.WriteAllText(verPath, result);
                File.SetAttributes(verPath, FileAttributes.Hidden | FileAttributes.Archive);
            }
            catch (Exception e)
            {
                AppendLog(path, "Failed trying to write version file: " + e);
            }
        }

        [DllExport("FixConfig", CallingConvention = CallingConvention.StdCall)]
        public static void FixConfig([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }

        private static void CheckRange(string instr, int min, int max)
        {
            var val = int.Parse(instr);
            if (min > val || val > max)
                throw new Exception();
        }

        [DllExport("FixPermissions", CallingConvention = CallingConvention.StdCall)]
        public static void FixPermissions([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                ProcessWaiter.CheckForRunningProcesses(new[] { Path.GetFullPath(path) }, new string[0]);

                var batContents = $@"
title Fixing permissions... 
rem Get the localized version of Y/N to pass to takeown to make this work in different locales
for /f ""tokens=1,2 delims=[,]"" %%a in ('""choice <nul 2>nul""') do set ""yes=%%a"" & set ""no=%%b""
echo Press %yes% for yes and %no% for no
set target={ path.Trim(Path.AltDirectorySeparatorChar, Path.DirectorySeparatorChar, ' ') }
echo off
cls
echo Taking ownership of %target% ...
rem First find is to filter out success messages, second findstr is to filter out empty lines
takeown /F ""%target%"" /R /SKIPSL /D %yes% | find /V ""SUCCESS: The file (or folder):"" | findstr /r /v ""^$""
echo.
echo Fixing access rights ...
icacls ""%target%"" /grant *S-1-1-0:(OI)(CI)F /T /C /L /Q
";
                var batPath = Path.Combine(Path.GetTempPath(), "hfpatch_fixperms.bat");
                File.WriteAllText(batPath, batContents);

                Process.Start(new ProcessStartInfo("cmd", $"/C \"{batPath}\"") { WindowStyle = ProcessWindowStyle.Hidden, CreateNoWindow = true });
            }
            catch (Exception e)
            {
                AppendLog(path, "Failed to fix permissions for path " + path + " - " + e);
            }
        }

        [DllExport("CreateBackup", CallingConvention = CallingConvention.StdCall)]
        public static void CreateBackup([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
            try
            {
                var fullPath = Path.GetFullPath(path);
                var filesToBackup = new List<string>();

                var bepinPath = Path.Combine(fullPath, "BepInEx");
                if (Directory.Exists(bepinPath))
                    filesToBackup.AddRange(Directory.GetFiles(bepinPath, "*", SearchOption.AllDirectories));

                var scriptsPath = Path.Combine(fullPath, "scripts");
                if (Directory.Exists(scriptsPath))
                    filesToBackup.AddRange(Directory.GetFiles(scriptsPath, "*", SearchOption.AllDirectories));

                var dhhPath = Path.Combine(fullPath, "DHH_Data");
                if (Directory.Exists(dhhPath))
                    filesToBackup.AddRange(Directory.GetFiles(dhhPath, "*", SearchOption.AllDirectories));

                if (!filesToBackup.Any()) return;

                using (var file = File.OpenWrite(Path.Combine(fullPath, $"Plugin_Backup_{DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss")}.zip")))
                using (var zip = new ZipArchive(file, ZipArchiveMode.Create, false, Encoding.UTF8))
                {
                    foreach (var toAdd in filesToBackup)
                    {
                        try
                        {
                            using (var toAddStream = File.OpenRead(toAdd))
                            {
                                var entry = zip.CreateEntry(toAdd.Substring(fullPath.Length + 1), CompressionLevel.Fastest);
                                using (var entryStream = entry.Open())
                                    toAddStream.CopyTo(entryStream);
                            }
                        }
                        catch (Exception ex)
                        {
                            AppendLog(path, $"Failed to add file {toAdd} to backup - {ex}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AppendLog(path, $"Failed to create backup - {ex}");
            }
        }

        [DllExport("RemoveModsExceptModpacks", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveModsExceptModpacks([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }


        [DllExport("RemoveJapaneseCards", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveJapaneseCards([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }

        [DllExport("RemoveNonstandardListfiles", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveNonstandardListfiles([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }

        [DllExport("PostInstallCleanUp", CallingConvention = CallingConvention.StdCall)]
        public static void PostInstallCleanUp([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }

        [DllExport("RemoveSideloaderDuplicates", CallingConvention = CallingConvention.StdCall)]
        public static void RemoveSideloaderDuplicates([MarshalAs(UnmanagedType.LPWStr)] string path)
        {
        }
    }
}