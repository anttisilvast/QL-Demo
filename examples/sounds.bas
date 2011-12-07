10 REM Test sounds for the Sinclair QL BEEP command.
20 REM Some sounds (indicated):  
25 REM   Dilwyn Jones's Sinclair QL page, see
30 REM   http://www.dilwyn.me.uk/sound/index.html
40 REM   in particular, 
50 REM   http://www.dilwyn.me.uk/sound/soundbytes.zip
60 REM Bassdrum
70 BEEP 5000,1,200,10,1
80 PAUSE 100
90 REM Infinite slow bassdrum
100 BEEP 0,1,200,10,1,15
110 PAUSE 100
120 REM Crash (from D. Jones)
130 BEEP 30000,255,32,2300,1,0,11
140 PAUSE 100
150 REM Chickens (from D. Jones)
160 BEEP 0,10,10,170,-8,0,0,8

