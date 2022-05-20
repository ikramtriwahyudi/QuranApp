// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogTestModel _$BlogTestModelFromJson(Map<String, dynamic> json) =>
    BlogTestModel(
      id: json['id'] as int,
      status: json['status'] as String? ?? 'Published',
      sort: json['sort'] as int?,
      userCreated: json['user_created'] as String?,
      userUpdated: json['user_updated'] as String?,
      dateUpdated: json['date_updated'] == null
          ? null
          : DateTime.parse(json['date_updated'] as String),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BlogTestModelToJson(BlogTestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'sort': instance.sort,
      'user_created': instance.userCreated,
      'user_updated': instance.userUpdated,
      'date_updated': instance.dateUpdated?.toIso8601String(),
      'date_created': instance.dateCreated?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
    };
