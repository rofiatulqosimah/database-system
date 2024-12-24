-- Membuat Database
CREATE DATABASE kampus_db;
USE kampus_db;

-- Tabel Fakultas
CREATE TABLE fakultas (
    id_fakultas INT PRIMARY KEY AUTO_INCREMENT,
    nama_fakultas VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Jurusan
CREATE TABLE jurusan (
    id_jurusan INT PRIMARY KEY AUTO_INCREMENT,
    id_fakultas INT,
    nama_jurusan VARCHAR(100) NOT NULL,
    kode_jurusan VARCHAR(10) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_fakultas) REFERENCES fakultas(id_fakultas)
);

-- Tabel Mahasiswa
CREATE TABLE mahasiswa (
    nim VARCHAR(20) PRIMARY KEY,
    id_jurusan INT,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL,
    email VARCHAR(100) UNIQUE,
    no_telp VARCHAR(15),
    tahun_masuk YEAR,
    status ENUM('Aktif', 'Cuti', 'Lulus', 'Keluar') DEFAULT 'Aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan)
);

-- Tabel Dosen
CREATE TABLE dosen (
    id_dosen INT PRIMARY KEY AUTO_INCREMENT,
    nip VARCHAR(20) UNIQUE NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    email VARCHAR(100) UNIQUE,
    no_telp VARCHAR(15),
    bidang_keahlian TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Dosen Pembimbing
CREATE TABLE dosen_pembimbing (
    id_pembimbing INT PRIMARY KEY AUTO_INCREMENT,
    nim_mahasiswa VARCHAR(20),
    id_dosen INT,
    tanggal_mulai DATE NOT NULL,
    status ENUM('Aktif', 'Selesai') DEFAULT 'Aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (nim_mahasiswa) REFERENCES mahasiswa(nim),
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
);

-- Tabel Mata Kuliah
CREATE TABLE mata_kuliah (
    id_matakuliah INT PRIMARY KEY AUTO_INCREMENT,
    kode_matakuliah VARCHAR(10) UNIQUE NOT NULL,
    nama_matakuliah VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    id_jurusan INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan)
);

-- Tabel Nilai
CREATE TABLE nilai (
    id_nilai INT PRIMARY KEY AUTO_INCREMENT,
    nim_mahasiswa VARCHAR(20),
    id_matakuliah INT,
    nilai DECIMAL(5,2) NOT NULL,
    semester_ambil INT NOT NULL,
    tahun_ajaran VARCHAR(9) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (nim_mahasiswa) REFERENCES mahasiswa(nim),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

-- Membuat Indexes untuk optimasi query
CREATE INDEX idx_mahasiswa_jurusan ON mahasiswa(id_jurusan);
CREATE INDEX idx_nilai_mahasiswa ON nilai(nim_mahasiswa);
CREATE INDEX idx_nilai_matakuliah ON nilai(id_matakuliah);
CREATE INDEX idx_dosen_pembimbing_mahasiswa ON dosen_pembimbing(nim_mahasiswa);
CREATE INDEX idx_dosen_pembimbing_dosen ON dosen_pembimbing(id_dosen);