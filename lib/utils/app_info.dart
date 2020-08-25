import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:management/pages/todolists/index_todolist_section_page.dart';

class AppInfo{

  static double getMediaQuerySizeHeight(BuildContext context)
    => MediaQuery.of(context).size.height;

  static double getMediaQuerySizeWidth(BuildContext context)
    => MediaQuery.of(context).size.width;

}