import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/model/faqt_sheet.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final FaqtSheet sheet;

  const CardWidget({
    super.key,
    required this.sheet,
  });

  @override
  Widget build(BuildContext context) {
    final showDivider = sheet.links.isNotEmpty || sheet.images.isNotEmpty || sheet.phoneNumbers.isNotEmpty;
    return Container(
      decoration: BoxDecoration(
        color: sheet.category.color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: context.padding(PaddingSize.small),
      margin: context.padding(PaddingSize.small),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          Text(
            sheet.title,
            style: AppColors.header.copyWith(
              color: AppColors.brandBlack,
              fontSize: context.fontSize(FontSize.normal),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 10),
          _divider(),

          /// DESCRIPTION
          const SizedBox(height: 10),
          Text(
            sheet.description,
            style: AppColors.cardDescription.copyWith(
              color: AppColors.brandBlack,
              fontSize: context.fontSize(FontSize.small),
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 10),
          const Spacer(),
          if (showDivider) ... [ _divider()] ,

          /// ICONS ROW
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              if (sheet.links.isNotEmpty)
                Icon(Icons.link_outlined,
                  size: context.fontSize(FontSize.large),
                  color: Colors.black45,
                ),

              if (sheet.images.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.folder_copy_outlined,
                    size: context.fontSize(FontSize.large),
                    color: Colors.black45,
                  ),
                ),

              const Spacer(),
              if (sheet.phoneNumbers.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.call,
                    size: context.fontSize(FontSize.large),
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
}
