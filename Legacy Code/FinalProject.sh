declare -a nama
declare -a tanggal
declare -a pukul
declare -a film
declare -a jumlah
declare -a total

i=0
n=0

menu(){
    clear
    echo "==========================================================="
    echo "                  WELCOME TO MY RESTAURANT                 "
    echo "                   SISTEM RESERVASI MEJA                   "
    echo "==========================================================="
    echo "1. Pilih Pemesanan"
    echo "2. Lihat data Pemesanan"
    echo "3. Cari data Pemesanan"
    echo "4. Batalkan data pemesanan"
    echo "5. Ubah Hak Akses Program"
    echo "6. Exit dari Program"
    echo -n "Masukkan Pilihan : "
    read pilih

    if(( $pilih == 1 ))
    then
        clear
        pesan
    elif(( $pilih == 2 ))
    then
        clear
        lihat
    elif(( $pilih == 3 ))
    then 
        clear
        cari
    elif(( $pilih == 4 ))
    then 
        clear
        delete
    elif(( $pilih == 5 ))
    then
        clear
        ubahhakakses
    elif(( $pilih == 6 ))
    then
        exit
    else
        echo "Maaf, anda salah menginputkan!!!"
        read -rsp $'Tekan terserah...\n' -n1 key
        menu
    fi
}

pesan(){
    flag=0
    echo -n "Nama Pemesanan : "
    read nama_temp
    echo -n "Tanggal        : "
    read tanggal_temp
    echo -n "Pukul          : "
    read pukul_temp
    echo "Avenger  Rp 40.000"
    echo "Joker    RP 45.000"
    echo "Jumanji  Rp 50.000"
    echo "Alladin  Rp 55.000"
    echo -n "Pilih Film    : "
    read jenis_temp
    echo -n "Jumlah Tiket  : "
    read jumlah_temp

    if [ $jenis_temp == Avenger ]
    then
        harga=40000
    elif [ $jenis_temp == Joker ]
    then
        harga=45000
    elif [ $jenis_temp == Jumanji ]
    then
        harga=50000
    elif [ $jenis_temp == Alladin ]
    then
        harga=55000
    fi

    let total_temp=harga*$jumlah_temp
    echo "Total Harga Tiket = $total_temp"

    for nomor_cari in ${nomor[*]}
    do
        if [[ $nomor_cari == $nomor_temp ]]
        then
            flag=1
            break
        fi
    done
    
    if [[ $flag == 1 ]]
    then
        echo "Nomor sudah digunakan"
    else
        nama[$i]=$nama_temp
        tanggal[$i]=$tanggal_temp
        pukul[$i]=$pukul_temp
        jenis[$i]=$jenis_temp
        jumlah[$i]=$jumlah_temp
        total[$i]=$total_temp
        i=$i+1
        n=$n+1
    fi
    read -rsp $'Tekan terserah...\n' -n1 key
    menu
}

lihat(){
    if(( $n==0 ))
    then
        echo "Data masih kosong"
    fi

    for((i=0;i<n;i++))
    do      
        echo "=================================================="
        echo -e "        DATA PESANAN Ke - $(( $i+1 ))          "
        echo "=================================================="
        echo "Nama Pemesan        : ${nama[$i]}"
        echo "Tanggal Pemesan     : ${tanggal[$i]}"
        echo "Pukul               : ${pukul[$i]}"
        echo "Jenis Film          : ${jenis[$i]}"
        echo "Jumlah Film         : ${jumlah[$i]}"
        echo "Total Harga         : ${total[$i]}"
        echo "=================================================="
    done
    read -rsp $'Tekan terserah...\n' -n1 key
    menu
}

cari(){
    echo -n "Masukkan Nama Pemesan Yang Ingin di Cari : "
    read cari
    a=0

    for((i=0;i<n;i++))
    do
        if(( $cari == ${nama[$i]} ))
        then 
            a=1
            break
        fi
    done
    
    if(( $a == 1 ))
    then
        echo "=================================================="
        echo "Nama Pemesan        : ${nama[$i]}"
        echo "Tanggal Pemesan     : ${tanggal[$i]}"
        echo "Pukul               : ${pukul[$i]}"
        echo "Jenis Film          : ${jenis[$i]}"
        echo "Jumlah Film         : ${jumlah[$i]}"
        echo "Total Harga         : ${total[$i]}"
        echo "=================================================="
    else
        echo "Nama Pemesan Tidak Di Temukan"
    fi
    read -rsp $'Tekan terserah...\n' -n1 key
    menu
}


delete(){
    echo -n "Masukkan Nama Pemesan untuk Membatalkan Pesanan : "
    read hapus
    c=0

    for((i=0;i<n;i++))
    do 
        if(( $hapus == ${nama[$i]} ))
        then
            c=1
            break
        fi
    done

    if(( $c == 1 ))
    then
        unset nama[$i] 
        unset tanggal[$i]
        unset pukul[$i] 
        unset jenis[$i]
        unset jumlah[$i]
        unset total[$i]
        echo "Data tamu telah dihapus"

        nama=( "${nama[@]}" )
        tanggal=( "${tanggal[@]}" )
        pukul=( "${pukul[@]}" )
        jenis=( "${jenis[@]}" )
        jumlah=( "${jumlah[@]}" )
        total=( "${total[@]}")
        n=$n-1
    else
        echo "Data Pemesan Tidak di Temukan"
    fi
    read -rsp $'Tekan terserah...\n' -n1 key
    menu
}

ubahhakakses(){
    echo -n "Masukkan File Yang Ingin di Ubah Hak Aksesnya : "
    read ubah

    echo "===== Nilai Hak Akses ====="
    echo "Hak Akses untuk Owner, Group dan Other"
    echo "r/read   = 4 (Membaca Berkas)"
    echo "w/write  = 2 (Mengedit Berkas)"
    echo "x/excute = 1 (Mengeksekusi Berkas)"
    echo -n "Masukkan Nilai Hak Aksesnya : "
    read angka

    sudo chmod $angka $ubah
    echo -e "\nManipulasi berkas sudah selesai"
    ls -l
    read
    read -rsp $'Tekan terserah...\n' -n1 key
    menu
}

halamanawal(){
    clear
    echo "=============================="
    echo " FINAL PROJECT SISTEM OPERASI "
    echo "   PROGRAM PEMESANNAN TIKET   "
    echo "=============================="
    echo "       DWI WAHYU EFFENDI      "
    echo "          18081010017         "
    echo "       Sistem Operasi B       "
    echo "=============================="
    echo -n "   LANJUT KE PROGRAM [Y/N] :  "
    read lanjut

    if [ $lanjut == Y ]
    then
        clear
        menu
    elif [ $lanjut == N ]
    then
        echo "Terimakasih, anda telah keluar dari program!!!"
        exit
    else
        echo "Maaf anda salah menginputkan, Ulangi!!!"
        read -rsp $'Tekan terserah...\n' -n1 key
    fi
}

halamanawal
