import 'package:faqt/demo/demo.dart';
import 'package:faqt/features/spaces/widgets/faqt_app_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  final user = demoUsers.first; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FaqtAppBar(user: user),
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}