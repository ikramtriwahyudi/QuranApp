import 'package:json_annotation/json_annotation.dart';
import 'package:ikram_task_project/models/ayat_model.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel {
  SurahModel({
    required this.name,
    required this.number,
    required this.numberOfAyahs,
    required this.ayahs,
  });

  final String name;
  final int number;
  final int numberOfAyahs;
  final List<AyatModel> ayahs;
  static fromList(List<dynamic> json) {
    return json.map((data) => SurahModel.fromJson(data)).toList();
  }

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}
