import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';
import '../Models_part/model.dart';

TodoController controller = Get.find();

class Dbhandler {
  Database? _db;

  Future<Database?> get dbs async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    var documentDirectory = await getDatabasesPath();
    String path = join(documentDirectory, 'note.db');
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        dates TEXT NOT NULL
        )''');
  }

  Future<noteModel> insert(noteModel modeln) async {
    var dbclient = await dbs;
    return dbclient!.transaction((txn) async {
     modeln.id= await txn.insert("notes", modeln.to_map());
     controller.noteslist.add(modeln);
      return modeln;
    });
  }

  Future<List<noteModel>> retrieveData() async {
    var dbclient = await dbs;
    return dbclient!.transaction((txn) async {
      final List<Map<String, Object?>> queryres = await txn.query('notes');
      return queryres.map((e) => noteModel.from_map(e)).toList();
    });
  }
  Future<int> deleteOp(int id) async {
    var dbclient = await dbs;
    return await dbclient!.transaction((txn) async {
      int result = await txn.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );
      controller.noteslist.removeWhere((note) => note.id == id);
      print('deleted item');
      return result;
    });
  }

  Future<int> updateOp(noteModel modeln) async {
    var dbc = await dbs;
    return await dbc!.transaction((txn) async {
      int result = await txn.update(
        'notes',
        modeln.to_map(),
        where: 'id = ?',
        whereArgs: [modeln.id],
      );
      int index =
          controller.noteslist.indexWhere((note) => note.id == modeln.id);
      if (index >= 0 ) {
        controller.noteslist[index] = modeln;

      } else {
        // Handle the case when the index is out of bounds, e.g., log an error.
        print('Invalid index: $index');
      }

      // controller.noteslist[index] = modeln;
      return result;
    });
  }

}
