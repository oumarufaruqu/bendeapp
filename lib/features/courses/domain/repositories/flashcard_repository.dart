import 'package:dartz/dartz.dart';
import 'package:bende/core/error/failures.dart';
import 'package:bende/features/courses/domain/entities/flashcard.dart';

abstract class FlashcardRepository {
  Future<Either<Failure, List<Flashcard>>> getFlashcardsForTopic(
      String topicId);
  Future<Either<Failure, void>> updateFlashcardProgress(
      String flashcardId, bool isCorrect);
}
