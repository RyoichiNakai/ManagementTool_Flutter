import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/pages/add_section_page.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:management/utils/model/todolist_model.dart';

import 'package:management/Widgets/app_icon.dart';

class MyToDoListPage extends StatefulWidget {
  final String tableName;
  final int index;

  MyToDoListPage({
    Key key,
    this.tableName,
    this.index
  }) : super(key: key);

  @override
  MyToDoListPageState createState() => MyToDoListPageState();

  static void push(BuildContext context, {Key key, String tableName, int index}){
    Utils.pushSlide(
      context,
      MyToDoListPage(
        key: key,
        tableName: tableName,
        index: index,
      )
    );
  }
}

class MyToDoListPageState extends State<MyToDoListPage> {

  final GlobalKey<MyToDoListPageState> todoListPageKey = GlobalKey<MyToDoListPageState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  _floatingActionButtonOnPressed() {
    //todo
  }

  _close() {
    Utils.pop(context);
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
/*      body: FutureBuilder(
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
      ),*/
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: AppIcon.buildArrowBackIconButton(callback: _close),
      title: Text(
          '${widget.tableName}',
        style: TextStyle(
          fontSize: AppInfo.appBarTitleFontSize,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String tableName, String key, {VoidCallback callback}) {
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
              title: Text(tableName),
              trailing: AppIcon.buildArrowIcon(),
              onTap: () {},

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