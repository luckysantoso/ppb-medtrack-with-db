import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medtrack/screens/home_screen.dart';
import 'package:medtrack/screens/add_obat_screen.dart';

void main() {
  testWidgets('Menambahkan dan menghapus obat dalam daftar', (WidgetTester tester) async {
    // Bangun aplikasi dan mulai frame
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Pastikan daftar awal kosong
    expect(find.text("Belum ada obat yang ditambahkan"), findsOneWidget);

    // Tekan tombol tambah obat
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Tunggu animasi selesai

    // Masukkan data obat
    await tester.enterText(find.byType(TextField).at(0), "Paracetamol");
    await tester.enterText(find.byType(TextField).at(1), "500mg");

    // Pilih jadwal obat (tidak bisa diuji langsung, jadi kita lewati)
    
    // Tekan tombol Simpan
    await tester.tap(find.text("Simpan"));
    await tester.pumpAndSettle();

    // Pastikan obat telah ditambahkan ke daftar
    expect(find.text("Paracetamol"), findsOneWidget);
    expect(find.text("500mg"), findsOneWidget);

    // Hapus obat
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Pastikan daftar kembali kosong
    expect(find.text("Belum ada obat yang ditambahkan"), findsOneWidget);
  });
}
