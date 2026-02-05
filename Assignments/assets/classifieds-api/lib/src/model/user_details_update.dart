//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_details_update.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserDetailsUpdate {
  /// Returns a new [UserDetailsUpdate] instance.
  UserDetailsUpdate({this.username, this.email, this.discordUsername});

  @JsonKey(name: r'username', required: false, includeIfNull: false)
  final String? username;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'discordUsername', required: false, includeIfNull: false)
  final String? discordUsername;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserDetailsUpdate &&
            runtimeType == other.runtimeType &&
            equals(
              [username, email, discordUsername],
              [other.username, other.email, other.discordUsername],
            );
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode([username, email, discordUsername]);

  factory UserDetailsUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
