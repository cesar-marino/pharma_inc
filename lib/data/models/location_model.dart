import 'models.dart';

class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final CoordinateModel coordinate;
  final TimezoneModel timezone;

  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinate,
    required this.timezone,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: StreetModel.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinate: CoordinateModel.fromJson(json['coordinate']),
      timezone: TimezoneModel.fromJson(json['timezone']),
    );
  }

  @override
  String toString() {
    return 'super.toString()';
  }
}
