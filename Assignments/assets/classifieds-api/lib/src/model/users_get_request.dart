//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'users_get_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsersGetRequest {
  /// Returns a new [UsersGetRequest] instance.
  UsersGetRequest({this.id, this.ids});

  /// The id of a listing.
  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  /// A list of listing ids.
  @JsonKey(name: r'ids', required: false, includeIfNull: false)
  final List<String>? ids;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UsersGetRequest &&
            runtimeType == other.runtimeType &&
            equals([id, ids], [other.id, other.ids]);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode([id, ids]);

  factory UsersGetRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersGetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsersGetRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
