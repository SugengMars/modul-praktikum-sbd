CREATE DATABASE rumahsakit_xxxx ---diganti nim masing2
on
( 
name = rumahsakit_xxxx_dat,
filename = 'C:\Users\asus\Desktop\modul-praktikum-sbd\rumahsakit_xxxx_dat.mdf', --directory file
size = 10,
maxsize=50,
filegrowth=5)
log on
(
name ='rumahsakit_xxxx_log',
filename = 'C:\Users\asus\Desktop\modul-praktikum-sbd\rumahsakit_xxxx_log.ldf', --directory file
size =5mb,
maxsize=25mb,
filegrowth =5mb)

use rumahsakit_xxxx

CREATE Table dokter_xxxx (
	kode_dokter VARCHAR (5) PRIMARY KEY NOT NULL,
	nama_dokter VARCHAR (30),
	gender CHAR(1) CHECK (gender = 'L' OR gender = 'P'),
	alamat VARCHAR (30),
	gaji int
)

CREATE TABLE jadwal_dokter_xxxx(
	kode_jadwal CHAR (5) PRIMARY KEY NOT NULL,
	hari VARCHAR (10),
	shift VARCHAR (10),
	kode_dokter VARCHAR (5) FOREIGN KEY REFERENCES dokter_xxxx(kode_dokter)
)

CREATE TABLE pasien_xxxx (
	kode_pasien CHAR (5) PRIMARY KEY NOT NULL, 
	nama VARCHAR (30) NOT NULL,
	tanggal_lahir Datetime,
	gender CHAR(1) CHECK (gender = 'L' OR gender = 'P'),
	alamat VARCHAR (30),
	periksa int
)

CREATE TABLE penyakit_xxxx (
	kode_penyakit CHAR (5) PRIMARY KEY NOT NULL, 
	nama_penyakit VARCHAR (30) NOT NULL
)

CREATE TABLE obat_xxxx(
	kode_obat CHAR (5) PRIMARY KEY NOT NULL,
	nama_obat VARCHAR (30) NOT NULL
)

CREATE TABLE resep_xxxx (
	kode_resep INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	hari VARCHAR (10) CHECK ( hari = 'senin' or hari = 'selasa' or hari = 'rabu' or hari = 'kamis' or hari = 'jumat' or hari = 'sabtu'),
	tanggal Datetime,
	kode_obat CHAR (5) FOREIGN KEY REFERENCES obat_xxxx(kode_obat),
	kode_penyakit CHAR (5) FOREIGN KEY REFERENCES penyakit_xxxx(kode_penyakit),
	kode_pasien CHAR (5) FOREIGN KEY REFERENCES pasien_xxxx(kode_pasien),
	kode_dokter VARCHAR (5) FOREIGN KEY REFERENCES dokter_xxxx(kode_dokter)
)
insert into dokter_xxxx(kode_dokter, nama_dokter, gender, alamat, gaji)
VALUES ('D0001','Ema Utami','P','Yogyakarta',2500000),
		('D0002','Suwanto Raharjo','L','Jakarta',2000000),
		('D0003','Emi Susanti','P','Semarang',1500000),
		('D0004','Andi Sunyoto','L','Bandung',2000000),
		('D0005','Emha Taufik Luthfi','L','Yogyakarta',3000000);


INSERT INTO pasien_xxxx(kode_pasien, nama, tanggal_lahir, gender, alamat, periksa)
VALUES ('P0001', 'Risa', '1997/12/10', 'P', 'Jakarta', 1),
		('P0002', 'Janu', '1996/10/02', 'L', 'Surabaya', 2),
		('P0003', 'Reva', '2000/11/30', 'P', 'Yogyakarta', 4),
		('P0004', 'Didi', '1989/01/20', 'L', 'Surakarta', 3),
		('P0005', 'Lativa', '1999/04/14 ', 'P', 'Purwokerto', 1),
		('P0006', 'Fanie', '1980/09/20', 'L', 'Cilacap', 2),
		('P0007', 'Putri', '2001/06/06', 'P', 'Yogyakarta', 5),
		('P0008', 'Randi', '2010/07/12', 'L', 'Jakarta', 3),
		('P0009', 'Daffa', '1995/05/05', 'L', 'Semarang', 2),
		('P0010', 'Vika', '1996/06/06', 'P', 'Bandung', 4);


INSERT INTO penyakit_xxxx(kode_penyakit, nama_penyakit)
VALUES ('K0001', 'Batuk'),
		('K0002', 'Panu'),
		('K0003', 'Kadas'),
		('K0004', 'Kurap'),
		('K0005', 'Konstipasi'),
		('K0006', 'Migrain'),
		('K0007', 'Tipus'),
		('K0008', 'Hepatitis'),
		('K0009', 'Diabates'),
		('K0010', 'Hipertensi');



