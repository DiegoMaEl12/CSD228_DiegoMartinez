// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classifieds_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassifiedsListing _$ClassifiedsListingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClassifiedsListing', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = ClassifiedsListing(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        created: $checkedConvert(
          'created',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        lastModified: $checkedConvert(
          'last_modified',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$StatusEnumMap, v),
        ),
        price: $checkedConvert(
          'price',
          (v) => v == null
              ? null
              : ListingPrice.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'lastModified': 'last_modified'});

Map<String, dynamic> _$ClassifiedsListingToJson(ClassifiedsListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'created': ?instance.created?.toIso8601String(),
      'last_modified': ?instance.lastModified?.toIso8601String(),
      'status': ?_$StatusEnumMap[instance.status],
      'price': ?instance.price?.toJson(),
    };

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.open: 'open',
  Status.sold: 'sold',
};
