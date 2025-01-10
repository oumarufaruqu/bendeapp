import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/features/courses/domain/entities/topic.dart';
// ignore: unused_import
import 'package:bende/features/courses/domain/entities/flashcard.dart';
import 'package:bende/features/courses/presentation/bloc/flashcard_bloc.dart';

class FlashcardsPage extends StatefulWidget {
  final Topic topic;

  const FlashcardsPage({
    super.key,
    required this.topic,
  });

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  final CardSwiperController controller = CardSwiperController();
  bool showAnswer = false;

  @override
  void initState() {
    super.initState();
    context.read<FlashcardBloc>().add(LoadFlashcards(widget.topic.id));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic.name,
          style: AppTypography.h2,
        ),
      ),
      body: BlocBuilder<FlashcardBloc, FlashcardState>(
        builder: (context, state) {
          if (state is FlashcardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FlashcardError) {
            return Center(
              child: Text(
                state.message,
                style: AppTypography.bodyLarge,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is FlashcardsLoaded) {
            if (state.flashcards.isEmpty) {
              return Center(
                child: Text(
                  'No flashcards available',
                  style: AppTypography.bodyLarge,
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: CardSwiper(
                    controller: controller,
                    cardsCount: state.flashcards.length,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      setState(() => showAnswer = false);
                      if (direction == CardSwiperDirection.right) {
                        context.read<FlashcardBloc>().add(
                              UpdateFlashcardProgress(
                                flashcardId: state.flashcards[previousIndex].id,
                                isCorrect: true,
                              ),
                            );
                      }
                      return true;
                    },
                    onUndo: (previousIndex, currentIndex, direction) {
                      setState(() => showAnswer = false);
                      return true;
                    },
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    cardBuilder: (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                    ) {
                      final flashcard = state.flashcards[index];
                      return GestureDetector(
                        onTap: () => setState(() => showAnswer = !showAnswer),
                        child: Card(
                          elevation: 4,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: Center(
                              child: Text(
                                showAnswer
                                    ? flashcard.backContent
                                    : flashcard.frontContent,
                                style: AppTypography.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => controller.undo(),
                        icon: const Icon(Icons.undo),
                      ),
                      IconButton(
                        onPressed: () =>
                            setState(() => showAnswer = !showAnswer),
                        icon: Icon(showAnswer
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      IconButton(
                        onPressed: () =>
                            controller.swipe(CardSwiperDirection.right),
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
