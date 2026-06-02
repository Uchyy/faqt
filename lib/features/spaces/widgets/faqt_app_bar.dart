import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/spaces/dashboard_provider.dart';
import 'package:faqt/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqtAppBar extends StatefulWidget implements PreferredSizeWidget {
  final FaqtUser user;

  const FaqtAppBar({
    super.key,
    required this.user,
  });

  @override
  State<FaqtAppBar> createState() => _FaqtAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80); // fallback
}

class _FaqtAppBarState extends State<FaqtAppBar> {
  double getResponsiveHeight(BuildContext context) {
    final view = View.of(context);
    final width = view.physicalSize.width / view.devicePixelRatio;

    if (width < 400) return 65;   // small phones
    if (width < 600) return 75;   // normal phones
    return 90;                    // tablets / large screens
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);
    final selectedWorkspace = workspaceProvider.current;

    final height = getResponsiveHeight(context);
    final dropdownWidth = MediaQuery.sizeOf(context).width * 0.5;

    return SafeArea(
      bottom: false,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: context.padding(PaddingSize.small).horizontal,
          vertical: height * 0.18, // keeps content centered
        ),
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaqtIcon(),
            const SizedBox(width: 12),

            SizedBox(
              width: dropdownWidth,
              child: _SpaceDropdown(
                selected: selectedWorkspace,
                user: widget.user,
                onChanged: workspaceProvider.setActiveWorkspace,
              ),
            ),

            const Spacer(),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: context.fontSize(FontSize.extraLarge) * 1.2,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _SpaceDropdown extends StatelessWidget {
  final String selected;
  final FaqtUser user;
  final Function(String) onChanged;

  const _SpaceDropdown({
    required this.selected,
    required this.user,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final userWorkspaces = demoWorkspaces
        .where((w) => w.memberIds.contains(user.id))
        .toList();

    final currentValue = selected.isEmpty ? userWorkspaces.first.id : selected;

    return Container(
      padding: context.padding(PaddingSize.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          style: BorderStyle.solid,
          color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentValue,
          isExpanded: true,
          isDense: true,
          underline: const SizedBox(height: 3),
          iconDisabledColor: Theme.of(context).colorScheme.outline,
          iconEnabledColor: AppColors.brandGreen,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: context.fontSize(FontSize.normal),
          ),

          selectedItemBuilder: (context) {
            return userWorkspaces.map((workspace) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  workspace.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppColors.cardHeader.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: context.fontSize(FontSize.normal),
                  ),
                ),
              );
            }).toList();
          },

          items: [
            ...userWorkspaces.map((workspace) {
              final isSelected = workspace.id == currentValue;

              return DropdownMenuItem<String>(
                value: workspace.id,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        workspace.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppColors.cardHeader.copyWith(
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: context.fontSize(FontSize.normal),
                        ),
                      ),
                    ),

                    if (isSelected)
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(
                          Icons.check_circle,
                          color: AppColors.pastelMint,
                          size: context.fontSize(FontSize.normal),
                        ),
                      ),
                  ],
                ),
              );
            }),

            DropdownMenuItem<String>(
              value: "new",
              child: Row(
                children: [
                  
                  const SizedBox(width: 8),
                  Text(
                    "Add Space",
                    style: AppColors.buttonText.copyWith(
                      color: AppColors.pastelMint,
                      fontWeight: FontWeight.w600,
                      fontSize: context.fontSize(FontSize.normal),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.pastelMint,
                      size: context.fontSize(FontSize.normal),
                    ),
                  ),
                ],
              ),
            ),
          ],

          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ),
    );
  }
}