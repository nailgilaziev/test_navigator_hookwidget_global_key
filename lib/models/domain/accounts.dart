import 'package:app_logs/app_logs.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/data/services/backend.dart';
import 'package:vmngr/data/versions_classes.dart';

final _l = AppLogger.forTag('AccountsProviders');

final accountsListFutureProvider = FutureProvider<List<AccountData>>((ref) {
  _l.v('* accountsListFutureProvider');
  final backend = ref.watch(backendProvider);
  return backend.getAll('accounts', (json) => AccountData.fromJson(json));
});

final accountFutureProvider =
    FutureProvider.family<AccountData?, int>((ref, id) async {
  final list = await ref.watch(accountsListFutureProvider.future);
  return list.firstWhereOrNull((e) => e.id == id);
});
