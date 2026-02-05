// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersDeleteRequest _$UsersDeleteRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UsersDeleteRequest', json, ($checkedConvert) {
      final val = UsersDeleteRequest(
        id: $checkedConvert('id', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UsersDeleteRequestToJson(UsersDeleteRequest instance) =>
    <String, dynamic>{'id': ?instance.id};
