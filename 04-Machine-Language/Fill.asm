// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.
(MAIN)
@KBD
D=M

@BLACK
D;JNE

@WHITE
0;JMP

(BLACK)

// SCREENPTR = SCREEN (16384)
@SCREEN
D=A
@SCREENPTR
M=D

(BLACK_LOOP)

// Apakah SCREENPTR sudah mencapai KBD (24576)?
@SCREENPTR
D=M
@KBD
D=D-A
@MAIN
D;JEQ

// Menghitamkan word layar yang sedang ditunjuk
@SCREENPTR
A=M
M=-1

// SCREENPTR++
@SCREENPTR
M=M+1

// Kembali mengisi word berikutnya
@BLACK_LOOP
0;JMP


(WHITE)

// SCREENPTR = SCREEN (16384)
@SCREEN
D=A
@SCREENPTR
M=D

(WHITE_LOOP)

// Apakah SCREENPTR sudah mencapai KBD (24576)?
@SCREENPTR
D=M
@KBD
D=D-A
@MAIN
D;JEQ

// Memutihkan word layar yang sedang ditunjuk
@SCREENPTR
A=M
M=0

// SCREENPTR++
@SCREENPTR
M=M+1

// Kembali mengisi word berikutnya
@WHITE_LOOP
0;JMP