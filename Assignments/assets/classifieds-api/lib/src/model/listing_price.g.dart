// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingPrice _$ListingPriceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingPrice', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['original']);
      final val = ListingPrice(
        original: $checkedConvert('original', (v) => v as num),
        current: $checkedConvert('current', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$ListingPriceToJson(ListingPrice instance) =>
    <String, dynamic>{
      'original': instance.original,
      'current': ?instance.current,
    };
