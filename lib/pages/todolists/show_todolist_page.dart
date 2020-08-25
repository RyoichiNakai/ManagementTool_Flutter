import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/app_shared_pref.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/Widgets/app_icon.dart';
import 'package:management/Widgets/widget.dart';
import 'package:management/pages/todolists/index_todolist_section_page.dart';

class ShowTodoListPage extends StatefulWidget {
  ShowTodoListPage({Key key}) : super(key: key);

  @override
  _ShowTodoListPageState createState() => _ShowTodoListPageState();

  static void push(BuildContext context, {State<StatefulWidget> state}) {
    Utils.pushModal(context, ShowTodoListPage(), state: state);
  }

}

class _ShowTodoListPageState extends State<ShowTodoListPage> {
  final TextEditingController _textEditingController = new TextEditingController();

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
    );
  }

}
