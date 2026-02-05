// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsPostRequest _$ListingsPostRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingsPostRequest', json, ($checkedConvert) {
      final val = ListingsPostRequest(
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        price: $checkedConvert(
          'price',
          (v) => v == null
              ? null
              : ListingPrice.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingsPostRequestToJson(
  ListingsPostRequest instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'description': ?instance.description,
  'price': ?instance.price?.toJson(),
};
