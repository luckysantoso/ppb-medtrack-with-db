# MedTrack - Personal Medicine Tracker

## Identitas Pengembang

**Lucky Santoso - 5025221050**  
**Pemrograman Perangkat Bergerak (C)**

## Fitur Aplikasi

- **Tambah Obat**: Menyimpan informasi obat dengan jadwal.
- **Edit Obat**: Memperbarui informasi obat yang sudah ada.
- **Hapus Obat**: Menghapus obat dari daftar.

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

✔ **Lebih dari 5 widget berbeda sudah digunakan!** 🎉

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

## Kesimpulan

✅ **Aplikasi sudah memenuhi semua kriteria!** 🚀

## 🎥 Demo Video
[![MedTrack Demo](https://img.youtube.com/vi/cpoBCnsh9Ck/0.jpg)](https://youtu.be/cpoBCnsh9Ck)