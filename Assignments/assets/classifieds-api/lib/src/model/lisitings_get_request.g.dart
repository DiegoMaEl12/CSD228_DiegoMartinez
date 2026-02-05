// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lisitings_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LisitingsGetRequest _$LisitingsGetRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LisitingsGetRequest', json, ($checkedConvert) {
      final val = LisitingsGetRequest(
        listingId: $checkedConvert('listingId', (v) => v as String?),
        listingIds: $checkedConvert(
          'listingIds',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LisitingsGetRequestToJson(
  LisitingsGetRequest instance,
) => <String, dynamic>{
  'listingId': ?instance.listingId,
  'listingIds': ?instance.listingIds,
};
