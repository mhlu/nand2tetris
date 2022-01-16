// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(OUTER)
    @KBD
    D=M

    @color
    M=-1
    @INNER
    D;JNE

    @color
    M=0
    @INNER
    0;JMP

(INNER)
    @i
    M=0

    (FOR)
    @i
    D=M
    @8192 //256*512/16
    D=D-A
    @OUTER
    D;JEQ // if i == 8192; break

    @SCREEN
    D=A
    @i
    D=D+M
    @loc
    M=D
    @color
    D=M
    @loc
    A=M
    M=D

    @i
    M=M+1

    @FOR
    0;JMP
