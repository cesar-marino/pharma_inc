import 'models.dart';

class PatientModel {
  final String gender;
  final NameModel name;
  final LocationModel location;
  final String email;
  final String birthDate;
  final String registered;
  final String phone;
  final String cell;
  final IdentifierModel identifier;
  final PictureModel picture;
  final String nationality;

  PatientModel({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.birthDate,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.identifier,
    required this.picture,
    required this.nationality,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      gender: json['gender'],
      name: NameModel.fromJson(json['name']),
      location: LocationModel.fromJson(json['location']),
      email: json['email'],
      birthDate: json['birthDate'],
      registered: json['registered'],
      phone: json['phone'],
      cell: json['cell'],
      identifier: IdentifierModel.fromJson(json['identifier']),
      picture: PictureModel.fromJson(json['picture']),
      nationality: json['nationality'],
    );
  }
}
