import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bende/features/courses/domain/entities/flashcard.dart';
import 'package:bende/features/courses/domain/repositories/flashcard_repository.dart';

part 'flashcard_event.dart';
part 'flashcard_state.dart';

class FlashcardBloc extends Bloc<FlashcardEvent, FlashcardState> {
  final FlashcardRepository repository;

  FlashcardBloc({required this.repository}) : super(FlashcardInitial()) {
    on<LoadFlashcards>(_onLoadFlashcards);
    on<UpdateFlashcardProgress>(_onUpdateProgress);
  }

  Future<void> _onLoadFlashcards(
    LoadFlashcards event,
    Emitter<FlashcardState> emit,
  ) async {
    emit(FlashcardLoading());

    final result = await repository.getFlashcardsForTopic(event.topicId);

    result.fold(
      (failure) => emit(FlashcardError(failure.message)),
      (flashcards) => emit(FlashcardsLoaded(flashcards)),
    );
  }

  Future<void> _onUpdateProgress(
    UpdateFlashcardProgress event,
    Emitter<FlashcardState> emit,
  ) async {
    // Implementation for progress tracking
  }
}
