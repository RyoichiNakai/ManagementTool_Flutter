import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/pages/todolists/index_todolist_section_page.dart';
import 'package:management/utils/utils.dart';

class EditColorNewTodoListSectionPage extends StatefulWidget {
  EditColorNewTodoListSectionPage({Key key}) : super(key: key);
  @override
  _EditColorNewTodoListSectionPageState createState() => _EditColorNewTodoListSectionPageState();

  static void push(BuildContext context, {State<StatefulWidget> state}) {
    Utils.pushModal(context, EditColorNewTodoListSectionPage(), state: state);
  }
}

class _EditColorNewTodoListSectionPageState extends State<EditColorNewTodoListSectionPage> {
  PageController _pageController;
  int _page = 0;

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

  }

}