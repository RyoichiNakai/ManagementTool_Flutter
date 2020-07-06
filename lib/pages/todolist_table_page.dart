import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/pages/add_section_page.dart';
import 'package:management/pages/todolist_page.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:management/utils/model/todolist_model.dart';
import 'package:management/Widgets/app_icon.dart';

class MyToDoListTablePage extends StatefulWidget {

  MyToDoListTablePage({Key key}) : super(key: key);

  @override
  MyToDoListTablePageState createState() => MyToDoListTablePageState();
}

class MyToDoListTablePageState extends State<MyToDoListTablePage> {

  final GlobalKey<MyToDoListTablePageState> todoListPageKey = GlobalKey<MyToDoListTablePageState>();
  //todo:このアイコンは後に変更
  Icon _defaultIcon = Icon(FontAwesomeIcons.icons);

  @override
  void initState() {
    super.initState();
    //todo：initが追加されていなかったこの後の挙動がどうなるか確かめる
  }

  @override
  void dispose(){
    super.dispose();
  }

  _getDBTables() async {
    try {
      await new Future.delayed(new Duration(milliseconds: 200));
      DbProvider _provider = new DbProvider();
      await _provider.init();
      List _tables = await _provider.getTables();
      return _tables;
    }
    catch (e) {
      print(e);
    }
  }


  void _appBarLeadingOnPressed() {
    //todo
  }

  void _appBarTrailingOnPressed() {
    //todo
  }

  void _floatingActionButtonOnPressed() {
    AddSectionPage.push(context, state: this);
  }

//  void _onReorder(int oldIndex, int newIndex) {
//    if (oldIndex < newIndex) {
//      newIndex -= 1;
//    }
//    setState(() {
//      final table = _tableList.removeAt(oldIndex);
//      _tableList.insert(newIndex, table);
//    });
//  }

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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListItem(context, snapshot.data[index], index.toString());
                    },
                ),
            );
          }
        }
      ),
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
    //todo;全部消したあ，エラーが出る
    return Dismissible(
      key: Key(key),
      background: Container(
          color: Colors.red,
          child: Container(
              child: Icon(Icons.delete)
          ),
      ),
      secondaryBackground: Container(
          color: Colors.blue,
          child: Container(
              child: Icon(Icons.flag)
          ),
      ),
      onDismissed: (direction) {
        print(direction);
        if (direction == DismissDirection.endToStart) {
          //todo:ここの具体的な実装は次回
          print("end to start"); // (日本語だと)右から左のとき
        } else {
          print("start to end"); // (日本語だと?)左から右のとき
        }
      },
      child: Column(
          children: <Widget> [
            ListTile(
              key: Key(key),
              leading: _defaultIcon,
              title: Text(tableName),
              trailing: AppIcon.buildArrowIcon(),
              onTap: () {
                MyToDoListPage.push(context, tableName: tableName, index: int.parse(key));
              },
            ),
            Divider(height:1.0)
          ]
      ),
    );
  }

//todo:時間があれば，reorderbleでできるかやってみよう
/*  ReorderableListView _buildReorderableList(BuildContext context, List<dynamic> tables) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex),

      children: tables.map((i) => _buildListItem(context, tables[i], i.toString())).toList(),
    );
  }*/

}