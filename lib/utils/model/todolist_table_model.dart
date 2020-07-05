import 'package:meta/meta.dart';

class ToDoListTableModel {
  final int key;
  final String title;
  //todo:この後のテーブルの情報を増やすかも

  ToDoListTableModel({
    @required this.key,
    @required this.title,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["key"] = key;
    map["title"] = title;
    return map;
  }
}
