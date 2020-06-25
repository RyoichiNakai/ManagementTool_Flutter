import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/pages/add_section_page.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:management/utils/model/todolist_model.dart';

class MyToDoListPage extends StatefulWidget {
  MyToDoListPage({Key key}) : super(key: key);

  @override
  _MyToDoListPageState createState() => _MyToDoListPageState();
}

class _MyToDoListPageState extends State<MyToDoListPage> {
  Icon _defaultIcon = Icon(FontAwesomeIcons.icons);
  var _tableList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  Future<String> _getDBTables() async {
    DbProvider _provider = new DbProvider();
    var _tables = await _provider.getTables();
    //todo:デバッグをするとここがnullになる
    return _tables;
  }

  void _appBarLeadingOnPressed() {
    //todo
  }

  void _appBarTrailingOnPressed() {
    //todo
  }

  void _floatingActionButtonOnPressed() {
    AddSectionPage.push(context);
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    setState(() {
      final table = _tableList.removeAt(oldIndex);
      _tableList.insert(newIndex, table);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
          size: 28.0,
        ),
        onPressed: _floatingActionButtonOnPressed
      ),
      body: FutureBuilder(
        future: _getDBTables(),
        //todo:ここのエラーが謎、、、
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData){
            print(snapshot);
            return Container(
              child: _buildReorderableList(context)
            );
          }else{
            return Container();
          }
        }
      ),
    );
  }

  ReorderableListView _buildReorderableList(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex),
      //todo:ここもtablelistでいいんかわからん
      children: _tableList.map((i) => _buildListItem(context, _tableList[i], i.toString())).toList(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.edit),
        onPressed: _appBarLeadingOnPressed,
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: _appBarTrailingOnPressed
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, String tableName, String key, {VoidCallback callback}) {
    return ListTile(
      key: Key(key),
      leading: _defaultIcon,
      title: Text(tableName),
      onTap: () {},
      //todo:長く押したら周りが黒くなるのなんで
    );
  }

}