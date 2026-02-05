import 'package:classifieds_api/src/model/classifieds_listing.dart';
import 'package:classifieds_api/src/model/contact_info.dart';
import 'package:classifieds_api/src/model/error.dart';
import 'package:classifieds_api/src/model/listing_price.dart';
import 'package:classifieds_api/src/model/listings_delete_request.dart';
import 'package:classifieds_api/src/model/listings_get_request.dart';
import 'package:classifieds_api/src/model/listings_post_request.dart';
import 'package:classifieds_api/src/model/listings_update.dart';
import 'package:classifieds_api/src/model/user.dart';
import 'package:classifieds_api/src/model/user_details.dart';
import 'package:classifieds_api/src/model/user_details_update.dart';
import 'package:classifieds_api/src/model/users_delete200_response.dart';
import 'package:classifieds_api/src/model/users_delete_request.dart';
import 'package:classifieds_api/src/model/users_get_request.dart';
import 'package:classifieds_api/src/model/users_patch_request.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(
  dynamic value,
  String targetType, {
  bool growable = true,
}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'ClassifiedsListing':
      return ClassifiedsListing.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ContactInfo':
      return ContactInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Error':
      return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ListingPrice':
      return ListingPrice.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ListingsDeleteRequest':
      return ListingsDeleteRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingsGetRequest':
      return ListingsGetRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingsPostRequest':
      return ListingsPostRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingsUpdate':
      return ListingsUpdate.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Status':
    case 'User':
      return User.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserDetails':
      return UserDetails.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserDetailsUpdate':
      return UserDetailsUpdate.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UsersDelete200Response':
      return UsersDelete200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UsersDeleteRequest':
      return UsersDeleteRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UsersGetRequest':
      return UsersGetRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UsersPatchRequest':
      return UsersPatchRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toList(growable: growable)
            as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toSet()
            as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map(
                (dynamic v) => deserialize<BaseType, BaseType>(
                  v,
                  targetType,
                  growable: growable,
                ),
              ),
            )
            as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
