import 'package:flutter/material.dart';
import '../models/obat_model.dart';

class EditObatScreen extends StatefulWidget {
  final ObatModel obat;
  final int index;
  final Function(ObatModel, int) onEditObat;

  EditObatScreen({required this.obat, required this.index, required this.onEditObat});

  @override
  _EditObatScreenState createState() => _EditObatScreenState();
}

class _EditObatScreenState extends State<EditObatScreen> {
  late TextEditingController _namaController;
  late TextEditingController _dosisController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.obat.nama);
    _dosisController = TextEditingController(text: widget.obat.dosis);
    _selectedDate = widget.obat.jadwal;
  }

  void _saveChanges() {
    if (_namaController.text.isEmpty || _dosisController.text.isEmpty || _selectedDate == null) {
      return;
    }
    final updatedObat = ObatModel(
      nama: _namaController.text,
      dosis: _dosisController.text,
      jadwal: _selectedDate!,
    );
    widget.onEditObat(updatedObat, widget.index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Obat")),
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
                  initialDate: _selectedDate ?? DateTime.now(),
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
              onPressed: _saveChanges,
              child: Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
