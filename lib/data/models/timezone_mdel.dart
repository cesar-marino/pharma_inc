import '../../domain/errors/errors.dart';

class TimezoneModel {
  final String offset;
  final String description;

  TimezoneModel({required this.offset, required this.description});

  factory TimezoneModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['offset', 'description'])) {
      throw UnexpectedError();
    }

    return TimezoneModel(
      offset: json['offset'],
      description: json['description'],
    );
  }
}
