mkdir 'bin' 2> /dev/null
mkdir 'bin/x64' 2> /dev/null
mkdir 'bin/x86' 2> /dev/null

i686-w64-mingw32-windres "resources/resource.rc" -o "resources/resources.o" --target=pe-i386
i686-w64-mingw32-g++ "src/main.cpp" "resources/resources.o" -static -mwindows -m32 -lcomctl32 -o "bin/x86/Simple Memory Editor (32-bit).exe"
rm -f "resources/*.o" > /dev/null

x86_64-w64-mingw32-windres "resources/resource.rc" -o "resources/resources.o" --target=pe-x86-64
x86_64-w64-mingw32-g++ "src/main.cpp" "resources/resources.o" -static -mwindows -lcomctl32 -o "bin/x64/Simple Memory Editor (64-bit).exe"
rm -f "resources/*.o" > /dev/null