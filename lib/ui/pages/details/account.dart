import 'package:app_logs/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/data/versions_classes.dart';
import 'package:vmngr/models/app_models.dart';
import 'package:vmngr/models/domain/accounts.dart';
import 'package:vmngr/routing/navigation_path.dart';
import 'package:vmngr/ui/pages/details/no_selection.dart';
import 'package:vmngr/ui/pieces/error_details.dart';
import 'package:vmngr/ui/pieces/item_not_found.dart';
import 'package:vmngr/ui/pieces/progress.dart';

class AccountBrowsing extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final id = useProvider(selectedIdProvider);
    final item = useProvider(accountFutureProvider(id ?? -1));
    return item.when(
        loading: () => Progress(),
        error: (error, stackTrace) => ErrorDetails(error, stackTrace),
        data: (AccountData? item) {
          if (id == null) {
            return const NoSelectionPage();
          } else if (item != null) {
            /// browse
            return Column(
              children: [
                Text(item.username),
                Text(item.firstName),
                Text(item.lastName),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read(navigationPathSNProvider)
                          .trySelectId(id, forEditing: true);
                    },
                    child: Text('edit'))
              ],
            );
          } else {
            /// id specified but item not found
            return ItemNotFound(id);
          }
        });
  }
}

final _l = AppLogger.forType(AccountEditing);

class AccountEditing extends HookWidget {
  AccountEditing({Key? key}) : super(key: key) {
    _l.v('.constructor()');
  }

  @override
  Widget build(BuildContext context) {
    _l.v('.build()');
    final id = useProvider(selectedIdProvider);
    final item = useProvider(accountFutureProvider(id ?? -1));

    return item.when(
        loading: () => Progress(),
        error: (error, stackTrace) => ErrorDetails(error, stackTrace),
        data: (AccountData? item) {
          if (id == null) {
            /// creation mode
            return constrainedBody(null);
          } else if (item != null) {
            /// browse or editing specific item mode
            return constrainedBody(item);
          } else {
            /// id specified but item not found
            return ItemNotFound(id);
          }
        });
  }

  Widget constrainedBody(AccountData? data) {
    // final formKey =
    //     useMemoized(() => GlobalKey<FormState>(debugLabel: 'formkey'));
    final firstName = useTextEditingController(text: data?.firstName);
    final lastName = useTextEditingController(text: data?.lastName);
    return Form(
      // key: formKey,
      child: Column(
        children: <Widget>[
          Text(
            'id:${data?.username}',
          ),
          TextField(
            controller: firstName,
            decoration: const InputDecoration(
              labelText: 'firstName',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: lastName,
            decoration: const InputDecoration(
              labelText: 'lastName',
              border: OutlineInputBorder(),
            ),
          ),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
