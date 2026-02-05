//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/listing_price.dart';
import 'package:classifieds_api/src/model/status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'classifieds_listing.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClassifiedsListing {
  /// Returns a new [ClassifiedsListing] instance.
  ClassifiedsListing({
    required this.id,

    required this.name,

    this.description,

    this.created,

    this.lastModified,

    this.status,

    this.price,
  });

  /// The id of a listing.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// The listing's title.
  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  /// The date-time notation as defined by RFC 3339, section 5.6, for example, 2017-07-21T17:32:28Z
  @JsonKey(name: r'created', required: false, includeIfNull: false)
  final DateTime? created;

  /// The date-time notation as defined by RFC 3339, section 5.6, for example, 2017-07-21T17:32:28Z
  @JsonKey(name: r'last_modified', required: false, includeIfNull: false)
  final DateTime? lastModified;

  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final Status? status;

  @JsonKey(name: r'price', required: false, includeIfNull: false)
  final ListingPrice? price;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ClassifiedsListing &&
            runtimeType == other.runtimeType &&
            equals(
              [id, name, description, created, lastModified, status, price],
              [
                other.id,
                other.name,
                other.description,
                other.created,
                other.lastModified,
                other.status,
                other.price,
              ],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode([
        id,
        name,
        description,
        created,
        lastModified,
        status,
        price,
      ]);

  factory ClassifiedsListing.fromJson(Map<String, dynamic> json) =>
      _$ClassifiedsListingFromJson(json);

  Map<String, dynamic> toJson() => _$ClassifiedsListingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
