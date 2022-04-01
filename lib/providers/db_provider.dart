import 'dart:io';

import 'package:path_provider/path_provider.dart';
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

    print(path);

    //DB Create
    return await openDatabase(path,
        version: 1, 
        onOpen: (db) {}, 
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
}
