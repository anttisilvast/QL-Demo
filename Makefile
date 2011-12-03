%.bin:	%.s
	vasmm68k_mot -m68000 -Fbin -o $@ $<

