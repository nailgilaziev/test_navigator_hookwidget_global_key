import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/routing/navigation_path.dart';

final _l = AppLogger.forTag('NotFoundPage');

class NotFoundPage extends HookWidget {
  const NotFoundPage();

  @override
  Widget build(BuildContext context) {
    final url = useProvider(navigationPathSNProvider.state);

    _l.v('.build()');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 240),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.not_listed_location_rounded, size: 96),
              const Text('Page with this url not found :('),
              Text(url?.encodeToUrl() ?? ''),
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
