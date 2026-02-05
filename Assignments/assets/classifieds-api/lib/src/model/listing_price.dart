//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'listing_price.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingPrice {
  /// Returns a new [ListingPrice] instance.
  ListingPrice({required this.original, this.current});

  /// The originally posted price.
  // minimum: 0
  @JsonKey(name: r'original', required: true, includeIfNull: false)
  final num original;

  /// The latest price of the listing, if there has been a update to the listing.
  // minimum: 0
  @JsonKey(name: r'current', required: false, includeIfNull: false)
  final num? current;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ListingPrice &&
            runtimeType == other.runtimeType &&
            equals([original, current], [other.original, other.current]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([original, current]);

  factory ListingPrice.fromJson(Map<String, dynamic> json) =>
      _$ListingPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ListingPriceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
