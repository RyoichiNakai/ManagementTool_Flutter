import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/app_shared_pref.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/Widgets/app_icon.dart';
import 'package:management/pages/todolist_table_page.dart';

class DetailToDoListPage extends StatefulWidget {
  DetailToDoListPage({Key key}) : super(key: key);

  @override
  DetailToDoListPageState createState() => DetailToDoListPageState();

  static void push(BuildContext context, {State<StatefulWidget> state}) {
    Utils.pushModal(context, DetailToDoListPage(), state: state);
  }

}

class DetailToDoListPageState extends State<DetailToDoListPage> {
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
      appBar: _buildAppBar(context),
      body: Container(
        //todo
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: AppIcon.buildArrowDownIconButton(callback: _close),
      title: Text(
        '',
        style: TextStyle(
          fontSize: AppInfo.appBarTitleFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTitleListTile(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTileText(String title, {double fontSize}) {
    return Expanded(
      child: Text(
        title,
        softWrap: true,
        maxLines: 3,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, Color color, VoidCallback callback, {double fontSize}){
    return InkWell(
      onTap: () => callback,//AppDataSelectUtils.onTapSelectColorTheme(context),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(icon, color: color, size: 22.0),
            ),
            _buildListTileText(title, fontSize: fontSize),
          ],
        ),
        trailing: AppIcon.buildArrowIcon(),
      ),
    );
  }
}
