import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'versions_classes.freezed.dart';

part 'versions_classes.g.dart';

@freezed
class AccountData with _$AccountData {
  factory AccountData({
    required int id,
    required String username,
    required String firstName,
    required String lastName,
    required bool active,
    required List<String> authorities,
  }) = _AccountData;

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);
}
