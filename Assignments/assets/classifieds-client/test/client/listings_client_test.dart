import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:classifieds_client/models.dart';
import 'package:classifieds_client/src/client/listings.dart';
import 'package:test/test.dart';

import '../oas_mocks.dart';

void main() {
  final now = DateTime.now();
  final oasListing1 = oas.ClassifiedsListing(
    id: 'id',
    name: 'title',
    description: 'description',
    created: now,
    price: oas.ListingPrice(original: 0),
  );
  final listing1 = Listing.fromOAS(oasListing1);

  final oasListing2 = oas.ClassifiedsListing(
    id: 'id2',
    name: 'awesome title',
    description: 'no description',
    created: now,
    price: oas.ListingPrice(original: 100),
    status: oas.Status.pending,
  );
  final listing2 = Listing.fromOAS(oasListing2);

  final oasListing3 = oas.ClassifiedsListing(
    id: 'id3',
    name: 'title',
    description: 'description',
    created: now,
    lastModified: now.add(const Duration(days: 5)),
    price: oas.ListingPrice(original: 30),
  );
  final listing3 = Listing.fromOAS(oasListing3);

  late MockDefaultApi api;

  group('ListingsClient', () {
    late ListingsClient client;

    group('getAllListings', () {
      test('returns an error on non-200', () {});
      test('returns listings', () {});
    });

    group('getListing', () {
      test('throws an error when data is null', () {});
      test('returns an error when not found', () {});
      test('returns a listing', () {});
    });

    group('getListings', () {
      test('returns an error when data is null', () {});
      test('returns an empty set when data is empty', () {});
      test('returns a list of listings', () {});
    });

    group('createListing', () {
      test('throws an error on non-200', () {});
      test('returns the fully qualified free listing', () {});
      test('returns the fully qualified listing', () {});
    });

    group('deleteListing', () {
      test('throws when the response is a non-200', () {});
      test('completes successfully', () {});
    });
    group('updateListing', () {
      test('throws an error on a non-200', () {});
      test('returns a fully qualified listing', () {});
      test('conditionally passes the listing price from the update', () {});
      test('conditionally passes the listing status from the update', () {});
    });
  });
}
