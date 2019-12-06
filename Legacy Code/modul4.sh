exit=1;
while [[ $exit -eq 1 ]]
do
echo "1. Menu Kalkulator Loop\n"
echo "2. Exit\n"
echo -n "Pilihan : "
read pilihan
if [[ $pilihan -eq 1 ]];
then
echo -n "Masukan Inputan Bilangan Acuan :"
read acuan;
echo -n "Masukan Batasan : "
read batas;
echo "Penjumlahan\n"
for ((a=1; a<=batas ;a=a+1))
do
let hasil=$acuan+$a
echo -e "$acuan + $a = $hasil"
done
echo "\nPengurangan"
for ((a=1; a<=batas ;a=a+1))
do
let hasil=$acuan-$a
echo -e "$acuan - $a = $hasil"
done
echo "\nPembagian"
for ((a=1; a<=batas ;a=a+1))
do
let hasil=$acuan/$a
echo -e "$acuan / $a = $hasil"
done
echo "\nPerkalian"
for ((a=1; a<=batas ;a=a+1))
do
let hasil=$acuan*$a
echo -e "$acuan * $a = $hasil"
done
elif [[ $pilihan = 2 ]]
then
exit=0;
fi
