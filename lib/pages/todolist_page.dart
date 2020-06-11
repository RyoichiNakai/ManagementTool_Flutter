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
  DbProvider _provider = new DbProvider();
  Icon _defaultIcon = Icon(FontAwesomeIcons.icons);
  List<ToDoListModel> modelList;

  @override
  void initState() {
    super.initState();
    modelList = [];
  }

  //todo:テーブル名の取得

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
      final model = modelList.removeAt(oldIndex);
      modelList.insert(newIndex, model);
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
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex),
        children: modelList
            .map((ToDoListModel model) => buildListItem(context,
            model.title, model.dateTime, model.key.toString()))
            .toList(),
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

  Widget buildListItem(
      BuildContext context, String title, String dateTime, String key,
      {VoidCallback callback}) {
    return ListTile(
      key: Key(key),
      leading: _defaultIcon,
      title: Text(title),
      onTap: () {},
      //todo:長く押したら周りが黒くなるのなんで
    );
  }

}