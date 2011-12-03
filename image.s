; A raw data image viewer for sinclair QL.
; The size of the image is 96x96.
; To compile, we use the vasm assembler as follows: 
; vasmm68k_mot -m68000 -Fbin -o image.bin image.s
; (link http://sun.hasenbraten.de/vasm/index.php)

	org	261120
start:
	movem	d0-d2/a0-a1,-(a7)

; clear the screen
	move.l  #131072,a0
	move.l	#0,d0
	move.l	#8192,d1
loop_clear:
	move.l	d0,(a0)+
	dbra 	d1,loop_clear

; move image to the screen
	move.l  #131072,a0
	move.l  #image_data,a1

	move.l	#96,d2
loop_outer:
	move.l	#12,d1
loop_inner:	
	move.l	(a1)+,d0
	move.l	d0,(a0)+
	dbra	d1,loop_inner
	add.l	#76,a0
	sub.l	#4,a1
	dbra	d2,loop_outer

; exit
	movem	(a7)+,d0-d2/a0-a1
	clr.l	d0
	rts

image_data:
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AA51,$AA15,$AA11,$AA57
  dc.w $AA77,$AA77,$AA77,$AA55,$AA55,$AA55,$AA50,$AA00
  dc.w $AA3F,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAD5,$AA55,$AA45,$AA5F
  dc.w $AADD,$AADD,$AADD,$AADD,$AA55,$AA55,$AA44,$AA00
  dc.w $AA1F,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAF7,$AAD1,$AA51,$AA51,$AA77
  dc.w $AA77,$AA77,$AA77,$AA75,$AA55,$AA51,$AA50,$AA00
  dc.w $AA1F,$AAFF,$AAF7,$AAFF,$AAFF,$AAFF,$AA7F,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAD5,$AAD5,$AA45,$AADD
  dc.w $AAFD,$AADD,$AAFD,$AADD,$AAD5,$AA55,$AA54,$AA00
  dc.w $AA0F,$AAFF,$AAFF,$AAFD,$A00E,$0080,$008A,$AA07
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AA51,$AA55,$AA15,$AA57
  dc.w $AA77,$AA57,$AA77,$AA75,$AA55,$AA11,$AA10,$AA00
  dc.w $AA17,$AAFF,$AADF,$8030,$000A,$00BA,$00A8,$0000
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAD5,$AA45,$AA4D,$AADF
  dc.w $AADF,$AADD,$AADF,$AADD,$AAD5,$AA55,$AA44,$AA00
  dc.w $AA05,$AAFF,$A8F2,$008A,$00FF,$00FE,$00A8,$008A
  dc.w $AAFF,$AAFF,$AAFF,$AAF7,$AA71,$AA55,$AA15,$AA77
  dc.w $AA77,$AA77,$AA77,$AA75,$AA55,$AA11,$AA10,$AA00
  dc.w $AA01,$AAFF,$8022,$00AA,$00FB,$00AA,$0020,$0022
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAF5,$AA55,$AA5D,$AADD
  dc.w $AAFF,$AAFD,$AAFF,$AADD,$AAD5,$AA54,$AA44,$AA00
  dc.w $AA05,$A8F6,$00AA,$00AA,$00EE,$00A8,$0088,$008A
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AA71,$AA11,$AA57,$AA57
  dc.w $AA77,$AA77,$AA77,$AA55,$AA51,$AA11,$AA10,$AA00
  dc.w $AA01,$A042,$00AA,$00AB,$00AA,$0000,$0002,$0229
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAF5,$AA55,$AA5D,$AADD
  dc.w $AADF,$AADF,$AADF,$AADD,$AA55,$AA55,$AA44,$AA00
  dc.w $AA04,$008A,$00AA,$00AA,$00A8,$0008,$008A,$2A8F
  dc.w $AAFF,$AAFF,$AAF7,$AAFF,$AAF1,$AA11,$AA75,$AA77
  dc.w $AA77,$AA77,$AA77,$AA75,$AA51,$AA51,$AA10,$AA00
  dc.w $A802,$00AA,$00AA,$00A2,$0000,$0022,$0228,$AA7F
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFC,$AA55,$AADD,$AADD
  dc.w $AAFD,$AAFF,$AAFD,$AADD,$AAD5,$AA55,$AA54,$AA50
  dc.w $807A,$00EA,$00A8,$0088,$0080,$00AA,$2ACF,$AAFF
  dc.w $AAFF,$AAFF,$AA77,$AA77,$AA74,$AA15,$AA77,$AA57
  dc.w $AA77,$AA77,$AA77,$AA75,$AA55,$AA15,$AA10,$0AA0
  dc.w $00AA,$00AA,$0000,$0000,$0022,$02AD,$AAFF,$AA7F
  dc.w $AAFF,$AAFF,$AAFF,$AADF,$AADC,$AA45,$AADD,$AADD
  dc.w $AADF,$AADF,$AADF,$AADD,$AADD,$AAD4,$8028,$2896
  dc.w $00AA,$00A8,$0080,$000A,$00AA,$AA1F,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAF7,$AAFD,$AA15,$AA77,$AA77
  dc.w $AA77,$AAF7,$AA77,$AA75,$AA55,$803A,$02B8,$A04A
  dc.w $00A2,$0000,$0022,$0028,$2A87,$AAF7,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFD,$AA55,$AADD,$AADD
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAD0,$A803,$8A3C,$00CA
  dc.w $0080,$0080,$00A8,$028C,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AA7F,$AA7F,$AA7D,$AA15,$AA57,$AA57
  dc.w $AA77,$AA77,$AA7F,$AAFF,$AA40,$A00F,$A832,$0020
  dc.w $0000,$0000,$000B,$AA3F,$AA7F,$AA7F,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFD,$AA05,$AADD,$AADF
  dc.w $AADF,$AAFF,$AAFF,$AAFF,$AA40,$AA07,$8060,$0000
  dc.w $0000,$0000,$2A8F,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAF7,$AAFF,$AA77,$AA11,$AA55,$AA77
  dc.w $AA77,$AA7F,$AAFF,$AAF5,$AA57,$A876,$0000,$0000
  dc.w $0000,$0000,$2A11,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AA55,$AADD,$AADD
  dc.w $AADD,$AAFF,$AAFF,$AAFF,$AADF,$80F0,$0080,$0000
  dc.w $0000,$0000,$0A3D,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AA7F,$AA7F,$AA77,$AA01,$AA57,$AA75
  dc.w $AA03,$AA7F,$AA7F,$AA7F,$AAF4,$0000,$0000,$0000
  dc.w $0000,$0000,$0A07,$AA7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAC5,$AADF,$8A70
  dc.w $AA05,$AADF,$AAFF,$AAFF,$8078,$0000,$0000,$0000
  dc.w $0000,$0000,$020F,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAF7,$AAF7,$AAD1,$A07F,$2AC0
  dc.w $AA13,$AA7F,$AAFF,$A8F3,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$020B,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AACC,$8228,$8A30
  dc.w $AA7F,$AAFF,$AAFF,$8020,$0008,$0080,$0000,$0000
  dc.w $0000,$0000,$0082,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AA7F,$AA77,$AA77,$A05A,$00BF,$2AC1
  dc.w $AA17,$AA7F,$A0DE,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$AA7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$80FA,$00BF,$AA00
  dc.w $AA5F,$AAFC,$0080,$0080,$0000,$0008,$0000,$0000
  dc.w $0000,$0000,$0000,$AA7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAF7,$AAF7,$AA77,$A00A,$0228,$AA01
  dc.w $AA7F,$8030,$0000,$0000,$0000,$0020,$0000,$0000
  dc.w $0000,$0000,$0000,$AA3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$A008,$02EC,$AA5F
  dc.w $A8D0,$0000,$0000,$0088,$0080,$0000,$0080,$0000
  dc.w $0000,$0000,$0000,$AA3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AA7F,$AA77,$AA77,$8032,$2AC7,$AAF0
  dc.w $0080,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$2ABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$8A05,$AAFD,$8020
  dc.w $0008,$0000,$0088,$0008,$0008,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$2ABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAF7,$AA74,$AA75,$8020,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0001,$0050
  dc.w $0000,$0000,$0000,$2AFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AA0F,$AAFF,$AAFF,$AAFF,$AAF4,$8020,$0000,$0000
  dc.w $0080,$0000,$0000,$0000,$0040,$0005,$AAAE,$8095
  dc.w $0054,$0000,$0004,$AA3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $02A8,$AA05,$AA75,$AA50,$00A0,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0001,$2A6A,$AAAA,$2061
  dc.w $0055,$0000,$0000,$2A3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $00AA,$00AA,$00AA,$0088,$028C,$80FC,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0A0A,$8899,$0859,$0055
  dc.w $8899,$0000,$0808,$AABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $00A2,$00AA,$00AA,$02A8,$AA7F,$A07A,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0015,$0050,$0015,$0051
  dc.w $0055,$0000,$0000,$AABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $00AA,$00AA,$02AC,$AAFF,$AAFF,$A8F2,$0000,$0000
  dc.w $0000,$0000,$0004,$A8A9,$8899,$8095,$8095,$0045
  dc.w $8899,$0004,$0004,$AABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $00FF,$2AC0,$AA7F,$AA57,$AA77,$A843,$0000,$0000
  dc.w $0000,$0000,$2A2A,$AAAA,$2267,$AABA,$2065,$0015
  dc.w $0055,$0000,$0000,$AABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFD,$AAFF,$AADF,$A2DC,$0080,$0000
  dc.w $0000,$000A,$AAAA,$AAEE,$AAAF,$AAFE,$8094,$0859
  dc.w $8899,$0040,$0848,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAF7,$AA77,$AAF7,$AA77,$AA77,$AA70,$0080,$0000
  dc.w $0000,$0A2A,$AAAA,$8292,$A0A1,$0010,$0001,$2879
  dc.w $2065,$0000,$0015,$AABF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFD,$AAFC,$0000,$0000
  dc.w $00AA,$00AA,$A8AD,$0849,$0A5B,$8095,$AAEA,$A8F9
  dc.w $8094,$0040,$0256,$2A3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AA7F,$AA77,$AA77,$AA77,$AA7F,$8020,$0002
  dc.w $A0A0,$002A,$282D,$2A2A,$2A6F,$82D7,$A2A6,$AABA
  dc.w $0051,$0000,$0217,$AA3F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AADF,$AAFF,$80E0,$0000
  dc.w $0808,$8AEB,$A8ED,$AAAF,$AAEF,$AAFE,$AAEA,$AAEE
  dc.w $8094,$0040,$0A1E,$AA7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAF7,$AAF7,$AA77,$AA77,$A0C0,$0202
  dc.w $82E2,$AABB,$AABB,$2A6B,$AABB,$AAAA,$8297,$AABA
  dc.w $0050,$0000,$0A18,$AA7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$A0C0,$8AAA
  dc.w $AAFF,$AAEE,$AAEE,$AAEA,$AAFE,$AAEE,$2A6F,$AAEE
  dc.w $8090,$0040,$AAAC,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AA7F,$AA7F,$A072,$02AA
  dc.w $2AAA,$AAAB,$AAAF,$AAAB,$AABB,$A2A6,$AABF,$AAAA
  dc.w $0050,$0000,$2269,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$A8FE,$00AA
  dc.w $AAAA,$AAAE,$AAAF,$AAAA,$AAEF,$AAEF,$AAFE,$AAEE
  dc.w $0044,$0004,$AAEF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$A8FE,$20AA
  dc.w $02AA,$AABA,$22B3,$AAAA,$AABB,$AAFF,$AABB,$A2A6
  dc.w $0050,$0000,$AABF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$A8FF,$AAAE
  dc.w $AAEE,$AAEE,$AABF,$AAEA,$AAEF,$AAFF,$AAFE,$A8E9
  dc.w $0040,$0044,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFD,$222A
  dc.w $AAAB,$AAAA,$2ABB,$AAAA,$2A6B,$AABF,$AABB,$A0A5
  dc.w $0000,$0000,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AADF,$0AAA
  dc.w $AAAE,$AAFA,$AAAF,$A8E9,$8A9A,$AAEF,$AAEE,$A8E9
  dc.w $0044,$0040,$0A3F,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$822A
  dc.w $AABB,$A0BA,$2ABF,$A0A5,$A2A6,$AABB,$AABA,$A0A5
  dc.w $0050,$0000,$0203,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$80EA
  dc.w $AAAE,$A2EA,$AABF,$A8E9,$A2E6,$AAEE,$AAFE,$A8A9
  dc.w $0040,$0040,$0207,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AA7F,$AA7F,$A0C2
  dc.w $2AAA,$828A,$AABF,$A2A6,$A2A2,$AABA,$AABA,$2065
  dc.w $0001,$0000,$0001,$AAF7,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAFD,$A00A
  dc.w $AAAA,$8AAE,$AAFF,$AAEA,$8292,$AAFE,$AAAE,$8899
  dc.w $0044,$0000,$0000,$2A7F,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$AAFF,$AAFF,$AAF4,$0080,$0002
  dc.w $2AAA,$282A,$AABB,$A2B6,$0203,$AABA,$AAAA,$A0A5
  dc.w $0010,$0000,$0000,$0207,$AAFF,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFF,$AAFF,$A0CE,$0000,$0000,$0000,$000A
  dc.w $AAAE,$A8AE,$AABF,$A0E4,$0A0E,$AAFE,$AAEE,$A0A5
  dc.w $0054,$0000,$0000,$0001,$AA9F,$AAFF,$AAFF,$AAFF
  dc.w $AAFF,$AAFD,$00E0,$0000,$0000,$0000,$0000,$0002
  dc.w $2AAA,$2AAB,$0A2B,$0040,$2A3B,$AABA,$AAAA,$2061
  dc.w $0010,$0000,$0000,$0206,$2260,$AA7F,$AAFF,$AAFF
  dc.w $AAFF,$A0C8,$0008,$0000,$0000,$0080,$0000,$0002
  dc.w $2AAE,$AAAF,$80E0,$0001,$AAEE,$AAEA,$AAAE,$8094
  dc.w $0054,$0000,$0000,$0A4B,$8094,$2ACF,$AAFF,$AAFF
  dc.w $A8F7,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2AAB,$AAAB,$A8B8,$0217,$AABB,$A0B4,$2A6B,$A0A1
  dc.w $0050,$0000,$0001,$0217,$0256,$0A41,$AA7F,$AAFF
  dc.w $80F0,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2AAA,$AAEA,$AAEF,$AAFF,$AAFE,$8282,$AAEE,$80D5
  dc.w $8090,$0000,$0808,$0257,$AAAA,$889C,$AA3F,$AAFF
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0A2B,$A8AA,$A0A8,$2065,$0000,$2A2E,$AAAB,$0055
  dc.w $0040,$0000,$0809,$0213,$2266,$0859,$2A17,$AAFF
  dc.w $0080,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0A0A,$AAEE,$0088,$0045,$AAAF,$AAEA,$AAEE,$8095
  dc.w $0040,$0000,$0818,$0216,$2065,$8899,$8290,$AA5F
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $022A,$AABB,$AABB,$AAFB,$AAFA,$2A6B,$AAAA,$0051
  dc.w $0000,$0001,$0818,$2226,$2065,$2065,$0257,$AA17
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $022A,$AAEA,$AAAE,$AAFE,$AAEA,$AAAE,$AAEE,$8085
  dc.w $0040,$0005,$0858,$0A5A,$2065,$A0A5,$8282,$88C4
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $202A,$AABB,$A2AA,$0055,$0A5A,$AABA,$AAAA,$0040
  dc.w $0000,$0004,$2868,$8296,$2226,$2065,$0045,$AABB
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $081A,$AAAE,$AAEE,$AAEA,$AAAA,$AAAE,$A8A9,$0044
  dc.w $0000,$0819,$A8A9,$888D,$A8A9,$A8A9,$8889,$AAAE
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $282A,$2AAA,$AABA,$AAEA,$AAAA,$AABA,$A8B9,$0000
  dc.w $0000,$2266,$2232,$0055,$A2A2,$AAAA,$8A9A,$2A6B
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2A6A,$2AAE,$AAAE,$AAEF,$AAFF,$AAEE,$A8E8,$0000
  dc.w $0000,$A0E5,$A2A6,$2266,$82D6,$AAEE,$8A9A,$8A9A
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2A2A,$0A0A,$AAAB,$AAFB,$AABB,$AAAA,$A0A4,$0000
  dc.w $0001,$2065,$8293,$2266,$8296,$AAAA,$A2A6,$2266
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2A2A,$024A,$AAEF,$AAEF,$AAEE,$AAEA,$8090,$0000
  dc.w $0203,$8899,$8889,$8889,$8ACA,$AAAE,$AAAA,$A8AD
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2A2A,$0002,$AABB,$AAFB,$AABB,$A2A6,$0040,$0000
  dc.w $0202,$A0A1,$8899,$0A5A,$AAAB,$AAAA,$AABA,$A0B0
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2A2E,$0040,$2AAE,$AAEE,$AAEE,$8899,$0000,$0000
  dc.w $0A0E,$A2A6,$88C9,$2A6E,$2A6E,$AAAE,$AAEA,$80C0
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2075,$0000,$0A0A,$A2A6,$AAAA,$0050,$0000,$0000
  dc.w $0A0A,$2226,$0044,$A8B8,$2A6A,$AABA,$A8A9,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0001
  dc.w $8A9A,$0040,$0202,$AAAA,$8899,$0000,$0000,$0000
  dc.w $0819,$8ADA,$0212,$82D6,$AAAA,$AAEE,$80C0,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0001
  dc.w $2A6A,$8090,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $2035,$8889,$0A0B,$0A5A,$A2B7,$AABA,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$080D
  dc.w $AAAA,$8080,$0000,$0000,$0000,$0000,$0000,$0001
  dc.w $A2E6,$A8A8,$2829,$A8E9,$AAEA,$A8F8,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$2829
  dc.w $AAAA,$0050,$0000,$0000,$0000,$0000,$0000,$0206
  dc.w $A2A2,$2020,$A2A3,$A2A6,$AAAB,$A0A0,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$2869
  dc.w $AAAA,$0859,$0000,$0000,$0000,$0000,$0000,$2A2A
  dc.w $8889,$0247,$8A9F,$A2E6,$AAEE,$8080,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0005,$0040,$A0A5
  dc.w $A2A6,$0001,$0051,$0040,$0000,$0000,$0001,$AAAA
  dc.w $8282,$081D,$AABA,$8296,$AABA,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0050,$0242,$A8A9
  dc.w $AAAA,$0054,$0859,$A8A9,$0044,$0004,$2A6E,$0256
  dc.w $084C,$2276,$AAFE,$2A6E,$A8A8,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0011,$0206,$A0A5
  dc.w $8899,$0256,$0001,$2A6A,$A2A6,$AAAA,$0256,$0055
  dc.w $2021,$8A8F,$A8A9,$2869,$8090,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0044,$0A0E,$A8E8
  dc.w $0A5E,$A2A6,$A8A9,$0045,$0054,$0055,$0859,$A0A4
  dc.w $8283,$2A7E,$A2A6,$8A9A,$0040,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0A1A,$A0A4
  dc.w $2226,$A0B1,$2A6A,$A0A5,$0216,$2266,$2065,$0246
  dc.w $0809,$A2B6,$8889,$2070,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$2A3A,$A0E4
  dc.w $0001,$A0E4,$0A5A,$AAEE,$A8E9,$AAAE,$AAEA,$A0F4
  dc.w $2A2B,$AAAA,$0216,$0040,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$2A7B,$A0A0
  dc.w $0001,$A0A4,$0015,$2266,$AAAA,$0055,$2065,$0000
  dc.w $AAAA,$A0A4,$2064,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$AAEE,$8090
  dc.w $0202,$A8E8,$0206,$8899,$8095,$8899,$0044,$0A1A
  dc.w $AAAE,$8292,$8080,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0001,$AAEE,$8080
  dc.w $0206,$A0B4,$0000,$2A6A,$A2A6,$2065,$2A6B,$AAAA
  dc.w $0040,$0014,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0202,$A8ED,$8080
  dc.w $0A0E,$A0F4,$0000,$0206,$AAEE,$A8A9,$8095,$0040
  dc.w $0819,$0040,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0203,$2272,$0000
  dc.w $0A1A,$A0B0,$0000,$0000,$0011,$0051,$0000,$0216
  dc.w $0040,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0A0A,$AAAA,$0040
  dc.w $2A2A,$A0E0,$0000,$0000,$0000,$0045,$8899,$0054
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0A0A,$8A9A,$0000
  dc.w $2A6B,$A0A0,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0A1E,$A8A9,$0000
  dc.w $AAEE,$80D0,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0A1A,$2868,$0000
  dc.w $AAAB,$8090,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$2869,$A8EC,$0202
  dc.w $AAAF,$80C0,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$2276,$A0A0,$0202
  dc.w $AAAB,$0040,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0001,$0040,$AAEE,$A0E0,$0206
  dc.w $AAEE,$0040,$0000,$0000,$0000,$0000,$0000,$0000
  dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000