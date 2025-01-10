import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String id;
  final String name;
  final String description;
  final String subjectId;

  const Topic({
    required this.id,
    required this.name,
    required this.description,
    required this.subjectId,
  });

  @override
  List<Object?> get props => [id, name, description, subjectId];
}
