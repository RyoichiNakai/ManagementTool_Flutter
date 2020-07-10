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

class MyToDoListPageState extends State<MyToDoListPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  final GlobalKey<MyToDoListPageState> todoListPageKey = GlobalKey<MyToDoListPageState>();
  bool _pressedFab = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0)).animate(controller);
  }

  @override
  void dispose(){
    super.dispose();
  }

  _close() {
    Utils.pop(context);
  }

  _floatingActionButtonOnPressed() {
    setState(() {
      if (_pressedFab){
        _pressedFab = false;
      } else {
        _pressedFab = true;
      }
    });
    //todo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).backgroundColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
            size: 28.0,
          ),
          onPressed: _floatingActionButtonOnPressed
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        notchMargin: 6.0,
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //todo:FABを押した時に表示する
               IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),

      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: AppIcon.buildArrowBackIconButton(callback: _close),
      title: Text(
          '${widget.tableName}',
        style: TextStyle(
          fontSize: AppInfo.appBarTitleFontSize + 1,
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

}