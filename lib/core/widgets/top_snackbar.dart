import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
}

class TopSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => _TopSnackBarWidget(
        message: message,
        background: AppColors.pastelPeach,
        borderColor: AppColors.pastelPeach.withOpacity(0.8),
        type: type,
      ),
    );

    overlay.insert(entry);

    Future.delayed(duration, () {
      entry.remove();
    });
  }
}

class _TopSnackBarWidget extends StatefulWidget {
  final String message;
  final Color background;
  final Color borderColor;
  final SnackBarType type;

  const _TopSnackBarWidget({
    required this.message,
    required this.background,
    required this.borderColor,
    required this.type,
  });

  @override
  State<_TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<_TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _slide = Tween(begin: const Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slide,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: context.padding(PaddingSize.medium),
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: widget.borderColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  switch (widget.type) {
                    SnackBarType.success => Icons.check_circle,
                    SnackBarType.error => Icons.error_outline,
                    SnackBarType.info => Icons.info_outline,
                  },
                  color: AppColors.textPrimary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.message,
                    style: AppColors.buttonText.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: context.fontSize(FontSize.normal),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
