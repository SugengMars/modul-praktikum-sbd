--- JAWABAN PRAKTIKUM 5
-- 1
select * from dokter_xxxx
where nama_dokter like '%i%'

-- 2
select nama_dokter from dokter_xxxx
where alamat like '%karta'

-- 3
select * from dokter_xxxx
where nama_dokter like '_m%'

-- 4 
update dokter_xxxx Set alamat = 'Semarang'
where alamat ='Jakarta'

-- 5
select * from dokter_xxxx
where nama_dokter like '%suwanto%'

update dokter_xxxx set alamat = 'Semarang'
where nama_dokter like '%suwanto%'

--- 6
select * from dokter_xxxx
where nama_dokter like '%susan%'

delete from dokter_xxxx 
where nama_dokter like '%susan%'

--- 7
delete from dokter_xxxx 
where alamat like '%Bandung%'

--- 8
delete from dokter_xxxx 
where kode_dokter = 'D0002'