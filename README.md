# Testing GNU gold's generation of the __executable_start symbol

It doesn't appear to work with dynamic linking.

```
$ make clean all LINKER=bfd
gcc -fuse-ld=bfd -o executable_start_simple executable_start_simple.c
gcc -fPIC -fuse-ld=bfd -shared -o libexecutable_start_func.so executable_start_func.c
gcc -fPIC -L . -Wl,-rpath=. -fuse-ld=bfd -o executable_start_func_main executable_start_func_main.c -l executable_start_func

$ ./executable_start_func_main
__executable_start = 0x400000

$ make clean all LINKER=gold
rm -f executable_start_simple executable_start_func_main libexecutable_start_func.so
gcc -fuse-ld=gold -o executable_start_simple executable_start_simple.c
gcc -fPIC -fuse-ld=gold -shared -o libexecutable_start_func.so executable_start_func.c
gcc -fPIC -L . -Wl,-rpath=. -fuse-ld=gold -o executable_start_func_main executable_start_func_main.c -l executable_start_func

$ ./executable_start_func_main
./executable_start_func_main: symbol lookup error: ./libexecutable_start_func.so: undefined symbol: __executable_start

```
