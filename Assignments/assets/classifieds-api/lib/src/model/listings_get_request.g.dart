// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsGetRequest _$ListingsGetRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingsGetRequest', json, ($checkedConvert) {
      final val = ListingsGetRequest(
        listingId: $checkedConvert('listingId', (v) => v as String?),
        listingIds: $checkedConvert(
          'listingIds',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingsGetRequestToJson(ListingsGetRequest instance) =>
    <String, dynamic>{
      'listingId': ?instance.listingId,
      'listingIds': ?instance.listingIds,
    };
