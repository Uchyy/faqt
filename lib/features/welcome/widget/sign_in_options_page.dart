import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/buttons/grey_button.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/top_snackbar.dart';
import 'package:flutter/material.dart';

class SignInOptionsPage extends StatefulWidget {
  final void Function(String email) onMagicLinkSent;
  const SignInOptionsPage({super.key, required this.onMagicLinkSent});

  @override
  State<SignInOptionsPage> createState() => _SignInOptionsPageState();
}

class _SignInOptionsPageState extends State<SignInOptionsPage> {

  @override
  Widget build(BuildContext context) {
    final emailAddressController = TextEditingController();
    final w = MediaQuery.sizeOf(context).width * 0.3;

    return SingleChildScrollView (
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        TextFormField(
            controller: emailAddressController,
            showCursor: true,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: AppColors.smallMuted.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: context.fontSize(FontSize.normal),
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: context.padding(PaddingSize.small).horizontal, vertical: context.padding(PaddingSize.small).vertical * 1.5),
              hintText: "Enter your email address",
              hintStyle: AppColors.cardDescription.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: context.fontSize(FontSize.normal),
                decoration: TextDecoration.none,
              ),

              // DEFAULT BORDER (when not focused)
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),

              // FOCUSED BORDER
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.pastelBlue,
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          PastelButton(
            padding: context.padding(PaddingSize.medium),
            label: "Send me a magic link",
            labelSize: context.fontSize(FontSize.large),
            fullWidth: true,
            onPressed: () {
                if (emailAddressController.text.isEmpty) {
                  TopSnackBar.show(context, message: "Please enter your email address", type: SnackBarType.info);
                  return;
                }

                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailAddressController.text)) {
                  TopSnackBar.show(context, message: "Please enter a valid email address", type: SnackBarType.error);
                  return;
                }

                widget.onMagicLinkSent( emailAddressController.text);
            },
          ),
          const SizedBox(height: 45),

          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: w,
                height: 1,
                color: Theme.of(context).colorScheme.primary,
              ),

              Text(
                "OR",
                style: AppColors.smallMuted.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: context.fontSize(FontSize.normal),
                  decoration: TextDecoration.none,
                ),
              ),

              Container(
                width: w,
                height: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 12,),

          GreyButton(
            labelText: "Continue with Google",
            icon: Icons.g_mobiledata,
            onPressed: () {  
            }
          ),
          const SizedBox(height: 12,),

          GreyButton(
            labelText: "Continue with Apple",
            icon: Icons.iso_outlined,
            onPressed: () {  
            }
          ),
        ],
      ),
    );
  }
}