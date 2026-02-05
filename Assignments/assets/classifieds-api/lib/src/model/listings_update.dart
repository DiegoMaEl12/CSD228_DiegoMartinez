//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/listing_price.dart';
import 'package:classifieds_api/src/model/status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'listings_update.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsUpdate {
  /// Returns a new [ListingsUpdate] instance.
  ListingsUpdate({
    required this.id,

    this.price,

    this.status,

    this.title,

    this.description,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'price', required: false, includeIfNull: false)
  final ListingPrice? price;

  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final Status? status;

  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ListingsUpdate &&
            runtimeType == other.runtimeType &&
            equals(
              [id, price, status, title, description],
              [
                other.id,
                other.price,
                other.status,
                other.title,
                other.description,
              ],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode([id, price, status, title, description]);

  factory ListingsUpdate.fromJson(Map<String, dynamic> json) =>
      _$ListingsUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
