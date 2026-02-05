import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

/// The core layer of an API endpoint.
///
/// Due to the way the [oas.DefaultApi] is generated it is under a single type.
/// While this may be desired to quickly iterate on a project, it is better long
/// term to abstract
abstract class ApiBase {
  @visibleForOverriding
  Logger get logger;
  @visibleForOverriding
  oas.DefaultApi get api;
}
