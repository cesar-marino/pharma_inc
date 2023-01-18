import '../../http/http.dart';
import '../../models/models.dart';
import '../../../domain/usecases/usecases.dart';

class RemoteLoadPatients implements LoadPatients {
  final GetRequest _request;

  RemoteLoadPatients({required GetRequest request}) : _request = request;

  @override
  Future<List<LoadPatientsResult>> load({
    required LoadPatientsParams params,
  }) async {
    final path = RemoteLoadPatientsParams.fromParams(params).toUrl();
    final List<Map<String, dynamic>> response = await _request.get(path: path);

    throw UnimplementedError();
  }
}

class RemoteLoadPatientsParams {
  final int limit;
  final int page;
  final String gender;
  final String nationality;

  RemoteLoadPatientsParams({
    required this.limit,
    required this.page,
    required this.gender,
    required this.nationality,
  });

  factory RemoteLoadPatientsParams.fromParams(LoadPatientsParams params) {
    return RemoteLoadPatientsParams(
      limit: params.limit,
      page: params.page,
      gender: params.gender,
      nationality: params.nationality,
    );
  }

  String toUrl() {
    return '';
  }
}

class RemoteLoadPatientsResult {
  final String id;
  final String picture;
  final String name;
  final String email;
  final String gender;
  final String birthDate;
  final String phone;
  final String nationality;
  final String address;

  RemoteLoadPatientsResult({
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

  factory RemoteLoadPatientsResult.fromModel(PatientModel model) {
    return RemoteLoadPatientsResult(
      id: model.identifier.value,
      picture: model.picture.thumbnail,
      name: model.name.toString(),
      email: model.email,
      gender: model.gender,
      birthDate: model.birthDate,
      phone: model.phone,
      nationality: model.nationality,
      address: model.location.toString(),
    );
  }

  LoadPatientsResult toDomain() {
    return LoadPatientsResult(
      id: id,
      picture: picture,
      name: name,
      email: email,
      gender: gender,
      birthDate: birthDate,
      phone: phone,
      nationality: nationality,
      address: address,
    );
  }
}
