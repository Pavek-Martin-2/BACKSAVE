REM hry_sav4.bas, pro Qbasic 4.5
REM konecne se me to podarilo udelat bez davkovyho souboru
REM jako bylo ve verzi 3 pro gw-basic
REM co se stale nepodarilo vyresit je PWD a asi to ani nepujde udelat lepe
REM bez nutnosti souboru "pwd.txt" dokonce ani AI nevedela a uvadela
REM tento muj trik jako nejlepsi mozne reseni
REM samozdrejme pro ti co si neradi hrajou, nemusite zalohovat jenom
REM savy do her, staci mala uprava a program slouzi na cokoliv
CLS
SHELL "cd > C:\pwd.txt"
REM tady zmena na cd oproti puvodnimu "dir >" a pak zbytecne subtituci
OPEN "C:\pwd.txt" FOR INPUT AS #1
LINE INPUT #1, pwd$
CLOSE #1
REM PRINT (">" + pwd$ + "<")
delka = LEN(pwd$)
REM PRINT (delka)
IF delka <> 3 THEN pwd$ = pwd$ + "\"
REM pro pripad ze by byl aktualni adresar "c:\" se nedava dalsi + "\"
REM PRINT (pwd$)
KILL "C:\pwd.txt"
REM ---------------------------------
pocet = 112
REM zvetsovat hodnotu promenne "pocet" jak budou pribejvat novy radky AH$(n)
REM promena "pocet" nemusi byt uplne presne muze byt o neco vice
REM ale nesnim byt mene naz je nutne !
REM ---------------------------------
DIM AH$(pocet)
DIM SC$(pocet)
SV$ = "NONE"
nalezeno = 0
REM -------- definice radku pole AH$ ---------------
REM AH$(n) absolutni cesta a SC$(n) je maska co jsou save pro danou hru
AH$(1) = "C:\HRY\7DEN7NOC\": SC$(1) = "*.zal"
AH$(2) = "C:\HRY\ABUSE\": SC$(2) = "save*.spe"
REM paklize ma nekdo adresar treba "C:\games\77" tak si to editujte
REM ale na hodnotu SC$(n) by se sahat nemelo !
AH$(3) = "C:\HRY\ALADDIN\": SC$(3) = "NONE"
REM "NONE" je prozatimni reseni a vseho co zatim nebylo zjisteno (save?)
REM samozdrejme se muze stat ze nakonec ze zustane i trvale
AH$(4) = "C:\HRY\ALIENTRI\": SC$(4) = "tril.sg?"
AH$(5) = "C:\HRY\CLOVECE2\": SC$(5) = "save"
AH$(6) = "C:\HRY\BERUSKY\": SC$(6) = "NONE"
AH$(7) = "C:\HRY\BLOOD\": SC$(7) = "game????.sav"
AH$(8) = "C:\HRY\CASTLEM\": SC$(8) = "?"
AH$(9) = "C:\HRY\CASTLEM2\": SC$(9) = "?"
AH$(10) = "C:\HRY\CC\": SC$(10) = "savegame.??? conquer.ini"
REM je dobre pakovat i *.ini; *.cfg apod. tim se nic nezkazi
AH$(11) = "C:\HRY\CHESS\": SC$(11) = "NONE"
AH$(12) = "C:\HRY\CHESSGEN\": SC$(12) = "NONE"
AH$(13) = "C:\HRY\CHESSPLA\": SC$(13) = "NONE"
AH$(14) = "C:\HRY\CIV\": SC$(14) = "civil?.sve replay.txt"
AH$(15) = "C:\HRY\DESCENT\": SC$(15) = "ja.* descent.cfg"
AH$(16) = "C:\HRY\DESCENT2\": SC$(16) = "ja.* descent.cfg"
AH$(17) = "C:\HRY\DOOM\": SC$(17) = "doomsav?.dsg *.bat"
AH$(18) = "C:\HRY\DOOM2\": SC$(18) = "doomsav?.dsg *.bat *.sh"
AH$(19) = "C:\HRY\DUKE2\": SC$(19) = "*.-s?"
AH$(20) = "C:\HRY\DUKE3D\": SC$(20) = "game?.sav"
AH$(21) = "C:\HRY\DUNE2\": SC$(21) = "_save???.dat"
AH$(22) = "C:\HRY\DUNE2S\": SC$(22) = "_save???.dat"
AH$(23) = "C:\HRY\GOBLINS2\": SC$(23) = "NONE"
AH$(24) = "C:\HRY\GOBLINS3\": SC$(24) = "NONE"
AH$(25) = "C:\HRY\HERETIC\": SC$(25) = "*.hsg"
AH$(26) = "C:\HRY\HEXEN\": SC$(26) = "hexen.cfg hexndata/"
AH$(27) = "C:\HRY\JAZZ\": SC$(27) = "save.?"
AH$(28) = "C:\HRY\JILL\": SC$(28) = "jn1save.* jn1savem.*"
AH$(29) = "C:\HRY\JS-WILLY\": SC$(29) = "NONE"
AH$(30) = "C:\HRY\KEEN4\": SC$(30) = "savegam?.ck4"
AH$(31) = "C:\HRY\KEEN5\": SC$(31) = "savegam?.ck5"
AH$(32) = "C:\HRY\KEEN6\": SC$(32) = "savegam?.ck6"
AH$(33) = "C:\HRY\KEEN7\": SC$(33) = "savegm?.kdr"
AH$(34) = "C:\HRY\KEEN8\": SC$(34) = "savegam?.ck6"
AH$(35) = "C:\HRY\LEMMCHS\": SC$(35) = "NONE"
AH$(36) = "C:\HRY\LEMMINGS\": SC$(36) = "NONE"
AH$(37) = "C:\HRY\LHX\": SC$(37) = "NONE"
AH$(38) = "C:\HRY\LODERUN\": SC$(38) = "NONE"
AH$(39) = "C:\HRY\M-CHESS\": SC$(39) = "NONE"
AH$(40) = "C:\HRY\MANIC\": SC$(40) = "NONE"
AH$(41) = "C:\HRY\MLICNAK\": SC$(41) = "teenage?.sav"
AH$(42) = "C:\HRY\MONKEY\": SC$(42) = "savegame.*"
AH$(43) = "C:\HRY\NAM\": SC$(43) = "game?.sav"
AH$(44) = "C:\HRY\LE_OSKAR\": SC$(44) = "*.sav kocky/*.*"
AH$(45) = "C:\HRY\PERESTR\": SC$(45) = "NONE"
AH$(46) = "C:\HRY\PREH2\": SC$(46) = "NONE"
AH$(47) = "C:\HRY\PRINCE\": SC$(47) = "prince.sav megahit.exe megahit.*"
AH$(48) = "C:\HRY\PRINCE2\": SC$(48) = "prince.sav"
AH$(49) = "C:\HRY\PRSI\": SC$(49) = "THE_BEST.TEN"
AH$(50) = "C:\HRY\PSION213\": SC$(50) = "NONE"
AH$(51) = "C:\HRY\PTOMB\": SC$(51) = "NONE"
AH$(52) = "C:\HRY\PUSHOVER\": SC$(52) = "NONE"
AH$(53) = "C:\HRY\QUAKE\": SC$(53) = "go.bat ID1/*.sav ID1/config.cfg EXE/*.*"
AH$(54) = "C:\HRY\RA\": SC$(54) = "savegame.*"
AH$(55) = "C:\HRY\RAPTOR\": SC$(55) = "NONE"
AH$(56) = "C:\HRY\RE\": SC$(56) = "NONE"
AH$(57) = "C:\HRY\REDNECK\": SC$(57) = "game?.sav"
AH$(58) = "C:\HRY\ROOT\": SC$(58) = "*.rot"
AH$(59) = "C:\HRY\SABOTEUR\": SC$(59) = "savgame?"
AH$(60) = "C:\HRY\SIM2000\": SC$(60) = "*.sc2"
AH$(61) = "C:\HRY\SIMCITY\": SC$(61) = "NONE"
AH$(62) = "C:\HRY\SOKOBAN\": SC$(62) = "../sokoban"
AH$(63) = "C:\HRY\TERMVELO\": SC$(63) = "NONE"
AH$(64) = "C:\HRY\THOSPITA\": SC$(64) = "SAVE/*.*"
AH$(65) = "C:\HRY\TOMBGOLD\": SC$(65) = "saveub.*"
AH$(66) = "C:\HRY\TOMBRAID\": SC$(66) = "savegame.*"
AH$(67) = "C:\HRY\TYCOON\": SC$(67) = "*.sv1"
AH$(68) = "C:\HRY\TYCOON2\": SC$(68) = "*.ss0"
AH$(69) = "C:\HRY\UFO\": SC$(69) = "GAME_1/*.* GAME_2/*.* GAME_3/*.* GAME_4/*.* GAME_5/*.* GAME_6/*.* GAME_7/*.* GAME_8/*.* GAME_9/*.* GAME_10/*.*"
AH$(70) = "C:\HRY\VLAK\": SC$(70) = "NONE"
REM AH$(71) = "C:\HRY\WAR\": SC$(71) = "*.sav"
REM pokud nejakou hru vymazete tak je lepsi jeji radek "za-removat"
REM na hodnotu promenny "pocet" se pak ani sahat nemusi
AH$(72) = "C:\HRY\WAR2\": SC$(72) = "*.sav"
AH$(73) = "C:\HRY\WOLF\": SC$(73) = "savegam?.*"
AH$(74) = "C:\HRY\XMASLEM\": SC$(74) = "NONE"
AH$(75) = "C:\HRY\BELOGEST\": SC$(75) = "*.hra"
AH$(76) = "C:\HRY\BLOCKOUT\": SC$(76) = "NONE"
AH$(77) = "C:\HRY\CAESAR2\": SC$(77) = "*.sav"
AH$(78) = "C:\HRY\GALZEME\": SC$(78) = "game?.sav"
AH$(79) = "C:\HRY\HEXX\": SC$(79) = "NONE"
AH$(80) = "C:\HRY\STINYNOC\": SC$(80) = "savegame.* *.cfg"
AH$(81) = "C:\HRY\WHAVEN\": SC$(81) = "*.bat *.txt *.ini svgn?.dat"
AH$(82) = "C:\HRY\ALBION\": SC$(82) = "SAVES/*.*"
AH$(83) = "C:\HRY\WINTER\": SC$(83) = "*.RP?"
AH$(84) = "C:\HRY\KEN\": SC$(84) = "savgame?.dat"
AH$(85) = "C:\HRY\LURE\": SC$(85) = "savegame.dta"
AH$(86) = "C:\HRY\ZORK1\": SC$(86) = "??? SAVE/*.* help.txt"
AH$(87) = "C:\HRY\ZORK2\": SC$(87) = "??? SAVE/*.* help.txt"
AH$(88) = "C:\HRY\ZORK3\": SC$(88) = "??? SAVE/*.* help.txt"
AH$(89) = "C:\HRY\MYSTIC\": SC$(89) = "towers.cfg towers.sg? *.png mys.bat"
AH$(90) = "C:\HRY\CHASM\": SC$(90) = "chasm??.sav *.pcx"
AH$(91) = "C:\HRY\DRACIHIS\": SC$(91) = "save??.sav savegame.map dh.bat navod.txt midi.cfg SAM-OLD/*.* MID/*.* NOMID/*.*"
AH$(92) = "C:\HRY\TOO\": SC$(92) = "too?.zal"
AH$(93) = "C:\HRY\DUNGEONM\": SC$(93) = "dmsave.*"
AH$(94) = "C:\HRY\DUNGEON2\": SC$(94) = "*.ini skull.cfg data/sksave?.*"
AH$(95) = "C:\HRY\CC_DEMO\": SC$(95) = "SAVEGAME.??? conquer.ini"
AH$(96) = "C:\HRY\SUMMER\": SC$(96) = "*.RP?"
AH$(97) = "C:\HRY\BSTONE\": SC$(97) = "savegam?.bs1"
AH$(98) = "C:\HRY\ERADICAT\": SC$(98) = "erad??.sav erad.cfg dig.ini"
AH$(99) = "C:\HRY\SPEAR\": SC$(99) = "savegam?.sdm"
AH$(100) = "C:\HRY\VINYL\": SC$(100) = "config.dat data.dat"
AH$(101) = "C:\HRY\DESCENTS\": SC$(101) = "maca.* descent.cfg"
AH$(102) = "C:\HRY\HEXENSH\": SC$(102) = "hexen.cfg hexndata/"
AH$(103) = "C:\HRY\WHAVEN2\": SC$(103) = "*.txt *.ini svgn?.dat"
AH$(104) = "C:\HRY\VYPRAVA\": SC$(104) = "SAV?.DAT"
AH$(105) = "C:\HRY\DOOMJPTR\": SC$(105) = "doomsav?.dsg *.bat"
AH$(106) = "C:\HRY\HORKELET\": SC$(106) = "SAVE.? *.txt"
AH$(107) = "C:\HRY\GOBLINS3\": SC$(107) = "*.cfg *.inf"
AH$(108) = "C:\HRY\GOBLINS2\": SC$(108) = "*.inf"
AH$(109) = "C:\HRY\NITEMARE\": SC$(109) = "*.sav"

REM ^^^ tady pridavat postupne novy radky jak budou pribejvat novy hry
REM ------------- konec seznamu adresaru a souboru save ---------------
FOR X = 1 TO pocet
REM promena "pocet" je nastavena na zacatku
REM tady jeste nebylo zadny pocet=AH$.len() apod.
REM PRINT AH$(X)
REM PRINT (pwd$)
IF pwd$ = AH$(X) THEN SV$ = SC$(X): nalezeno = 1
NEXT X
REM PRINT (nalezeno)
IF SV$ <> "NONE" THEN PRINT "": PRINT pwd$; SV$
IF nalezeno = 0 THEN PRINT "": PRINT "Adresar nenalezen v seznamu": SYSTEM
IF SV$ = "NONE" THEN PRINT "": PRINT "Adresar v seznamu nalezen ale neni definovano": SYSTEM
REM setaveni nazvu podle datumu a casu a pakovani v arj.exe
datum$ = DATE$
cas$ = TIME$
hodin$ = LEFT$(cas$, 2)
minut$ = MID$(cas$, 4, 2)
den$ = MID$(datum$, 4, 2)
mesic$ = LEFT$(datum$, 2)
rok$ = RIGHT$(datum$, 2)
X$ = "arj.exe a -r -m4 "
REM -r recursive muze bejt vzdycky i pokud nejsou podadresare
REM tak to proste jenom nepouzije, pokud sou tak ano
REM jinak zbytecne by se to zeslozitovalo, musi to bejt uni
REM -m4 max. komprese, -m0 min. komprese (uspora mista na disku ale trva dil)
X$ = X$ + pwd$ + den$ + mesic$ + rok$ + hodin$ + ".arj "
X$ = X$ + SV$
REM test archivu
z$ = "arj.exe t " + pwd$ + den$ + mesic$ + rok$ + hodin$ + ".arj"
REM v Ms-Dosu byly nazvy souboru na 8 znaku Maximalne (12345678.123)
REM takze minuta se nakonec nazvu uz nevesla aby bylo DDMMYYHHmm.ARJ
REM zrychli emulator na 20000 cyklu pred pakovanim v arj.exe
cekej$ = "sleep.exe 10"
REM "sleep 10" neni 10 vterin vse zalezi na momentalny rychlosti emulatoru...
REM je poreba si stim pohrat
rychle$ = "config -set cpu cycles=20000"
PRINT rychle$
SHELL rychle$
REM PRINT cekej$
SHELL cekej$
PRINT X$
REM spusteni x$ pakuje uz primo bez nutnosti davky :) uraaaa
REM nefungoval z X$ (velkym pismenem, nezjisteno proc)
SHELL X$
REM PRINT cekej$
SHELL cekej$
PRINT z$
SHELL z$
REM z$ kontroluje zapakovene pomoci arj.exe
REM PRINT cekej$
SHELL cekej$
REM vrati zase spatky cykly na 3000 (3000=dosbox.conf tedy auto)
pomalu$ = "config -set cpu cycles=auto"
PRINT "archiv je ve formatu DDMMYYHH.arj"
PRINT pomalu$
SHELL pomalu$
REM PRINT cekej$
SHELL cekej$

