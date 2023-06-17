// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
      name: json['name'] as String,
      number: json['number'] as int,
      numberOfAyahs: json['numberOfAyahs'] as int,
      ayahs: (json['ayahs'] as List<dynamic>)
          .map((e) => AyatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'numberOfAyahs': instance.numberOfAyahs,
      'ayahs': instance.ayahs,
    };
