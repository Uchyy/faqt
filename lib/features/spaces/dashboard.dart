import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/sheets/widgets/card_widget.dart';
import 'package:faqt/features/spaces/dashboard_provider.dart';
import 'package:faqt/features/appBar/faqt_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  final user = demoUsers.first;

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = context.watch<WorkspaceProvider>();
    final selectedWorkspace = workspaceProvider.current ?? demoWorkspaces.first;
    final items = selectedWorkspace.sheets;

    return Scaffold(
      appBar: FaqtAppBar(user: user),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// EMPTY STATE
            if (items.isEmpty)
              Center(
                child: Text(
                  "This space has no faqt cards",
                  style: AppColors.smallMuted.copyWith(
                    fontSize: context.fontSize(FontSize.small),
                  ),
                ),
              ),

            /// GRID OF CARDS
            if (items.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CardWidget(sheet: items[index]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
