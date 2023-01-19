import '../../domain/errors/errors.dart';

import 'models.dart';

class PatientModel {
  final IdentifierModel identifier;
  final String gender;
  final NameModel name;
  final LocationModel location;
  final String email;
  final DateOfBirth dateOfBirth;
  final RegisteredModel registered;
  final String phone;
  final String cell;
  final PictureModel picture;
  final String nationality;

  PatientModel({
    required this.identifier,
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.dateOfBirth,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nationality,
  });

  factory PatientModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll([
      'id',
      'gender',
      'name',
      'location',
      'email',
      'dob',
      'registered',
      'phone',
      'cell',
      'picture',
      'nat'
    ])) {
      throw UnexpectedError();
    }

    return PatientModel(
      identifier: IdentifierModel.fromJson(json: json['id']),
      gender: json['gender'],
      name: NameModel.fromJson(json: json['name']),
      location: LocationModel.fromJson(json: json['location']),
      email: json['email'],
      dateOfBirth: DateOfBirth.fromJson(json: json['dob']),
      registered: RegisteredModel.fromJson(json: json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      picture: PictureModel.fromJson(json: json['picture']),
      nationality: json['nat'],
    );
  }
}
