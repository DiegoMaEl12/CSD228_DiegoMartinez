//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'contact_info.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ContactInfo {
  /// Returns a new [ContactInfo] instance.
  ContactInfo({this.email, this.discord});

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'discord', required: false, includeIfNull: false)
  final String? discord;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ContactInfo &&
            runtimeType == other.runtimeType &&
            equals([email, discord], [other.email, other.discord]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ mapPropsToHashCode([email, discord]);

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
