import 'package:classifieds_client/src/models/responses/base.dart';

import '../../../models.dart' show User;

class  SingleUserResponse extends BaseResponse<User> {
  const SingleUserResponse._({
    required super.statusCode,
    super.error,
    super.data
});
  factory SingleUserResponse.ok({ required User user}) {
    return SingleUserResponse._(statusCode: 200, data: user);
  }

  factory SingleUserResponse.notFound() {
    return SingleUserResponse.error(statusCode: 404, error: 'not found');
  }
  factory SingleUserResponse.error({
    required int statusCode,
    Object? error,
}) {
    return SingleUserResponse._(
      statusCode: statusCode,
      error: error ?? 'An error occurred while requesting user',
    );
  }
}

class BulkUserResponse extends BaseResponse<Iterable<User>> {
  const BulkUserResponse._({
    required super.statusCode,
    super.error,
    super.data
});
  factory BulkUserResponse.ok({required Iterable<User> users}) {
    return BulkUserResponse._(statusCode: 200, data: users);
  }
  factory BulkUserResponse.notFound() {
    return BulkUserResponse.error(statusCode: 404, error: 'not found');
  }
  factory BulkUserResponse.error({required int statusCode, Object? error}) {
    return BulkUserResponse._(
      statusCode: statusCode,
      error: error ?? 'An error occurred while requesting listings',
    );
  }
}