import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:management/pages/todolist_page.dart';

class AppInfo{

  static final appBarTitleFontSize = 16.0;
//  static var myToDoListPageKeyMap = Map<String, MyToDoListPageState>();

  static double getMediaQuerySizeHeight(BuildContext context)
    => MediaQuery.of(context).size.height;

  static double getMediaQuerySizeWidth(BuildContext context)
    => MediaQuery.of(context).size.width;

//  static setState() {
//    myToDoListPageKeyMap.forEach((key, state) =>
//        state?.setState(() { }));
//  }
}