//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/contact_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_details.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserDetails {
  /// Returns a new [UserDetails] instance.
  UserDetails({this.username, this.contact});

  @JsonKey(name: r'username', required: false, includeIfNull: false)
  final String? username;

  @JsonKey(name: r'contact', required: false, includeIfNull: false)
  final ContactInfo? contact;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserDetails &&
            runtimeType == other.runtimeType &&
            equals([username, contact], [other.username, other.contact]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([username, contact]);

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
