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
  final emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView (
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        TextFormField(
            controller: emailAddressController,
            showCursor: true,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: AppColors.smallMuted.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: context.fontSize(FontSize.large),
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              hintText: "Enter your email address",
              hintStyle: AppColors.cardDescription.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: context.fontSize(FontSize.large),
                decoration: TextDecoration.none,
              ),

              // DEFAULT BORDER (when not focused)
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.brandGreen,
                  width: 1.5,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.brandGreen.withAlpha(50),
                  width: 2,
                ),
              ),

              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.padding(PaddingSize.small).vertical,
                  horizontal: context.padding(PaddingSize.small).horizontal,
                ),
                child: Icon(
                  Icons.email_outlined,
                  size: context.fontSize(FontSize.large) * 1.8, // normal size
                  color: AppColors.brandGreen,
                ),
              ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
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
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "OR",
                  style: AppColors.smallMuted.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: context.fontSize(FontSize.normal),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12,),

          GreyButton(
            labelText: "Sign in with Google",
            svgPath: "assets/svg/icons8-google.svg",
            onPressed: () {},
          ),

          const SizedBox(height: 12),

          GreyButton(
            labelText: "Sign in with Apple",
            svgPath: "assets/svg/icons8-apple.svg",
            onPressed: () {},
          ),

        ],
      ),
    );
  }
}