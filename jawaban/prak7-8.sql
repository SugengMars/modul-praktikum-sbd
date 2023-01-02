---1
select count(kode_dokter) as 'jumlah dokter'
from dokter_xxxx
---2
select max(gaji) as 'gaji terbesar'
from dokter_xxxx

---3
select min(gaji) as 'gaji terkecil'
from dokter_xxxx

---4
select avg(gaji) as 'gaji rata-rata'
from dokter_xxxx

---5
select gaji, nama_dokter
from dokter_xxxx
where gaji= (select max(gaji) from dokter_xxxx) 
or gaji =(select min(gaji) from dokter_xxxx)

---6 
select count(alamat) as 'Jumlah Dokter Dari Yogyakarta'
from dokter_xxxx
where alamat = 'Yogyakarta'

----- praktikum 8
SELECT alamat AS Kota_Asal, COUNT(alamat) AS Jumlah 
FROM dokter_xxxx GROUP BY alamat

select count(periksa) from pasien_xxxx
group by periksa

select count(hari) as jumlah_periksa_dokter, kode_dokter
from jadwal_dokter_xxxx
group by kode_dokter

SELECT *  FROM pasien_xxxx
SELECT *  FROM dokter_xxxx
select * from jadwal_dokter_xxxx

