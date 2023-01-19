abstract class LoadPatients {
  Future<List<LoadPatientsResult>> load({required LoadPatientsParams params});
}

class LoadPatientsParams {
  final int limit;
  final int page;
  final String gender;
  final String nationality;

  LoadPatientsParams({
    required this.limit,
    required this.page,
    required this.gender,
    required this.nationality,
  });
}

class LoadPatientsResult {
  final String id;
  final String picture;
  final String name;
  final String email;
  final DateTime birthDate;
  final String phone;
  final String nationality;
  final String address;

  LoadPatientsResult({
    required this.id,
    required this.picture,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.phone,
    required this.nationality,
    required this.address,
  });
}
