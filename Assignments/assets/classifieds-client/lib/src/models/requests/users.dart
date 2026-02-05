import 'dart:math' as math;

import 'package:classifieds_client/models.dart';
import 'package:classifieds_client/src/models/requests/base.dart';

class SingleUserRequest extends BaseRequest {
  final String id;
  const SingleUserRequest({required this.id});
}

class BulkUsersRequest extends BaseRequest {
  final Set<String> ids;
  const BulkUsersRequest._({ required super.limit, required this.ids});

  factory BulkUsersRequest({required Set<String> ids, int limit = 25}) {
    return BulkUsersRequest._(
      limit: limit,
      ids: ids.take(math.min(ids.length, limit)).toSet(),
    );
  }
}

class CreateUserRequest extends BaseRequest {
  final String username;
  final String email;
  final String? discordUsername;
  const CreateUserRequest({
    required this.username,
    required this.email,
    this.discordUsername,
});
}

class UpdateUserRequest extends BaseRequest {
  final String id;
  final String? username;
  final String? email;
  final String? discordUsername;

  const UpdateUserRequest({
    required this.id,
    this.username,
    this.email,
    this.discordUsername
  });
}