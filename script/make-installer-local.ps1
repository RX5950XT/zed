# Local installer build script — uses already-compiled target/release binaries.
# Does not require CI, code signing, AMD AGS SDK, or appx packaging.
#
# Usage:
#   .\script\make-installer-local.ps1
#   .\script\make-installer-local.ps1 -Version "0.1.0" -Install

[CmdletBinding()]
Param(
    [string]$Version = "0.0.1-local",
    [switch]$Install
)

$ErrorActionPreference = 'Stop'

$workspace  = "D:\Workspace_cloud\Personal_Project\zed"
$releaseDir = "$workspace\target\release"
$innoDir    = "$workspace\inno\x86_64"
$iscc = if (Test-Path "C:\Program Files (x86)\Inno Setup 6\ISCC.exe") {
    "C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
} elseif (Test-Path "$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe") {
    "$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe"
} else {
    (Get-Command ISCC.exe -ErrorAction SilentlyContinue)?.Source
}

if (-not (Test-Path $iscc)) {
    Write-Error "Inno Setup 6 not found at $iscc. Run: winget install JRSoftware.InnoSetup"
    exit 1
}

# Read channel from RELEASE_CHANNEL file
$channel = Get-Content "$workspace\crates\zed\RELEASE_CHANNEL" -ErrorAction SilentlyContinue
if (-not $channel) { $channel = "dev" }

# VersionInfoVersion must be numeric x.x.x.x — strip any suffix like "-zh-tw"
$numericVersion = ($Version -replace '[^0-9.].*$', '').TrimEnd('.')
if ($numericVersion -notmatch '^\d+\.\d+') { $numericVersion = "0.0.1.0" }

Write-Host "Channel : $channel"
Write-Host "Version : $Version (numeric: $numericVersion)"
Write-Host "Staging : $innoDir"

# --- Staging directory ---
if (Test-Path $innoDir) { Remove-Item $innoDir -Recurse -Force }
New-Item $innoDir -ItemType Directory -Force | Out-Null
New-Item "$innoDir\bin"   -ItemType Directory -Force | Out-Null
New-Item "$innoDir\tools" -ItemType Directory -Force | Out-Null
New-Item "$innoDir\appx"  -ItemType Directory -Force | Out-Null
New-Item "$innoDir\x64"   -ItemType Directory -Force | Out-Null

# Copy ISS resources (icons, messages, sign.ps1, zed.sh, etc.)
Copy-Item "$workspace\crates\zed\resources\windows\*" -Destination $innoDir -Recurse -Force

# Copy binaries
Copy-Item "$releaseDir\zed.exe"          "$innoDir\Zed.exe"          -Force
Copy-Item "$releaseDir\cli.exe"          "$innoDir\bin\zed.exe"      -Force
Copy-Item "$releaseDir\conpty.dll"       "$innoDir\conpty.dll"       -Force
Copy-Item "$releaseDir\OpenConsole.exe"  "$innoDir\x64\OpenConsole.exe" -Force

# tools/ needs at least one file for ISCC wildcard; use cli as placeholder
Copy-Item "$releaseDir\cli.exe" "$innoDir\tools\auto_update_helper.exe" -Force

# --- Patch ISS: remove appx section (no explorer_command_injector in local build) ---
$issPath = "$innoDir\zed.iss"
$issContent = Get-Content $issPath -Raw
# Remove the appx source line
$issContent = $issContent -replace '(?m)^Source: "\{#ResourcesDir\}\\appx\\\*".*\r?\n', ''
# Remove UninstallRun appx line
$issContent = $issContent -replace '(?m)^Filename: "powershell\.exe".*AppxPackage.*\r?\n', ''
# Use numeric version for VersionInfoVersion (must be x.x.x.x format)
$issContent = $issContent -replace 'VersionInfoVersion=\{#Version\}', 'VersionInfoVersion={#NumericVersion}'
Set-Content $issPath $issContent -NoNewline

# --- Channel-specific settings ---
switch ($channel) {
    "stable" {
        $appId       = "{2DB0DA96-CA55-49BB-AF4F-64AF36A86712}"
        $appIconName = "app-icon"
        $appName     = "Zed"
        $appDisplay  = "Zed"
        $appMutex    = "Zed-Stable-Instance-Mutex"
        $appExeName  = "Zed"
        $regValue    = "Zed"
        $appUserId   = "ZedIndustries.Zed"
        $shellShort  = "Z&ed"
        $appxFull    = "ZedIndustries.Zed_1.0.0.0_neutral__japxn1gcva8rg"
    }
    "preview" {
        $appId       = "{F70E4811-D0E2-4D88-AC99-D63752799F95}"
        $appIconName = "app-icon-preview"
        $appName     = "Zed Preview"
        $appDisplay  = "Zed Preview"
        $appMutex    = "Zed-Preview-Instance-Mutex"
        $appExeName  = "Zed"
        $regValue    = "ZedPreview"
        $appUserId   = "ZedIndustries.Zed.Preview"
        $shellShort  = "Z&ed Preview"
        $appxFull    = "ZedIndustries.Zed.Preview_1.0.0.0_neutral__japxn1gcva8rg"
    }
    default {
        $appId       = "{8357632E-24A4-4F32-BA97-E575B4D1FE5D}"
        $appIconName = "app-icon-dev"
        $appName     = "Zed Dev"
        $appDisplay  = "Zed Dev"
        $appMutex    = "Zed-Dev-Instance-Mutex"
        $appExeName  = "Zed"
        $regValue    = "ZedDev"
        $appUserId   = "ZedIndustries.Zed.Dev"
        $shellShort  = "Z&ed Dev"
        $appxFull    = "ZedIndustries.Zed.Dev_1.0.0.0_neutral__japxn1gcva8rg"
    }
}

$defs = @(
    "/dAppId=`"{$appId}`"",
    "/dAppIconName=`"$appIconName`"",
    "/dOutputDir=`"$workspace\target`"",
    "/dAppSetupName=`"Zed-x86_64`"",
    "/dAppName=`"$appName`"",
    "/dAppDisplayName=`"$appDisplay`"",
    "/dRegValueName=`"$regValue`"",
    "/dAppMutex=`"$appMutex`"",
    "/dAppExeName=`"$appExeName`"",
    "/dResourcesDir=`"$innoDir`"",
    "/dShellNameShort=`"$shellShort`"",
    "/dAppUserId=`"$appUserId`"",
    "/dVersion=`"$Version`"",
    "/dNumericVersion=`"$numericVersion`"",
    "/dSourceDir=`"$workspace`"",
    "/dAppxFullName=`"$appxFull`""
)

Write-Host ""
Write-Host "Running Inno Setup..."
$proc = Start-Process -FilePath $iscc -ArgumentList (@($issPath) + $defs) -NoNewWindow -Wait -PassThru

if ($proc.ExitCode -eq 0) {
    $output = "$workspace\target\Zed-x86_64.exe"
    Write-Host ""
    Write-Host "SUCCESS: $output"
    if ($Install) {
        Write-Host "Installing..."
        Start-Process -FilePath $output
    }
} else {
    Write-Error "Inno Setup failed (exit code $($proc.ExitCode))"
    exit 1
}
