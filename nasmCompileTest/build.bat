REM 
set MSVC_PATH="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build"
call %MSVC_PATH%\vcvars64.bat
nasm -f win64 -o newASM.obj newASM.asm
link newASM.obj /subsystem:console /out:newnew191.exe  msvcrt.lib libucrt.lib legacy_stdio_definitions.lib