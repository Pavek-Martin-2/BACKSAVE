0 REM zalohovaci program pro ukladani SAVE pozic her v Dos-Boxu
1 REM vsechno hezky pod jednou strechou, netreba behat po 150 adresarich
4 cls
5 POCET=120
6 CEKEJ=1000
7 SHELL "dir > C:\pwd.txt"
8 FOR A = 1 TO CEKEJ : X=SQR(A) : NEXT A
11 REM C:\ zarucene existuje
12 REM funguje i na D: kdyz je pripojenej jako *.img
13 REM ale samozdrejme se na read-only se neda ukladat, ale pozna kde je
20 OPEN "C:\pwd.txt" FOR INPUT AS #1
30 INPUT #1,PWD$
40 CLOSE #1
45 FOR A = 1 TO CEKEJ : X=SQR(A) : NEXT A
50 KILL "C:\pwd.txt"
51 REM prikaz KILL = delete C:\pwd.txt ekvivalent
90 REM PRINT PWD$
100 DELKA=LEN(PWD$)
105 REM PRINT "1234567890123456789012345678901234567"
110 REM PRINT DELKA
120 PWD2$=MID$(PWD$,14,DELKA -14)
130 REM PRINT PWD2$
140 REM ------------- adresare hry seznam a do ceho uklada save SC$(n)
141 REM
142 DIM AH$(POCET)
143 DIM SC$(POCET)
144 REM     ^^ zvetsovat hodnotu POCET jak budou pribejvat novy radky !
145 SV$="NONE"
150 NALEZENO=0
999 REM -------------------------
1000 AH$(1)="C:\HRY\7DEN7NOC\" : SC$(1)="*.zal"
1001 AH$(2)="C:\HRY\ABUSE\" : SC$(2)="save*.spe"
1002 AH$(3)="C:\HRY\ALADDIN\" : SC$(3)="NONE"
1003 AH$(4)="C:\HRY\ALIENTRI\" : SC$(4)="tril.sg?"
1004 AH$(5)="C:\HRY\CLOVECE2\" : SC$(5)="save"
1005 AH$(6)="C:\HRY\BERUSKY\" : SC$(6)="NONE"
1006 AH$(7)="C:\HRY\BLOOD\" : SC$(7)="game????.sav"
1007 AH$(8)="C:\HRY\CASTLEM\" : SC$(8)="?"
1008 AH$(9)="C:\HRY\CASTLEM2\" : SC$(9)="?"
1009 AH$(10)="C:\HRY\CC\" : SC$(10)="savegame.??? conquer.ini"
1010 AH$(11)="C:\HRY\CHESS\" : SC$(11)="NONE"
1011 AH$(12)="C:\HRY\CHESSGEN\" : SC$(12)="NONE"
1012 AH$(13)="C:\HRY\CHESSPLA\" : SC$(13)="NONE"
1013 AH$(14)="C:\HRY\CIV\" : SC$(14)="civil?.sve replay.txt"
1014 AH$(15)="C:\HRY\DESCENT\" : SC$(15)="ja.* descent.cfg"
1015 AH$(16)="C:\HRY\DESCENT2\" : SC$(16)="ja.* descent.cfg"
1016 AH$(17)="C:\HRY\DOOM\" : SC$(17)="doomsav?.dsg *.bat"
1017 AH$(18)="C:\HRY\DOOM2\" : SC$(18)="doomsav?.dsg *.bat *.sh"
1018 AH$(19)="C:\HRY\DUKE2\" : SC$(19)="*.-s?"
1019 AH$(20)="C:\HRY\DUKE3D\" : SC$(20)="game?.sav"
1020 AH$(21)="C:\HRY\DUNE2\" : SC$(21)="_save???.dat"
1021 AH$(22)="C:\HRY\DUNE2S\" : SC$(22)="_save???.dat"
1022 AH$(23)="C:\HRY\GOBLINS2\" : SC$(23)="NONE"
1023 AH$(24)="C:\HRY\GOBLINS3\" : SC$(24)="NONE"
1024 AH$(25)="C:\HRY\HERETIC\" : SC$(25)="*.hsg"
1025 AH$(26)="C:\HRY\HEXEN\" : SC$(26)="hexen.cfg hexndata/"
1026 AH$(27)="C:\HRY\JAZZ\" : SC$(27)="save.?"
1027 AH$(28)="C:\HRY\JILL\" : SC$(28)="jn1save.* jn1savem.*"
1028 AH$(29)="C:\HRY\JS-WILLY\" : SC$(29)="NONE"
1029 AH$(30)="C:\HRY\KEEN4\" : SC$(30)="savegam?.ck4"
1030 AH$(31)="C:\HRY\KEEN5\" : SC$(31)="savegam?.ck5"
1031 AH$(32)="C:\HRY\KEEN6\" : SC$(32)="savegam?.ck6"
1032 AH$(33)="C:\HRY\KEEN7\" : SC$(33)="savegm?.kdr"
1033 AH$(34)="C:\HRY\KEEN8\" : SC$(34)="savegam?.ck6"
1034 AH$(35)="C:\HRY\LEMMCHS\" : SC$(35)="NONE"
1035 AH$(36)="C:\HRY\LEMMINGS\" : SC$(36)="NONE"
1036 AH$(37)="C:\HRY\LHX\" : SC$(37)="NONE"
1037 AH$(38)="C:\HRY\LODERUN\" : SC$(38)="NONE"
1038 AH$(39)="C:\HRY\M-CHESS\" : SC$(39)="NONE"
1039 AH$(40)="C:\HRY\MANIC\" : SC$(40)="NONE"
1040 AH$(41)="C:\HRY\MLICNAK\" : SC$(41)="teenage?.sav"
1041 AH$(42)="C:\HRY\MONKEY\" : SC$(42)="savegame.*"
1042 AH$(43)="C:\HRY\NAM\" : SC$(43)="game?.sav"
1043 AH$(44)="C:\HRY\LE_OSKAR\" : SC$(44)="*.sav kocky/*.*"
1044 AH$(45)="C:\HRY\PERESTR\" : SC$(45)="NONE"
1045 AH$(46)="C:\HRY\PREH2\" : SC$(46)="NONE"
1046 AH$(47)="C:\HRY\PRINCE\" : SC$(47)="prince.sav megahit.exe megahit.*"
1047 AH$(48)="C:\HRY\PRINCE2\" : SC$(48)="prince.sav"
1048 AH$(49)="C:\HRY\PRSI\" : SC$(49)="THE_BEST.TEN"
1049 AH$(50)="C:\HRY\PSION213\" : SC$(50)="NONE"
1050 AH$(51)="C:\HRY\PTOMB\" : SC$(51)="NONE"
1051 AH$(52)="C:\HRY\PUSHOVER\" : SC$(52)="NONE"
1052 AH$(53)="C:\HRY\QUAKE\" : SC$(53)="go.bat ID1/*.sav ID1/config.cfg EXE/*.*"
1053 AH$(54)="C:\HRY\RA\" : SC$(54)="savegame.*"
1054 AH$(55)="C:\HRY\RAPTOR\" : SC$(55)="NONE"
1055 AH$(56)="C:\HRY\RE\" : SC$(56)="NONE"
1056 AH$(57)="C:\HRY\REDNECK\" : SC$(57)="game?.sav"
1057 AH$(58)="C:\HRY\ROOT\" : SC$(58)="*.rot"
1058 AH$(59)="C:\HRY\SABOTEUR\" : SC$(59)="savgame?"
1059 AH$(60)="C:\HRY\SIM2000\" : SC$(60)="*.sc2"
1060 AH$(61)="C:\HRY\SIMCITY\" : SC$(61)="NONE"
1061 AH$(62)="C:\HRY\SOKOBAN\" : SC$(62)="../sokoban"
1062 AH$(63)="C:\HRY\TERMVELO\" : SC$(63)="NONE"
1063 AH$(64)="C:\HRY\THOSPITA\" : SC$(64)="SAVE/*.*"
1064 AH$(65)="C:\HRY\TOMBGOLD\" : SC$(65)="saveub.*"
1065 AH$(66)="C:\HRY\TOMBRAID\" : SC$(66)="savegame.*"
1066 AH$(67)="C:\HRY\TYCOON\" : SC$(67)="*.sv1"
1067 AH$(68)="C:\HRY\TYCOON2\" : SC$(68)="*.ss0"
1068 AH$(69)="C:\HRY\UFO\" : SC$(69)="GAME_1/*.* GAME_2/*.* GAME_3/*.* GAME_4/*.* GAME_5/*.* GAME_6/*.* GAME_7/*.* GAME_8/*.* GAME_9/*.* GAME_10/*.*"
1069 AH$(70)="C:\HRY\VLAK\" : SC$(70)="NONE"
1070 AH$(71)="C:\HRY\WAR\" : SC$(71)="*.sav"
1071 AH$(72)="C:\HRY\WAR2\" : SC$(72)="*.sav"
1072 AH$(73)="C:\HRY\WOLF\" : SC$(73)="savegam?.*"
1073 AH$(74)="C:\HRY\XMASLEM\" : SC$(74)="NONE"
1074 AH$(75)="C:\HRY\BELOGEST\" : SC$(75)="*.hra"
1075 AH$(76)="C:\HRY\BLOCKOUT\" : SC$(76)="NONE"
1076 AH$(77)="C:\HRY\CAESAR2\" : SC$(77)="*.sav"
1077 AH$(78)="C:\HRY\GALZEME\" : SC$(78)="game?.sav"
1078 AH$(79)="C:\HRY\HEXX\" : SC$(79)="NONE"
1079 AH$(80)="C:\HRY\STINYNOC\" : SC$(80)="savegame.* *.cfg"
1080 AH$(81)="C:\HRY\WHAVEN\" : SC$(81)="*.bat *.txt *.ini svgn?.dat"
1081 AH$(82)="C:\HRY\ALBION\" : SC$(82)="SAVES/*.*"
1082 AH$(83)="C:\HRY\WINTER\" : SC$(83)="*.RP?"
1083 AH$(84)="C:\HRY\KEN\" : SC$(84)="savgame?.dat"
1084 AH$(85)="C:\HRY\LURE\" : SC$(85)="savegame.dta"
1085 AH$(86)="C:\HRY\ZORK1\" : SC$(86)="??? SAVE/*.* help.txt"
1086 AH$(87)="C:\HRY\ZORK2\" : SC$(87)="??? SAVE/*.* help.txt"
1087 AH$(88)="C:\HRY\ZORK3\" : SC$(88)="??? SAVE/*.* help.txt"
1088 AH$(89)="C:\HRY\MYSTIC\" : SC$(89)="towers.cfg towers.sg? *.png mys.bat"
1089 AH$(90)="C:\HRY\CHASM\" : SC$(90)="chasm??.sav *.pcx"
1090 AH$(91)="C:\HRY\DRACIHIS\" : SC$(91)="save??.sav savegame.map dh.bat navod.txt midi.cfg SAM-OLD/*.* MID/*.* NOMID/*.*"
1091 AH$(92)="C:\HRY\TOO\" : SC$(92)="too?.zal"
1092 AH$(93)="C:\HRY\DUNGEONM\" : SC$(93)="dmsave.*"
1093 AH$(94)="C:\HRY\DUNGEON2\" : SC$(94)="*.ini skull.cfg data/sksave?.*"
1094 AH$(95)="C:\HRY\CC_DEMO\" : SC$(95)="SAVEGAME.??? conquer.ini"
1095 AH$(96)="C:\HRY\SUMMER\" : SC$(96)="*.RP?"
1096 AH$(97)="C:\HRY\BSTONE\" : SC$(97)="savegam?.bs1"
1097 AH$(98)="C:\HRY\ERADICAT\" : SC$(98)="erad??.sav erad.cfg dig.ini"
1098 AH$(99)="C:\HRY\SPEAR\" : SC$(99)="savegam?.sdm"
1099 AH$(100)="C:\HRY\VINYL\" : SC$(100)="config.dat data.dat"
1100 AH$(101)="C:\HRY\DESCENTS\" : SC$(101)="maca.* descent.cfg"
1101 AH$(102)="C:\HRY\HEXENSH\" : SC$(102)="hexen.cfg hexndata/"
1102 AH$(103)="C:\HRY\WHAVEN2\" : SC$(103)="*.txt *.ini svgn?.dat"
1103 AH$(104)="C:\HRY\VYPRAVA\" : SC$(104)="SAV?.DAT"
1104 AH$(105)="C:\HRY\DOOMJPTR\" : SC$(105)="doomsav?.dsg *.bat"
1105 AH$(106)="C:\HRY\HORKELET\" : SC$(106)="SAVE.? *.txt"
1106 AH$(107)="C:\HRY\GOBLINS3\" : SC$(107)="*.cfg *.inf"
1107 AH$(108)="C:\HRY\GOBLINS2\" : SC$(108)="*.inf"
1108 AH$(109)="C:\HRY\NFS\" : SC$(109)="GAMEDATA\"

1998 REM ^^^ tady pridavat postupne novy radky jak budou pribejvat novy hry
1999 REM --------------- konec seznamu adresaru a souboru save
2000 FOR X = 1 TO POCET : REM promena POCET na zacatku
2010 REM PRINT AH$(X)
2012 IF PWD2$ = AH$(X) THEN SV$=SC$(X) : NALEZENO=1
2020 NEXT X
2040 REM PRINT PWD2$
2022 PRINT "backsave.exe ver.3 - GW-BASIC 3.32"
2050 IF SV$ <> "NONE" THEN PRINT "" : PRINT PWD2$SV$
2055 IF NALEZENO=0 THEN PRINT "" : PRINT "Adresar nenalezen v seznamu" : SYSTEM
2060 IF SV$="NONE" THEN PRINT "" : PRINT "Adresar v seznamu nalezen ale neni definovano" : SYSTEM
2070 REM setaveni nazvu podle datumu a casu a pakovani v arj.exe
3000 DATUM$ = DATE$
3010 CAS$=TIME$
3020 HODIN$ = LEFT$(CAS$,2)
3030 MINUT$ = MID$(CAS$,4,2)
3040 DEN$=MID$(DATUM$,4,2)
3050 MESIC$=LEFT$(DATUM$,2)
3060 ROK$=RIGHT$(DATUM$,2)
3070 X$="arj a -r -m4 "
3071 REM -r recursive muze bejt vzdycky i pokud nejsou podadresare
3072 REM tak to proste jenom nepouzije, pokud sou tak ano
3073 REM jinak zbytecne by se to zeslozitovalo
3074 REM -m4 max. komprese, -m0 min. komprese (uspora mista na disku ale trva dil)
3080 X$=X$ + PWD2$ + DEN$ + MESIC$ + ROK$ + HODIN$ + ".arj "
3090 X$=X$ + SV$
3100 PRINT X$
3110 REM test archivu
3120 Z$="arj t " + PWD2$ + DEN$ + MESIC$ + ROK$ + HODIN$ + ".arj"
3130 PRINT Z$
3035 PRINT "" : PRINT "archiv je ve formatu  DDMMYYHH.arj"
3036 REM v Ms-Dosu byly nazvy souboru na 8 znaku Maximalne (12345678.123)
3037 REM takze minuta se nakonec nazvu uz nevesla aby bylo DDMMYYHHmm.ARJ
3150 OPEN "ASDFGHVB.BAT" FOR OUTPUT AS #1
3151 REM zrychli emulator na 30000 cyklu pred pakovanim
3152 PRINT #1, "config -set cpu cycles=30000"
3160 PRINT #1, X$
3162 PRINT #1, "SLEEP 10"
3164 PRINT #1, Z$
3166 PRINT #1 , "SLEEP 10"
3168 PRINT #1, "config -set cpu cycles=auto"
3169 REM vrati zase zpatky defautni cykly tzn. 3000
3180 PRINT #1, "DELETE ASDFGHVB.BAT"
3190 CLOSE #1
3200 FOR A = 1 TO CEKEJ : X=SQR(A) : NEXT A
9999 system
