DELIMITER //

-- Trigger sebelum insert mahasiswa
CREATE TRIGGER before_mahasiswa_insert
BEFORE INSERT ON mahasiswa
FOR EACH ROW
BEGIN
    IF NEW.tahun_masuk IS NULL THEN
        SET NEW.tahun_masuk = YEAR(CURRENT_DATE);
    END IF;
END //

-- Trigger setelah update nilai
CREATE TRIGGER after_nilai_update
AFTER UPDATE ON nilai
FOR EACH ROW
BEGIN
    INSERT INTO log_perubahan 
    SET 
        tabel_name = 'nilai',
        action_type = 'UPDATE',
        record_id = NEW.nim_mahasiswa,
        old_value = OLD.nilai,
        new_value = NEW.nilai;
END //

-- Trigger untuk validasi nilai
CREATE TRIGGER before_nilai_insert
BEFORE INSERT ON nilai
FOR EACH ROW
BEGIN
    IF NEW.nilai < 0 OR NEW.nilai > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nilai harus antara 0 dan 100';
    END IF;
END //

DELIMITER ;