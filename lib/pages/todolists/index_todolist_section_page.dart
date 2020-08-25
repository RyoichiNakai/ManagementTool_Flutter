import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/pages/todolists/new_todolist_section_page.dart';
import 'package:management/pages/todolists/index_todolist_page.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:management/utils/model/todolist_model.dart';
import 'package:management/Widgets/app_icon.dart';

class IndexToDoListSectionPage extends StatefulWidget {
  IndexToDoListSectionPage({Key key}) : super(key: key);

  @override
  _IndexToDoListSectionPageState createState() => _IndexToDoListSectionPageState();
}

class _IndexToDoListSectionPageState extends State<IndexToDoListSectionPage> {
  final GlobalKey<_IndexToDoListSectionPageState> todoListPageKey =
      GlobalKey<_IndexToDoListSectionPageState>();

  //todo:このアイコンは後に変更
  Icon _defaultIcon = Icon(FontAwesomeIcons.icons);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getDBTables() async {
    try {
      await new Future.delayed(new Duration(milliseconds: 200));
      DbProvider _provider = new DbProvider();
      await _provider.init();
      List _tables = await _provider.getTables();
      return _tables;
    } catch (e) {
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
    NewTodoListSectionPage.push(context, state: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 28.0,
          ),
          onPressed: _floatingActionButtonOnPressed),
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
                  return _buildListItem(
                      context, snapshot.data[index], index.toString());
                },
              ),
            );
          }
        },
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
            icon: Icon(Icons.settings), onPressed: _appBarTrailingOnPressed),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, String tableName, String key,
      {VoidCallback callback}) {
    //todo:全部消したら，エラーが出る
    return Dismissible(
      key: Key(key),
      background: Container(
        color: Colors.red,
        child: Container(child: Icon(Icons.delete)),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        child: Container(child: Icon(Icons.flag)),
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
      child: Column(children: <Widget>[
        ListTile(
          key: Key(key),
          leading: _defaultIcon,
          title: Text(
            tableName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: AppIcon.buildArrowIcon(),
          onTap: () {
            IndexToDoListPage.push(context, tableName: tableName, index: int.parse(key));
          },
        ),
        Divider(height: 1.0)
      ]),
    );
  }
}
