-- Insert data Fakultas
INSERT INTO fakultas (nama_fakultas) VALUES
('Fakultas Teknik'),
('Fakultas Ekonomi'),
('Fakultas Ilmu Komputer');

-- Insert data Jurusan
INSERT INTO jurusan (id_fakultas, nama_jurusan, kode_jurusan) VALUES
(3, 'Teknik Informatika', 'TI'),
(3, 'Sistem Informasi', 'SI'),
(1, 'Teknik Elektro', 'TE');

-- Insert data Mahasiswa
INSERT INTO mahasiswa (nim, id_jurusan, nama, alamat, tanggal_lahir, jenis_kelamin, email, tahun_masuk) VALUES
('123456', 1, 'John Doe', 'Jl. Merdeka No. 10', '2000-05-15', 'L', 'john@email.com', 2020),
('123457', 1, 'Jane Smith', 'Jl. Sudirman No. 25', '1999-08-20', 'P', 'jane@email.com', 2020),
('123458', 2, 'Mike Johnson', 'Jl. Asia No. 15', '1998-03-10', 'L', 'mike@email.com', 2019),
('123459', 1, 'Sarah Brown', 'Jl. Afrika No. 8', '1997-12-05', 'P', 'sarah@email.com', 2019),
('123460', 2, 'David Wilson', 'Jl. Eropa No. 12', '1996-07-25', 'L', 'david@email.com', 2018);

-- Insert data Dosen
INSERT INTO dosen (nip, nama, email, bidang_keahlian) VALUES
('D001', 'Dr. Ahmad', 'ahmad@email.com', 'Database Systems'),
('D002', 'Prof. Linda', 'linda@email.com', 'Artificial Intelligence'),
('D003', 'Dr. Robert', 'robert@email.com', 'Network Security');

-- Insert data Dosen Pembimbing
INSERT INTO dosen_pembimbing (nim_mahasiswa, id_dosen, tanggal_mulai) VALUES
('123456', 1, '2022-01-01'),
('123457', 2, '2022-01-01'),
('123458', 3, '2022-01-01');

-- Insert data Mata Kuliah
INSERT INTO mata_kuliah (kode_matakuliah, nama_matakuliah, sks, semester, id_jurusan) VALUES
('MK001', 'Basis Data', 3, 3, 1),
('MK002', 'Pemrograman Web', 4, 4, 1),
('MK003', 'Jaringan Komputer', 3, 5, 1);

-- Insert data Nilai
INSERT INTO nilai (nim_mahasiswa, id_matakuliah, nilai, semester_ambil, tahun_ajaran) VALUES
('123456', 1, 85.5, 3, '2021/2022'),
('123456', 2, 78.0, 4, '2021/2022'),
('123457', 1, 90.0, 3, '2021/2022'),
('123458', 1, 65.5, 3, '2021/2022'),
('123459', 2, 88.5, 4, '2021/2022');