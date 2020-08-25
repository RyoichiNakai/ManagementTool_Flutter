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

class NewTodoListSectionPage extends StatefulWidget {
  NewTodoListSectionPage({Key key}) : super(key: key);

  @override
  _NewTodoListSectionPageState createState() => _NewTodoListSectionPageState();

  static void push(BuildContext context, {State<StatefulWidget> state}) {
    Utils.pushModal(context, NewTodoListSectionPage(), state: state);
  }

}

class _NewTodoListSectionPageState extends State<NewTodoListSectionPage> {
  final FocusNode _nameFocusNode = new FocusNode();
  final TextEditingController _textEditingController = new TextEditingController();
  String _sectionName = '';

  @override
  void initState() {
    super.initState();
    _readText();
  }

  void _readText() async{
    await AppSharedPrefs.setInstance();
    setState(() {
      _sectionName = AppSharedPrefs.getSectionName();
      _textEditingController.text = AppSharedPrefs.getSectionName();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onPressed(BuildContext context) async{
    try {
      DbProvider _provider = new DbProvider();
      await _provider.init();
      await _provider.createDBTable(_provider.db, _sectionName);
      _reset();
      _close();
    }
    catch (e) {
      List<Widget> actions = [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('OK'),
          onPressed: _close,
        )
      ];
      String title = 'このセクションは\n既に作成されています';
      Utils.showConfirmDialog(context, title, actions, hasContent: false);
      print(e);
    }
  }

  _reset() {
    setState(() {
      _sectionName = '';
      _textEditingController.text = '';
    });
    AppSharedPrefs.clearSectionName();
  }

  _close() {
    Utils.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextFormCard(context),
        Widgets.buildTitleListTile(context, 'オプション'),
        Divider(height:1.0),
        Widgets.buildListTile(context, 'セクションのカラーテーマ変更', FontAwesomeIcons.palette, Colors.blue, null),
        Divider(height:1.0),
        Widgets.buildListTile(context, 'セクションのアイコンを変更', FontAwesomeIcons.heart, Colors.red, null),
        Divider(height:1.0),
      ],
    );

    return Scaffold(
      appBar: Widgets.buildDownIconAppBar(context, 'セクションの追加', callback: _close),
      body: GestureDetector (
        onTap: () async{
          _nameFocusNode.unfocus();
          AppSharedPrefs.setSectionName(_sectionName);
        },
        child: SingleChildScrollView(
          child: _child,
        ),
      ),
    );
  }

  Widget _buildTextFormCard(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20), //パディングで調整
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'セクション名',
              style: Theme.of(context).textTheme.headline2
            ),
            TextFormField(
              controller: _textEditingController,
              focusNode: _nameFocusNode,
              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.edit,
                  size: 30,
                ),
                labelText: 'Section Name...',
              ),
              onChanged: (value) {

                setState(() {
                  _sectionName = value;
                });

                AppSharedPrefs.setSectionName(_sectionName);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                        'セクションを作成',
                        style: Theme.of(context).textTheme.button
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: _sectionName.length > 0 ? () async => _onPressed(context) : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }

}
