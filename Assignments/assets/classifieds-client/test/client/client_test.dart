import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:classifieds_client/client.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  group('ClassifiedsClient', () {
    group('configures', () {
      late ClassifiedsClient client;
      setUp(() {
        client = ClassifiedsClient();
      });

      test('default client', () => expect(client.client, isNotNull));
      test(
        'default serverUrl',
        () => expect(client.client.dio.options.baseUrl, 'localhost:8888'),
      );

      test('a custom client', () {
        final client = oas.ClassifiedsApi(
          dio: Dio(BaseOptions(baseUrl: 'notLocalhost')),
        );

        expect(
          identical(ClassifiedsClient(client: client).client, client),
          isTrue,
        );
      });
      test('a custom baseUrl', () {
        expect(
          identical(
            ClassifiedsClient(
              serverUrl: 'notLocalhost',
            ).client.dio.options.baseUrl,
            isNot('localhost:8888'),
          ),
          isTrue,
        );
      });
    });
    group('provides access to a(n)', () {
      late ClassifiedsClient client;
      setUp(() {
        client = ClassifiedsClient();
      });

      test('ListingsApi', () => expect(client.listingApi, isNotNull));
      test('ListingsApi reuses instance', () {
        final initial = client.listingApi;
        expect(identical(initial, client.listingApi), isTrue);
      });

      test('UsersApi', () => expect(client.usersApi, isNotNull));
      test('UsersApi reuses instance', () {
        final initial = client.usersApi;
        expect(identical(initial, client.usersApi), isTrue);
      });
    });
  });
}
