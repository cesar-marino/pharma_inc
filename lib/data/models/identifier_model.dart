class IdentifierModel {
  final String name;
  final String value;

  IdentifierModel({required this.name, required this.value});

  factory IdentifierModel.fromJson(Map<String, dynamic> json) {
    return IdentifierModel(name: json['name'], value: json['value']);
  }
}
