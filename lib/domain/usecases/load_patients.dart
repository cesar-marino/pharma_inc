import '../helpers/helpers.dart';

abstract class LoadPatients {
  Future<List<LoadPatientsResult>> load({required LoadPatientsParams params});
}

class LoadPatientsParams extends SearchPagination {
  final String gender;
  final String nationality;

  LoadPatientsParams({
    required this.gender,
    required this.nationality,
    required super.limit,
    required super.page,
  });
}

class LoadPatientsResult {
  final String id;
  final String picture;
  final String name;
  final String email;
  final String gender;
  final String birthDate;
  final String phone;
  final String nationality;
  final String address;

  LoadPatientsResult({
    required this.id,
    required this.picture,
    required this.name,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.phone,
    required this.nationality,
    required this.address,
  });
}
