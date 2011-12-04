%.bin:	%.s
	vasmm68k_mot -m68000 -Fbin -o $@ $<

sintab:
	 gcc -lm -o make_sin_table make_sin_table.c

commit:
	git add putpixel.s
	git commit -m "update"
	git push

