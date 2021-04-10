import 'package:app_logs/app_logs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/models/app_models.dart';
import 'package:vmngr/models/layout_modes.dart';
import 'package:vmngr/routing/navigation_path.dart';
import 'package:vmngr/ui/left_drawer.dart';
import 'package:vmngr/ui/pages/details/account.dart';
import 'package:vmngr/ui/pages/details/no_selection.dart';
import 'package:vmngr/ui/pages/master/accounts.dart';
import 'package:vmngr/ui/pages/master/not_found.dart';
import 'package:vmngr/ui/pages/splash.dart';

class AppRouterDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier {
  final l = AppLogger.forTag('AppRouterDelegate');

  // BuildContext refactorMeContext;
  late AppCondition app;

  AppRouterDelegate(this.app) {
    l.v('.constructor()');
  }

  void manuallySetNewAppCondition(AppCondition appCondition) {
    // Rebuild whenever any of our app state changes
    // When notifyListeners is called, it tells the Router to rebuild the RouterDelegate
    app = appCondition;
    notifyListeners();
  }

  @override
  void dispose() {
    l.v('.dispose()');
    //TODO need to dispose something?
    super.dispose();
  }

  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');

  BuildContext get ctx {
    if (navigatorKey.currentContext == null) {
      throw 'use ctx only when Navigator is already build';
    }
    return navigatorKey.currentContext!;
  }

  @override

  /// keep browser url up to date with the current app state
  /// If an app state change leads to the Router rebuilding, the Router will retrieve
  /// the new route information from the routerDelegate's RouterDelegate.currentConfiguration method
  /// and the routeInformationParser's RouteInformationParser.restoreRouteInformation method.
  NavigationPath? get currentConfiguration {
    /// user types deeplink in browser url and press enter
    /// app starts up and show auth page. here 2 things happen:
    /// 1) deeplink already saved to deferredNavigationPath
    /// 2) this method returns null that means that rewriting browser url field won't happen
    /// so typed by user deeplink url keeps in place
    final navigationPath = ctx.read(navigationPathSNProvider.state);
    l.v('.currentConfiguration() = $navigationPath');
    return navigationPath;
  }

  @override

  /// Call once at startup of the Router, on all platforms.
  /// This might hold a deep link from the browser, or just an empty initial route "/'
  Future<void> setInitialRoutePath(NavigationPath initialPath) async {
    l.v('.setInitialRoutePath($initialPath)');
    setNewRoutePath(initialPath);
  }

  @override

  /// The OS is asking us to change our location.
  /// If we choose, we can update the app state to match the request from the OS.
  Future<void> setNewRoutePath(NavigationPath np) async {
    l.v('.setNewRoutePath($np)');
    bool newRouteApplied;
    if (Navigator.canPop(ctx)) {
      Navigator.pop(ctx);
      l.i('using new path is not available now because alert/page is shown');
      newRouteApplied = false;
    } else if (!ctx.read(navigationPathSNProvider).trySetNewPath(np)) {
      l.i('using new path is not available now because unsaved data changes exist');
      newRouteApplied = false;
    } else {
      newRouteApplied = true;
    }
    if (!newRouteApplied) {
      /// browser url changed but app state not (url deferred)
      /// notify to keep browser url in sync with app state
      notifyListeners();
    }
  }

  @override

  /// Handle OS level back event  (Android mainly)
  /// returning true means that we handled event
  /// false - we can't handle, so app will close
  Future<bool> popRoute() async {
    l.v('.popRoute()');
    final sc = ctx.read(navigationPathSNProvider);
    bool handled;
    final pushedAlerts = Navigator.of(ctx).canPop();
    final detailsPresented = sc.canPop();
    if (pushedAlerts || detailsPresented) {
      Navigator.of(ctx).pop();
      handled = true;
    } else {
      handled = false; // exit from app
    }
    return SynchronousFuture(handled);
  }

