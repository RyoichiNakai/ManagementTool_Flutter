import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/pages/todolist_section_page.dart';
import 'package:management/utils/utils.dart';

class ColorSettingTodoListSectionPage extends StatefulWidget {
  ColorSettingTodoListSectionPage({Key key}) : super(key: key);
  @override
  _ColorSettingTodoListSectionPageState createState() => _ColorSettingTodoListSectionPageState();

  static void push(BuildContext context, {State<StatefulWidget> state}) {
    Utils.pushModal(context, ColorSettingTodoListSectionPage(), state: state);
  }
}

class _ColorSettingTodoListSectionPageState extends State<ColorSettingTodoListSectionPage> {
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