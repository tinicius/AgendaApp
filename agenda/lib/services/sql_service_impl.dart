import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:agenda/services/uuid_generate_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlService implements DataService {
  Database? _database;
  UuidGenerateService uuidGenerateService = UuidGenerateService();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _init();
      return _database;
    }
  }

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'contatos_database.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE contatos(id TEXT PRIMARY KEY, name TEXT, phoneNumber TEXT, profilePhotoUrl TEXT)');
      },
      version: 1,
    );
  }

  @override
  Future<void> deleteContato(String id) async {
    final Database db = (await database)!;

    await db.delete(
      'contatos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> editContato(ContactModel contato) async {
    final Database db = (await database)!;

    await db.update(
      'contatos',
      contato.toMap(),
      where: 'id = ?',
      whereArgs: [contato.id],
    );
  }

  @override
  Future<ContactModel> getContatoById(String id) async {
    final Database db = (await database)!;

    final List<Map<String, dynamic>> query =
        await db.query('contatos', where: 'id = ?', whereArgs: [id]);

    return ContactModel(
        id: query[0]['id'],
        profilePhotoUrl: query[0]['profilePhotoUrl'],
        name: query[0]['name'],
        phoneNumber: query[0]['phoneNumber']);
  }

  @override
  Future<List<ContactModel>> getContatos() async {
    final Database db = (await database)!;

    final List<Map<String, dynamic>> maps = await db.query('contatos');

    return List.generate(maps.length, (i) {
      return ContactModel(
          id: maps[i]['id'],
          profilePhotoUrl: maps[i]['profilePhotoUrl'],
          name: maps[i]['name'],
          phoneNumber: maps[i]['phoneNumber']);
    });
  }

  @override
  Future<void> addContato(ContactModel contato) async {
    final Database db = (await database)!;

    if (contato.id == null) {
      contato.id = uuidGenerateService.generateUuid();
    }

    await db.insert('contatos', contato.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
