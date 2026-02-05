import 'dart:async';

import 'package:classifieds_api/classifieds_api.dart' as oas;

import 'package:classifieds_client/src/models/responses/users.dart';

import '../api/users.dart';
import '../models/requests/users.dart';
import '../models/user.dart';

final class UsersClient extends UserApi {
  UsersClient({required super.api});
  @override
  Future<BulkUserResponse> getAllUsers() {
    return api.usersGet().then((response) {
      if(response.statusCode != 200) {
        return BulkUserResponse.error(statusCode: response.statusCode!);
      }
      final data = response.data?.map(User.fromOAS).toList() ?? const [];
      return BulkUserResponse.ok(users: data);
    });
  }

  @override
  Future<SingleUserResponse> getUser(SingleUserRequest request) {
    return api
        .usersGet(
      usersGetRequest: oas.UsersGetRequest(id: request.id),
    )
        .then((response) {
          if (response.data == null) {
            throw SingleUserResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
          final user = response.data?.firstOrNull;
          if(user == null) {
            logger.fine('Failed to find user: ${request.id}');
            return SingleUserResponse.notFound();
          }

          return SingleUserResponse.ok(user: User.fromOAS(user));
    });
  }
  @override
  Future<BulkUserResponse> getUsers(BulkUsersRequest request) {
    return api
        .usersGet(
      usersGetRequest: oas.UsersGetRequest(
        ids: request.ids.toList(),
      ),
    )
        .then((response) {
          if (response.data == null) {
            logger.fine('Failed to find users');
            return BulkUserResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          } else if( response.data!.isEmpty) {
            return BulkUserResponse.ok(users: const {});
          }
          return BulkUserResponse.ok(
            users: response.data!.map(User.fromOAS).toSet(),
          );
    });
  }

  @override
  Future<SingleUserResponse> createUser(CreateUserRequest request) {
    return api
        .usersPost(
      userDetails: oas.UserDetails(
        username: request.username,
        contact: oas.ContactInfo(
            email: request.email,
            discord: request.discordUsername
        ),
      ),
    )
        .then((response) {
      if (response.statusCode != 200) {
        throw SingleUserResponse.error(
          statusCode: response.statusCode!,
          error: response.statusMessage,
        );
      }
      return SingleUserResponse.ok(
        user: User.fromOAS(response.data!),
      );
    });
  }

  @override
  Future<void> deleteUser(SingleUserRequest request){
    return api
        .usersDelete(
      usersDeleteRequest: oas.UsersDeleteRequest(id: request.id),
    )
        .then((response) {
          if(response.statusCode != 200) {
            throw SingleUserResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
    });
  }

  @override
  Future<SingleUserResponse> updateUser(UpdateUserRequest request){
    return api
        .usersPatch(
      usersPatchRequest: oas.UsersPatchRequest(
        id: request.id,
        details: oas.UserDetails(
          username: request.username,
          contact: (request.email != null || request.discordUsername != null)
            ? oas.ContactInfo(
            email: request.email,
            discord: request.discordUsername,
          )
              : null,
        ),
      ),
    )
        .then((response) {
          if(response.statusCode != 200) {
            throw SingleUserResponse.error(
              statusCode: response.statusCode!,
              error: response.statusMessage,
            );
          }
          return SingleUserResponse.ok(
            user: User.fromOAS(response.data!),
          );
    });
  }
}
