//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/listing_price.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'listings_post_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsPostRequest {
  /// Returns a new [ListingsPostRequest] instance.
  ListingsPostRequest({this.title, this.description, this.price});

  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @JsonKey(name: r'price', required: false, includeIfNull: false)
  final ListingPrice? price;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ListingsPostRequest &&
            runtimeType == other.runtimeType &&
            equals(
              [title, description, price],
              [other.title, other.description, other.price],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([title, description, price]);

  factory ListingsPostRequest.fromJson(Map<String, dynamic> json) =>
      _$ListingsPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsPostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
