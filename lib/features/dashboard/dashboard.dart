import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/appBar/faqt_app_bar.dart';
import 'package:faqt/features/dashboard/dashboard_provider.dart';
import 'package:faqt/features/cards/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HubProvider>().loadData(
        hubs: demoHubs,
        spaces: demoSpaces,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hubProvider = context.watch<HubProvider>();

    final hub = hubProvider.currentHub;
    final activeSpaceId = hubProvider.activeSpaceId;

    if (hub == null) {
      return const Center(child: Text("No hub selected"));
    }

    // All faqts in this hub
    final allFaqsInHub =
        demoFaqts.where((f) => f.hubId == hub.id).toList();

    // Filtered faqts
    final faqs = activeSpaceId == null
        ? allFaqsInHub
        : allFaqsInHub.where((f) {
            return f.isGlobal || f.spaceIds.contains(activeSpaceId);
          }).toList();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: FaqtAppBar(
        user: demoUsers.firstWhere((u) => u.id == "user_2"),
        scaffoldKey: _scaffoldKey,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ⭐ FILTER ROW (scrollable)
          

          const SizedBox(height: 12),

          /// ⭐ MAIN CONTENT
          Expanded(child: _buildMainContent(faqs)),
        ],
      ),
    );
  }

  // MAIN CONTENT
  Widget _buildMainContent(List faqs) {
    if (faqs.isEmpty) {
      return const Center(
        child: Text(
          "No faqt cards in this space",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: faqs.length,
        itemBuilder: (_, i) => CardWidget(faqt: faqs[i]),
      ),
    );
  }
}
