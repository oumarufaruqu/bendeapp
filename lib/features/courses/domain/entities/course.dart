import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String code;
  final String title;
  final String description;

  const Course({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, code, title, description];
}
