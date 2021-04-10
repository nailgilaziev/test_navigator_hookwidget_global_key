import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';

final _l = AppLogger.forTag('NoSelectionPage');

class NoSelectionPage extends StatelessWidget {
  const NoSelectionPage();

  @override
  Widget build(BuildContext context) {
    _l.v('.build()');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 96, bottom: 16),
              child: Icon(Icons.select_all, size: 80),
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text(
                  'Выберите элемент в панели слева для просмотра детальной информации по нему',
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
