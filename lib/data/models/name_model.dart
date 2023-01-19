import '../../domain/errors/errors.dart';

class NameModel {
  final String title;
  final String first;
  final String last;

  NameModel({required this.title, required this.first, required this.last});

  factory NameModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['title', 'first', 'last'])) {
      throw UnexpectedError();
    }

    return NameModel(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}
