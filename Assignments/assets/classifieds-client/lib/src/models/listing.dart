import 'package:classifieds_api/classifieds_api.dart' as oas;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class Listing extends Equatable {
  /// The id of a listing.
  final String id;

  /// The listing's title.
  final String name;
  final DateTime created;
  final DateTime? lastModified;
  final ListingStatus? status;
  final ListingPrice? price;

  Listing._({
    required this.id,
    required this.name,
    required this.created,
    this.lastModified,
    this.status,
    this.price,
  });

  factory Listing({
    required String name,
    DateTime? created,
    DateTime? lastModified,
    ListingStatus? status,
    ListingPrice? price,
  }) {
    final c = created ?? DateTime.now();
    final lm = lastModified ?? created;
    return Listing._(
      id: Uuid().v8(),
      name: name,
      created: c,
      lastModified: lm,
      status: status ?? ListingStatus.open,
      price: price ?? ListingPrice(),
    );
  }

  @internal
  factory Listing.fromOAS(oas.ClassifiedsListing listing) {
    return Listing._(
      id: listing.id,
      name: listing.name,
      created: listing.created!,
      lastModified: listing.lastModified ?? listing.created!,
      status: ListingStatus.fromOAS(listing.status ?? oas.Status.open),
      price: ListingPrice.fromOAS(
        listing.price ?? oas.ListingPrice(original: 0),
      ),
    );
  }

  @override
  List<Object?> get props => [id, name, created, lastModified, status, price];

  @override
  bool get stringify => true;

  Listing copyWith({
    String? name,
    DateTime? created,
    DateTime? lastModified,
    ListingStatus? status,
    ListingPrice? price,
  }) {
    return Listing._(
      id: id,
      name: name ?? this.name,
      created: created ?? this.created,
      lastModified: lastModified ?? this.lastModified,
      status: status ?? this.status,
      price: price ?? this.price,
    );
  }
}

@immutable
class ListingPrice extends Equatable {
  final double price;
  ListingPrice({this.price = 0})
    : assert(price >= 0, 'the price cannot be negative');

  ListingPrice.fromOAS(oas.ListingPrice p)
    : this(price: (p.current ?? p.original).toDouble());

  @override
  List<Object?> get props => [price];

  @override
  bool? get stringify => true;

  ListingPrice copyWith({double? price}) {
    return ListingPrice(price: price ?? this.price);
  }
}

enum ListingStatus {
  pending,
  sold,
  open;

  static ListingStatus fromOAS(oas.Status status) {
    switch (status) {
      case oas.Status.open:
        return open;
      case oas.Status.pending:
        return pending;
      case oas.Status.sold:
        return sold;
    }
  }
}
