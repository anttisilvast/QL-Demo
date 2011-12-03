; An unfinished putpixel routine for sinclair QL.
; To compile, use the vasm assembler as follows: 
; vasmm68k_mot -m68000 -Fbin -o putpixel.bin putpixel.s

	org	261120
start:
	movem	d0-d2/a0-a1,-(a7)

	bsr clearscreen

	move.l #131072,a0

	move.w	#5,d0
	move.w	#200,d1
	bsr putpixel
	move.w	#0,d0
	move.w	#201,d1	
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
;   d2.w colour 
	
	move.l  a0,-(a7) ; push a0
; the screen is organized as planar bytes as follows:
; GFGFGFGF RBRBRBRB
; (G=Green,F=Flash,R=Red,B=Blue)
; Hence the address to draw to is a0+d1*128+(d0/4)*2 

 	lsl.w #7,d1
	adda.l d1,a0 ; a0+=d1*128

	move.w d0,d2
	and.w #$FC,d2
	asr.w #1,d2
	adda.l d2,a0  ;a0+=2*(d0/4)

; Now determine the colour mask and OR it to the screen
; from here, unfinished
; but the idea is to have the color
; value as the mask, which is 
; then shifted right according
; to the (x-coordinate & 0x3)

	move.b #$FF,d2	; a dummy color for now
	move.b d2,(a0)

	move.l (a7)+,a0  ; pop a0
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
