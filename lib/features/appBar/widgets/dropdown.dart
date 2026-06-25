
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/features/appBar/widgets/dropdown_item.dart';
import 'package:faqt/features/dashboard/dashboard_provider.dart';
import 'package:faqt/model/hub.dart';
import 'package:faqt/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqtDropdown extends StatelessWidget {
  final Hub? selected;
  final List<Hub> hubs;
  final FaqtUser user;
  final Function(Hub) onChanged;

  const FaqtDropdown({super.key, 
    required this.selected,
    required this.user,
    required this.hubs,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentValue = selected ?? hubs.first;
    final hubProvider = context.watch<HubProvider>();
    final h = MediaQuery.of(context).size.height;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<Hub>(
        valueListenable: ValueNotifier<Hub?>(currentValue),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          //height: MediaQuery.sizeOf(context).width * 0.08
          padding: context.padding(PaddingSize.small)
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
                  currentValue.name,
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
          ...hubs.map(  
            (hub) => DropdownItem(
              height:  h * 0.065,
              value: hub,
              child: WorkspaceDropdownItem(
                workspace: hub,
                selected: hub.id == currentValue.id,
              ),
              onTap: () =>   hubProvider.setActiveHub(hub),
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
                        "New / Join Space",
                        style: AppColors.buttonText.copyWith(
                          color:  Colors.white,
                          fontWeight: FontWeight .w800,
                          fontSize: context.fontSize(FontSize.large)
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