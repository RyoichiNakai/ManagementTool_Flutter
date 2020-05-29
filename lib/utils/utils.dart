import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/utils/transition/transition.dart';

class Utils{

  static void pushModal(BuildContext context, Widget widget){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: true
        )
    );
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

}