import 'package:management/utils/database/database_provider.dart';
import 'package:management/utils/model/todolist_model.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider extends DatabaseProvider {
  @override
  String get databaseName => 'todolist.db';

  @override
  createDBTable(Database db, String tableName) async => await db.execute(
    """
          CREATE TABLE $tableName(
            "key" INTEGER PRIMARY KEY AUTOINCREMENT,
            "title" TEXT,
            "datetime" TEXT,
            "done" TEXT
          )
    """,
  );

  //テーブル一覧の取得
  Future getTables() async {
    final maps = await db.rawQuery("select * from sqlite_master where type='table'");
    final tables = [];
    for (int i = 0; i < maps.length; i++){
      if (maps[i]['tbl_name'] == 'sqlite_sequence') continue;
      tables.add(maps[i]['tbl_name']);
    }
    print(tables);
    return tables;
  }

  //挿入
  Future<void> insertList(ToDoListModel model, String tableName) async{
    await db.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //削除
  Future<void> deleteList(int key, String tableName) async{
    await db.delete(
        tableName,
        where: 'key = ?',
        whereArgs: [key]
    );
  }

  //更新
  Future<void> updateList(ToDoListModel model, String tableName) async{
    await db.update(
      tableName,
      model.toMap(),
      where: 'key = ?',
      whereArgs: [model.key],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  //取得
  Future<List<Map<String, dynamic>>> getList(String tableName) async{
    final List<Map<String, dynamic>> maps = await db.query(tableName, orderBy: "key");
    return maps;
  }

  //検索
  Future<List<Map<String, dynamic>>> exploreTitle(String name, String tableName) async{
    final List<Map<String, dynamic>> maps
    = await db.query(tableName, where:"title = ?", whereArgs:[name]);
    return maps;
  }


  Future close() async => db.close();
}
