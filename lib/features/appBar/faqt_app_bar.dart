import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/appBar/widgets/dropdown.dart';
import 'package:faqt/features/dashboard/dashboard_provider.dart';
import 'package:faqt/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqtAppBar extends StatefulWidget implements PreferredSizeWidget {
  final FaqtUser user;
  final GlobalKey<ScaffoldState>? scaffoldKey; 
  //final VoidCallback onMenuPressed;

  const FaqtAppBar({
    super.key,
    required this.user,
    required this.scaffoldKey, 
    //required  this.onMenuPressed,
  });

  @override
  State<FaqtAppBar> createState() => _FaqtAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(
    MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first).size.height * 0.15,
  ); // fallback
}

class _FaqtAppBarState extends State<FaqtAppBar> {
  @override
  Widget build(BuildContext context) {
    final hubProvider = context.watch<HubProvider>();
    final user = demoUsers.elementAt(0);

    final hub = hubProvider.currentHub;        
    final hubs = hubProvider.hubs;    
    final spaces = hubProvider.currentSpaces;  
    final activeSpaceId = hubProvider.activeSpaceId;     

    final height = MediaQuery.sizeOf(context).height * 0.15;
    final dropdownWidth = MediaQuery.sizeOf(context).width * 0.5;

    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
          ),
        ),
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: context.padding(PaddingSize.small).horizontal * 0.5,
          vertical: context.padding(PaddingSize.small).vertical * 0.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Row of dropdown and settings button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: dropdownWidth,
                  child: FaqtDropdown(
                    user: user,
                    selected: hub,   
                    hubs: hubs,            
                    onChanged: hubProvider.setActiveHub,
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
            const Spacer(),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding:  EdgeInsets.only(
                top: context.padding(PaddingSize.small).top,
                bottom: context.padding(PaddingSize.small).bottom,
                right: context.padding(PaddingSize.small).right
              ),
              child: Row(
                children: [
                  /// ALL FAQTS CHIP
                  _buildGlassChip(
                    "All",
                    isSelected: activeSpaceId == null,
                    onTap: () => hubProvider.setActiveSpace(null),
                  ),

                  /// SPACE CHIPS
                  ...spaces.map((space) {
                    return _buildGlassChip(
                      space.name,
                      isSelected: activeSpaceId == space.id,
                      onTap: () => hubProvider.setActiveSpace(space.id),
                    );
                  }),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

   Widget _buildGlassChip( String label, { required bool isSelected, required VoidCallback onTap, }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.brandGreen.withAlpha(80)       
                : (isDark  ? Colors.white.withOpacity(0.15) : Colors.black.withOpacity(0.06)),       // light mode glass

            borderRadius: BorderRadius.circular(24),

            border: Border.all(
              color: isSelected
                  ? (isDark
                      ? Colors.white.withOpacity(0.9)
                      : Colors.black.withOpacity(0.4))
                  : (isDark
                      ? Colors.white.withOpacity(0.3)
                      : Colors.black.withOpacity(0.15)),
            ),

            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.25)
                    : Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: Text(
            label,
            style: AppColors.cardHeader.copyWith(
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
