IP=0;
jumlah=0;
loop=1;
indexnama=0
indexnpm=0
indexjurusan=0
indexsemester=0
indexmk1=0;
indexmk2=0;
indexmk3=0;
indexmk4=0;

declare -a nilai
declare -a ip
declare -a namaa
declare -a npmm
declare -a jurusann
declare -a semsterr
declare -a mk1
declare -a mk2
declare -a mk3
declare -a mk4

while [[ loop -eq 1 ]]; do
    echo " == Program SIAMIK Mahasiswa == ";
    echo "1. Input Data Mhs";
    echo "2. Input Data Nilai Mata Kuliah Mhs";
    echo "3. View Data Mahasiswa dan Data Nilai MK Mhs";
    echo "4. Nilai IP Mhs";
    echo "5. Exit";
    echo "Pilihan :"
    read pilihan;

    case "$pilihan" in
        "1" )
        echo "Nama :";
        read namaa[$indexnama];
        let indexnama=$indexnama+1;

        echo "NPM";
        read npmm[$indexnpm];
        let indexnpm=$indexnpm+1;

        echo "Jurusan";
        read jurusann[$indexjurusan];
        let indexjurusan=$indexjurusan+1;
        
        echo "Semester";
        read semsterr[$indexsemester];
        let indexsemester=$indexsemester+1;
        ;;
        "2" )
        echo "Sistem Operasi : "
        read mk1[$indexmk1];
        let indexmk1=$indexmk1+1;
        
        echo "Pemrogranan Lanjut : "
        read mk2[$indexmk2];
        let indexmk2=$indexmk2+1;

        echo "Bela Negara : "
        read mk3[$indexmk3];
        let indexmk3=$indexmk3+1;
        
        echo "Statistik Komputasi : "
        read mk4[$indexmk4];
        let indexmk4=$indexmk4+1;
            ;;
        "3" )
        for (( i = 0; i < $indexnpm; i++ ));
        do
            echo "Nama : ${namaa[$i]}";
            echo "NPM : ${npmm[$i]}";
            echo "Jurusan : ${jurusann[$i]}"
            echo "Semester : ${semsterr[$i]}"
            echo "Sistem Operasi : ${mk1[$i]}";
            echo "Pemrograman Lanjut: ${mk2[$i]}";
            echo "Bela Negara : ${mk3[$i]}"
            echo "Statistik Komputasi : ${mk4[$i]}"
        done
            ;;
        "4" )
        for (( i = 0; i < $indexnpm; i++ ));
        do
                let jumlah=${mk1[$i]}+${mk2[$i]}+${mk3[$i]}+${mk4[$i]};
                let IP=$jumlah/4;
                echo "Rata Rata IP Mahasiswa: $IP";    

        done
            ;;
        "5" )
        echo "Terima Kasih"
        let loop=2;
            ;;
    esac

done
