import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/utils/transition/transition.dart';

class Utils{

  static void pushModal(BuildContext context, Widget widget, {State<StatefulWidget> state}){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: true
        )
    ).then((value) => state?.setState(() { }));
    //todo: FullScreenじゃなくても大丈夫なようにする
  }

  static void pushBounce(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).bounce()
    );
  }

  static void pushDissolve(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).dissolve()
    );
  }

  static void pushQuick(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).quick()
    );
  }

  static void pushSlide(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).slide()
    );
  }

  static void pushSlideUp(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).slideUp()
    );
  }

  static void pushStandard(BuildContext context, Widget widget){
    Navigator.push(
        context,
        TransHall.of(widget).standard()
    );
  }

  static void pop(BuildContext context){
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }


  static void showConfirmDialog(BuildContext context, String title, List<Widget> widgets, {bool hasContent, String content}){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text(title),
            content: hasContent ? Text(content) : null,
            actions: widgets
          );
        }
    );
  }

}