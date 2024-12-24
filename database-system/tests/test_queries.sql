-- Test Cases untuk Soal Database

-- Test Case 1: Update alamat mahasiswa
START TRANSACTION;
-- Cek sebelum update
SELECT alamat FROM mahasiswa WHERE nim = '123456';
-- Lakukan update
UPDATE mahasiswa SET alamat = 'Jl. Raya No.5' WHERE nim = '123456';
-- Cek setelah update
SELECT alamat FROM mahasiswa WHERE nim = '123456';
ROLLBACK;

-- Test Case 2: Query mahasiswa Teknik Informatika dan dosen pengajar
EXPLAIN ANALYZE
SELECT 
    m.nim,
    m.nama,
    j.nama_jurusan,
    mk.nama_matakuliah,
    d.nama as dosen_pengajar
FROM mahasiswa m
JOIN jurusan j ON m.id_jurusan = j.id_jurusan
JOIN nilai n ON m.nim = n.nim_mahasiswa
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
JOIN dosen d ON mk.id_dosen = d.id_dosen
WHERE j.nama_jurusan = 'Teknik Informatika'
GROUP BY m.nim;

-- Test Case 3: Query 5 mahasiswa tertua
EXPLAIN ANALYZE
SELECT 
    nama,
    tanggal_lahir,
    TIMESTAMPDIFF(YEAR, tanggal_lahir, CURDATE()) as umur
FROM mahasiswa
ORDER BY tanggal_lahir ASC
LIMIT 5;

-- Test Case 4: Query nilai > 70
EXPLAIN ANALYZE
SELECT 
    m.nama as nama_mahasiswa,
    mk.nama_matakuliah,
    n.nilai
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim_mahasiswa
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
WHERE n.nilai > 70
ORDER BY m.nama;

-- Validasi hasil
SELECT COUNT(*) as jumlah_data FROM (
    SELECT 
        m.nama as nama_mahasiswa,
        mk.nama_matakuliah,
        n.nilai
    FROM mahasiswa m
    JOIN nilai n ON m.nim = n.nim_mahasiswa
    JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    WHERE n.nilai > 70
) as hasil;