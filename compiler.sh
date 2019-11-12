#!/bin/bash

nasm -f elf $1.asm

if [ "$(uname -m)" == "x86_64" ]; then
	ld -m elf_i386 $1.o -o $1
else
	ld $1.o -o $1
fi
