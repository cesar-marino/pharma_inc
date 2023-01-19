import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pharma_inc/data/models/models.dart';
import 'package:pharma_inc/domain/usecases/usecases.dart';

class RemoteLoadPatients {
  final GetRequest _request;

  RemoteLoadPatients({required GetRequest request}) : _request = request;

  Future<List<LoadPatientsResult>> load({
    required LoadPatientsParams params,
  }) async {
    final path = RemoteLoadPatientsParams.fromParams(params: params).toPath();
    final List<Map<String, dynamic>> response = await _request.get(path: path);
    final models = response.map((json) {
      return PatientModel.fromJson(json: json);
    }).toList();

    final results = models.map((model) {
      return RemoteLoadPatientsResult.fromModel(model: model);
    }).toList();

    return results.map((result) => result.toResult()).toList();
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

  factory RemoteLoadPatientsParams.fromParams({
    required LoadPatientsParams params,
  }) {
    return RemoteLoadPatientsParams(
      limit: params.limit,
      page: params.page,
      gender: params.gender,
      nationality: params.nationality,
    );
  }

  String toPath() {
    return 'results=$limit&page=$page&nat=$nationality&gender=$gender';
  }
}

class RemoteLoadPatientsResult {
  final String id;
  final String picture;
  final String name;
  final String email;
  final DateTime birthDate;
  final String phone;
  final String nationality;
  final String address;

  RemoteLoadPatientsResult({
    required this.id,
    required this.picture,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.phone,
    required this.nationality,
    required this.address,
  });

  factory RemoteLoadPatientsResult.fromModel({required PatientModel model}) {
    return RemoteLoadPatientsResult(
      id: model.identifier.value,
      picture: model.picture.thumbnail,
      name: model.name.toString(),
      email: model.email,
      birthDate: model.dateOfBirth.date,
      phone: model.phone,
      nationality: model.nationality,
      address: model.location.street.toString(),
    );
  }

  LoadPatientsResult toResult() {
    return LoadPatientsResult(
      id: id,
      picture: picture,
      name: name,
      email: email,
      birthDate: birthDate,
      phone: phone,
      nationality: nationality,
      address: address,
    );
  }
}

abstract class GetRequest {
  Future get({required String path});
}

class GetRequestSpy extends Mock implements GetRequest {}

void main() {
  late final RemoteLoadPatients sut;
  late final GetRequestSpy request;
  late final LoadPatientsParams params;
  late final String path;

  When mockGetCall() => when(() => request.get(path: any(named: 'path')));

  void mockGetAnswer(dynamic data) {
    mockGetCall().thenAnswer((_) async => data);
  }

  List<Map<String, dynamic>> makePatientsResponse() {
    return [
      {
        "gender": "female",
        "name": {"title": "Miss", "first": "Jennie", "last": "Nichols"},
        "location": {
          "street": {
            "number": 8929,
            "name": "Valwood Pkwy",
          },
          "city": "Billings",
          "state": "Michigan",
          "country": "United States",
          "postcode": "63104",
          "coordinates": {"latitude": "-69.8246", "longitude": "134.8719"},
          "timezone": {"offset": "+9:30", "description": "Adelaide, Darwin"}
        },
        "email": "jennie.nichols@example.com",
        "login": {
          "uuid": "7a0eed16-9430-4d68-901f-c0d4c1c3bf00",
          "username": "yellowpeacock117",
          "password": "addison",
          "salt": "sld1yGtd",
          "md5": "ab54ac4c0be9480ae8fa5e9e2a5196a3",
          "sha1": "edcf2ce613cbdea349133c52dc2f3b83168dc51b",
          "sha256":
              "48df5229235ada28389b91e60a935e4f9b73eb4bdb855ef9258a1751f10bdc5d"
        },
        "dob": {"date": "1992-03-08T15:13:16.688Z", "age": 30},
        "registered": {"date": "2007-07-09T05:51:59.390Z", "age": 14},
        "phone": "(272) 790-0888",
        "cell": "(489) 330-2385",
        "id": {"name": "SSN", "value": "405-88-3636"},
        "picture": {
          "large": "https://randomuser.me/api/portraits/men/75.jpg",
          "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
          "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
        },
        "nat": "US"
      }
    ];
  }

  setUpAll(() {
    request = GetRequestSpy();
    sut = RemoteLoadPatients(request: request);
    params = LoadPatientsParams(
      limit: 50,
      page: 1,
      gender: faker.randomGenerator.string(5, min: 5),
      nationality: faker.randomGenerator.string(10, min: 5),
    );

    path =
        'results=${params.limit}&page=${params.page}&nat=${params.nationality}&gender=${params.gender}';
  });

  setUp(() {
    final data = makePatientsResponse();
    mockGetAnswer(data);
  });

  test('Should call http request with correct values', () async {
    await sut.load(params: params);

    verify(() => request.get(path: path)).called(1);
  });

  test('Should return result if request resturns correct data', () async {
    final result = await sut.load(params: params);

    verify(() => request.get(path: path)).called(1);
    expect(result[0].id, "405-88-3636");
  });
}
