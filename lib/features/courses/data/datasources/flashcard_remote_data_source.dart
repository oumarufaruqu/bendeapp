import 'package:supabase_flutter/supabase_flutter.dart';
// ignore: unused_import
import 'package:bende/core/config/supabase_config.dart';
import 'package:bende/core/error/exceptions.dart';
import 'package:bende/features/courses/data/models/flashcard_model.dart';

abstract class FlashcardRemoteDataSource {
  Future<List<FlashcardModel>> getFlashcardsForTopic(String topicId);
  Future<void> updateFlashcardProgress(String flashcardId, bool isCorrect);
}

class FlashcardRemoteDataSourceImpl implements FlashcardRemoteDataSource {
  final SupabaseClient supabase;

  FlashcardRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<FlashcardModel>> getFlashcardsForTopic(String topicId) async {
    try {
      final response =
          await supabase.from('flashcards').select().eq('topic_id', topicId);

      final List<dynamic> data = response;
      return data.map((json) => FlashcardModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw NetworkException('Failed to fetch flashcards: $e');
    }
  }

  @override
  Future<void> updateFlashcardProgress(
      String flashcardId, bool isCorrect) async {
    try {
      await supabase.from('flashcard_progress').upsert({
        'flashcard_id': flashcardId,
        'is_correct': isCorrect,
        'last_reviewed': DateTime.now().toIso8601String(),
      });
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw NetworkException('Failed to update progress: $e');
    }
  }
}
