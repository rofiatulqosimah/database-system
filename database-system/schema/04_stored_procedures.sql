DELIMITER //

-- Procedure untuk registrasi mahasiswa baru
CREATE PROCEDURE RegisterNewStudent(
    IN p_nim VARCHAR(20),
    IN p_nama VARCHAR(100),
    IN p_jurusan INT,
    IN p_alamat TEXT,
    IN p_tanggal_lahir DATE,
    IN p_jenis_kelamin ENUM('L', 'P')
)
BEGIN
    INSERT INTO mahasiswa (nim, nama, id_jurusan, alamat, tanggal_lahir, jenis_kelamin)
    VALUES (p_nim, p_nama, p_jurusan, p_alamat, p_tanggal_lahir, p_jenis_kelamin);
END //

-- Procedure untuk input nilai
CREATE PROCEDURE InputNilai(
    IN p_nim VARCHAR(20),
    IN p_matakuliah INT,
    IN p_nilai DECIMAL(5,2),
    IN p_semester INT,
    IN p_tahun VARCHAR(9)
)
BEGIN
    INSERT INTO nilai (nim_mahasiswa, id_matakuliah, nilai, semester_ambil, tahun_ajaran)
    VALUES (p_nim, p_matakuliah, p_nilai, p_semester, p_tahun);
END //

-- Procedure untuk generate transkrip
CREATE PROCEDURE GenerateTranskrip(
    IN p_nim VARCHAR(20)
)
BEGIN
    -- Logic untuk generate transkrip
END //

DELIMITER ;