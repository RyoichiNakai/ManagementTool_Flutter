import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/pages/add_section_page.dart';

class MyToDoListPage extends StatefulWidget {
  MyToDoListPage({Key key}) : super(key: key);

  @override
  _MyToDoListPageState createState() => _MyToDoListPageState();
}

class _MyToDoListPageState extends State<MyToDoListPage> {

  @override
  void initState() {
    super.initState();
  }

  void _appBarLeadingOnPressed() {
    //todo
  }

  void _appBarTrailingOnPressed() {
    //todo
  }

  void _floatingActionButtonOnPressed() {
    AddSectionPage.push(context);
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

}