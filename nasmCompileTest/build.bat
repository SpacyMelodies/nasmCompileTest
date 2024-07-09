REM 
set MSVC_PATH="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build"
call %MSVC_PATH%\vcvars64.bat
nasm -f win64 helloworld.asm -o helloworld1111.obj
link helloworld1111.obj /subsystem:console /entry:main /nodefaultlib /out:hello.exe kernel32.lib