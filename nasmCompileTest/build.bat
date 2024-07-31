REM 
set MSVC_PATH="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build"
call %MSVC_PATH%\vcvars64.bat
nasm -f win64 -o newASM1.obj newASM.asm
link newASM1.obj /subsystem:console /out:brandnew3.exe  msvcrt.lib libucrt.lib legacy_stdio_definitions.lib