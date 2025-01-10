import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';
import 'package:bende/core/widgets/accordion/bende_accordion_header.dart';
import 'package:bende/core/widgets/accordion/bende_accordion_item.dart';

class BendeAccordion extends StatefulWidget {
  final String title;
  final List<SubTopic> subTopics;
  final bool initiallyExpanded;
  final VoidCallback? onTap;
  final int topicNumber;

  const BendeAccordion({
    super.key,
    required this.title,
    required this.subTopics,
    this.initiallyExpanded = false,
    this.onTap,
    required this.topicNumber,
  });

  @override
  State<BendeAccordion> createState() => _BendeAccordionState();
}

class _BendeAccordionState extends State<BendeAccordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _iconTurns;
  bool _isExpanded = false;

  bool get _isAllCompleted {
    return widget.subTopics.every((subtopic) => subtopic.isCompleted);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
    _iconTurns = _controller.drive(
      Tween<double>(begin: 0.0, end: 0.5)
          .chain(CurveTween(curve: Curves.easeIn)),
    );
    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.gray.withValues(alpha: 0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BendeAccordionHeader(
            title: widget.title,
            topicNumber: widget.topicNumber,
            subTopicCount: widget.subTopics.length,
            isExpanded: _isExpanded,
            isAllCompleted: _isAllCompleted,
            iconTurns: _iconTurns,
            onTap: _handleTap,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.03),
              ),
              child: Column(
                children: widget.subTopics.map((subtopic) {
                  return BendeAccordionItem(subtopic: subtopic);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
