@echo off
rem Development setup for Demo-RDCFlexTron - run it once after cloning.
rem
rem While RDCFlexTronDemo.sws points at the library by PATH (..\Libraries\RDCFlexTron), the package
rem manager does not run the library's "install" step, so its style sheets never reach AppHtml. This
rem links AppHtml\RDCFlexTron to the library's own folder in the pool instead - a junction, no admin
rem rights needed - so an edit to a sheet shows in the demo straight away.
rem
rem Once the demo uses the published package, the package manager installs real files there: delete
rem the link first (rmdir AppHtml\RDCFlexTron - that removes the link, not the library's files).
setlocal
set "LIB=%~dp0..\Libraries\RDCFlexTron\AppHtml\RDCFlexTron"
set "LINK=%~dp0AppHtml\RDCFlexTron"
if not exist "%LIB%\palette.css" (
    echo The RDCFlexTron library was not found at:
    echo   %LIB%
    echo Clone Library-RDCFlexTron into ..\Libraries\RDCFlexTron first.
    exit /b 1
)
if exist "%LINK%" (
    echo AppHtml\RDCFlexTron already exists - nothing to do.
    exit /b 0
)
mklink /J "%LINK%" "%LIB%"
