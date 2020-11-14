@ECHO OFF
color A
set shortcut=%~1

if "%shortcut%" == "" goto usage else got everything

:everything
set link = ""
set game_name = ""
for %%F in ("%shortcut%") do (
	set game_name=%%~nF
    call :findurl "%%~dpnxF"
)

:findurl inputfile
set url=
for /f "tokens=2 delims==" %%i in ('findstr URL %1') do set url=%%i
set link=%url%

echo shortcut is %shortcut%
echo link is %link%
echo game_name is %game_name%

REM create shortcut to start menu
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\%game_name%.lnk');$s.TargetPath='%windir%\explorer.exe';$s.Arguments='%link%';$s.IconLocation='%shortcut%';$s.Save()"

REM check for syspin.exe
powershell "If (Test-Path -Path 'syspin.exe' ) { echo 'syspin.exe already downloaded' } Else { echo 'downloading syspin.exe';(New-Object System.Net.WebClient).DownloadFile('http://www.technosys.net/download.aspx?file=syspin.exe', 'syspin.exe') }"

REM Pin to start menu
.\syspin.exe "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\%game_name%.lnk" c:51201 > nul
DEL /F "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\%game_name%.lnk"

echo launching explorer for you to edit the icons
explorer.exe "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
timeout 5
exit 0

:usage
echo Drag steam or epic shortcut into this script
timeout 5
exit 0