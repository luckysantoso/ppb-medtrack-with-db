# MedTrack - Implementasi Database Sqflite 


## Identitas Pengembang

**Lucky Santoso - 5025221050**  
**Pemrograman Perangkat Bergerak (C)**

## Fitur Aplikasi

- **Lihat Obat** : Menampilkan informasi obat yang telah dibuat.
- **Tambah Obat**: Menyimpan informasi obat dengan jadwal.
- **Edit Obat**: Memperbarui informasi obat yang sudah ada.
- **Hapus Obat**: Menghapus obat dari daftar.
- **🗂️ Penyimpanan Lokal dengan SQLite**: Menyimpan data obat secara permanen menggunakan `sqflite`.

## 🔧 Teknologi dan Package

- **Flutter**: Framework utama pengembangan aplikasi.
- **sqflite**: Untuk menyimpan dan mengelola data obat secara lokal dalam database SQLite.
- **path_provider**: Menentukan lokasi penyimpanan database di perangkat.

## 1️⃣ Menggunakan Minimal 5 Widget Berbeda

| Widget                      | Fungsi                                                  | Letak dalam kode                                                                 |
| --------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------- |
| ✅ **Scaffold**             | Struktur utama layar.                                   | AddObatScreen, EditObatScreen, MainScreen                                        |
| ✅ **AppBar**               | Menampilkan judul halaman.                              | `Scaffold(appBar: AppBar(...))` di AddObatScreen, EditObatScreen, dan MainScreen |
| ✅ **ListView.builder**     | Menampilkan daftar obat dalam list.                     | MainScreen untuk menampilkan daftar obat.                                        |
| ✅ **Card**                 | Menampilkan setiap item obat dalam bentuk kartu.        | ObatCard digunakan di dalam ListView.builder                                     |
| ✅ **ListTile**             | Digunakan dalam ObatCard untuk menampilkan detail obat. | ObatCard                                                                         |
| ✅ **FloatingActionButton** | Tombol untuk menambahkan obat.                          | MainScreen                                                                       |
| ✅ **TextField**            | Untuk input data obat.                                  | AddObatScreen, EditObatScreen                                                    |
| ✅ **ElevatedButton**       | Tombol untuk menyimpan perubahan atau memilih jadwal.   | AddObatScreen, EditObatScreen                                                    |
| ✅ **IconButton**           | Untuk mengedit dan menghapus obat.                      | ObatCard                                                                         |

## 2️⃣ Custom Class & Custom Stateless Widget

| Kriteria                                  | Letak dalam kode         |
| ----------------------------------------- | ------------------------ |
| ✅ **Custom Class (ObatModel)**           | `models/obat_model.dart` |
| ✅ **Custom Stateless Widget (ObatCard)** | `widgets/obat_card.dart` |

## 3️⃣ Apply Create, Read, Update, Delete (CRUD)

| Operasi       | Keterangan                    | Letak dalam kode                |
| ------------- | ----------------------------- | ------------------------------- |
| ✅ **Create** | Menambahkan obat baru.        | AddObatScreen (`onAddObat`)     |
| ✅ **Read**   | Menampilkan daftar obat.      | MainScreen (`ListView.builder`) |
| ✅ **Update** | Mengedit obat yang sudah ada. | EditObatScreen (`onEditObat`)   |
| ✅ **Delete** | Menghapus obat dari daftar.   | ObatCard (`onDelete`)           |

## 🗂️ Integrasi Database Lokal (SQLite)

Aplikasi ini telah menggunakan **database lokal SQLite** dengan bantuan package `sqflite`, untuk memastikan data tetap tersimpan meskipun aplikasi ditutup.

| Komponen            | Keterangan                                                                                   |
| ------------------- | -------------------------------------------------------------------------------------------- |
| ✅ `DatabaseHelper` | Class helper untuk membuat dan mengelola database lokal (`lib/helpers/database_helper.dart`) |
| ✅ Tabel `obat`     | Menyimpan data nama obat, dosis, dan jadwal                                                  |
| ✅ CRUD SQLite      | Operasi tambah, ambil, ubah, dan hapus data obat dilakukan langsung ke database lokal        |

## Kesimpulan

✅ **Aplikasi sudah memenuhi semua kriteria!** 🚀  
✅ **Telah menambahkan penyimpanan lokal menggunakan SQLite!**

## 🎥 Demo Video

## 📌 Daftar Pustaka

OpenAI. (2025). _ChatGPT (diakses 13 April)_. https://openai.com/chatgpt

> Referensi ini digunakan untuk membantu memperbaiki error dalam kode yang dibuat secara from scratch, termasuk optimasi implementasi widget, state management, dan perbaikan bug pada fitur CRUD dalam aplikasi MedTrack.
