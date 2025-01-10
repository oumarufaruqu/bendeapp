import 'package:bende/features/courses/domain/entities/topic.dart';

class TopicModel extends Topic {
  const TopicModel({
    required super.id,
    required super.name,
    required super.description,
    required super.subjectId,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      subjectId: json['subject_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'subject_id': subjectId,
    };
  }
}
