import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
/*class DatabaseNotes {
    static final _nombreDb = "PATM22";
    static final _versionDB = 1;

    static late Database _database;
    Future<Database> get database async{
      if(_database!=null) return _database;
      _database = await _initDatabase();
      return _database;
    }
    _initDatabase() async{
      Directory carpeta = await getApplicationDocumentsDirectory();
      String rutaBD = join (carpeta.path,_nombreDb);
      return await openDatabase(rutaBD,version: _versionDB,onCreate: _crearTablas);
    }
}*/