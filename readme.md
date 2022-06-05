# damkar-docker-compose
Docker compose utk development aplikasi contact center damkar

## Sebelum Memulai
- folder `dump` belum tersedia saat repo ini di-clone. Sementara folder `dump` wajib ada untuk bisa membuat docker-compose berjalan dengan benar.
- buat directory `dump`, kemudian `copy`-kan file `damkar_vts.sql` dan `new_cc_damkar270422.sql` ke folder `dump`
- sisipkan query berikut di awal eksekusi file `new_cc_damkar270422.sql`
```sql
CREATE DATABASE IF NOT EXISTS `new_cc_damkar`;
USE new_cc_damkar;
```
- sisipkan query berikut di awal eksekusi file `damkar_vts.sql`
```sql
GRANT ALL ON *.* TO 'user'@'%';
CREATE DATABASE IF NOT EXISTS `damkar_vts`;
USE damkar_vts;
```
- Pastikan Kamu sudah set OS environment variable `$WORKING_DIR_PHP` dengan value path dari `htdocs` (tempat bersemayam project `ccdamkar`) di local PC/Laptop-mu , contoh setnya seperti ini

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
