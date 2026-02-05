import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:mocktail/mocktail.dart';

class MockDefaultApi extends Mock implements oas.DefaultApi {}

class FakeUsersGetRequest extends Fake implements oas.UsersGetRequest {}
