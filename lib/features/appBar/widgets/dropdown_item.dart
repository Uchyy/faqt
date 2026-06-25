import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/model/hub.dart';
import 'package:flutter/material.dart';

class WorkspaceDropdownItem extends StatelessWidget {
  final Hub workspace;
  final bool selected;

  const WorkspaceDropdownItem({super.key, 
    required this.workspace,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    

    return Container(
      padding: context.padding(PaddingSize.small),
      margin: EdgeInsets.symmetric(
        vertical: context.padding(PaddingSize.small).vertical * 0.2
      ),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.brandGreen.withAlpha(80)
            : Colors.transparent
      ),

      child: Row(
        children: [
          Icon(
            workspace.type == HubType.personal
                ? Icons.person_outline
                : workspace.type == HubType.business
                    ? Icons.business_outlined
                    : Icons.public,
            size: context.fontSize(FontSize.normal),
            color: colorScheme.primary,
          ),

          SizedBox(width: context.padding(PaddingSize.small).horizontal),

          Expanded(
            child: Text(
              workspace.name,
              overflow: TextOverflow.ellipsis,
              style: AppColors.cardHeader.copyWith(
                fontSize: context.fontSize(FontSize.normal),
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: colorScheme.primary
              ),
            ),
          ),

          if (selected)
            Icon(
              Icons.check_circle,
              size: context.fontSize(FontSize.normal),
              color: AppColors.pastelMint,
            ),
        ],
      ),
    );
  }
}
