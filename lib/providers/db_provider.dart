import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DbProvider {
  static Database? _database;

  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    //DB path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');

    //DB Create
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            )          
          ''');
    });
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final response = await db!.insert('Scans', newScan.toJson());
    return response;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final response = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? ScanModel.fromJson(response.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final response = await db!.query('Scans');

    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>?> getScansByType(String type) async {
    final db = await database;
    final response = await db!.rawQuery('''

      SELECT * FROM Scans WHERE type = '$type'
    
    ''');

    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final response = await db!.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return response;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final response =
        await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return response;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final response =
        await db!.rawDelete('''
        DELETE FROM Scans
        ''');
    return response;
  }
}
