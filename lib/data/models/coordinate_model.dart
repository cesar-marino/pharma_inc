class CoordinateModel {
  final String latitude;
  final String longitude;

  CoordinateModel({required this.latitude, required this.longitude});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
