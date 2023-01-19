import '../../domain/errors/errors.dart';

class RegisteredModel {
  final DateTime date;

  RegisteredModel({required this.date});

  factory RegisteredModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.containsKey('date')) {
      throw UnexpectedError();
    }

    final date = DateTime.tryParse(json['date']);
    if (date == null) throw UnexpectedError();

    return RegisteredModel(date: date);
  }
}
