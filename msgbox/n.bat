nasm -f win32 msgbox.asm -o msgbox.obj
golink /entry:Start /console kernel32.dll user32.dll msgbox.obj