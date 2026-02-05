// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_patch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersPatchRequest _$UsersPatchRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UsersPatchRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'details']);
      final val = UsersPatchRequest(
        id: $checkedConvert('id', (v) => v as String),
        details: $checkedConvert(
          'details',
          (v) => UserDetails.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UsersPatchRequestToJson(UsersPatchRequest instance) =>
    <String, dynamic>{'id': instance.id, 'details': instance.details.toJson()};
