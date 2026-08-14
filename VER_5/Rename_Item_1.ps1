cls

# utilita na prejmenovani screenshotu, vytvorene klavesou F12 ve hre "NAM" 

Remove-Variable files, item -ErrorAction SilentlyContinue
$files += @( Get-ChildItem -Include "NAM0????" -Name )

foreach ($item in $files) {
echo "$item --> $item.pcx"
# Rename-Item -Path "project.txt" -NewName "d:\archive\old-project.txt"
Rename-Item $item -NewName "$item.pcx"
}

sleep 5
