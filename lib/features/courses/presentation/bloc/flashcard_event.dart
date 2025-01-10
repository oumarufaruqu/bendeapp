part of 'flashcard_bloc.dart';

abstract class FlashcardEvent extends Equatable {
  const FlashcardEvent();

  @override
  List<Object> get props => [];
}

class LoadFlashcards extends FlashcardEvent {
  final String topicId;

  const LoadFlashcards(this.topicId);

  @override
  List<Object> get props => [topicId];
}

class UpdateFlashcardProgress extends FlashcardEvent {
  final String flashcardId;
  final bool isCorrect;

  const UpdateFlashcardProgress({
    required this.flashcardId,
    required this.isCorrect,
  });

  @override
  List<Object> get props => [flashcardId, isCorrect];
}
