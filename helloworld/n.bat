nasm -f win32 helloworld.asm -o helloworld.obj
golink /entry:Start /console kernel32.dll helloworld.obj