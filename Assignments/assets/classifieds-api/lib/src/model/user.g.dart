// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate('User', json, (
  $checkedConvert,
) {
  final val = User(
    id: $checkedConvert('id', (v) => v as String?),
    details: $checkedConvert(
      'details',
      (v) => v == null ? null : UserDetails.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': ?instance.id,
  'details': ?instance.details?.toJson(),
};
