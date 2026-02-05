//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/user_details.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'users_patch_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsersPatchRequest {
  /// Returns a new [UsersPatchRequest] instance.
  UsersPatchRequest({required this.id, required this.details});

  /// The id of a listing.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'details', required: true, includeIfNull: false)
  final UserDetails details;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UsersPatchRequest &&
            runtimeType == other.runtimeType &&
            equals([id, details], [other.id, other.details]);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode([id, details]);

  factory UsersPatchRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersPatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsersPatchRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
