echo -n "Masukkan Menit yang di inginkan = "
read menit
if [ $menit -ge 1440 ]
then
let hari=$menit/1440
let sisa=$menit%1440
let jam=$sisa/60
let sisa=$sisa%60
echo -e "$hari Hari $jam Jam $sisa Menit"
elif [ $menit -ge 60 ]
then
let jam=$menit/60
let sisa=$menit%60
echo -e "$jam Jam $sisa Menit"
else
echo -e "$menit Menit"
fi
