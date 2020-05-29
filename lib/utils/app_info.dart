import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppInfo{

  static final appBarTitleFontSize = 16.0;

  static double getMediaQuerySizeHeight(BuildContext context)
    => MediaQuery.of(context).size.height;

  static double getMediaQuerySizeWidth(BuildContext context)
    => MediaQuery.of(context).size.width;

}