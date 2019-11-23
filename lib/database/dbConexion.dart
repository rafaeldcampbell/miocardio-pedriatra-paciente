import 'dart:async';
import 'dart:io';

import 'package:miocardio_paciente/database/reminder.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

//  INSERT:
//      newReminder(Reminder newReminder)
//
//  READ:
//      getReminderById(int id)
//      getAllReminders()
//      getRemindersByInterval(int beginin, int end) 
//
//  UPDATE:
//      updateReminder(Reminder newReminder)
//
//  DELETE:
//      deleteReminderById(int id)
//      deleteLateReminders()




class DBConexion {

  static Database _database;
  static const DB_NAME = "reminder_database.db";
  static const TABLE_NAME = 'Reminder';

  //singleton que retorna uma referencia para o database (ou cria um novo)
  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  //cria o database
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE" + TABLE_NAME + " ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "dose INTEGER,"
          "doseMetric TEXT,"
          "time INTEGER,"
          "obs TEXT,"
          "begining INTEGER,"
          "end INTEGER,"
          ")"
        );
    });
  }

  // ====== INSERT =========
  newReminder(Reminder newReminder) async {
    final db = await database;
    var res = await db.insert(TABLE_NAME, newReminder.toMap());
    return res;
  }


  // ========= READ =====
  getReminderById(int id) async {
    final db = await database;
    var res =await  db.query(TABLE_NAME, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Reminder.fromMap(res.first) : Null ;
  }

  getAllReminders() async {
    final db = await database;
    var res = await db.query(TABLE_NAME);
    List<Reminder> list =
        res.isNotEmpty ? res.map((c) => Reminder.fromMap(c)).toList() : [];
    return list;
  }

  getRemindersByInterval(int beginin, int end) async {
    final db = await database;
    var res =await  db.query(TABLE_NAME, where: "begining >= ? AND end <= end", whereArgs: [beginin, end]);
    List<Reminder> list =
        res.isNotEmpty ? res.toList().map((c) => Reminder.fromMap(c)) : null;
    return list;
  }


  // ========= UPDATE ======
  updateReminder(Reminder newReminder) async {
    final db = await database;
    var res = await db.update(TABLE_NAME, newReminder.toMap(),
        where: "id = ?", whereArgs: [newReminder.id]);
    return res;
  }


  // ========== DELETE ======
  deleteReminderById(int id) async {
    final db = await database;
    db.delete(TABLE_NAME, where: "id = ?", whereArgs: [id]);
  }

  deleteLateReminders() async {
    final db = await database;
    db.delete(TABLE_NAME, where: "end < ?", whereArgs: [DateTime.now().millisecondsSinceEpoch]);
  }
  
}

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}