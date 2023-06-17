import 'package:json_annotation/json_annotation.dart';

part 'quran_model.g.dart';

@JsonSerializable()
class QuranModel {
  QuranModel({
    required this.translationId,
    required this.name,
    required this.number,
    required this.asma,
    required this.orderNumber,
  });

  final String translationId;
  final String name;
  final int number;
  final String asma;
  final int orderNumber;
  static fromList(List<dynamic> json) {
    return json.map((data) => QuranModel.fromJson(data)).toList();
  }

  factory QuranModel.fromJson(Map<String, dynamic> json) =>
      _$QuranModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranModelToJson(this);
}
