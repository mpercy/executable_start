LINKER=gold # or pass: make LINKER=bfd

all: executable_start_simple executable_start_func_main

clean:
	rm -f executable_start_simple executable_start_func_main libexecutable_start_func.so

executable_start_simple: executable_start_simple.c
	gcc -fuse-ld=$(LINKER) -o executable_start_simple executable_start_simple.c

libexecutable_start_func.so: executable_start_func.c
	gcc -fPIC -fuse-ld=$(LINKER) -shared -o libexecutable_start_func.so executable_start_func.c

executable_start_func_main: libexecutable_start_func.so executable_start_func_main.c
	gcc -fPIC -L . -Wl,-rpath=. -fuse-ld=$(LINKER) -o executable_start_func_main executable_start_func_main.c -l executable_start_func
