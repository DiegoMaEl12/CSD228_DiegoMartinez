//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'listings_delete_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsDeleteRequest {
  /// Returns a new [ListingsDeleteRequest] instance.
  ListingsDeleteRequest({this.id});

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ListingsDeleteRequest &&
            runtimeType == other.runtimeType &&
            equals([id], [other.id]);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode([id]);

  factory ListingsDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$ListingsDeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsDeleteRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
