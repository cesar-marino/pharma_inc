import '../../domain/errors/errors.dart';

import 'models.dart';

class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final CoordinatesModel coordinates;
  final TimezoneModel timezone;

  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory LocationModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll([
      'street',
      'city',
      'state',
      'country',
      'postcode',
      'coordinates',
      'timezone'
    ])) {
      throw UnexpectedError();
    }

    return LocationModel(
      street: StreetModel.fromJson(json: json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: CoordinatesModel.fromJson(json: json['coordinates']),
      timezone: TimezoneModel.fromJson(json: json['timezone']),
    );
  }
}
