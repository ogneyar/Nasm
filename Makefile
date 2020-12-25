all:
    nasm -f win32 helloworld.asm -o helloworld.obj
    golink /entry:Start /console kernel32.dll user32.dll helloworld.obj

helloworld:
    nasm -f win32 helloworld.asm -o helloworld.obj

golink:
    golink /entry:Start /console kernel32.dll user32.dll helloworld.obj



hel:
    nasm -f win32 hello.asm -o hello.obj

go:
    golink /entry:_start /console kernel32.dll user32.dll hello.obj


h:
    nasm -f win32 h.asm -o h.obj

gh:
    golink /entry:_start /console kernel32.dll user32.dll h.obj

