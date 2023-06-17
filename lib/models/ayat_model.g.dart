// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyatModel _$AyatModelFromJson(Map<String, dynamic> json) => AyatModel(
      verseId: json['verseId'] as int,
      ayahText: json['ayahText'] as String,
      indoText: json['indoText'] as String,
      page: json['page'] as int,
      juz: json['juz'] as int,
      readText: json['readText'] as String,
    );

Map<String, dynamic> _$AyatModelToJson(AyatModel instance) => <String, dynamic>{
      'verseId': instance.verseId,
      'ayahText': instance.ayahText,
      'indoText': instance.indoText,
      'page': instance.page,
      'juz': instance.juz,
      'readText': instance.readText,
    };
