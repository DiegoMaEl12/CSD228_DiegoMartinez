import 'dart:async';

import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:classifieds_client/src/models/requests/listings.dart';

import '../api/listings.dart';
import '../models/listing.dart';
import '../models/responses/listings.dart';

class ListingsClient extends ListingsApi {
  ListingsClient({required super.api});
  @override
  Future<BulkListingResponse> getAllListings() {
    return api.listingsGet().then((response) {
      if (response.statusCode != 200) {
        return BulkListingResponse.error(statusCode: response.statusCode!);
      }
      final data = response.data?.map(Listing.fromOAS).toList() ?? const [];

      return BulkListingResponse.ok(listings: data);
    });
  }

  @override
  Future<SingleListingResponse> getListing(SingleListingRequest request) {
    return api
        .listingsGet(
          listingsGetRequest: oas.ListingsGetRequest(listingId: request.id),
        )
        .then((response) {
          if (response.data == null) {
            throw SingleListingResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
          final listing = response.data?.firstOrNull;
          if (listing == null) {
            logger.fine('Failed to find listing: ${request.id}');
            return SingleListingResponse.notFound();
          }

          return SingleListingResponse.ok(listing: Listing.fromOAS(listing));
        });
  }

  @override
  Future<BulkListingResponse> getListings(BulkListingRequest request) {
    return api
        .listingsGet(
          listingsGetRequest: oas.ListingsGetRequest(
            listingIds: request.ids.toList(),
          ),
        )
        .then((response) {
          if (response.data == null) {
            logger.fine('Failed to find listings');
            return BulkListingResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          } else if (response.data!.isEmpty) {
            return BulkListingResponse.ok(listings: const {});
          }

          return BulkListingResponse.ok(
            listings: response.data!.map(Listing.fromOAS).toSet(),
          );
        });
  }

  @override
  Future<SingleListingResponse> createListing(CreateListingRequest request) {
    return api
        .listingsPost(
          listingsPostRequest: oas.ListingsPostRequest(
            description: request.description,
            title: request.title,
            price: oas.ListingPrice(original: request.price),
          ),
        )
        .then((response) {
          if (response.statusCode != 200) {
            throw SingleListingResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
          return SingleListingResponse.ok(
            listing: Listing.fromOAS(response.data!),
          );
        });
  }

  @override
  Future<void> deleteListing(SingleListingRequest request) {
    return api
        .listingsDelete(
          listingsDeleteRequest: oas.ListingsDeleteRequest(id: request.id),
        )
        .then((response) {
          if (response.statusCode != 200) {
            throw SingleListingResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
        });
  }

  @override
  Future<SingleListingResponse> updateListing(UpdateListingRequest request) {
    return api
        .listingsPatch(
          listingsUpdate: oas.ListingsUpdate(
            id: request.id,
            title: request.title,
            description: request.description,
            price: request.price != null
                ? oas.ListingPrice(original: request.price!)
                : null,
            status: request.status != null
                ? oas.Status.values.firstWhere(
                    (s) => s.value == request.status!.name,
                  )
                : null,
          ),
        )
        .then((response) {
          if (response.statusCode != 200) {
            throw SingleListingResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }

          return SingleListingResponse.ok(
            listing: Listing.fromOAS(response.data!),
          );
        });
  }
}
