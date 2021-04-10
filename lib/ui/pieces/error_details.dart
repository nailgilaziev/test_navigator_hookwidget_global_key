import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentRefreshableProviderScopedProvider =
    ScopedProvider<FutureProvider<Object>>(null);

final _l = AppLogger.forTag('ErrorDetails');

class ErrorDetails extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;

  const ErrorDetails(this.error, this.stackTrace);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  final currentProvider =
                      context.read(currentRefreshableProviderScopedProvider);
                  context.refresh(currentProvider);
                }),
            Text(
              error.toString(),
              style: const TextStyle(color: Colors.deepOrange),
            ),
            TextButton(
                onPressed: () {
                  // TODO тут кусочек кода, который просит appCondition перейти на страницу логов
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      _l.v(error.toString());
                      debugPrintStack(stackTrace: stackTrace);
                      return AlertDialog(
                        title: const Text('StackTrace'),
                        content: SingleChildScrollView(
                          child: Text(
                            stackTrace.toString(),
                            textScaleFactor: 0.6,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('подробнее')),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
