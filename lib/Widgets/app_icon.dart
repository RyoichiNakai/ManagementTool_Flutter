import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon {

  static Widget buildArrowBackIconButton({VoidCallback callback}) => IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      size: 24.0,
    ),
    onPressed: callback,
  );

  static Widget buildArrowDownIconButton({VoidCallback callback}) => IconButton(
      icon: Icon(
        Icons.keyboard_arrow_down,
        size: 24.0,
      ),
      onPressed: callback,
  );

  static Widget buildArrowIcon() => Padding(
    padding: const EdgeInsetsDirectional.only(end: 8.0),
    child: Icon(
      Icons.arrow_forward_ios, size: 16.0,
    ),
  );

}