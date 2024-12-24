# Query Optimization Guide

## Index Strategy
1. Composite indexes untuk query yang sering digunakan
2. Covering indexes untuk menghindari table lookup
3. Index untuk foreign keys

## Query Optimization Techniques
1. Gunakan EXPLAIN untuk analisis query
2. Hindari SELECT *
3. Gunakan LIMIT untuk pembatasan hasil
4. Optimasi JOIN dengan proper indexes

## Common Query Patterns
1. Pencarian mahasiswa: Gunakan index pada nama dan NIM
2. Pencarian nilai: Gunakan composite index
3. Reporting queries: Gunakan materialized views

## Performance Tips
1. Partisi tabel nilai berdasarkan tahun
2. Regular ANALYZE TABLE
3. Optimal WHERE clause ordering