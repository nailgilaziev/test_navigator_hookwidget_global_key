import 'package:app_logs/app_logs.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/models/app_models.dart';

part 'navigation_path.freezed.dart';

/// holds currently displayed on screen data
/// null means that page not found or app not initialized yet
final navigationPathSNProvider = StateNotifierProvider<NavigationPathNotifier>(
    (ref) => NavigationPathNotifier());

@freezed
class NavigationPath with _$NavigationPath {
  ///id is String because it can be 'new' for creation
  const factory NavigationPath(String modelName, String? identifier) =
      _NavigationPath;

  // ignore: prefer_constructors_over_static_methods
  //static NavigationPath startPage() => const NavigationPath('start', null);
  static NavigationPath startPage() => const NavigationPath('accounts', null);

  const NavigationPath._();

  String encodeToUrl() {
    var s = '/$modelName';
    if (identifier != null) {
      s += '/$identifier';
    }
    return s;
  }

  @override
  String toString() => encodeToUrl();
}

extension ItemDetailsModeParser on NavigationPath? {
  DetailsMode toItemDetailsMode() {
    final np = this;
    var identifier = np?.identifier;
    if (np == null || identifier == null) return DetailsMode.nothing();
    if (np.identifier == 'new') return DetailsMode.item(editing: true);
    final isEditing = identifier.endsWith('.edit');
    if (isEditing) identifier = identifier.replaceAll('.edit', '');
    final id = int.tryParse(identifier);
    if (id == null) return DetailsMode.unparsable();
    return DetailsMode.item(id: id, editing: isEditing);
  }
}

class NavigationPathNotifier extends StateNotifier<NavigationPath?> {
  NavigationPathNotifier() : super(null);
  final l = AppLogger.forTag('NavigationPathNotifier');

  // it's a hack
  late BuildContext context;

  bool _tryChangeNavigationPath(NavigationPath Function() newStateFunc,
      {bool checkForUnsaved = true}) {
    final newState = newStateFunc();
    state = newState;
    return true;
  }

  final _incorrectMethodUsageException = Exception('Incorrect method usage. '
      'Current state is null. Method calling not available.');

  /// functions that manipulate state should not return state
  /// but returning info like this considered normal I think. Am I right?
  bool trySelectId(int id, {bool forEditing = false}) {
    l.v('.selectId($id) when state = $state');
    if (state == null) throw _incorrectMethodUsageException;
    return _tryChangeNavigationPath(() {
      return state!.copyWith(identifier: forEditing ? '$id.edit' : '$id');
    });
  }

  bool trySetCreationMode() {
    if (state == null) throw _incorrectMethodUsageException;
    return _tryChangeNavigationPath(() {
      return state!.copyWith(identifier: 'new');
    });
  }

  bool canPop() {
    if (state == null) throw _incorrectMethodUsageException;
    // if details not presented, so pop attempt can't be executed
    final canPop = state!.identifier != null;
    l.v('.canPop()?$canPop when state = $state');
    return canPop;
  }

  /// return type of this method means:
  /// true - details exist and popping attempt executed/handled.
  /// But result depends on fact that unsavedExist or not
  /// false - details not presented, so popping not available
  bool tryPop({bool checkForUnsaved = true}) {
    l.v('.unselectDetails() when state = $state');
    if (!canPop()) return false;
    final np = state!;
    final identifier = np.identifier!;
    // ignore: prefer_function_declarations_over_variables
    var newStateFunc = () => np.copyWith(identifier: null);
    if (identifier.endsWith('.edit')) {
      newStateFunc =
          () => np.copyWith(identifier: identifier.replaceAll('.edit', ''));
    }
    final changed = _tryChangeNavigationPath(newStateFunc,
        checkForUnsaved: checkForUnsaved);
    if (changed) {
      l.i('NavigationPath pop resulted to $state');
    } else {
      l.i('''Details panel exist but can't be pop because unsaved data exist''');
    }
    // try attempt handled
    return true;
  }

  void forceSetNewPath(NavigationPath np) {
    l.v('force set new NavigationPath [$np]. Data if not saved can be lost');
    _tryChangeNavigationPath(() => state = np, checkForUnsaved: false);
  }

  bool trySetNewPath(NavigationPath np) {
    return _tryChangeNavigationPath(() => np);
  }

  bool trySetNewRoot(String pathName) {
    return _tryChangeNavigationPath(() {
      return NavigationPath(pathName, null);
    });
  }
}
