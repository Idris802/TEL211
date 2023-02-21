user=linus_thorvalds
mkdir ${user}
copydir=${user}_2
cp -R ${user} ${copydir} 
cd ${copydir}
touch file_1 file_a dangervirus
ls
find -type f -name "file*"
mv dangervirus .dangervirus
ls 
ls -a 
echo "Have a nice day ${user}"
