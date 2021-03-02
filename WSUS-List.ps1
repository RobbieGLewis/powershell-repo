$computers = get-content C:\Users\a1-wyldeja\Desktop\wsus.txt

foreach ($computer in $computers){

get-wsuscomputer -NameIncludes $computer -ErrorAction stop}