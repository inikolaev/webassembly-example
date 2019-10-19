#!/bin/ash

clang -emit-llvm --target=wasm32 -Oz $1 -c -o /target/hello.bc
llc -asm-verbose=false /target/hello.bc -o /target/hello.s
#emcc -O2 $1 -o /target/hello.html