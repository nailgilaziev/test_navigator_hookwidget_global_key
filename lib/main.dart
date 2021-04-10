import 'dart:ui';

import 'package:app_logs/app_logs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/_utils/utils.dart';
import 'package:vmngr/models/app_models.dart';
import 'package:vmngr/models/layout_modes.dart';
import 'package:vmngr/routing/navigation_path.dart';
import 'package:vmngr/routing/route_parser.dart';
import 'package:vmngr/routing/router_delegate.dart';

void main() {
  // AppLogger.initTagsLength(32);
  AppLogger.printToConsole = !kReleaseMode;

  runApp(ProviderScope(child: _AppBootstrapper()));
}

class _AppBootstrapper extends StatefulWidget {
  @override
  _AppBootstrapperState createState() => _AppBootstrapperState();
}

class _AppBootstrapperState extends State<_AppBootstrapper>
    with WidgetsBindingObserver {
  final l = AppLogger.forTag('_AppBootstrapperState');

  AppRouteParser appRouteParser = AppRouteParser();
  late AppRouterDelegate appRouterDelegate;

  ProviderSubscription<AppCondition>? providerSub;

  @override
  void initState() {
    l.v('.initState()');
    initLayoutMode();
// I doubt that providing context that way is a good solution. But nothing simpler and clever I can't to figure out
    context.read(navigationPathSNProvider).context = context;

    setBootstrapped();
    // Create the appRouter, and inject it with the models/services it needs
    appRouterDelegate = AppRouterDelegate(context.read(appConditionProvider));
    providerSub =
        ProviderScope.containerOf(context, listen: false).listen<AppCondition>(
      appConditionProvider,
      mayHaveChanged: (sub) {
        final r = sub.read();
        l.v('.mayHaveChanged()');
        appRouterDelegate.manuallySetNewAppCondition(r);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    l.v('.dispose()');
    WidgetsBinding.instance?.removeObserver(this);
    appRouterDelegate.dispose();
    providerSub?.close();
    super.dispose();
  }

  void initLayoutMode() {
    WidgetsBinding.instance?.addObserver(this);
    final window = WidgetsBinding.instance?.window;
    final width = window?.physicalSize.width;
    if (width == null) throw 'window size must be not null on initState';
    context
        .read(layoutModeSNProvider)
        .widthChanged(width / window!.devicePixelRatio);
  }

  @override
  void didChangeMetrics() {
    final width = window.physicalSize.width / window.devicePixelRatio;
    l.v('.didChangeMetrics()', width);
    context.read(layoutModeSNProvider).widthChanged(width);
  }

  @override
  Widget build(BuildContext context) {
    l.v('.build()');
    return MaterialApp.router(
      // Convert appState to (and from) a string "location"
      routeInformationParser: appRouteParser,
      // Builds a stack that represents your appState.
      routerDelegate: appRouterDelegate,
      // Disable debug banner
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          accentColor: Colors.green,
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.green)),

      themeMode: ThemeMode.dark,
    );
  }

  void setBootstrapped() async {
    await Utils.delaySecs(0.5);
    context.read(bootstrappedStateProvider).state = true;
  }
}
