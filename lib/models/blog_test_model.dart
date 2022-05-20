// import 'package:json_annotation/json_annotation.dart';

part 'blog_test_model.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
class BlogTestModel {
  BlogTestModel({
    required this.id,
    this.status = 'Published',
    this.sort,
    this.userCreated,
    this.userUpdated,
    this.dateUpdated,
    this.dateCreated,
    this.title,
    this.description,
  });

  final int id;
  final String status;
  final int? sort;
  final String? userCreated;
  final String? userUpdated;
  final DateTime? dateUpdated;
  final DateTime? dateCreated;
  final String? title;
  final String? description;

  static fromList(List<dynamic> json) {
    return json.map((data) => BlogTestModel.fromJson(data)).toList();
  }

  factory BlogTestModel.fromJson(Map<String, dynamic> json) =>
      _$BlogTestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogTestModelToJson(this);
}
