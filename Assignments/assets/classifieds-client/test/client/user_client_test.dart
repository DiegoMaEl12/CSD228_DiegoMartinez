import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:classifieds_client/models.dart';
import 'package:classifieds_client/src/client/users.dart';
import 'package:classifieds_client/src/models/requests/users.dart';
import 'package:classifieds_client/src/models/responses/users.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../oas_mocks.dart';

void main() {
  final oasUser1 = oas.User(
    id: 'id',
    details: oas.UserDetails(
      username: 'u',
      contact: oas.ContactInfo(email: 'test@test.com'),
    ),
  );
  final user1 = User.fromOAS(oasUser1);

  final oasUser2 = oas.User(
    id: 'id1',
    details: oas.UserDetails(
      username: 'u1',
      contact: oas.ContactInfo(email: 'test1@test.com', discord: 'discord'),
    ),
  );
  final user2 = User.fromOAS(oasUser2);

  final oasUser3 = oas.User(
    id: 'id2',
    details: oas.UserDetails(
      username: 'u2',
      contact: oas.ContactInfo(email: 'test2@test.com'),
    ),
  );
  final user3 = User.fromOAS(oasUser3);

  late MockDefaultApi api;
  setUpAll(() {
    api = MockDefaultApi();
    registerFallbackValue(FakeUsersGetRequest());
  });
  tearDownAll(() => resetMocktailState());

  group('UserClient', () {
    late UsersClient client;
    setUpAll(() {
      client = UsersClient(api: api);
    });

    group('getUser', () {
      test('returns the found user', () {
        when(
          () => api.usersGet(usersGetRequest: any(named: 'usersGetRequest')),
        ).thenAnswer(
          (_) async =>
              Response(requestOptions: RequestOptions(), data: [oasUser1]),
        );

        client
            .getUser(SingleUserRequest(id: oasUser1.id!))
            .then(
              (user) => expect(
                user,
                isA<SingleUserResponse>().having(
                  (p) => p.data,
                  'a user is set',
                  isA<User>()
                      .having((p) => p.id, 'set id', oasUser1.id!)
                      .having(
                        (p) => p.details.username,
                        'set username',
                        oasUser1.details!.username!,
                      )
                      .having(
                        (p) => p.details.contactInfo.email,
                        'set email',
                        oasUser1.details!.contact!.email!,
                      ),
                ),
              ),
            );
      });
      test('throws an exception on null', () {
        when(
          () => api.usersGet(usersGetRequest: any(named: 'usersGetRequest')),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(), data: null),
        );

        expect(
          () => client.getUser(SingleUserRequest(id: oasUser1.id!)),
          throwsA(
            isA<SingleUserResponse>()
                .having(
                  (p) => p.error,
                  'uses correct messaging',
                  'user not found',
                )
                .having((p) => p.statusCode, 'uses expected error code', 404),
          ),
        );
      });
    });
    group('getUsers', () {
      group('returns', () {
        test('a single user', () {
          when(
            () => api.usersGet(
              usersGetRequest: any(
                named: 'usersGetRequest',
                that: isA<oas.UsersGetRequest>().having(
                  (p) => p.ids,
                  'expected list of ids',
                  ['id'],
                ),
              ),
            ),
          ).thenAnswer(
            (_) async =>
                Response(requestOptions: RequestOptions(), data: [oasUser1]),
          );

          client
              .getUsers(BulkUsersRequest(ids: {oasUser1.id!}))
              .then(
                (users) => expect(
                  users,
                  isA<BulkUserResponse>().having(
                    (p) => p.data,
                    'has populated data',
                    isA<Iterable<User>>()
                        .having((p) => p, 'has expected count', hasLength(1))
                        .having((p) => p.first, 'expected user', user1),
                  ),
                ),
              );
        });
        group('multiple users', () {
          test('all users', () {
            when(
              () => api.usersGet(
                usersGetRequest: any(
                  named: 'usersGetRequest',
                  that: isA<oas.UsersGetRequest>().having(
                    (p) => p.ids,
                    'expected list of ids',
                    ['id', 'id1', 'id2'],
                  ),
                ),
              ),
            ).thenAnswer(
              (_) async => Response(
                requestOptions: RequestOptions(),
                data: [oasUser1, oasUser2, oasUser3],
              ),
            );

            client
                .getUsers(
                  BulkUsersRequest(
                    ids: {oasUser1.id!, oasUser2.id!, oasUser3.id!},
                  ),
                )
                .then(
                  (users) => expect(
                    users,
                    isA<BulkUserResponse>().having(
                      (p) => p.data,
                      'has populated data',
                      isA<Iterable<User>>()
                          .having((p) => p, 'has expected count', hasLength(3))
                          .having(
                            (p) => p,
                            'expected user',
                            containsAllInOrder([user1, user2, user3]),
                          ),
                    ),
                  ),
                );
          });
          test('some users', () {
            when(
              () => api.usersGet(
                usersGetRequest: any(
                  named: 'usersGetRequest',
                  that: isA<oas.UsersGetRequest>().having(
                    (p) => p.ids,
                    'expected list of ids',
                    ['id', 'id1', 'id2'],
                  ),
                ),
              ),
            ).thenAnswer(
              (_) async => Response(
                requestOptions: RequestOptions(),
                data: [oasUser2, oasUser3],
              ),
            );
            client
                .getUsers(
                  BulkUsersRequest(
                    ids: {oasUser1.id!, oasUser2.id!, oasUser3.id!},
                  ),
                )
                .then(
                  (users) => expect(
                    users,
                    isA<BulkUserResponse>().having(
                      (p) => p.data,
                      'has populated data',
                      isA<Iterable<User>>()
                          .having((p) => p, 'has expected count', hasLength(2))
                          .having(
                            (p) => p,
                            'expected user',
                            containsAllInOrder([user2, user3]),
                          ),
                    ),
                  ),
                );
          });
        });
        test('empty set', () {
          when(
            () => api.usersGet(
              usersGetRequest: any(
                named: 'usersGetRequest',
                that: isA<oas.UsersGetRequest>().having(
                  (p) => p.ids,
                  'expected list of ids',
                  ['id'],
                ),
              ),
            ),
          ).thenAnswer(
            (_) async => Response(requestOptions: RequestOptions(), data: []),
          );

          client
              .getUsers(BulkUsersRequest(ids: {oasUser1.id!}))
              .then(
                (users) => expect(
                  users,
                  isA<BulkUserResponse>().having(
                    (p) => p.data,
                    'has populated data',
                    isA<Iterable<User>>().having(
                      (p) => p,
                      'is an empty set',
                      isEmpty,
                    ),
                  ),
                ),
              );
        });
      });
      test('throws an exception on null data', () {
        when(
          () => api.usersGet(
            usersGetRequest: any(
              named: 'usersGetRequest',
              that: isA<oas.UsersGetRequest>().having(
                (p) => p.ids,
                'expected list of ids',
                ['id'],
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: null,
            statusCode: 500,
            statusMessage: 'err',
          ),
        );

        expect(
          () => client.getUsers(BulkUsersRequest(ids: {oasUser1.id!})),
          throwsA(
            isA<BulkUserResponse>()
                .having((p) => p.error, 'has correct error message', "err")
                .having(
                  (p) => p.statusCode,
                  'has the expected status code',
                  500,
                ),
          ),
        );
      });
    });
    group('createUser', () {
      group('fails when', () {
        test('a username is already taken', () {
          when(
            () => api.usersPost(userDetails: any(named: 'userDetails')),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 409,
              statusMessage: 'username conflict',
            ),
          );

          expect(
            () => client.createUser(
              CreateUserRequest(email: 'test@test.com', username: 'batman'),
            ),
            throwsA(
              isA<SingleUserResponse>()
                  .having((p) => p.error, 'expected error', 'username conflict')
                  .having((p) => p.statusCode, 'error status code', 409),
            ),
          );
        });
        test('an email is already in use', () {
          when(
            () => api.usersPost(userDetails: any(named: 'userDetails')),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 409,
              statusMessage: 'email already in use',
            ),
          );

          expect(
            () => client.createUser(
              CreateUserRequest(email: 'test@test.com', username: 'batman'),
            ),
            throwsA(
              isA<SingleUserResponse>()
                  .having(
                    (p) => p.error,
                    'expected error',
                    'email already in use',
                  )
                  .having((p) => p.statusCode, 'error status code', 409),
            ),
          );
        });
        test('a discord username is already in use', () {
          when(
            () => api.usersPost(userDetails: any(named: 'userDetails')),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 409,
              statusMessage: 'discordUsername already in use',
            ),
          );

          expect(
            () => client.createUser(
              CreateUserRequest(
                email: 'test@test.com',
                username: 'batman',
                discordUsername: 'theRealBatMan',
              ),
            ),
            throwsA(
              isA<SingleUserResponse>()
                  .having(
                    (p) => p.error,
                    'expected error',
                    'discordUsername already in use',
                  )
                  .having((p) => p.statusCode, 'error status code', 409),
            ),
          );
        });
      });
      test('returns a new user instance', () {
        when(
          () => api.usersPost(userDetails: any(named: 'userDetails')),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: oasUser1,
          ),
        );

        client
            .createUser(
              CreateUserRequest(email: 'test@test.com', username: 'u'),
            )
            .then((resp) {
              expect(
                resp,
                isA<SingleUserResponse>().having(
                  (p) => p.data,
                  'the user',
                  user1,
                ),
              );
            });
      });
    });
    group('deleteUser', () {
      test('throws an error when a non-200 status code is returned', () {
        when(
          () => api.usersDelete(
            usersDeleteRequest: any(named: 'usersDeleteRequest'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusMessage: 'not found',
            statusCode: 404,
          ),
        );

        expect(
          () => client.deleteUser(SingleUserRequest(id: 'id')),
          throwsA(
            isA<SingleUserResponse>()
                .having((p) => p.error, 'error message', 'not found')
                .having((p) => p.statusCode, 'error status code', 404),
          ),
        );
      });
      test('completes successfully', () {
        when(
          () => api.usersDelete(
            usersDeleteRequest: any(named: 'usersDeleteRequest'),
          ),
        ).thenAnswer(
          (_) async =>
              Response(requestOptions: RequestOptions(), statusCode: 200),
        );

        expect(client.deleteUser(SingleUserRequest(id: 'id')), completes);
      });
    });
    group('updateUser', () {
      group('updates', () {
        test('username', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(
                named: 'usersPatchRequest',
                that: isA<oas.UsersPatchRequest>().having(
                  (p) => p.details.username,
                  'provides username',
                  'uName',
                ),
              ),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: oasUser2,
            ),
          );

          client
              .updateUser(UpdateUserRequest(id: 'id', username: 'uName'))
              .then((resp) {
                expect(
                  resp,
                  isA<SingleUserResponse>().having(
                    (p) => p.data,
                    'the updated user',
                    user2,
                  ),
                );
              });
        });
        test('email', () {});
        test('discordUsername', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(
                named: 'usersPatchRequest',
                that: isA<oas.UsersPatchRequest>().having(
                  (p) => p.details.contact!.discord,
                  'provides username',
                  'discord',
                ),
              ),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: oasUser2,
            ),
          );

          client
              .updateUser(
                UpdateUserRequest(id: 'id', discordUsername: 'discord'),
              )
              .then((resp) {
                expect(
                  resp,
                  isA<SingleUserResponse>().having(
                    (p) => p.data,
                    'the updated user',
                    user2,
                  ),
                );
              });
        });
        // This test ensures that we are passing multiple parameters as would be
        // expected.
        test('usernames', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(
                named: 'usersPatchRequest',
                that: isA<oas.UsersPatchRequest>()
                    .having(
                      (p) => p.details.contact!.discord,
                      'provides username',
                      'discord',
                    )
                    .having((p) => p.details.username, 'username', 'uName'),
              ),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: oasUser2,
            ),
          );

          client
              .updateUser(
                UpdateUserRequest(
                  id: 'id',
                  discordUsername: 'discord',
                  username: 'uName',
                ),
              )
              .then((resp) {
                expect(
                  resp,
                  isA<SingleUserResponse>().having(
                    (p) => p.data,
                    'the updated user',
                    user2,
                  ),
                );
              });
        });
      });
      group('fails when', () {
        test('discordUsername is set to empty', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(named: 'usersPatchRequest'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusMessage: 'discordUsername must not be empty when provided',
              statusCode: 400,
            ),
          );

          expect(
            () => client.updateUser(
              UpdateUserRequest(id: 'id', discordUsername: ''),
            ),
            throwsA(
              isA<SingleUserResponse>()
                  .having((p) => p.statusCode, 'error status code', 400)
                  .having(
                    (p) => p.error,
                    'error message',
                    'discordUsername must not be empty when provided',
                  ),
            ),
          );
        });
        test('username is set to empty', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(named: 'usersPatchRequest'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusMessage: 'username must not be empty when provided',
              statusCode: 400,
            ),
          );

          expect(
            () => client.updateUser(UpdateUserRequest(id: 'id', username: '')),
            throwsA(
              isA<SingleUserResponse>()
                  .having((p) => p.statusCode, 'error status code', 400)
                  .having(
                    (p) => p.error,
                    'error message',
                    'username must not be empty when provided',
                  ),
            ),
          );
        });
        test('email is not a valid email', () {
          when(
            () => api.usersPatch(
              usersPatchRequest: any(named: 'usersPatchRequest'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusMessage: 'email must be valid',
              statusCode: 400,
            ),
          );

          expect(
            () => client.updateUser(
              UpdateUserRequest(id: 'id', email: 'notAValidEmail'),
            ),
            throwsA(
              isA<SingleUserResponse>()
                  .having((p) => p.statusCode, 'error status code', 400)
                  .having(
                    (p) => p.error,
                    'error message',
                    'email must be valid',
                  ),
            ),
          );
        });
      });
    });
  });
}
