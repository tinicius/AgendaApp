import 'package:agenda/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';

class SqlService extends GetxService {
  late final dynamic database;

  void init() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'contatos_database.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE contatos(id TEXT PRIMARY KEY, name TEXT, phoneNumber TEXT, profilePhotoUrl TEXT)');
      },
      version: 1,
    );
  }

  Future<void> insertContato(ContactModel contato) async {
    final db = await database;

    await db.insert('contatos', contato.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ContactModel>> contatos() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('contatos');

    return List.generate(maps.length, (i) {
      return ContactModel(
          id: maps[i]['id'],
          profilePhotoUrl: maps[i]['profilePhotoUrl'],
          name: maps[i]['name'],
          phoneNumber: maps[i]['phoneNumber']);
    });
  }
}
