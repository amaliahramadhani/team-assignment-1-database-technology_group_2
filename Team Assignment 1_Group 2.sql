
-- =========================================================
-- TEAM ASSIGNMENT 1 - DATABASE TECHNOLOGY
-- Database: team_assignment_1_database_technology
-- MySQL
-- =========================================================

CREATE DATABASE IF NOT EXISTS team_assignment_1_database_technology;
USE team_assignment_1_database_technology;

-- =========================================================
-- 1. HAPUS TABEL LAMA (URUTAN SESUAI FOREIGN KEY)
-- =========================================================

DROP TABLE IF EXISTS Transaksi_Jadwal;
DROP TABLE IF EXISTS Kelas;
DROP TABLE IF EXISTS Mata_Kuliah;
DROP TABLE IF EXISTS Ruang;
DROP TABLE IF EXISTS Mahasiswa;
DROP TABLE IF EXISTS Dosen;

-- =========================================================
-- 2. MEMBUAT TABEL DOSEN
-- PK: id_dosen
-- =========================================================

CREATE TABLE Dosen (
    id_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    email_dosen VARCHAR(100) NOT NULL UNIQUE,
    no_hp_dosen VARCHAR(15)
) ENGINE=InnoDB;

-- =========================================================
-- 3. MEMBUAT TABEL MAHASISWA
-- PK: id_mahasiswa
-- =========================================================

CREATE TABLE Mahasiswa (
    id_mahasiswa VARCHAR(10) PRIMARY KEY,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    jenis_kelamin CHAR(1),
    alamat_mahasiswa VARCHAR(200),
    email_mahasiswa VARCHAR(100) UNIQUE,
    telepon_mahasiswa VARCHAR(15)
) ENGINE=InnoDB;

-- =========================================================
-- 4. MEMBUAT TABEL RUANG
-- PK: no_ruang
-- =========================================================

