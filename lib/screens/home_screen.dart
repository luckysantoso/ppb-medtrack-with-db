import 'package:flutter/material.dart';
import '../models/obat_model.dart';
import '../widgets/obat_card.dart';
import 'add_obat_screen.dart';
import 'edit_obat_screen.dart';
import '../database/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Future<List<ObatModel>> _loadObatList() async {
    List<ObatModel> obatList = await DatabaseHelper.instance.getAllObat();
    return obatList;
  }

  void addObat(ObatModel obat) async {
    await DatabaseHelper.instance.insertObat(obat); 
    setState(() {}); 
  }

  void removeObat(int id) async {
    await DatabaseHelper.instance.deleteObat(id); 
    setState(() {}); 
  }

  void editObat(ObatModel updatedObat, int id) async {
    await DatabaseHelper.instance.updateObat(updatedObat); 
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MedTrack - Obat")),
      body: FutureBuilder<List<ObatModel>>(
        future: _loadObatList(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); 
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada obat yang ditambahkan"));
          }

          final obatList = snapshot.data!;

          return ListView.builder(
            itemCount: obatList.length,
            itemBuilder: (context, index) {
              return ObatCard(
                obat: obatList[index],
                onDelete: () => removeObat(obatList[index].id!),
                onEdit: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditObatScreen(
                        obat: obatList[index],
                        index: index,
                        onEditObat: (updatedObat, id) {
                          editObat(updatedObat, obatList[index].id!);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddObatScreen(onAddObat: addObat),
            ),
          );
          if (result != null) addObat(result);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
