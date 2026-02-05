import 'dart:math' as math;

import 'package:classifieds_client/models.dart';
import 'package:classifieds_client/src/models/requests/base.dart';

class SingleListingRequest extends BaseRequest {
  final String id;
  const SingleListingRequest({required this.id});
}

class BulkListingRequest extends BaseRequest {
  final Set<String> ids;
  const BulkListingRequest._({required super.limit, required this.ids});

  /// Creates a [BulkListingRequest] using all [ids] upto [limit] (inclusive).
  factory BulkListingRequest({required Set<String> ids, int limit = 25}) {
    return BulkListingRequest._(
      limit: limit,
      ids: ids.take(math.min(ids.length, limit)).toSet(),
    );
  }
}

class CreateListingRequest extends BaseRequest {
  final String title;
  final String description;
  final double price;
  const CreateListingRequest({
    required this.title,
    required this.description,
    this.price = 0.0,
  });
}

class UpdateListingRequest extends BaseRequest {
  final String id;
  final String? title;
  final String? description;
  final double? price;
  final ListingStatus? status;

  const UpdateListingRequest({
    required this.id,
    this.title,
    this.description,
    this.price,
    this.status,
  });
}
