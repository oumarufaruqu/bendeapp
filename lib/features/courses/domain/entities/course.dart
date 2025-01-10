import 'package:equatable/equatable.dart';
import 'topic.dart';

class Course extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<Subject> subjects;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.subjects,
  });

  @override
  List<Object?> get props => [id, title, description, subjects];
}

class Subject extends Equatable {
  final String id;
  final String name;
  final List<Topic> topics;

  const Subject({
    required this.id,
    required this.name,
    required this.topics,
  });

  @override
  List<Object?> get props => [id, name, topics];
}
