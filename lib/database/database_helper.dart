// db/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/obat_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('obat.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE obat (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        dosis TEXT NOT NULL,
        jadwal TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertObat(ObatModel obat) async {
    final db = await instance.database;
    return await db.insert('obat', obat.toMap());
  }

  Future<List<ObatModel>> getAllObat() async {
    final db = await instance.database;
    final result = await db.query('obat', orderBy: 'jadwal ASC');

    return result.map((map) => ObatModel.fromMap(map)).toList();
  }

  Future<int> updateObat(ObatModel obat) async {
    final db = await instance.database;
    return await db.update(
      'obat',
      obat.toMap(),
      where: 'id = ?',
      whereArgs: [obat.id],
    );
  }

  Future<int> deleteObat(int id) async {
    final db = await instance.database;
    return await db.delete(
      'obat',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
