import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 12: My Goals.
class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      bottomBar: const BottomNav(active: NavTab.goals),
      children: [
        const AppHeader(),
        Chevron(x: 23, y: 128, onTap: () => AppRouter.goHome(context)),
        const XText(AppContent.myGoalsTitle, x: 131, y: 148, size: 32,
            weight: GW.bold, color: AppColors.heading),
        const XText(AppContent.goalsSubtitle, x: 23, y: 186, size: 16,
            weight: GW.book, align: XAlign.left, color: AppColors.body,
            lineHeight: 22),
        SegmentedTabs(
          y: 227,
          left: AppContent.activeGoalsTab,
          right: AppContent.completedGoalsTab,
          activeIndex: _tab,
          onChanged: (i) => setState(() => _tab = i),
        ),
        if (_tab == 0)
          for (var i = 0; i < AppContent.goals.length; i++)
            _GoalCard(y: 279 + i * 161.0, goal: AppContent.goals[i]),
        PlusButton(
          text: AppContent.addGoal,
          x: 150,
          y: 772,
          w: 129,
          h: 38,
          plusX: 165,
          plusY: 784.67,
          plusSize: 13.46,
          textX: 222.01,
          baseline: 796,
          size: 18,
        ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.y, required this.goal});

  final double y;
  final Goal goal;

  @override
  Widget build(BuildContext context) {
    // Icons are centred in the 41 px tile.
    final iconX = 36 + (41 - goal.iconWidth) / 2;
    final iconY = y + 60 + (41 - goal.iconHeight) / 2;
    return Stack(
      children: [
        XRect(x: 21, y: y, w: 387, h: 156, color: AppColors.card, radius: 13),
        XText(goal.name, x: 36, y: y + 27, size: 16, weight: GW.bold,
            align: XAlign.left),
        Chevron(x: 374, y: y + 12),
        XRect(x: 36, y: y + 60, w: 41, h: 41, color: AppColors.brand,
            radius: 8),
        XSvg(goal.icon, x: iconX, y: iconY, w: goal.iconWidth,
            h: goal.iconHeight),
        XText(goal.total, x: 90, y: y + 58, size: 18, weight: GW.bold,
            align: XAlign.left, color: AppColors.amount),
        ProgressBar(x: 91, y: y + 70, w: 303, h: 13, percent: goal.percent,
            fillColor: AppColors.accentAlt),
        XText('${goal.percent}%', x: 242.5, y: y + 99, size: 11,
            weight: GW.medium, color: AppColors.muted),
        XText(goal.saved, x: 91, y: y + 105, size: 14, weight: GW.bold,
            align: XAlign.left),
        XText(AppContent.savedLabel, x: 91, y: y + 117, size: 11,
            weight: GW.medium, align: XAlign.left, color: AppColors.muted),
        XText(goal.remaining, x: 394, y: y + 105, size: 14, weight: GW.bold,
            align: XAlign.right),
        XText(AppContent.remainingLabel, x: 394, y: y + 117, size: 11,
            weight: GW.medium, align: XAlign.right, color: AppColors.muted),
        XText('${AppContent.targetLabel}${goal.target}', x: 36, y: y + 142,
            size: 11, weight: GW.medium, align: XAlign.left,
            color: AppColors.muted),
      ],
    );
  }
}
