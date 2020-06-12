import 'package:management/utils/database/database_todolist.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

//コマンド一覧
// /data/data/com.expample.flutterapp/databases/
// run-as com.example.flutterapp cat databases/RendaMachine_10.db > /sdcard/mode_10.db
// adb pull /sdcard/mode_10.db /Users/ryoichinakai/WorkSpace

/// データベース毎にこのクラスを継承したProviderを実装する
abstract class DatabaseProvider {
  //_internalは
  Database db;
  String get databaseName;
  createDBTable(Database db, String tableName);

  init() async {
    if (db != null) return;
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, databaseName);
    //deleteDatabase(path);
    // openDatabaseメソッドを使用することでDBインスタンスを取得することができる。
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) => createDBTable,
    );
  }
}