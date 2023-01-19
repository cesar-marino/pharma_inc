import '../../domain/errors/errors.dart';

class PictureModel {
  final String large;
  final String medium;
  final String thumbnail;

  PictureModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory PictureModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['large', 'medium', 'thumbnail'])) {
      throw UnexpectedError();
    }

    return PictureModel(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
