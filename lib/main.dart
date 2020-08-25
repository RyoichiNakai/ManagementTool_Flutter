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

  final themeDataLight = ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      iconTheme: IconThemeData.fallback().copyWith(
        color: Colors.blueGrey, //todo：リファクタリング
      ),
      accentColor: Colors.white, //ボタンの中のアイコンの色
      textTheme: TextTheme(
          button: TextStyle(fontSize: 18, color: Colors.white)
      )
  );

  final themeDataDark = ThemeData.dark().copyWith(
      primaryColorDark: Colors.black,
      iconTheme: IconThemeData.fallback().copyWith(
        color: Colors.blueGrey, //todo：リファクタリング
      ),
      accentColor: Colors.blue, //ボタンの中のアイコンの色
      textTheme: TextTheme(
          button: TextStyle(fontSize: 18, color: Colors.white)
      )
  );

}
