import 'option.dart';

class Test {
  final String id;
  final String title;
  final String subjectId;
  final List<Question> questions;
  final Duration timeLimit;

  Test({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.questions,
    required this.timeLimit,
  });
}

class Question {
  final String id;
  final String text;
  final List<Option> options;
  final String correctOptionId;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionId,
  });
}
