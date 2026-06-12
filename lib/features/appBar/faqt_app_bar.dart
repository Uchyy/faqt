import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/spaces/dashboard_provider.dart';
import 'package:faqt/features/appBar/widgets/dropdown_item.dart';
import 'package:faqt/model/user.dart';
import 'package:faqt/model/workspaces.dart';
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

    if (width < 400) return 75;   // small phones
    if (width < 600) return 90;   // normal phones
    return 120;                    // tablets / large screens
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);
    final selectedWorkspace = workspaceProvider.current == null ? demoWorkspaces.first : workspaceProvider.current!;

    final height = getResponsiveHeight(context);
    final dropdownWidth = MediaQuery.sizeOf(context).width * 0.5;

    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5
            )
          )
        ),
        height: height,
        
        padding: EdgeInsets.symmetric(
          horizontal: context.padding(PaddingSize.small).horizontal,
          vertical: height * 0.18, 
        ),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const FaqtIcon(),
            //const SizedBox(width: 12),

            SizedBox(
              width: dropdownWidth,
              child: _FaqtDropdown(
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

class _FaqtDropdown extends StatelessWidget {
  final Workspace? selected;
  final FaqtUser user;
  final Function(Workspace) onChanged;

  const _FaqtDropdown({
    required this.selected,
    required this.user,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final userWorkspaces = demoWorkspaces
        .where((w) => w.memberIds.contains(user.id))
        .toList();

    final currentValue = userWorkspaces.contains(selected) ? selected : userWorkspaces.first;
    final h = MediaQuery.of(context).size.height;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<Workspace>(
        valueListenable: ValueNotifier(currentValue),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: MediaQuery.sizeOf(context).width * 0.2
        ),
        customButton: Container(
          padding: context.padding(PaddingSize.small),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            color: Theme.of(context) .colorScheme.surfaceContainerHighest.withOpacity(.18),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  currentValue?.name ?? "Select Space",
                  overflow: TextOverflow.ellipsis,
                  style: AppColors.cardHeader.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: context.fontSize(FontSize.normal)
                  ),
                ),
              ),
              Icon(
                Icons.expand_more,
                size: context.fontSize(FontSize.normal),
              ),
            ],
          ),
        ),

        dropdownStyleData: DropdownStyleData(
          elevation: 2,
          padding: context.padding(PaddingSize.small) * 0.4,
          maxHeight: MediaQuery.sizeOf(context).height ,
          width:  MediaQuery.sizeOf(context).width * 0.6 ,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.symmetric(
              vertical: BorderSide(
                color: AppColors.accentGrey,
                style: BorderStyle.solid
              )
            )
            
          ),
          offset: const Offset(0, 0),
        ),

        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.zero,
        ),

        items: [
          ...userWorkspaces.map(
            (workspace) => DropdownItem(
              height:  h * 0.065,
              value: workspace,
              child: WorkspaceDropdownItem(
                workspace: workspace,
                selected: workspace.id == currentValue?.id,
              ),
            ),
          ),

          // ⭐ "Create New Space" item — no padding, no height
          DropdownItem(
            value: null,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(  context);
                debugPrint( "Create Space", );
              },

              child: Container(
                padding: context.padding(PaddingSize.small),
                decoration: BoxDecoration( 
                  gradient: LinearGradient(
                    colors: [
                      const Color.from(alpha: 1, red: 0.376, green: 0.663, blue: 0.682),
                      const Color.from(alpha: 0.7, red: 0.235, green: 0.616, blue: 0.424),
                    ],
                  ),
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons.add_card,
                      size: context.fontSize(FontSize.extraLarge) ,
                      color: AppColors.brandWhite,
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        "Create New Space",
                        style: AppColors.buttonText.copyWith(
                          color:  Colors.white,
                          fontWeight: FontWeight .w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],

        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
