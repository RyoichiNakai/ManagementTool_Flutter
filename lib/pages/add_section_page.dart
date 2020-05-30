import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:management/utils/utils.dart';
import 'package:management/utils/app_info.dart';
import 'package:management/utils/app_shared_pref.dart';
import 'package:management/utils/database/database_todolist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        Container(
          //todo:見栄え悪いからspaceboxにした方がいいかも
          height: AppInfo.getMediaQuerySizeHeight(context) / 7,
        ),
        //todo:メソッドの抽出と位置調整
        Text('オプション', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
        Divider(height:1.0),
        _buildColorListTile(context),
        Divider(height:1.0),
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
          onPressed: _close,
      ),
      title: Text(
        'セクションの追加',
        style: TextStyle(
            fontSize: AppInfo.appBarTitleFontSize,
            fontWeight: FontWeight.bold,
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
                    child: Text('セクションを作成'),
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

  Widget buildArrowIcon() => Padding(
    padding: const EdgeInsetsDirectional.only(end: 8.0),
    child: Icon(
      Icons.arrow_forward_ios, size: 16.0,
    ),
  );

  Widget buildListTileText(String title) {
    return Expanded(
      child: Text(
        title,
        softWrap: true,
        maxLines: 3,
      ),
    );
  }

  Widget _buildColorListTile(BuildContext context){
    return InkWell(
        onTap: () => null,//AppDataSelectUtils.onTapSelectColorTheme(context),
        child: Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: const Icon(
                      FontAwesomeIcons.palette,
                      size: 22.0,
                    ),
                  ),
                  buildListTileText('セクションカードのカラーテーマ変更'),
                ],
              ),
              trailing: buildArrowIcon(),
            ),
        ),
    );
  }
}
