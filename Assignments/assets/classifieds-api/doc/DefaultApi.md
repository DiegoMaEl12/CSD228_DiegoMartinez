# classifieds_api.api.DefaultApi

## Load the API package
```dart
import 'package:classifieds_api/api.dart';
```

All URIs are relative to *http://0.0.0.0:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listingsDelete**](DefaultApi.md#listingsdelete) | **DELETE** /listings/ | 
[**listingsGet**](DefaultApi.md#listingsget) | **GET** /listings/ | Fetches item with matching id.
[**listingsPatch**](DefaultApi.md#listingspatch) | **PATCH** /listings/ | 
[**listingsPost**](DefaultApi.md#listingspost) | **POST** /listings/ | 
[**usersDelete**](DefaultApi.md#usersdelete) | **DELETE** /users/ | Deletes a user
[**usersGet**](DefaultApi.md#usersget) | **GET** /users/ | Fetches a list of Users from within the system
[**usersPatch**](DefaultApi.md#userspatch) | **PATCH** /users/ | Updates the active user&#39;s account details. 
[**usersPost**](DefaultApi.md#userspost) | **POST** /users/ | Creates a user if not already present


# **listingsDelete**
> listingsDelete(listingsDeleteRequest)



Delete a listing

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final ListingsDeleteRequest listingsDeleteRequest = ; // ListingsDeleteRequest | 

try {
    api.listingsDelete(listingsDeleteRequest);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->listingsDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listingsDeleteRequest** | [**ListingsDeleteRequest**](ListingsDeleteRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listingsGet**
> List<ClassifiedsListing> listingsGet(listingsGetRequest)

Fetches item with matching id.

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final ListingsGetRequest listingsGetRequest = ; // ListingsGetRequest | 

try {
    final response = api.listingsGet(listingsGetRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->listingsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listingsGetRequest** | [**ListingsGetRequest**](ListingsGetRequest.md)|  | [optional] 

### Return type

[**List&lt;ClassifiedsListing&gt;**](ClassifiedsListing.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listingsPatch**
> ClassifiedsListing listingsPatch(listingsUpdate)



Listings Update endpoint

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final ListingsUpdate listingsUpdate = ; // ListingsUpdate | 

try {
    final response = api.listingsPatch(listingsUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->listingsPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listingsUpdate** | [**ListingsUpdate**](ListingsUpdate.md)|  | [optional] 

### Return type

[**ClassifiedsListing**](ClassifiedsListing.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listingsPost**
> ClassifiedsListing listingsPost(listingsPostRequest)



Creates a new listing

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final ListingsPostRequest listingsPostRequest = ; // ListingsPostRequest | 

try {
    final response = api.listingsPost(listingsPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->listingsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listingsPostRequest** | [**ListingsPostRequest**](ListingsPostRequest.md)|  | [optional] 

### Return type

[**ClassifiedsListing**](ClassifiedsListing.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersDelete**
> UsersDelete200Response usersDelete(usersDeleteRequest)

Deletes a user

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final UsersDeleteRequest usersDeleteRequest = ; // UsersDeleteRequest | 

try {
    final response = api.usersDelete(usersDeleteRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->usersDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **usersDeleteRequest** | [**UsersDeleteRequest**](UsersDeleteRequest.md)|  | [optional] 

### Return type

[**UsersDelete200Response**](UsersDelete200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersGet**
> List<User> usersGet(usersGetRequest)

Fetches a list of Users from within the system

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final UsersGetRequest usersGetRequest = ; // UsersGetRequest | 

try {
    final response = api.usersGet(usersGetRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->usersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **usersGetRequest** | [**UsersGetRequest**](UsersGetRequest.md)|  | [optional] 

### Return type

[**List&lt;User&gt;**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersPatch**
> User usersPatch(usersPatchRequest)

Updates the active user's account details. 

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final UsersPatchRequest usersPatchRequest = ; // UsersPatchRequest | 

try {
    final response = api.usersPatch(usersPatchRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->usersPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **usersPatchRequest** | [**UsersPatchRequest**](UsersPatchRequest.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersPost**
> User usersPost(userDetails)

Creates a user if not already present

### Example
```dart
import 'package:classifieds_api/api.dart';

final api = ClassifiedsApi().getDefaultApi();
final UserDetails userDetails = ; // UserDetails | 

try {
    final response = api.usersPost(userDetails);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->usersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDetails** | [**UserDetails**](UserDetails.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

