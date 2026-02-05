//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'listings_get_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsGetRequest {
  /// Returns a new [ListingsGetRequest] instance.
  ListingsGetRequest({this.listingId, this.listingIds});

  /// The id of a listing.
  @JsonKey(name: r'listingId', required: false, includeIfNull: false)
  final String? listingId;

  /// A list of listing ids.
  @JsonKey(name: r'listingIds', required: false, includeIfNull: false)
  final List<String>? listingIds;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ListingsGetRequest &&
            runtimeType == other.runtimeType &&
            equals(
              [listingId, listingIds],
              [other.listingId, other.listingIds],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([listingId, listingIds]);

  factory ListingsGetRequest.fromJson(Map<String, dynamic> json) =>
      _$ListingsGetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsGetRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
