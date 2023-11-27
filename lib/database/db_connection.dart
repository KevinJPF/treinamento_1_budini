import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  static Database? _database;
  static const String dbName = 'db_treinamento.db';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    String customDatabasePath = join(await getDatabasesPath(), dbName);

    // Se o banco de dados não existir, ele será criado automaticamente
    _database = await openDatabase(
      customDatabasePath,
      version: 1, // Versão do seu banco de dados
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE Users(id_user INTEGER PRIMARY KEY, user_name TEXT, user_address TEXT, user_phone TEXT)',
        );
      },
    );

    return _database!;
  }

  Future<String> get databasePath async {
    if (_database != null) {
      return _database!.path;
    }

    String customDatabasePath = join(await getDatabasesPath(), dbName);

    return customDatabasePath;
  }


  Future<void> insertItem(Map<String, dynamic> item) async {
    try {
    final Database db = await database;
    await db.insert('Users', item,
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('Item inserido com sucesso!');
  } catch (e) {
    print('Erro ao inserir item: $e');
  }
  }

  Future<List<Map<String, dynamic>>> getUsuarios() async {
  final Database db = await database;

  final List<Map<String, dynamic>> usuarios = await db.query('Users');

  return usuarios;
}


  Future<void> updateItem(Map<String, dynamic> item) async {
    final Database db = await database;
    await db.update('Users', item,
        where: 'id_user = ?', whereArgs: [item['id_user']]);
  }

  Future<void> deleteItem(int id) async {
    final Database db = await database;
    await db.delete('Users', where: 'id_user = ?', whereArgs: [id]);
  }
}
