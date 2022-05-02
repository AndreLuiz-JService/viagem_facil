import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initiateDatabase();
  }

  static get() async {
    return await DB._instance.database;
  }

  initiateDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'dados.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(item);
        await db.execute(mala);
        await db.execute(publicacao);
        await db.execute(curtidas);
      },
    );
  }

  String get item => '''
  CREATE TABLE Item (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Mala_ID INTEGER UNSIGNED NOT NULL,
  Nome TEXT NOT NULL,
  Categoria INTEGER NOT NULL
)
  ''';



  String get mala => '''
  CREATE TABLE Mala (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome TEXT NOT NULL
)
  ''';


  String get publicacao => '''
  CREATE TABLE Publicacao (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Usuario_ID INTEGER  NOT NULL,
  Nome TEXT NOT NULL,
  Categoria INTEGER NOT NULL,
  Nome_user TEXT NOT NULL,
  photo_URL TEXT NOT NULL,
  likes INTEGER 
)
  ''';

  String get curtidas => '''
  CREATE TABLE curtidas (
  ID TEXT not null,
  ID_publicacao INTEGER not null,
  tipo integer not null
)
  ''';
}
