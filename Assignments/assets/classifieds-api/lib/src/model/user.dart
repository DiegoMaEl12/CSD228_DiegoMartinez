//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:classifieds_api/src/model/user_details.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class User {
  /// Returns a new [User] instance.
  User({this.id, this.details});

  /// The id of a listing.
  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'details', required: false, includeIfNull: false)
  final UserDetails? details;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is User &&
            runtimeType == other.runtimeType &&
            equals([id, details], [other.id, other.details]);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ mapPropsToHashCode([id, details]);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
