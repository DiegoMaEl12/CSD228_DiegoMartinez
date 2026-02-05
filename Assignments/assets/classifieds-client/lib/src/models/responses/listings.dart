import 'package:classifieds_client/src/models/responses/base.dart';

import '../../../models.dart' show Listing;

class SingleListingResponse extends BaseResponse<Listing> {
  const SingleListingResponse._({
    required super.statusCode,
    super.error,
    super.data,
  });

  factory SingleListingResponse.ok({required Listing listing}) {
    return SingleListingResponse._(statusCode: 200, data: listing);
  }

  factory SingleListingResponse.notFound() {
    return SingleListingResponse.error(statusCode: 404, error: 'not found');
  }

  factory SingleListingResponse.error({
    required int statusCode,
    Object? error,
  }) {
    return SingleListingResponse._(
      statusCode: statusCode,
      error: error ?? 'An error occurred while requesting listing',
    );
  }
}

class BulkListingResponse extends BaseResponse<Iterable<Listing>> {
  const BulkListingResponse._({
    required super.statusCode,
    super.error,
    super.data,
  });

  factory BulkListingResponse.ok({required Iterable<Listing> listings}) {
    return BulkListingResponse._(statusCode: 200, data: listings);
  }

  factory BulkListingResponse.notFound() {
    return BulkListingResponse.error(statusCode: 404, error: 'not found');
  }

  factory BulkListingResponse.error({required int statusCode, Object? error}) {
    return BulkListingResponse._(
      statusCode: statusCode,
      error: error ?? 'An error occurred while requesting listings',
    );
  }
}
