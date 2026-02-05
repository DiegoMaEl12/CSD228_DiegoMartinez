//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'lisitings_get_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LisitingsGetRequest {
  /// Returns a new [LisitingsGetRequest] instance.
  LisitingsGetRequest({this.listingId, this.listingIds});

  @JsonKey(name: r'listingId', required: false, includeIfNull: false)
  final String? listingId;

  @JsonKey(name: r'listingIds', required: false, includeIfNull: false)
  final List<String>? listingIds;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LisitingsGetRequest &&
            runtimeType == other.runtimeType &&
            equals(
              [listingId, listingIds],
              [other.listingId, other.listingIds],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([listingId, listingIds]);

  factory LisitingsGetRequest.fromJson(Map<String, dynamic> json) =>
      _$LisitingsGetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LisitingsGetRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
