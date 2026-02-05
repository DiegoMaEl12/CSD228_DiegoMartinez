import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../api/api.dart';
import 'listings.dart';
import 'users.dart';

/// The public API used to interact with the Classifieds Service.
///
/// Lazily configures api's for interacting with the various supported endpoints.
class ClassifiedsClient {
  /// The underlying generated OpenAPI Specification client.
  late final oas.ClassifiedsApi _client;

  @visibleForTesting
  oas.ClassifiedsApi get client => _client;

  /// The core api used for interacting with `Listing`s.
  late final ListingsClient? _listingsApi;

  /// The core api used for interacting with `User`s.
  late final UsersClient? _usersApi;

  ClassifiedsClient({
    @visibleForTesting oas.ClassifiedsApi? client,
    String serverUrl = 'localhost:8888',
  }) {
    // Realistically there should be some middleware that intercepts the requests
    // that does authentication, injecting common headers etc to fulfill security
    // requirements.
    final dio = Dio(BaseOptions(baseUrl: serverUrl));
    _client = client ?? oas.ClassifiedsApi(dio: dio);
  }

  /// The public api for interacting with `Listing`s.
  ///
  /// A lazily initialized api client.
  ListingsApi get listingApi {
    if (_listingsApi == null) {
      _listingsApi = ListingsClient(api: _client.getDefaultApi());
    }
    return _listingsApi!;
  }

  /// The public api for the interacting with `User`s.
  ///
  /// A lazily initialized api client.
  UserApi get usersApi {
    if (_usersApi == null) {
      _usersApi = UsersClient(api: _client.getDefaultApi());
    }
    return _usersApi!;
  }
}
