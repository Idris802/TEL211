document_value_1="magician\nwho have lost\ntheir magic?"

document_value_2="Ian"

picture_data="P1\n# A very tiny picture\n6 10\n1 0 0 0 0 1\n0 0 0 0 0 0\n0 1 0 0 1 0\n0 0 0 0 0 0\n0 0 1 1 0 0\n0 0 0 0 0 0\n0 1 0 0 1 0\n0 1 1 1 1 0\n0 0 0 0 0 0\n1 0 0 0 0 1"

arg=$1

if [ $# -gt 1 ]; then 
	echo "Number of arguments is greater then 1, please give only 1!"
	exit 1
elif [ $# -lt 1 ]; then 
	echo "Number of arguments is less than 1, please give 1 argument!"
	exit 1
fi

user=${arg}

usr_dir=${user}_directory

mkdir ${usr_dir} 

cd ${usr_dir}

mkdir ${user}_documents ${user}_pictures ${user}_music

cd ..

tar -xf some_files.tar.gz --one-top-level

cd some_files 

cp -r *.txt ../${usr_dir}/${user}_documents 

cp -r *.png ../${usr_dir}/${user}_pictures 

cp -r *.wav ../${usr_dir}/${user}_music

cat ../${usr_dir}/${user}_documents/a_text_file.txt

cd ..; cd ${usr_dir}/${user}_documents; touch a_very_important_file.txt

echo -e ${document_value_1} > a_very_important_file.txt

echo -e ${document_value_2} >> a_very_important_file.txt

cat a_very_important_file.txt

cd ..; cd ${user}_pictures; touch a_very_tiny_picture.pgm

echo -e ${picture_data} > a_very_tiny_picture.pgm

cd ..; cd ..;

tar cfz ${usr_dir}_230220_144405.tar.xz ${usr_dir}
