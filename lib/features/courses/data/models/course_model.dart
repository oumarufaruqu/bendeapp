import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/data/models/topic_model.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.subjects,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      subjects: (json['subjects'] as List)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subjects': subjects.map((e) => (e as SubjectModel).toJson()).toList(),
    };
  }
}

class SubjectModel extends Subject {
  const SubjectModel({
    required super.id,
    required super.name,
    required super.topics,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      topics: (json['topics'] as List)
          .map((e) => TopicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'topics': topics.map((e) => (e as TopicModel).toJson()).toList(),
    };
  }
}
