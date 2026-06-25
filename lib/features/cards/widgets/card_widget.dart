import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/model/faqt.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Faqt faqt;

  const CardWidget({
    super.key,
    required this.faqt,
  });

  @override
  Widget build(BuildContext context) {
    final showDivider = faqt.links.isNotEmpty || faqt.images.isNotEmpty || faqt.phoneNumbers.isNotEmpty;
    final width =  MediaQuery.sizeOf(context).width;
    final height =  MediaQuery.sizeOf(context).height;


    return Container(
      constraints: BoxConstraints(
        minWidth: width * 0.45,
        minHeight: height * 0.3
      ),
      decoration: BoxDecoration(
        color: faqt.category.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Darker tit;le color
          Container( 
            width: double.infinity,
            decoration: BoxDecoration(
              color: darken(faqt.category.color, 0.15),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            padding: context.padding(PaddingSize.small),
            child: Text(
              faqt.title,
              style: AppColors.cardHeader.copyWith(
                color: AppColors.brandBlack,
                fontSize: context.fontSize(FontSize.normal),
              ),
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// DESCRIPTION
          const SizedBox(height: 25),
          Text(
            faqt.description ?? "This space has no description",
            style: AppColors.cardDescription.copyWith(
              color: AppColors.brandBlack,
              fontSize: context.fontSize(FontSize.small),
            ),
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 10),
          const Spacer(),

          //if (showDivider) ... [ _divider()] ,
          /// ICONS ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              if (faqt.links.isNotEmpty)
                IconButton(
                  onPressed: () {

                  },
                  icon: _iconizer(Icon(Icons.link_outlined), context), 
                  iconSize: context.fontSize(FontSize.large),
                  color: Theme.of(context).colorScheme.primary
                ),

              if (faqt.images.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton (
                    onPressed: () {

                    },
                    icon: _iconizer(Icon(Icons.folder_copy_outlined), context), 
                    iconSize: context.fontSize(FontSize.large),
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),

              const Spacer(),
              if (faqt.phoneNumbers.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton (
                    onPressed: () {

                    },
                    icon: _iconizer(Icon(Icons.call), context),
                    iconSize: context.fontSize(FontSize.large),
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.black12,
    );
  }

  Color darken(Color color, [double amount = .2]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Widget _iconizer (Icon icon, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
        border: Border.all(
          color: AppColors.accentGrey,

        )
      ),
      padding: context.padding(PaddingSize.small),
      child: icon,
    );
  }

}
