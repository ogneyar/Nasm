nasm -f win32 test.asm -o test.obj
golink /entry:Start /console kernel32.dll user32.dll test.obj