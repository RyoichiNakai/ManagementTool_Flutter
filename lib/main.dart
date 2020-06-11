import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:management/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:management/I10n/japanese_cupertino_localizations.dart';
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
      //TODO:root
    );
  }

  //todo:色がいい感じになる様にする、名前とかももう一回再確認
  //todo:try to change themecolor
  final themeDataLight = ThemeData.light().copyWith(
    primaryColorLight: Colors.white,
    backgroundColor: Colors.blue,
    accentColor: Colors.white, //ボタンの中のアイコンの色
    textSelectionColor: Colors.white, //タブバーの文字の色
    canvasColor: Colors.white, //カードの中の文字
  );

  final themeDataDark = ThemeData.dark().copyWith(
    primaryColorDark: Colors.black,
    iconTheme: IconThemeData.fallback().copyWith(
      color: Colors.blueGrey,
    ),
    accentColor: Colors.blue, //ボタンの中のアイコンの色
  );




}
