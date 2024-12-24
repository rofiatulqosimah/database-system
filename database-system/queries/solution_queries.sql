-- File sebelumnya sudah lengkap dengan solution queries
-- Tambahan query untuk analisis:

-- Query untuk distribusi nilai per jurusan
SELECT 
    j.nama_jurusan,
    COUNT(*) as jumlah_nilai,
    ROUND(AVG(n.nilai), 2) as rata_rata_nilai
FROM nilai n
JOIN mahasiswa m ON n.nim_mahasiswa = m.nim
JOIN jurusan j ON m.id_jurusan = j.id_jurusan
GROUP BY j.id_jurusan;

-- Query untuk tingkat kelulusan mata kuliah
SELECT 
    mk.nama_matakuliah,
    COUNT(CASE WHEN n.nilai >= 70 THEN 1 END) as jumlah_lulus,
    COUNT(CASE WHEN n.nilai < 70 THEN 1 END) as jumlah_tidak_lulus,
    ROUND(COUNT(CASE WHEN n.nilai >= 70 THEN 1 END) * 100.0 / COUNT(*), 2) as persentase_kelulusan
FROM nilai n
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
GROUP BY mk.id_matakuliah;

-- Query untuk menampilkan nama mahasiswa, mata kuliah, dan nilai yang lebih besar dari 70
SELECT 
    m.nama as nama_mahasiswa,
    mk.mata_kuliah,
    n.nilai
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim_mahasiswa
JOIN mata_kuliah mk ON n.id_matakuliah = mk.id
WHERE n.nilai > 70
ORDER BY m.nama;