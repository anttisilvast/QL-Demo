10 REM Test sounds for the Sinclair QL BEEP command.
20 REM By Antti Silvast 2011.
30 REM Slow bassdrum
40 BEEP 5000,1,200,10,1
50 PAUSE 100
60 REM Looping slow bassdrum
70 BEEP 0,1,200,10,1,15
80 PAUSE 100
90 REM 4/4 hard bassdrum (190 BPM)
100 BEEP 0,1,200,10,3,15
1000 REM
1010 REM A good source for further QL beep sounds is  
1020 REM Dilwyn Jones's Sinclair QL page, see
1030 REM   http://www.dilwyn.me.uk/sound/index.html
1040 REM in particular, 
1050 REM   http://www.dilwyn.me.uk/sound/soundbytes.zip
