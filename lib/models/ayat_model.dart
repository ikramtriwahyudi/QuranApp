import 'package:json_annotation/json_annotation.dart';

part 'ayat_model.g.dart';

@JsonSerializable()
class AyatModel {
  AyatModel({
    required this.verseId,
    required this.ayahText,
    required this.indoText,
    required this.page,
    required this.juz,
    required this.readText,
    required this.audio,
  });

  final int verseId;
  final String ayahText;
  final String indoText;
  final int page;
  final int juz;
  final String readText;
  final String audio;
  static fromList(List<dynamic> json) {
    return json.map((data) => AyatModel.fromJson(data)).toList();
  }

  factory AyatModel.fromJson(Map<String, dynamic> json) =>
      _$AyatModelFromJson(json);

  Map<String, dynamic> toJson() => _$AyatModelToJson(this);
}
