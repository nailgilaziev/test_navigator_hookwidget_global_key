// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versions_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountData _$_$_AccountDataFromJson(Map<String, dynamic> json) {
  return _$_AccountData(
    id: json['id'] as int,
    username: json['username'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    active: json['active'] as bool,
    authorities:
        (json['authorities'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_AccountDataToJson(_$_AccountData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'active': instance.active,
      'authorities': instance.authorities,
    };
