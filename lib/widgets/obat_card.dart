import 'package:flutter/material.dart';
import '../models/obat_model.dart';

class ObatCard extends StatelessWidget {
  final ObatModel obat;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ObatCard({required this.obat, required this.onDelete, required this.onEdit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(obat.nama, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Dosis: ${obat.dosis} | Jadwal: ${obat.jadwal.toLocal()}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit, // Panggil fungsi edit
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}