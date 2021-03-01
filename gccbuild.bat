@echo off

echo building for x86...
    
if not exist "bin\x86" (
    mkdir "bin\x86"
)

windres "resources\resource.rc" -o "resources\resources.o" --target=pe-i386
g++ "src\main.cpp" "resources\resources.o" -static -mwindows -m32 -lcomctl32 -o "bin\x86\Simple Memory Editor (32-bit).exe"
del "resources\*.o" 2>NUL

echo building for x64...
    
if not exist "bin\x64" (
    mkdir "bin\x64"
) 

windres "resources\resource.rc" -o "resources\resources.o" --target=pe-x86-64
g++ "src\main.cpp" "resources\resources.o" -static -mwindows -lcomctl32 -o "bin\x64\Simple Memory Editor (64-bit).exe"
del "resources\*.o" 2>NUL