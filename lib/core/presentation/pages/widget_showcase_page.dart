import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_spacing.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';
import 'package:bende/core/widgets/app_bar/bende_app_bar.dart';
import 'package:bende/core/widgets/button/bende_button.dart';
import 'package:bende/core/widgets/card/bende_card.dart';
import 'package:bende/core/widgets/chip/bende_chip.dart';
import 'package:bende/core/widgets/dialog/bende_dialog.dart';
import 'package:bende/core/widgets/progress/bende_progress.dart';
import 'package:bende/core/widgets/snackbar/bende_snackbar.dart';
import 'package:bende/core/widgets/tooltip/bende_tooltip.dart';
import 'package:bende/core/widgets/input/bende_search_bar.dart';
import 'package:bende/core/widgets/bottom_sheet/bende_bottom_sheet.dart';
import 'package:bende/core/widgets/accordion/bende_accordion.dart';
import 'package:bende/core/widgets/accordion/bende_accordion_item.dart';
import 'package:bende/core/widgets/card/bende_lesson_card.dart';
import 'package:bende/core/widgets/card/bende_flash_card.dart';
import 'package:bende/core/widgets/navigation/bende_bottom_bar.dart';

class WidgetShowcasePage extends StatefulWidget {
  const WidgetShowcasePage({super.key});

  @override
  State<WidgetShowcasePage> createState() => _WidgetShowcasePageState();
}

class _WidgetShowcasePageState extends State<WidgetShowcasePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BendeAppBar(
        title: 'Widget Showcase',
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _buildSection(
            'Buttons',
            Column(
              children: [
                BendeButton(
                  text: 'Primary Button',
                  onPressed: () {},
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeButton(
                  text: 'Secondary Button',
                  variant: ButtonVariant.secondary,
                  onPressed: () {},
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeButton(
                  text: 'Black Button',
                  variant: ButtonVariant.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          _buildSection(
            'Cards',
            Column(
              children: [
                BendeCard(
                  title: 'Card with Title',
                  child: const Text('Card Content'),
                ),
                const SizedBox(height: AppSpacing.md),
                BendeCard(
                  hasBorder: false,
                  child: const Text('Card without Border'),
                ),
              ],
            ),
          ),
          _buildSection(
            'Chips',
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                const BendeChip(
                  label: 'Primary',
                  icon: Icons.check,
                ),
                BendeChip(
                  label: 'Secondary',
                  variant: ChipVariant.secondary,
                  icon: Icons.info,
                ),
                BendeChip(
                  label: 'Success',
                  variant: ChipVariant.success,
                  icon: Icons.check_circle,
                ),
                BendeChip(
                  label: 'Warning',
                  variant: ChipVariant.warning,
                  icon: Icons.warning,
                ),
                BendeChip(
                  label: 'Error',
                  variant: ChipVariant.error,
                  icon: Icons.error,
                ),
              ],
            ),
          ),
          _buildSection(
            'Progress',
            Column(
              children: const [
                BendeProgress(
                  value: 0.7,
                  label: 'With Label',
                ),
                SizedBox(height: AppSpacing.md),
                BendeProgress(
                  value: 0.3,
                ),
              ],
            ),
          ),
          _buildSection(
            'Search Bar',
            const BendeSearchBar(
              placeholder: 'Search something...',
            ),
          ),
          _buildSection(
            'Interactive Components',
            Column(
              children: [
                BendeButton(
                  text: 'Show Dialog',
                  onPressed: () => BendeDialog.show(
                    context: context,
                    title: 'Dialog Title',
                    message: 'This is a sample dialog message.',
                    confirmText: 'Confirm',
                    cancelText: 'Cancel',
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeButton(
                  text: 'Show Bottom Sheet',
                  onPressed: () => BendeBottomSheet.show(
                    context: context,
                    title: 'Bottom Sheet',
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: const Text('Bottom Sheet Content'),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeButton(
                  text: 'Show Snackbar',
                  onPressed: () => BendeSnackbar.show(
                    context: context,
                    message: 'This is a sample snackbar message',
                    type: SnackbarType.success,
                    actionLabel: 'Action',
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeTooltip(
                  message: 'This is a tooltip',
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withValues(alpha: 0.1),
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text('Hover me for tooltip'),
                  ),
                ),
              ],
            ),
          ),
          _buildSection(
            'Lesson Cards',
            Column(
              children: [
                BendeLessonCard(
                  title: 'Mathematics',
                  subtitle: 'Introduction to Calculus',
                  code: 'MATH101',
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),
                BendeLessonCard(
                  title: 'Physics',
                  subtitle: 'Quantum Mechanics',
                  code: 'PHY201',
                  dotColor: const Color(0xFF4CAF50),
                  onTap: () {},
                ),
              ],
            ),
          ),
          _buildSection(
            'Flash Cards',
            SizedBox(
              height: 400,
              child: BendeFlashCard(
                title: 'Sample Flash Card',
                content:
                    'This is a sample flash card content with detailed explanation.',
                cardNumber: '01',
                reference: 'REF123',
                imageUrl: 'https://picsum.photos/200',
              ),
            ),
          ),
          _buildSection(
            'Accordion',
            BendeAccordion(
              title: 'Sample Topic',
              topicNumber: 1,
              subTopics: [
                SubTopic(
                  title: 'Subtopic 1',
                  cardCount: 5,
                  isCompleted: true,
                ),
                SubTopic(
                  title: 'Subtopic 2',
                  cardCount: 3,
                ),
                SubTopic(
                  title: 'Subtopic 3',
                  cardCount: 7,
                ),
              ],
              onTap: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BendeBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTypography.h3.copyWith(
            color: AppColors.black.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        content,
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
