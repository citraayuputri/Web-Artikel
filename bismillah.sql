-- Pilih database yang akan digunakan
USE artikel_web;

-- Hapus tabel jika sudah ada
DROP TABLE IF EXISTS `artikel`;

-- Buat tabel artikel
CREATE TABLE IF NOT EXISTS `artikel` (
  `id_artikel` int NOT NULL AUTO_INCREMENT,
  `tanggal` varchar(250) NOT NULL DEFAULT '',
  `judul` varchar(350) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(150) NOT NULL,
  PRIMARY KEY (`id_artikel`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Hapus tabel kategori jika sudah ada
DROP TABLE IF EXISTS `kategori`;

-- Buat tabel kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL DEFAULT '0',
  `keterangan` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Hapus tabel penulis jika sudah ada
DROP TABLE IF NOT EXISTS `penulis`;

-- Buat tabel penulis
CREATE TABLE IF NOT EXISTS `penulis` (
  `id_penulis` int NOT NULL AUTO_INCREMENT,
  `nama_penulis` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_penulis`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Hapus tabel kontributor jika sudah ada
DROP TABLE IF NOT EXISTS `kontributor`;

-- Buat tabel kontributor
CREATE TABLE IF NOT EXISTS `kontributor` (
  `id_kontributor` int NOT NULL AUTO_INCREMENT,
  `id_penulis` int DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  `id_artikel` int DEFAULT NULL,
  PRIMARY KEY (`id_kontributor`),
  KEY `FK_artikel` (`id_artikel`),
  KEY `FK_kategori` (`id_kategori`),
  KEY `FK_penulis` (`id_penulis`),
  CONSTRAINT `FK_artikel` FOREIGN KEY (`id_artikel`) REFERENCES `artikel` (`id_artikel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_penulis` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id_penulis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
