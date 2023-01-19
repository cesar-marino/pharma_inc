import '../../domain/errors/errors.dart';

class StreetModel {
  final int number;
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['number', 'name'])) {
      throw UnexpectedError();
    }

    return StreetModel(number: json['number'], name: json['name']);
  }
}
