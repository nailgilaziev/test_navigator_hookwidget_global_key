import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/data/versions_classes.dart';
import 'package:vmngr/models/app_models.dart';
import 'package:vmngr/models/domain/accounts.dart';
import 'package:vmngr/routing/navigation_path.dart';
import 'package:vmngr/ui/left_drawer.dart';
import 'package:vmngr/ui/pieces/error_details.dart';
import 'package:vmngr/ui/pieces/progress.dart';

class AccountsPage extends HookWidget {
  @override
  Widget itemWidget() => AccountItem();

  @override
  Widget build(BuildContext context) {
    final av = useProvider(accountsListFutureProvider);
    return Scaffold(
        drawer: LeftDrawer(),
        appBar: AppBar(),
        body: av.when(
            loading: () => Progress(),
            error: (error, stackTrace) => ErrorDetails(error, stackTrace),
            data: (List<AccountData> items) {
              return ListView(
                children: items
                    .map((e) => ProviderScope(
                        overrides: [_currentItem.overrideWithValue(e)],
                        child: AccountItem()))
                    .toList(),
              );
            }));
  }
}

final _currentItem = ScopedProvider<AccountData>(null);

class AccountItem extends HookWidget {
  final l = AppLogger.forTag('AccountItem');

  @override
  Widget build(BuildContext context) {
    final item = useProvider(_currentItem);
    final d = item;
    final selectedId = useProvider(selectedIdProvider);
    return ListTile(
      selected: d.id == selectedId,
      title: Text('${d.firstName} ${d.lastName}'),
      subtitle: Text(d.username),
      trailing: d.authorities.contains('USER_MANAGEMENT')
          ? const Icon(Icons.admin_panel_settings_outlined)
          : null,
      onTap: () {
        context.read(navigationPathSNProvider).trySelectId(d.id);
      },
    );
  }
}
