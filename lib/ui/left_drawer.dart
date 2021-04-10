import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LeftDrawer extends HookWidget {
  final bool popOnSelect;

  LeftDrawer({Key? key, this.popOnSelect = true}) : super(key: key);
  final l = AppLogger.forTag('LeftDrawer');

  List<Widget> list(BuildContext context) {
    var theme = Theme.of(context);
    return [
      Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 36, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('user', style: theme.textTheme.caption),
                IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
              ],
            ),
            Text(
              'Welcome',
              style: theme.textTheme.headline6,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: list(context)),
    );
  }
}
