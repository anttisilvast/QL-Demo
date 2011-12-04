%.bin:	%.s
	vasmm68k_mot -m68000 -Fbin -o $@ $<

commit:
	git add putpixel.s
	git commit -m "update"
	git push

