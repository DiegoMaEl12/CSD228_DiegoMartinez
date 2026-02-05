//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'users_delete_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsersDeleteRequest {
  /// Returns a new [UsersDeleteRequest] instance.
  UsersDeleteRequest({this.id});

  /// The id of a listing.
  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UsersDeleteRequest &&
            runtimeType == other.runtimeType &&
            equals([id], [other.id]);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode([id]);

  factory UsersDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersDeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsersDeleteRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
