import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';

final _l = AppLogger.forTag('ItemNotFound');

class ItemNotFound extends StatelessWidget {
  final int id;

  const ItemNotFound(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.not_interested),
      const SizedBox(height: 16),
      Text('По идентификатору $id ничего не найдено')
    ]));
  }
}
