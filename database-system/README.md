# Sistem Database Akademik

## Deskripsi
Sistem database untuk mengelola data akademik yang mencakup mahasiswa, dosen, mata kuliah, dan nilai.

## Struktur Database
- Fakultas
- Jurusan
- Mahasiswa
- Dosen
- Dosen Pembimbing
- Mata Kuliah
- Nilai

## Cara Penggunaan
1. Import schema dasar:
```bash
mysql -u username -p database_name < schema/01_create_tables.sql