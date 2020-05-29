import 'package:meta/meta.dart';

class ToDoListModel {
  final int key;
  final String title;
  final String dateTime;
  final String done;

  ToDoListModel({
    @required this.key,
    @required this.title,
    @required this.dateTime,
    @required this.done
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["key"] = key;
    map["title"] = title;
    map["dateTime"] = dateTime;
    map["done"] = done;
    return map;
  }
}