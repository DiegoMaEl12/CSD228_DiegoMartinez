// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersGetRequest _$UsersGetRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UsersGetRequest', json, ($checkedConvert) {
      final val = UsersGetRequest(
        id: $checkedConvert('id', (v) => v as String?),
        ids: $checkedConvert(
          'ids',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UsersGetRequestToJson(UsersGetRequest instance) =>
    <String, dynamic>{'id': ?instance.id, 'ids': ?instance.ids};
