// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_delete200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersDelete200Response _$UsersDelete200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UsersDelete200Response', json, ($checkedConvert) {
  final val = UsersDelete200Response(
    id: $checkedConvert('id', (v) => v as String?),
    ids: $checkedConvert(
      'ids',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$UsersDelete200ResponseToJson(
  UsersDelete200Response instance,
) => <String, dynamic>{'id': ?instance.id, 'ids': ?instance.ids};
