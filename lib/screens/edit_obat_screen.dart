import 'package:flutter/material.dart';
import '../models/obat_model.dart';

class EditObatScreen extends StatefulWidget {
  final ObatModel obat;
  final int index;
  final Function(ObatModel, int) onEditObat;

  EditObatScreen({
    required this.obat,
    required this.index,
    required this.onEditObat,
  });

  @override
  _EditObatScreenState createState() => _EditObatScreenState();
}

class _EditObatScreenState extends State<EditObatScreen> {
  late TextEditingController _namaController;
  late TextEditingController _dosisController;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.obat.nama);
    _dosisController = TextEditingController(text: widget.obat.dosis);
    _selectedDate = widget.obat.jadwal;
    _selectedTime = TimeOfDay.fromDateTime(widget.obat.jadwal);
  }

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
    }
  }

  void _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() => _selectedTime = pickedTime);
    }
  }

  void _saveChanges() {
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

    final updatedObat = ObatModel(
      nama: _namaController.text,
      dosis: _dosisController.text,
      jadwal: finalJadwal,
    );

    widget.onEditObat(updatedObat, widget.index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Obat"),
        backgroundColor: Colors.orangeAccent,
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
                        color: Colors.orangeAccent,
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
                      prefixIcon: Icon(
                        Icons.science,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Row untuk memilih tanggal dan waktu
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
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pickTime,
                          icon: Icon(Icons.access_time),
                          label: Text(
                            _selectedTime == null
                                ? "Pilih Waktu"
                                : _selectedTime!.format(context),
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
                    onPressed: _saveChanges,
                    icon: Icon(Icons.save),
                    label: Text("Simpan Perubahan"),
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
