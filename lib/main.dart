import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bende/core/injection/injection.dart';
import 'package:bende/core/theme/app_theme.dart';
import 'package:bende/features/courses/presentation/bloc/course_bloc.dart';
import 'package:bende/features/courses/presentation/pages/courses_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const BendeApp());
}

class BendeApp extends StatelessWidget {
  const BendeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CourseBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Bende',
        theme: AppTheme.lightTheme,
        home: const CoursesPage(),
      ),
    );
  }
}
