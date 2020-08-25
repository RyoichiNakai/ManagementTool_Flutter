import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:management/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:management/I10n/japanese_cupertino_localizations.dart';
import 'package:management/utils/app_info.dart';
import 'dart:io';

import 'package:management/utils/app_shared_pref.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeDataLight,
      darkTheme: themeDataDark,
      localizationsDelegates: [
        JapaneseCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ja', 'JP'),
      ],
      home: MyHomePage(),
    );
  }


  final themeDataLight = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    iconTheme: IconThemeData.fallback().copyWith(
      color: Colors.blueGrey,
    ),
    textTheme: TextTheme(
      button: TextStyle(fontSize: 18, color: Colors.white),
      headline1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), //appbar
      headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54), //見出し
      bodyText1: TextStyle(color: Colors.black87),
    ),
  );

  final themeDataDark =  ThemeData.dark().copyWith(
    iconTheme: IconThemeData.fallback().copyWith(
      color: Colors.blueGrey, //todo：カラーテーマの続き
    ),
    textTheme: TextTheme(
      button: TextStyle(fontSize: 16, color: Colors.white),
      headline1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), //appbar
      headline2: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), //見出し
      bodyText1: TextStyle(color: Colors.white),
    ),
  );


}
