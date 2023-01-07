use rumahsakit_xxxx

-- 1
select * 
FROM resep_xxxx inner join dokter_xxxx
on resep_xxxx.kode_dokter = dokter_xxxx.kode_dokter

--2
select * 
from resep_xxxx inner join pasien_xxxx
on resep_xxxx.kode_pasien = pasien_xxxx.kode_pasien

--3
select *
from resep_xxxx inner join penyakit_xxxx
on resep_xxxx.kode_penyakit = penyakit_xxxx.kode_penyakit

--4
select *
from resep_xxxx inner join obat_xxxx
on resep_xxxx.kode_obat = obat_xxxx.kode_obat

--5
select nama_dokter, hari, shift
from jadwal_dokter_xxxx j 
inner join dokter_xxxx d
on j.kode_dokter = d.kode_dokter

--6
select d.nama_dokter, j.hari
from jadwal_dokter_xxxx j 
inner join dokter_xxxx d
on j.kode_dokter = d.kode_dokter
where hari = 'Selasa'

--7
select d.nama_dokter, r.tanggal
from resep_xxxx r 
inner join dokter_xxxx d
on r.kode_dokter = d.kode_dokter
where r.tanggal = '2015-11-02'

--8
select p.nama, pe.nama_penyakit
from resep_xxxx r 
inner join pasien_xxxx p
on r.kode_pasien = p.kode_pasien
inner join penyakit_xxxx pe
on r.kode_penyakit = pe.kode_penyakit
where r.hari = 'Senin'



