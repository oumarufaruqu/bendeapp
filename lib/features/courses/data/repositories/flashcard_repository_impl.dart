import 'package:dartz/dartz.dart';
import 'package:bende/core/error/failures.dart';
import 'package:bende/core/error/exceptions.dart';
import 'package:bende/features/courses/data/datasources/flashcard_remote_data_source.dart';
import 'package:bende/features/courses/domain/entities/flashcard.dart';
import 'package:bende/features/courses/domain/repositories/flashcard_repository.dart';

class FlashcardRepositoryImpl implements FlashcardRepository {
  final FlashcardRemoteDataSource remoteDataSource;

  FlashcardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Flashcard>>> getFlashcardsForTopic(
      String topicId) async {
    try {
      final flashcards = await remoteDataSource.getFlashcardsForTopic(topicId);
      return Right(flashcards);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateFlashcardProgress(
      String flashcardId, bool isCorrect) async {
    try {
      await remoteDataSource.updateFlashcardProgress(flashcardId, isCorrect);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}
