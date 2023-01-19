import '../../domain/errors/errors.dart';

class DateOfBirth {
  final DateTime date;

  DateOfBirth({required this.date});

  factory DateOfBirth.fromJson({required Map<String, dynamic> json}) {
    if (!json.containsKey('date')) {
      throw UnexpectedError();
    }

    final date = DateTime.tryParse(json['date']);
    if (date == null) throw UnexpectedError();

    return DateOfBirth(date: date);
  }
}
