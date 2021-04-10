import 'package:app_logs/app_logs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vmngr/routing/navigation_path.dart';

/// Converts browser location strings to [NavigationPath], and vice-versa.
class AppRouteParser extends RouteInformationParser<NavigationPath> {
  final l = AppLogger.forTag('AppRouteParser');

  AppRouteParser() {
    l.v('.constructor');
  }

  @override
  // Take a url bar location, and create an AppLink from it
  Future<NavigationPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    l.v('.parseRouteInformation(${routeInformation.location})');
    final uri = Uri.parse(routeInformation.location!);
    final s = uri.pathSegments.where((e) => e.isNotEmpty).toList();
    if (s.isEmpty) return NavigationPath.startPage(); //redirecting
    final np = parseToNavigationPath(s);
    l.v('.parseRouteInformation parsed to', np);
    return SynchronousFuture(np);
  }

  NavigationPath parseToNavigationPath(List<String> s) {
    l.v('location segments', s);
    final name = s[0];
    final id = s.length > 1 ? s[1] : null;
    return NavigationPath(name, id);
  }

  @override
  // Convert an NavigationPath into a string used for the browser location
  // If an app state change leads to the Router rebuilding, the Router will retrieve
  // the new route information from the routerDelegate's RouterDelegate.currentConfiguration method
  // and the routeInformationParser's RouteInformationParser.restoreRouteInformation method.
  RouteInformation restoreRouteInformation(NavigationPath p) {
    final String location = p.encodeToUrl();
    l.v('.restoreRouteInformation($location)');
    // Pass that string back to the OS so it can update the url bar
    return RouteInformation(location: location);
  }
}
