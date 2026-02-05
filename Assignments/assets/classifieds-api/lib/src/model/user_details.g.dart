// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'UserDetails',
  json,
  ($checkedConvert) {
    final val = UserDetails(
      username: $checkedConvert('username', (v) => v as String?),
      contact: $checkedConvert(
        'contact',
        (v) =>
            v == null ? null : ContactInfo.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'username': ?instance.username,
      'contact': ?instance.contact?.toJson(),
    };
