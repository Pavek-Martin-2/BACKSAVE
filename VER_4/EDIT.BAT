del backsave.exe
del backsave.obj
del c:\utils\backsave.exe

copy backsave.bak backsave.old
copy backsave.bas backsave.bak

qb.exe backsave.bas

copy backsave.exe c:\utils\backsave.exe


