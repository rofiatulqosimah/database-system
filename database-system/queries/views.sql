-- View untuk transkrip nilai
CREATE VIEW v_transkrip AS
SELECT 
    m.nim,
    m.nama,
    mk.kode_matakuliah,
    mk.nama_matakuliah,
    n.nilai,
    mk.sks,
    n.semester_ambil
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim_mahasiswa
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah;

-- View untuk status pembimbingan
CREATE VIEW v_pembimbingan AS
SELECT 
    m.nim,
    m.nama AS nama_mahasiswa,
    d.nama AS nama_dosen,
    dp.tanggal_mulai,
    dp.status
FROM mahasiswa m
JOIN dosen_pembimbing dp ON m.nim = dp.nim_mahasiswa
JOIN dosen d ON dp.id_dosen = d.id_dosen;

-- View untuk statistik nilai per mata kuliah
CREATE VIEW v_statistik_nilai AS
SELECT 
    mk.nama_matakuliah,
    AVG(n.nilai) as rata_rata,
    MIN(n.nilai) as nilai_min,
    MAX(n.nilai) as nilai_max,
    COUNT(*) as jumlah_mahasiswa
FROM nilai n
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
GROUP BY mk.id_matakuliah;