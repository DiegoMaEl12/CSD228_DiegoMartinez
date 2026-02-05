import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:classifieds_client/src/models/requests/listings.dart';
import 'package:logging/logging.dart';

import '../models/responses/listings.dart';
import 'base.dart';

abstract class ListingsApi extends ApiBase {
  @override
  final logger = Logger('ListingsApi');

  @override
  final oas.DefaultApi api;
  ListingsApi({required this.api});

  Future<SingleListingResponse> getListing(SingleListingRequest request);

  Future<BulkListingResponse> getListings(BulkListingRequest request);

  Future<BulkListingResponse> getAllListings();

  Future<void> deleteListing(SingleListingRequest request);
  Future<SingleListingResponse> createListing(CreateListingRequest request);

  Future<SingleListingResponse> updateListing(UpdateListingRequest request);
}
