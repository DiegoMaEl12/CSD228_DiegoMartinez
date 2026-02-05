// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsUpdate _$ListingsUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingsUpdate', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id']);
      final val = ListingsUpdate(
        id: $checkedConvert('id', (v) => v as String),
        price: $checkedConvert(
          'price',
          (v) => v == null
              ? null
              : ListingPrice.fromJson(v as Map<String, dynamic>),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$StatusEnumMap, v),
        ),
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ListingsUpdateToJson(ListingsUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': ?instance.price?.toJson(),
      'status': ?_$StatusEnumMap[instance.status],
      'title': ?instance.title,
      'description': ?instance.description,
    };

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.open: 'open',
  Status.sold: 'sold',
};
