import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon {

  static Widget buildArrowIcon() => Padding(
    padding: const EdgeInsetsDirectional.only(end: 8.0),
    child: Icon(
      Icons.arrow_forward_ios, size: 16.0,
    ),
  );

}