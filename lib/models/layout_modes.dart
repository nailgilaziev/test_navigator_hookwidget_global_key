import 'package:app_logs/app_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final layoutModeSNProvider = StateNotifierProvider<LayoutModeStateNotifier>(
    (ref) => LayoutModeStateNotifier());

enum LayoutMode { narrow, medium, wide, ultraWide }

class LayoutModeStateNotifier extends StateNotifier<LayoutMode> {
  LayoutModeStateNotifier() : super(LayoutMode.narrow);
  final l = AppLogger.forType(LayoutModeStateNotifier);

  LayoutMode layoutMode(double width) {
    if (width < 640) return LayoutMode.narrow;
    if (width < 1100) return LayoutMode.medium;
    if (width < 1620) return LayoutMode.wide;
    return LayoutMode.ultraWide;
  }

  void widthChanged(double width) {
    final newValue = layoutMode(width);
    if (state == newValue) return;
    l.i('.widthChanged($width) changes layoutMode to $newValue');
    state = newValue;
  }
}
