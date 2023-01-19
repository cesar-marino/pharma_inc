import '../../domain/errors/errors.dart';

class IdentifierModel {
  final String name;
  final String value;

  IdentifierModel({required this.name, required this.value});

  factory IdentifierModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['name', 'value'])) {
      throw UnexpectedError();
    }

    return IdentifierModel(name: json['name'], value: json['value']);
  }
}
