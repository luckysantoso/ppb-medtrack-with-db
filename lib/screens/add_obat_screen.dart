import 'package:flutter/material.dart';
import '../models/obat_model.dart';

class AddObatScreen extends StatefulWidget {
  @override
  _AddObatScreenState createState() => _AddObatScreenState();
}

class _AddObatScreenState extends State<AddObatScreen> {
  final _namaController = TextEditingController();
  final _dosisController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_namaController.text.isEmpty || _dosisController.text.isEmpty || _selectedDate == null) {
      return;
    }
    final newObat = ObatModel(
      nama: _namaController.text,
      dosis: _dosisController.text,
      jadwal: _selectedDate!,
    );
    Navigator.pop(context, newObat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Obat")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: "Nama Obat"),
            ),
            TextField(
              controller: _dosisController,
              decoration: InputDecoration(labelText: "Dosis"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() => _selectedDate = pickedDate);
                }
              },
              child: Text("Pilih Jadwal"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitData,
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
