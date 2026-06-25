import 'package:faqt/model/faqt.dart';
import 'package:flutter/material.dart';

class CreateNewSheet extends StatefulWidget {
  final List<Faqt> sheets;

  const CreateNewSheet({
    super.key,
    required this.sheets,
  });

  @override
  State<CreateNewSheet> createState() => _CreateNewCardState();

}

class _CreateNewCardState extends State<CreateNewSheet> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child:  GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250, 
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          /*final items = [
            ["Multiplayer", "Compete with anyone, anywhere", Icons.group, Colors.purple],
            ["Track Stats", "Monitor your progress and scores", Icons.bar_chart, AppColors.pink],
            ["Coins & Rewards", "Earn coins and unlock rewards", Icons.monetization_on, Colors.amber],
            //["Community", "Meet and challenge fellow ponderers", Icons.diversity_1, Colors.orange],
            ["Likes", "Send & Receive likes from other players", Icons.favorite, Colors.red],
            ["Notifications", "See disputes, rewards, and updates", Icons.notifications, Colors.blue],
            ["Feedback", "Share your ideas or issues with us", Icons.feedback, Colors.yellow],
          ];

          final item = items[index];

          return _featureTile(
            item[0] as String,
            item[1] as String,
            item[2] as IconData,
            item[3] as Color,
          ); */
        },
      ),
    );

  }

  
}