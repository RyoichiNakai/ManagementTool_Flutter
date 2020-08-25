import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/Widgets/app_icon.dart';

class Widgets {

  static Widget buildDownIconAppBar(BuildContext context, String title,{VoidCallback callback}) => AppBar(
      leading: AppIcon.buildArrowDownIconButton(callback: callback),
      title: Text(title, style: Theme.of(context).textTheme.headline1),
  );

  static Widget buildBackIconAppBar(BuildContext context, String title,{VoidCallback callback}) => AppBar(
    leading: AppIcon.buildArrowBackIconButton(callback: callback),
    title: Text(title, style: Theme.of(context).textTheme.headline1),
  );

  static Widget buildTitleListTile(BuildContext context, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      title: Text(
          title,
          style: Theme.of(context).textTheme.headline2
      ),
    );
  }

  static Widget buildListTile(BuildContext context, String title, IconData icon, Color color, VoidCallback callback){
    return InkWell(
      onTap: () => callback,//AppDataSelectUtils.onTapSelectColorTheme(context),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(icon, color: color, size: 22.0),
            ),
            buildListTileText(context, title),
          ],
        ),
        trailing: AppIcon.buildArrowIcon(),
      ),
    );
  }

  static Widget buildListTileText(BuildContext context, String title) {
    return Expanded(
      child: Text(
          title,
          softWrap: true,
          maxLines: 3,
          style: Theme.of(context).textTheme.bodyText1
      ),
    );
  }

}