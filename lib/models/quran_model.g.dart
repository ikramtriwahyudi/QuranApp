// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranModel _$QuranModelFromJson(Map<String, dynamic> json) => QuranModel(
      translationId: json['translationId'] as String,
      name: json['name'] as String,
      number: json['number'] as int,
      asma: json['asma'] as String,
      orderNumber: json['orderNumber'] as int,
    );

Map<String, dynamic> _$QuranModelToJson(QuranModel instance) =>
    <String, dynamic>{
      'translationId': instance.translationId,
      'name': instance.name,
      'number': instance.number,
      'asma': instance.asma,
      'orderNumber': instance.orderNumber,
    };