INSERT INTO obat_xxxx(kode_obat, nama_obat)
VALUES ('M0001', 'Antalgin'),
		('M0002', 'parasetamol'),
		('M0003', 'Ctm'),
		('M0004', 'Antibiotik'),
		('M0005', 'Salep'),
		('M0006', 'Dulcox'),
		('M0007', 'pacepil'),
		('M0008', 'Imunox'),
		('M0009', 'Hiposetamol'),
		('M0010', 'Metromex');


INSERT INTO jadwal_dokter_xxxx(kode_jadwal, hari, shift, kode_dokter)
VALUES ('A0001', 'Senin', 'Pagi', 'D0001'),
		('A0002', 'Senin', 'sore', 'D0002' ),
		('B0001', 'selasa', 'Pagi', 'D0004'),
		('B0002', 'selasa', 'Sore', 'D0003'),
		('C0001', 'Rabu', 'Pagi', 'D0001'),
		('C0002', 'Rabu', 'Sore', 'D0005'),
		('D0001', 'kamis', 'Pagi', 'D0003'),
		('D0002', 'kamis', 'Sore', 'D0002'),
		('E0001', 'Jumat', 'Pagi', 'D0004'),
		('E0002', 'Jumat', 'Sore', 'D0001'),
		('F0001', 'Sabtu', 'pagi', 'D0003');



INSERT INTO resep_xxxx(hari, tanggal, kode_pasien,kode_penyakit, kode_obat, kode_dokter)
values ('Senin', '11/02/2015', 'P0001', 'K0001', 'M0001', 'D0001'),
		('Senin', '11/02/2015', 'P0002', 'K0002', 'M0001', 'D0002'),
		('Senin', '11/02/2015', 'P0002', 'K0003', 'M0001', 'D0002'),
		('Senin', '11/02/2015', 'P0002','K0004', 'M0001', 'D0002'),
		('Selasa', '12/02/2015', 'P0003','K0005', 'M0001', 'D0004'),
		('Selasa', '12/02/2015', 'P0004','K0006', 'M0001', 'D0004'),
		('Selasa', '12/02/2015', 'P0005','K0007', 'M0001', 'D0003'),
		('Selasa', '12/02/2015', 'P0006','K0008', 'M0001', 'D0003'),
		('Selasa', '12/02/2015', 'P0007','K0009', 'M0001', 'D0003'),
		('Rabu', '12/12/2015', 'P0007','K0009', 'M0001', 'D0003');


select * from dokter_xxxx
select * from jadwal_dokter_xxxx
select * from obat_xxxx
select * from pasien_xxxx
select * from penyakit_xxxx
select * from resep_xxxx

---- praktikum modul 4

--- where
-- SELECT [Daftar_Kolom] FROM Tabel WHERE Kondisi
select * from dokter_xxxx 
where alamat ='Jakarta'

select * from dokter_xxxx
where gaji > 1500000

---- ORDER BY
select * from dokter_xxxx
order by nama_dokter

select * from dokter_xxxx
order by nama_dokter desc

--- BETWEEN
SELECT * FROM dokter_xxxx
where gaji between 1500000 and 2500000

--- TOP 
SELECT top 2 * FROM dokter_xxxx

----- PRAKTIKUM 5
-- like

-- percent(%)
SELECT * FROM dokter_xxxx
where nama_dokter like 'E%'

SELECT * FROM dokter_xxxxWHERE nama_dokter LIKE '%O'-- undescore(_)SELECT *FROM dokter_xxxxWHERE nama_dokter like '_U%'-- updateselect * from dokter_xxxxUPDATE dokter_xxxx SET nama_dokter='Ema Utami Saja', alamat='Semarang'
WHERE kode_dokter='D0001'select * from dokter_xxxx-- DELETEselect * from jadwal_dokter_xxxxDELETE FROM jadwal_dokter_xxxx WHERE kode_jadwal='F0001'

------ Praktikum 7
---- Agregate avg, max, min, sum, count
-- count
select * from pasien_xxxx
select count(*) from pasien_xxxx

-- max
select max(periksa) from pasien_xxxx

-- min
select min(periksa) from pasien_xxxx

-- avg
select avg(periksa) from pasien_xxxx

-- sum
select sum(periksa) from pasien_xxxx

-- alias
SELECT COUNT(kode_pasien) AS [Jumlah Pasien Dari Yogyakarta] 
FROM pasien_xxxx WHERE alamat='Yogyakarta'

---- PRAKTIKUM 8
-- group by
sELECT alamat AS Kota_Asal, COUNT(alamat) AS Jumlah 
FROM pasien_xxxx GROUP BY alamat

