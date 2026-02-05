//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum Status {
  @JsonValue(r'pending')
  pending(r'pending'),
  @JsonValue(r'open')
  open(r'open'),
  @JsonValue(r'sold')
  sold(r'sold');

  const Status(this.value);

  final String value;

  @override
  String toString() => value;
}
