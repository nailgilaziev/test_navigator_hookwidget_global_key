import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/models/layout_modes.dart';
import 'package:vmngr/routing/navigation_path.dart';

part 'app_models.freezed.dart';

final _l = AppLogger.forTag('appModelsProviders');

final bootstrappedStateProvider = StateProvider<bool>((ref) => false);

final appConditionProvider = Provider<AppCondition>((ref) {
  _l.v('* appConditionProvider');
  final bootstrapped = ref.watch(bootstrappedStateProvider).state;
  final np = ref.watch(navigationPathSNProvider.state);
  final layoutMode = ref.watch(layoutModeSNProvider.state);

  /// watch for triggering change when itemDetails changed for RouterDelegate
  // ref.watch(itemDetailsProvider);
  return AppCondition(
    bootstrapped: bootstrapped,
    authorized: true,
    layoutMode: layoutMode,
  );
});

@freezed
class AppCondition with _$AppCondition {
  const factory AppCondition({
    required bool bootstrapped,
    required bool authorized,
    required LayoutMode layoutMode,
  }) = _AppCondition;
}

@freezed
class DetailsMode with _$DetailsMode {
  factory DetailsMode.nothing() = _NothingMode;

  factory DetailsMode.unparsable() = _UnparsableMode;

  factory DetailsMode.item({
    int? id,
    @Default(false) bool editing,
  }) = _ItemMode;
}

final detailsModeProvider = Provider<DetailsMode>((ref) {
  final np = ref.watch(navigationPathSNProvider.state);
  return np.toItemDetailsMode();
});

final selectedIdProvider = Provider<int?>((ref) {
  final detailsMode = ref.watch(detailsModeProvider);
  return detailsMode.maybeWhen(
    item: (id, _) => id,
    orElse: () => null,
  );
});

/// used in building editing or browse pages for itemdetails
final idScopedProvider = ScopedProvider<int?>(null);
