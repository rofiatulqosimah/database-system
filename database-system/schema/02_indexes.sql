-- Indexes untuk optimasi query

-- Indexes untuk tabel mahasiswa
CREATE INDEX idx_mahasiswa_nama ON mahasiswa(nama);
CREATE INDEX idx_mahasiswa_status ON mahasiswa(status);
CREATE INDEX idx_mahasiswa_tahun ON mahasiswa(tahun_masuk);

-- Indexes untuk tabel nilai
CREATE INDEX idx_nilai_semester ON nilai(semester_ambil);
CREATE INDEX idx_nilai_tahun ON nilai(tahun_ajaran);
CREATE INDEX composite_idx_nilai ON nilai(nim_mahasiswa, id_matakuliah, semester_ambil);

-- Indexes untuk mata kuliah
CREATE INDEX idx_matakuliah_semester ON mata_kuliah(semester);
CREATE INDEX idx_matakuliah_jurusan ON mata_kuliah(id_jurusan);

-- Indexes untuk dosen
CREATE INDEX idx_dosen_nama ON dosen(nama);
CREATE INDEX idx_dosen_bidang ON dosen(bidang_keahlian);