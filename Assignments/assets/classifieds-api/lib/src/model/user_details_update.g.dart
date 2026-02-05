// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsUpdate _$UserDetailsUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserDetailsUpdate', json, ($checkedConvert) {
      final val = UserDetailsUpdate(
        username: $checkedConvert('username', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        discordUsername: $checkedConvert(
          'discordUsername',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserDetailsUpdateToJson(UserDetailsUpdate instance) =>
    <String, dynamic>{
      'username': ?instance.username,
      'email': ?instance.email,
      'discordUsername': ?instance.discordUsername,
    };
