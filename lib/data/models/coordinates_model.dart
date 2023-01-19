import '../../domain/errors/errors.dart';

class CoordinatesModel {
  final double latitude;
  final double longitude;

  CoordinatesModel({required this.latitude, required this.longitude});

  factory CoordinatesModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['latitude', 'longitude'])) {
      throw UnexpectedError();
    }

    final latitude = double.tryParse(json['latitude']);
    final longitude = double.tryParse(json['longitude']);

    if (latitude == null || longitude == null) {
      throw UnexpectedError();
    }

    return CoordinatesModel(latitude: latitude, longitude: longitude);
  }
}
