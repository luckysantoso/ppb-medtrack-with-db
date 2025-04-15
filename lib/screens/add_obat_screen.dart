import 'package:flutter/material.dart';
import '../models/obat_model.dart';

class AddObatScreen extends StatefulWidget {
  final Function(ObatModel) onAddObat;

  AddObatScreen({required this.onAddObat});

  @override
  _AddObatScreenState createState() => _AddObatScreenState();
}

class _AddObatScreenState extends State<AddObatScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _dosisController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _saveObat() {
    if (_namaController.text.isEmpty ||
        _dosisController.text.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      return;
    }

    // Menggabungkan tanggal & waktu
    final DateTime finalJadwal = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final newObat = ObatModel(
      nama: _namaController.text,
      dosis: _dosisController.text,
      jadwal: finalJadwal,
    );

    widget.onAddObat(newObat);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Obat"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: "Nama Obat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.medical_services,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _dosisController,
                    decoration: InputDecoration(
                      labelText: "Dosis",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.science, color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Row untuk Pilih Tanggal & Waktu
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pickDate,
                          icon: Icon(Icons.calendar_today),
                          label: Text(
                            _selectedDate == null
                                ? "Pilih Tanggal"
                                : "${_selectedDate!.toLocal()}".split(' ')[0],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pickTime,
                          icon: Icon(Icons.access_time),
                          label: Text(
                            _selectedTime == null
                                ? "Pilih Waktu"
                                : "${_selectedTime!.format(context)}",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _saveObat,
                    icon: Icon(Icons.save),
                    label: Text("Simpan Obat"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}