CREATE TABLE Ruang (
    no_ruang VARCHAR(10) PRIMARY KEY,
    jenis_ruang VARCHAR(10) NOT NULL,
    fasilitas_ruang VARCHAR(200),
    kapasitas_ruang INT NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 5. MEMBUAT TABEL MATA KULIAH
-- PK: id_matkul
-- FK: id_dosen
-- =========================================================

CREATE TABLE Mata_Kuliah (
    id_matkul VARCHAR(10) PRIMARY KEY,
    nama_matkul VARCHAR(100) NOT NULL,
    jumlah_sks INT NOT NULL,
    tipe_matkul VARCHAR(20) NOT NULL,
    id_dosen VARCHAR(10) NOT NULL,
    kapasitas_kelas INT NOT NULL,
    CONSTRAINT fk_matkul_dosen
        FOREIGN KEY (id_dosen)
        REFERENCES Dosen(id_dosen)
) ENGINE=InnoDB;

-- =========================================================
-- 6. MEMBUAT TABEL KELAS
-- PK: id_kelas
-- =========================================================

CREATE TABLE Kelas (
    id_kelas VARCHAR(10) PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    semester INT NOT NULL,
    tahun_akademik VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 7. MEMBUAT TABEL TRANSAKSI JADWAL
-- PK: id_jadwal
-- FK: id_matkul, id_mahasiswa, id_dosen,
--     no_ruang, id_kelas
-- =========================================================

CREATE TABLE Transaksi_Jadwal (
    id_jadwal VARCHAR(10) PRIMARY KEY,
    id_matkul VARCHAR(10) NOT NULL,
    id_mahasiswa VARCHAR(10) NOT NULL,
    id_dosen VARCHAR(10) NOT NULL,
    no_ruang VARCHAR(10) NOT NULL,
    id_kelas VARCHAR(10) NOT NULL,
    hari VARCHAR(10) NOT NULL,
    jam_mulai TIME NOT NULL,
    jam_selesai TIME NOT NULL,

    CONSTRAINT fk_jadwal_matkul
        FOREIGN KEY (id_matkul)
        REFERENCES Mata_Kuliah(id_matkul),

    CONSTRAINT fk_jadwal_mahasiswa
        FOREIGN KEY (id_mahasiswa)
        REFERENCES Mahasiswa(id_mahasiswa),

    CONSTRAINT fk_jadwal_dosen
        FOREIGN KEY (id_dosen)
        REFERENCES Dosen(id_dosen),

    CONSTRAINT fk_jadwal_ruang
        FOREIGN KEY (no_ruang)
        REFERENCES Ruang(no_ruang),

    CONSTRAINT fk_jadwal_kelas
        FOREIGN KEY (id_kelas)
        REFERENCES Kelas(id_kelas)
) ENGINE=InnoDB;

-- =========================================================
-- 8. INSERT 6 DATA AWAL DOSEN
-- =========================================================

INSERT INTO Dosen VALUES
('D001','Andi Pratama','andi@kampus.ac.id','081234567801'),
('D002','Budi Santoso','budi@kampus.ac.id','081234567802'),
('D003','Citra Lestari','citra@kampus.ac.id','081234567803'),
('D004','Dedi Saputra','dedi@kampus.ac.id','081234567804'),
('D005','Eka Putri','eka@kampus.ac.id','081234567805'),
('D006','Fajar Nugraha','fajar@kampus.ac.id','081234567806');

-- =========================================================
-- 9. INSERT 6 DATA AWAL MAHASISWA
-- =========================================================

INSERT INTO Mahasiswa VALUES
('2026001','Amalia Ramadhani','P','Makassar','amalia01@kampus.ac.id','081234560001'),
('2026002','Bima Pratama','L','Gowa','bima02@kampus.ac.id','081234560002'),
('2026003','Citra Ananda','P','Maros','citra03@kampus.ac.id','081234560003'),
('2026004','Dimas Saputra','L','Bone','dimas04@kampus.ac.id','081234560004'),
('2026005','Eka Lestari','P','Parepare','eka05@kampus.ac.id','081234560005'),
('2026006','Farhan Akbar','L','Takalar','farhan06@kampus.ac.id','081234560006');

-- =========================================================
-- 10. INSERT 6 DATA AWAL RUANG
-- =========================================================

INSERT INTO Ruang VALUES
('R001','Teori','Proyektor, papan tulis, AC',40),
('R002','Teori','Proyektor, papan tulis',35),
('R003','Praktik','Komputer, internet, AC',30),
('R004','Praktik','Komputer, internet',25),
('R005','Teori','Proyektor, AC',40),
('R006','Praktik','Komputer, software praktikum',28);

-- =========================================================
-- 11. INSERT 6 DATA AWAL MATA KULIAH
-- =========================================================

INSERT INTO Mata_Kuliah VALUES
('MK001','Basis Data',3,'Teori & Praktik','D001',30),
('MK002','Pemrograman Web',3,'Praktik','D002',25),
('MK003','Matematika Diskrit',2,'Teori','D003',40),
('MK004','Jaringan Komputer',3,'Teori & Praktik','D004',30),
('MK005','Sistem Informasi',3,'Teori','D005',40),
('MK006','Algoritma Pemrograman',4,'Praktik','D006',30);

-- =========================================================
-- 12. INSERT 6 DATA AWAL KELAS
-- =========================================================

INSERT INTO Kelas VALUES
('K001','TI-A',1,'2026/2027'),
('K002','TI-B',1,'2026/2027'),
('K003','TI-C',2,'2026/2027'),
('K004','TI-D',2,'2026/2027'),
('K005','SI-A',3,'2026/2027'),
('K006','SI-B',3,'2026/2027');

-- =========================================================
-- 13. INSERT 6 DATA AWAL TRANSAKSI JADWAL
-- =========================================================

INSERT INTO Transaksi_Jadwal VALUES
('J001','MK001','2026001','D001','R001','K001','Senin','08:00:00','10:30:00'),
('J002','MK002','2026002','D002','R002','K002','Senin','10:30:00','13:00:00'),
('J003','MK003','2026003','D003','R003','K003','Selasa','08:00:00','10:00:00'),
('J004','MK004','2026004','D004','R004','K004','Selasa','10:00:00','12:30:00'),
('J005','MK005','2026005','D005','R005','K005','Rabu','08:00:00','10:30:00'),
('J006','MK006','2026006','D006','R006','K006','Rabu','10:30:00','13:30:00');

-- =========================================================
-- 14. TAMBAH 4 DATA MAHASISWA (TOTAL 10)
-- =========================================================

INSERT INTO Mahasiswa VALUES
('2026007','Rizky Ananda','L','Parepare','rizky07@kampus.ac.id','081234560007'),
('2026008','Putri Lestari','P','Makassar','putri08@kampus.ac.id','081234560008'),
('2026009','Arman Hakim','L','Bone','arman09@kampus.ac.id','081234560009'),
('2026010','Indah Permata','P','Gowa','indah10@kampus.ac.id','081234560010');

-- =========================================================
-- 15. TAMBAH 4 DATA RUANG (TOTAL 10)
-- =========================================================

INSERT INTO Ruang VALUES
('R007','Teori','Papan tulis, AC',35),
('R008','Praktik','Komputer, internet, proyektor',30),
('R009','Teori','Proyektor, papan tulis',40),
('R010','Praktik','Komputer, internet, AC',50);

-- =========================================================
-- 16. TAMBAH 4 DATA MATA KULIAH (TOTAL 10)
-- =========================================================

INSERT INTO Mata_Kuliah VALUES
('MK007','Struktur Data',3,'Teori & Praktik','D007',35),
('MK008','Rekayasa Perangkat Lunak',3,'Teori','D008',35),
('MK009','Interaksi Manusia Komputer',2,'Teori & Praktik','D009',30),
('MK010','Sistem Operasi',3,'Teori','D010',40);

-- =========================================================
-- 17. TAMBAH 4 DATA KELAS (TOTAL 10)
-- =========================================================

INSERT INTO Kelas VALUES
('K007','TI-E',4,'2026/2027'),
('K008','TI-F',4,'2026/2027'),
('K009','SI-C',5,'2026/2027'),
('K010','SI-D',5,'2026/2027');

-- =========================================================
-- 18. TAMBAH 4 DATA TRANSAKSI JADWAL (TOTAL 10)
-- =========================================================

INSERT INTO Transaksi_Jadwal VALUES
('J007','MK007','2026007','D007','R007','K007','Kamis','08:00:00','10:30:00'),
('J008','MK008','2026008','D008','R008','K008','Kamis','10:30:00','13:00:00'),
('J009','MK009','2026009','D009','R009','K009','Jumat','08:00:00','10:00:00'),
('J010','MK010','2026010','D010','R010','K010','Jumat','10:00:00','12:30:00');

-- =========================================================
-- 19. TAMBAH 24 DOSEN (TOTAL 30 DOSEN)
-- Ketentuan: jumlah dosen = 3 x jumlah ruang
-- =========================================================

INSERT INTO Dosen VALUES
('D007','Gita Maharani','gita@kampus.ac.id','081234567807'),
('D008','Hendra Wijaya','hendra@kampus.ac.id','081234567808'),
('D009','Indah Permata','indah@kampus.ac.id','081234567809'),
('D010','Joko Susilo','joko@kampus.ac.id','081234567810'),
('D011','Kartika Sari','kartika@kampus.ac.id','081234567811'),
('D012','Lukman Hakim','lukman@kampus.ac.id','081234567812'),
('D013','Maya Anggraini','maya@kampus.ac.id','081234567813'),
('D014','Nanda Putra','nanda@kampus.ac.id','081234567814'),
('D015','Olivia Safitri','olivia@kampus.ac.id','081234567815'),
('D016','Prasetyo','prasetyo@kampus.ac.id','081234567816'),
('D017','Qori Aulia','qori@kampus.ac.id','081234567817'),
('D018','Rizal Ramadhan','rizal@kampus.ac.id','081234567818'),
('D019','Sinta Dewi','sinta@kampus.ac.id','081234567819'),
('D020','Taufik Hidayat','taufik@kampus.ac.id','081234567820'),
('D021','Umar Faruq','umar@kampus.ac.id','081234567821'),
('D022','Vina Amelia','vina@kampus.ac.id','081234567822'),
('D023','Wahyu Setiawan','wahyu@kampus.ac.id','081234567823'),
('D024','Xaverius Putra','xaverius@kampus.ac.id','081234567824'),
('D025','Yuni Kartika','yuni@kampus.ac.id','081234567825'),
('D026','Zaki Mubarak','zaki@kampus.ac.id','081234567826'),
('D027','Agus Salim','agus@kampus.ac.id','081234567827'),
('D028','Bella Novita','bella@kampus.ac.id','081234567828'),
('D029','Chandra Wijaya','chandra@kampus.ac.id','081234567829'),
('D030','Dian Puspita','dian@kampus.ac.id','081234567830');

-- =========================================================
-- 20. VERIFIKASI JUMLAH DATA SELURUH TABEL
-- =========================================================

SELECT 'Mahasiswa' AS nama_tabel, COUNT(*) AS jumlah_data
FROM Mahasiswa
UNION ALL
SELECT 'Dosen', COUNT(*) FROM Dosen
UNION ALL
SELECT 'Ruang', COUNT(*) FROM Ruang
UNION ALL
SELECT 'Mata_Kuliah', COUNT(*) FROM Mata_Kuliah
UNION ALL
SELECT 'Kelas', COUNT(*) FROM Kelas
UNION ALL
SELECT 'Transaksi_Jadwal', COUNT(*) FROM Transaksi_Jadwal;

-- =========================================================
-- Menampilkan semua mahasiswa yang mengambil mata kuliah
-- =========================================================

SELECT DISTINCT
    m.id_mahasiswa,
    m.nama_mahasiswa,
    mk.id_matkul,
    mk.nama_matkul,
    mk.jumlah_sks
FROM Mahasiswa m
JOIN Transaksi_Jadwal tj
    ON m.id_mahasiswa = tj.id_mahasiswa
JOIN Mata_Kuliah mk
    ON tj.id_matkul = mk.id_matkul
ORDER BY m.nama_mahasiswa;

-- =========================================================
-- Menghitung mahasiswa dengan total SKS lebih dari 18
-- =========================================================

SELECT COUNT(*) AS jumlah_mahasiswa_diatas_18_sks
FROM (
    SELECT tj.id_mahasiswa
    FROM Transaksi_Jadwal tj
    JOIN Mata_Kuliah mk
        ON tj.id_matkul = mk.id_matkul
    GROUP BY tj.id_mahasiswa
    HAVING SUM(mk.jumlah_sks) > 18
) AS mahasiswa_sks;

-- =========================================================
-- Menampilkan mahasiswa dengan nama berawalan huruf A
-- =========================================================

SELECT
    id_mahasiswa,
    nama_mahasiswa
FROM Mahasiswa
WHERE nama_mahasiswa LIKE 'A%'
ORDER BY nama_mahasiswa;

-- =========================================================
-- HASIL JOIN INFORMASI JADWAL PERKULIAHAN
-- =========================================================

SELECT
    tj.id_jadwal,
    m.nama_mahasiswa,
    mk.nama_matkul,
    d.nama_dosen,
    r.jenis_ruang,
    r.kapasitas_ruang,
    k.nama_kelas,
    tj.hari,
    tj.jam_mulai,
    tj.jam_selesai
FROM Transaksi_Jadwal tj
JOIN Mahasiswa m
    ON tj.id_mahasiswa = m.id_mahasiswa
JOIN Mata_Kuliah mk
    ON tj.id_matkul = mk.id_matkul
JOIN Dosen d
    ON tj.id_dosen = d.id_dosen
JOIN Ruang r
    ON tj.no_ruang = r.no_ruang
JOIN Kelas k
    ON tj.id_kelas = k.id_kelas
ORDER BY tj.id_jadwal;
