import 'package:app_logs/app_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vmngr/_utils/utils.dart';
import 'package:vmngr/data/versions_classes.dart';

final backendProvider = Provider<BackendService>((ref) {
  return BackendService();
});

class BackendService {
  String host = 'versions.mobile.geo4.pro';

  final l = AppLogger.forTag('BACKND');

  Future<List<AccountData>> getAll(String pathName,
      AccountData Function(Map<String, dynamic> json) deserialize) async {
    await Utils.delaySecs(2);
    return [
      AccountData(
        id: 1,
        username: 'username1',
        firstName: 'firstName1',
        lastName: 'lastName1',
        active: true,
        authorities: ['BASE'],
      ),
      AccountData(
        id: 2,
        username: 'username2',
        firstName: 'firstName2',
        lastName: 'lastName2',
        active: true,
        authorities: ['BASE'],
      ),
      AccountData(
        id: 3,
        username: 'username3',
        firstName: 'firstName3',
        lastName: 'lastName3',
        active: true,
        authorities: ['BASE'],
      ),
    ];
  }
}
