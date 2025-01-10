import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeFlashCard extends StatelessWidget {
  static const double _cardHeight = 600.0;
  static const double _imageHeight = 150.0;

  final String title;
  final String content;
  final String cardNumber;
  final String reference;
  final String? imageUrl;

  const BendeFlashCard({
    super.key,
    required this.title,
    required this.content,
    required this.cardNumber,
    required this.reference,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.md),
      height: _cardHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: AppColors.gray.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card Info Section
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.orange,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          cardNumber.padLeft(2, '0'),
                          style: AppTypography.h3.copyWith(
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.black.withValues(alpha: 0.1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        'REF: $reference',
                        style: AppTypography.labelSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Title Section
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    title.toUpperCase(),
                    style: AppTypography.h2.copyWith(
                      color: AppColors.black.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Content Section
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (imageUrl != null) ...[
                          Container(
                            height: _imageHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: AppColors.gray.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      color: AppColors.gray,
                                      size: 32,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                        Text(
                          content,
                          textAlign: TextAlign.justify,
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
