@echo off
rem Development setup for Demo-RDCFlexTron - run it once after cloning, and again after changing one
rem of the library's style sheets.
rem
rem While RDCFlexTronDemo.sws points at the library by PATH (..\Libraries\RDCFlexTron), the package
rem manager does not run the library's "install" step, so its style sheets never reach AppHtml. This
rem copies them into AppHtml\RDCFlexTron (ignored by git) - where the published package installs them.
rem
rem A COPY, not a link: through a junction to the library folder the pages stayed unstyled
rem (2026-09-23). The FlexTron host serves AppHtml through WebView2's virtual host folder mapping.
setlocal
set "LIB=%~dp0..\Libraries\RDCFlexTron\AppHtml\RDCFlexTron"
set "DEST=%~dp0AppHtml\RDCFlexTron"
if not exist "%LIB%\palette.css" (
    echo The RDCFlexTron library was not found at:
    echo   %LIB%
    echo Clone Library-RDCFlexTron into ..\Libraries\RDCFlexTron first.
    exit /b 1
)
rem An earlier setup made AppHtml\RDCFlexTron a junction: remove the link itself, never its target.
dir /AL /B "%~dp0AppHtml" 2>nul | findstr /I /X "RDCFlexTron" >nul && rmdir "%DEST%"
robocopy "%LIB%" "%DEST%" /MIR /NJH /NJS /NFL /NDL /NP >nul
if errorlevel 8 (
    echo Copying the style sheets failed.
    exit /b 1
)
echo The library's style sheets are in AppHtml\RDCFlexTron.
exit /b 0