  // Handle Navigator.pop for any routes in our stack
  bool _handleNavigatorPop(Route<dynamic> route, dynamic result) {
    l.v('._handleNavigatorPop($route,$result)');
    /// Ask the route if it can handle pop internally... (has own stack)
    if (route.didPop(result)) {
      /// router hasn't internal stack, so we will pop one level in our stack
      /// but router already create the animation of popping, so we must actualize our stack
      l.v('._handleNavigatorPop() ask us to pop one level');

      /// checkForUnsaved can be true or false. Result will be the same,
      /// because unsavedData existence already checked above
      /// and there is no changes. but by specifying checkForUnsaved=false
      /// we reduce internal calling of unsavedData checking.
      /// didPop already pop the page, so we need just actualize our stack
      final attemptHandled = tryPopAttempt(checkForUnsaved: false);
      l.v('._handleNavigatorPop() tryPopAttempt returned $attemptHandled');
      /// if router ask us to pop the route - we must pop the route and return true
      /// if we return false this cause next exceptions
      /// Bad state: Future already completed
      /// Each child must be laid out exactly once.
      return true;
    } else {
      l.v('route.didPop() returned false. It means that it has internal stack');
      /// I don't understand when it can happen and what true / false here means
      return false;
    }
  }

  bool tryPopAttempt({bool checkForUnsaved = true}) {
    final sc = ctx.read(navigationPathSNProvider);
    final attemptHandled = sc.tryPop(checkForUnsaved: checkForUnsaved);
    return attemptHandled;
  }

  @override
  // Return a navigator, configured to match the current app state
  Widget build(BuildContext context) {
    // TODO эта часть реализации мне не нравится, избавиться от нее или перенести выше
    // Hold splash in place until our bootstrap cmd and any route parsing is done.
    final showSplash =
        !app.bootstrapped; //app.lastNavigationPathFromOs == null;
    final isNotAuthenticated = !app.authorized;
    l.v('.build() bootstrapped: ${app.bootstrapped}, authorized: ${app.authorized}');

    /// for showing snackbars messages
    return Scaffold(
      body: Stack(
        children: [
          Navigator(
            key: navigatorKey,
            onPopPage: _handleNavigatorPop,
            pages: [
              if (showSplash)
                SplashPage()
              else
                // Model pages
                ...getPages(context)
            ].map((e) => MaterialPage<void>(child: e)).toList(),
          )
        ],
      ),
    );
  }

  // preserve state when window shrinked to a minimum and item details page moved
  // in widget tree hierarchy (two panels mode changes to navigation page)
  GlobalKey itemPanelKey = GlobalKey();

  /// delegate page creation to ModelHolder object
  List<Widget> getPages(BuildContext context) {
    l.v('.getPages(_)');
    final details = context.read(detailsModeProvider);
    final layoutMode = app.layoutMode;
    final showDetails =
        details.maybeWhen(nothing: () => false, orElse: () => true);
    final pages = <Widget>[
      AccountsPage(),
      if (showDetails)
        ...details.when(
          nothing: () => [const NoSelectionPage()],
          unparsable: () => [const NotFoundPage()],
          item: (int? id, bool editing) => [
            if (id != null)
              ProviderScope(
                  overrides: [idScopedProvider.overrideWithValue(id)],
                  child: AccountBrowsing()),
            if (editing)
              ProviderScope(
                  overrides: [idScopedProvider.overrideWithValue(id)],
                  child: AccountEditing(key: itemPanelKey))
          ],
        ),
    ];
    if (app.layoutMode == LayoutMode.narrow) {
      /// use navigator pages
      return pages;
    } else {
      /// use master detail panels
      return [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: pages[0],
            ),
            if (pages.length > 1)
              Expanded(
                flex: 1,

                /// last is browse or editing. simultaneously in multi panel mode their not shown
                child: pages.last,
              ),
          ],
        )
      ];
    }
  }
}
