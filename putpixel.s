; A working putpixel routine for sinclair QL.
; To compile, use the vasm assembler as follows: 
; vasmm68k_mot -m68000 -Fbin -o putpixel.bin putpixel.s
;
; Or use this project's Makefile:
; make putpixel.bin

	org	261120

; preset colour masks
RED	equ	$80
GREEN	equ	$8000
BLUE	equ	$40
YELLOW	equ	(RED+GREEN)
PURPLE	equ	(RED+BLUE)
CYAN	equ	(GREEN+BLUE)
WHITE	equ	(RED+GREEN+BLUE)

start:
	movem	d0-d2/a0-a1,-(a7)

	bsr clearscreen

; Draw some test pixels into the screen
	move.l #131072,a0

	move.w #128,d0
	move.w #128,d1
	move.w #RED,d2
	bsr putpixel
	addq #2,d0
	addq #2,d1
	move.w #GREEN,d2
	bsr putpixel
	addq #2,d0
	addq #2,d1
	move.w #BLUE,d2
	bsr putpixel
	addq #2,d0
	addq #2,d1
	move.w #PURPLE,d2
	bsr putpixel
	addq #2,d0
	addq #2,d1
	move.w #CYAN,d2
	bsr putpixel
	addq #2,d0
	addq #2,d1
	move.w #WHITE,d2
	bsr putpixel

; exit
	movem	(a7)+,d0-d2/a0-a1
	clr.l	d0
	rts

putpixel:
; INPUT: 
;   a0.l screen base address
;   d0.w x coordinate
;   d1.w y coordinate
;   d2.w colour (see colour constants in the beginning)
	
	move.l a0,-(a7)
	move.l d0,-(a7)
	move.l d1,-(a7)

; the screen is organized as planar bytes as follows:
; GFGFGFGF RBRBRBRB
; (G=green bit,F=flash bit,R=red bit,B=blue bit)
; The low-res screen is 256 pixels wide.
; Hence the address to draw to is a0+y*128+(x/4)*2.

 	lsl.w #7,d1
	adda.l d1,a0 ; a0+=d1*128

	move.w d0,d1 ; spare d0 in d1

	and.w #$FC,d0
	lsr.w #1,d0
	adda.l d0,a0  ;a0+=2*(d0/4)=(d0 & $FC)/2

; Now determine the colour mask and OR it to the screen.
; With colour (d2) as the initial mask, this mask is 
; shifted right by (x & 3)*2 to align with the correct location.

	and.w #$03,d1
	lsl.l #1,d1
	lsr.w d1,d2
	or.w d2,(a0)

	move.l (a7)+,d1
	move.l (a7)+,d0
	move.l (a7)+,a0

	rts
 
clearscreen:
; clears the entire screen buffer
	move.l #131072,a0
	move.l #0,d0
	move.l #8192,d1
loop_clear:
	move.l d0,(a0)+
	dbra d1,loop_clear
	rts
