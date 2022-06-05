# damkar-docker-compose
Docker compose utk development aplikasi contact center damkar

## Sebelum Memulai
Pastikan Kamu sudah set OS environment variable `$WORKING_DIR_PHP` dengan value path dari `htdocs` (tempat bersemayam project `ccdamkar`) di local PC/Laptop-mu , contoh setnya seperti ini

`export WORKING_DIR_PHP=~/Works/htdocs`

## Bagaimana cara menjalankan repo ini
- `clone` repo ini di local PC/laptop-mu
- masuk ke dalam folder hasil clone `damkar-docker-compose`
- pastikan port `80, 8000, 3306` tidak sedang menyala/running di local PC/laptop-mu
- jika ternyata sedang menyala, silakan matikan port tersebut atau kamu bisa juga menyesuaikan port-port dengan mengubah file `docker-compose.yml`
- jika semua sudah OK, ketikan `docker-compose up`
- tunggu beberapa saat, sampai semua proses docker-compose selesai
- coba akses browser dengan mengetik url ccdamkar `http://localhost/ccdamkar`
- selamat mencoba
