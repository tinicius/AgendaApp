import 'package:agenda/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlService extends GetxService {
  late Future<Database> database;

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
    final Database db = await database;

    await db.insert('contatos', contato.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateContato(ContactModel contato) async {
    final Database db = await database;

    try {
      await db.update(
        'contatos',
        contato.toMap(),
        where: 'id = ?',
        whereArgs: [contato.id],
      );
    } catch (e) {
      throw Exception("Erro ao atulizar contato");
    }
  }

  Future<void> deleteContato(String id) async {
    final Database db = await database;

    try {
      await db.delete(
        'contatos',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception(
        "Erro ao deletar contato",
      );
    }
  }

  Future<List<ContactModel>> contatos() async {
    final Database db = await database;

    try {
      final List<Map<String, dynamic>> maps = await db.query('contatos');

      return List.generate(maps.length, (i) {
        return ContactModel(
            id: maps[i]['id'],
            profilePhotoUrl: maps[i]['profilePhotoUrl'],
            name: maps[i]['name'],
            phoneNumber: maps[i]['phoneNumber']);
      });
    } catch (e) {
      throw Exception("Erro ao buscar contatos");
    }
  }

  Future<ContactModel> contatoById(String id) async {
    final Database db = await database;

    try {
      final List<Map<String, dynamic>> query =
          await db.query('contatos', where: 'id = ?', whereArgs: [id]);

      return ContactModel(
          id: query[0]['id'],
          profilePhotoUrl: query[0]['profilePhotoUrl'],
          name: query[0]['name'],
          phoneNumber: query[0]['phoneNumber']);
    } catch (e) {
      throw Exception("Contato não encontrado");
    }
  }
}
