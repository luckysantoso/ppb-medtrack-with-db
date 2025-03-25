import 'package:flutter/material.dart';
import '../models/obat_model.dart';
import '../widgets/obat_card.dart';
import 'add_obat_screen.dart';
import 'edit_obat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ObatModel> obatList = [
    ObatModel(
      nama: "Paracetamol",
      dosis: "500mg",
      jadwal: DateTime.now().add(Duration(days: 1)),
    ),
    ObatModel(
      nama: "Amoxicillin",
      dosis: "250mg",
      jadwal: DateTime.now().add(Duration(days: 2)),
    ),
    ObatModel(
      nama: "Ibuprofen",
      dosis: "200mg",
      jadwal: DateTime.now().add(Duration(days: 3)),
    ),
  ]; // Menyimpan data obat sementara

  void addObat(ObatModel obat) {
    setState(() {
      obatList.add(obat);
    });
  }

  void removeObat(int index) {
    setState(() {
      obatList.removeAt(index);
    });
  }

  void editObat(ObatModel updatedObat, int index) {
    setState(() {
      obatList[index] = updatedObat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MedTrack - Obat")),
      body:
          obatList.isEmpty
              ? Center(child: Text("Belum ada obat yang ditambahkan"))
              : ListView.builder(
                itemCount: obatList.length,
                itemBuilder: (context, index) {
                  return ObatCard(
                    obat: obatList[index],
                    onDelete: () => removeObat(index),
                    onEdit: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EditObatScreen(
                                obat: obatList[index],
                                index: index,
                                onEditObat: editObat,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddObatScreen(onAddObat: addObat)),
          );
          if (result != null) addObat(result);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
