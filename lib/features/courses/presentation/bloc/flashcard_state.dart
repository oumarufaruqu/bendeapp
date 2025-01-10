part of 'flashcard_bloc.dart';

abstract class FlashcardState extends Equatable {
  const FlashcardState();

  @override
  List<Object> get props => [];
}

class FlashcardInitial extends FlashcardState {}

class FlashcardLoading extends FlashcardState {}

class FlashcardsLoaded extends FlashcardState {
  final List<Flashcard> flashcards;

  const FlashcardsLoaded(this.flashcards);

  @override
  List<Object> get props => [flashcards];
}

class FlashcardError extends FlashcardState {
  final String message;

  const FlashcardError(this.message);

  @override
  List<Object> get props => [message];
}
