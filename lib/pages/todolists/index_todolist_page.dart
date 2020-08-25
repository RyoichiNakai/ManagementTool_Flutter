import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/pages/todolists/new_todolist_section_page.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:management/utils/model/todolist_model.dart';
import 'package:management/Widgets/app_icon.dart';
import 'package:management/Widgets/widget.dart';

class IndexToDoListPage extends StatefulWidget {
  final String tableName;
  final int index;

  IndexToDoListPage({Key key, this.tableName, this.index}) : super(key: key);

  @override
  _IndexToDoListPageState createState() => _IndexToDoListPageState();

  static void push(BuildContext context, {Key key, String tableName, int index}) {
    Utils.pushSlide(
        context,
        IndexToDoListPage(
          key: key,
          tableName: tableName,
          index: index,
        ),
    );
  }
}

class _IndexToDoListPageState extends State<IndexToDoListPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  final GlobalKey<_IndexToDoListPageState> todoListPageKey =
  GlobalKey<_IndexToDoListPageState>();
  bool _pressedFab = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _close() {
    Utils.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.buildBackIconAppBar(context, widget.tableName, callback: _close),
    );
  }
}
