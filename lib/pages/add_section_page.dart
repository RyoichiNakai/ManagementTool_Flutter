import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/app_shared_pref.dart';

//todo:画面遷移をモーダルで行う
class AddSectionPage extends StatefulWidget {
  AddSectionPage({Key key}) : super(key: key);

  @override
  _AddSectionPageState createState() => _AddSectionPageState();

  static void push(BuildContext context) {
    Utils.pushModal(context, AddSectionPage());
  }
}

class _AddSectionPageState extends State<AddSectionPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocusNode = new FocusNode();
  final TextEditingController _textEditingController = new TextEditingController();
  String _sectionName = '';

  @override
  void initState() {
    super.initState();
    _readText();
  }

  void _readText() async{
    //todo:Tweecha2のようにmainのところでFutureBilderを使った方が良い？？
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

  void close() {
    Utils.pop(context);
  }

  void _updateSectionName(String name){
    setState(() {
      _sectionName = name;
      //todo:ここのエラーの直し
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextFormCard(context),
      ],
    );

    return Scaffold(
      appBar: _buildAppBar(context),
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

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 24.0,
          ),
          onPressed: close
      ),
      title: Text(
        'セクションの追加',
        style: TextStyle(
            fontSize: AppInfo.appBarTitleFontSize, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
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
                _updateSectionName(value);
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
                    child: Text('セクションを作成'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: _sectionName.length > 0
                        ? () {
                            //todo: dbのテーブルを作成,pop
                          }
                        : null,
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
