import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bende/core/config/supabase_config.dart';
import 'package:bende/features/courses/data/datasources/course_remote_data_source.dart';
import 'package:bende/features/courses/data/repositories/course_repository_impl.dart';
import 'package:bende/features/courses/domain/repositories/course_repository.dart';
import 'package:bende/features/courses/presentation/bloc/course_bloc.dart';
import 'package:bende/features/courses/data/datasources/flashcard_remote_data_source.dart';
import 'package:bende/features/courses/data/repositories/flashcard_repository_impl.dart';
import 'package:bende/features/courses/domain/repositories/flashcard_repository.dart';
import 'package:bende/features/courses/presentation/bloc/flashcard_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Supabase
  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  final supabase = Supabase.instance.client;
  getIt.registerSingleton<SupabaseClient>(supabase);

  // Data Sources
  getIt.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(getIt()),
  );

  // BLoCs
  getIt.registerFactory(
    () => CourseBloc(repository: getIt()),
  );

  // Flashcard Dependencies
  getIt.registerLazySingleton<FlashcardRemoteDataSource>(
    () => FlashcardRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<FlashcardRepository>(
    () => FlashcardRepositoryImpl(getIt()),
  );

  getIt.registerFactory(
    () => FlashcardBloc(repository: getIt()),
  );
}
