REM 
set MSVC_PATH="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build"
call %MSVC_PATH%\vcvars64.bat
nasm -f win64 anotherProgram.asm -o anopro.obj
link anopro.obj /subsystem:console /entry:main /nodefaultlib /out:hell.exe kernel32.lib