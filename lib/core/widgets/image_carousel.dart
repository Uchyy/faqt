import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({
    super.key,
    required this.images,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,   
      children: [
        // FULLSCREEN CAROUSEL BACKGROUND
        PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          onPageChanged: (i) => setState(() => _index = i),
          itemBuilder: (_, i) {
            return AspectRatio(
              aspectRatio: 20 / 12,
              child:  Image.asset(
                widget.images[i],
                fit: BoxFit.fill,
              ),
            );
          },
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 40), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (i) {
              final active = i == _index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: active ? context.fontSize(FontSize.large) * 1.2 : context.fontSize(FontSize.large) * 0.8,
                height: active ? context.fontSize(FontSize.large) * 1.2 : context.fontSize(FontSize.large) * 0.8,
                decoration: BoxDecoration(
                  color: active ? AppColors.brandGreen : AppColors.brandGreen.withAlpha(100),
                  borderRadius: BorderRadius.circular(22),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
