import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// The information needed to contact the [User].
@immutable
class ContactInfo extends Equatable {
  ContactInfo._({required this.email, this.discord = null});

  final String email;
  final String? discord;

  ContactInfo({required String email, String? discord})
    : this._(discord: discord, email: email);

  factory ContactInfo.fromOAS(oas.ContactInfo info) =>
      ContactInfo(email: info.email!, discord: info.discord);

  @override
  List<Object?> get props => [email];

  @override
  bool get stringify => true;

  ContactInfo copyWith({String? email, String? discord}) {
    assert(
      email == null || email.isNotEmpty,
      'when providing an `email`, it should not be empty.',
    );
    return ContactInfo(email: email ?? this.email, discord: discord);
  }
}

/// The details about a [User].
@immutable
class UserDetails extends Equatable {
  UserDetails._({required this.username, required this.contactInfo});

  final String username;
  final ContactInfo contactInfo;

  UserDetails({required String username, required ContactInfo contactInfo})
    : this._(username: username, contactInfo: contactInfo);

  factory UserDetails.fromOAS(oas.UserDetails user) => UserDetails(
    username: user.username!,
    contactInfo: ContactInfo.fromOAS(user.contact!),
  );

  @override
  List<Object?> get props => [username, contactInfo];

  @override
  bool get stringify => true;

  UserDetails copyWith({String? username, ContactInfo? contactInfo}) {
    return UserDetails(
      username: username ?? this.username,
      contactInfo: contactInfo ?? this.contactInfo,
    );
  }
}

/// A system user that can wish to list or interact with listings.
@immutable
class User extends Equatable {
  User._({required this.details, required this.id});

  final UserDetails details;
  final String id;

  User({required String id, required UserDetails details})
    : this._(id: id, details: details);

  factory User.fromOAS(oas.User user) =>
      User(id: user.id!, details: UserDetails.fromOAS(user.details!));

  @override
  List<Object?> get props => [id, details];

  @override
  bool get stringify => true;

  User copyWith({UserDetails? details}) =>
      User(details: details ?? this.details, id: id);
}
