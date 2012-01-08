; A QL Rhythm
; By Antti Silvast 2011. 
;
; Uses the QL's sound processor and plays a 2/4 125 BPM rhythm, 
; alternating a bassdrum and a single note. 
; 
; The player runs in the background in the 50 Hz interrupt. 
;
; Started from an earlier sound playing example by Marq: 
; http://www.kameli.net/~marq/ql/soundi.s

	org	196608

	movem	d0-d7/a0-a6,-(sp)

; Clear the screen
	movea.l	#131072,a0
	move.l	#32767,d0
clean:	move.b	#255,(a0)+
	dbra	d0,clean

; Use our own 50 Hz interruption handler
	lea	hook(pc),a0
	lea	routine(pc),a1
	move.l	a1,4(a0)
	moveq	#$1c,d0
	trap	#1

	movem	(sp)+,d0-d7/a0-a6

; Loops infinitely
loop:	move.b	#$8,$18063
	move.b	#$a,$18063
	bra.b	loop

; In practice, we never get here
	clr.l	d0
	rts

; Hook block
hook:	ds.l	2

; The handler
routine:
	movem	d1/d5/d7/a3,-(sp) 

; Check when to update the instrument
	add.b	#1,tick
	cmp.b	#12,tick ; 125 BPM, 2/4
	blt	skip	
	move.b	#0,tick

; Play the sound

; First, select either of the two preset sounds
	cmp.b	#0,instr_index
	bne 	play_instr2
play_instr1:		
	lea	instr1(pc),a3
	bra 	play
play_instr2:
	lea	instr2(pc),a3
play:

; Now, call the QL's IPC sound processor
	moveq	#$11,d0
	trap	#1

; Switch between the two instruments
	add.b	#1,instr_index
	and.b	#1,instr_index

; Return to the main program
skip:
	movem	(sp)+,d1/d5/d7/a3
	rts

; The QL's sound processor provides a square wave generator and some effects, 
; most notably a pitch shifter. The format of the instrument is the same 
; as BASIC's BEEP command.

; BASSDRUM
instr1:
	dc.b	$a		; Initiate sound
	dc.b	8		; Number of parameters
	dc.l	$aaaa		; Codes

	dc.b	1		; Pitch 1
	dc.b	200		; Pitch 2
	dc.b	10		; Interval between steps (lo byte)
	dc.b	0		; Interval between steps (hi byte)
	dc.b	0		; Duration (0 = inf) (lo byte)
	dc.b	30		; Duration (0 = inf) (hi byte)
	dc.b	16*3		; hi nibble: step in pitch, lo: wrap
	dc.b	0		; hi: randomness, lo: fuzziness

	dc.b	1		; Reply code (maybe not used)
	dc.b	0		; dummy (pad to word alignment)

; BASS
instr2:
	dc.b	$a		; Initiate sound
	dc.b	8		; Number of parameters
	dc.l	$aaaa		; Codes

	dc.b	100		; Pitch 1
	dc.b	251		; Pitch 2
	dc.b	40		; Interval between steps (lo byte)
	dc.b	1		; Interval between steps (hi byte)
	dc.b	0		; Duration (0 = inf) (lo byte)
	dc.b	10		; Duration (0 = inf) (hi byte)
	dc.b	1*16		; hi nibble: step in pitch, lo: wrap
	dc.b	5*16+5		; hi: randomness, lo: fuzziness

	dc.b	1		; Reply code (maybe not used)
	dc.b	0		; dummy (pad to word alignment)

; Counter for the tick that is playing (1 tick = 1/50 s)
tick:
	dc.b	11

; The current instrument (0 - Bassdrum, 1 - Note)
instr_index:
	dc.b	0
