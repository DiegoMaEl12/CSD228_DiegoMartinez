// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsDeleteRequest _$ListingsDeleteRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListingsDeleteRequest', json, ($checkedConvert) {
  final val = ListingsDeleteRequest(
    id: $checkedConvert('id', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ListingsDeleteRequestToJson(
  ListingsDeleteRequest instance,
) => <String, dynamic>{'id': ?instance.id};
