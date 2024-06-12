COLOR E
@echo off
rem *****************************************************************************
rem * MAKESUPPORT_DIR has to be set to MakeSupport root directory
rem * There MUSTN'T be any blanks between the '=' sign and the path string
rem * Example:
rem *     set MAKESUPPORT_DIR=..\..\MakeSupport
rem *****************************************************************************

set MAKESUPPORT_DIR=%~dp0\..\..\..\MakeSupport

rem *****************************************************************************
rem * DO NOT EDIT ANYTHING BELOW THIS
rem *****************************************************************************

if "%MAKESUPPORT_DIR% "==" "   goto ErrorNotSet
if not exist %MAKESUPPORT_DIR% goto ErrorWrongPath

set PATH_OLD=%PATH%
set PATH=%MAKESUPPORT_DIR%\cmd;%PATH%
set CYGWIN=nodosfilewarning

rem *****************************************************************************
rem * Run make and store its return value afterwards.
rem * The return value is passed to the caller of m.bat at the end of the file.
rem *****************************************************************************
%MAKESUPPORT_DIR%\cmd\make -C %~dp0 --no-print-directory %*
if exist FlashDrv.hex %MAKESUPPORT_DIR%\..\Misc\HexView\hexview.exe FlashDrv.hex /s /FA /AF:0xFF /XI -o FlashDrv.hex
SET GNU_MAKE_RETURN_CODE=%ERRORLEVEL%
set PATH=%PATH_OLD%
set PATH_OLD=
if exist FlashDrv.hex move FlashDrv.hex FlashDrv_original.hex
if exist FlashDrv_original.hex ..\..\..\Misc\Hexview\hexview.exe FlashDrv_original.hex /AD:0x80 /AL:0x80 /XI /FA /s -o FlashDrv.hex
call generate_checksums.bat FlashDrv.hex
goto End

:ErrorNotSet
echo ************************************************************************
echo BRS warning: MAKESUPPORT_DIR has to be set to MakeSupport\cmd directory!
echo              Please correct setting in this batch file and try again!
echo ************************************************************************
goto End

:ErrorWrongPath
echo ************************************************************************
echo BRS warning: %MAKESUPPORT_DIR% does not exist
echo              Please correct setting in this batch file and try again!
echo ************************************************************************
goto End

:End
set MAKESUPPORT_DIR=
exit /b %GNU_MAKE_RETURN_CODE%
