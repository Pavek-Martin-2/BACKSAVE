@echo off
cls
@echo
@echo zalohuju soubor backsave.txt, backssave.bat, basksave.old

copy c:\utils\backsave.bak C:\utils\backsave.old
copy c:\utils\backsave.txt C:\utils\backsave.bak

copy backsave.txt C:\prog\bc31\moje\backsav5\
copy backsave.bak C:\prog\bc31\moje\backsav5\
copy backsave.old C:\prog\bc31\moje\backsav5\

copy backsave.txt C:\zaloha\
copy backsave.bak C:\zaloha\
copy backsave.old C:\zaloha\

copy backsave.txt C:\zaloha\utils\
copy backsave.bak C:\zaloha\utils\
copy backsave.old C:\zaloha\utils\

copy C:\utils\copysav.bat C:\prog\bc31\moje\backsav5\
copy C:\utils\copysav.bat C:\zaloha\
copy C:\utils\copysav.bat C:\zaloha\utils\
