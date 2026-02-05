// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Error', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'message']);
      final val = Error(
        code: $checkedConvert('code', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
};
