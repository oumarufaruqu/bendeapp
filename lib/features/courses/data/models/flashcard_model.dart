import 'package:bende/features/courses/domain/entities/flashcard.dart';

class FlashcardModel extends Flashcard {
  const FlashcardModel({
    required super.id,
    required super.topicId,
    required super.frontContent,
    required super.backContent,
    required super.createdAt,
  });

  factory FlashcardModel.fromJson(Map<String, dynamic> json) {
    return FlashcardModel(
      id: json['id'] as String,
      topicId: json['topic_id'] as String,
      frontContent: json['front_content'] as String,
      backContent: json['back_content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic_id': topicId,
      'front_content': frontContent,
      'back_content': backContent,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
