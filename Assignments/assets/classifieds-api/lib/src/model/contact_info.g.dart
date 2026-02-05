// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ContactInfo', json, ($checkedConvert) {
      final val = ContactInfo(
        email: $checkedConvert('email', (v) => v as String?),
        discord: $checkedConvert('discord', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{'email': ?instance.email, 'discord': ?instance.discord};
