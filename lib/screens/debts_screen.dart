import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screens 4 (Active Debts) and 5 (Completed), one screen with two tabs.
class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  late int _tab = widget.initialTab;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      bottomBar: const BottomNav(active: NavTab.debts),
      children: [
        const AppHeader(),
        Chevron(x: 23, y: 128, onTap: () => AppRouter.goHome(context)),
        const XText(AppContent.myDebtsTitle, x: 131, y: 148, size: 32,
            weight: GW.bold, color: AppColors.heading),
        SegmentedTabs(
          y: 177,
          left: AppContent.activeDebtsTab,
          right: AppContent.completedDebtsTab,
          activeIndex: _tab,
          onChanged: (i) => setState(() => _tab = i),
        ),
        if (_tab == 0)
          for (var i = 0; i < AppContent.activeDebts.length; i++)
            _ActiveCard(y: 229 + i * 136.0, debt: AppContent.activeDebts[i])
        else
          for (var i = 0; i < AppContent.completedDebts.length; i++)
            _CompletedCard(
                y: 229 + i * 136.0, debt: AppContent.completedDebts[i]),
        XText(
          _tab == 0 ? AppContent.bismillah : AppContent.alhamdulillahTawfiq,
          x: 214,
          y: 703,
          size: 20,
          family: AppFonts.tajawal,
          weight: GW.light,
          tracking: 0,
          color: AppColors.arabicMuted,
        ),
        PlusButton(
          text: AppContent.addDebt,
          x: 137,
          y: 733,
          w: 155,
          h: 38,
          plusX: 165,
          plusY: 745.67,
          plusSize: 13.46,
          textX: 222.01,
          baseline: 757,
          size: 18,
          onTap: () => Navigator.pushNamed(context, AppRouter.addDebt1),
        ),
      ],
    );
  }
}

class _ActiveCard extends StatelessWidget {
  const _ActiveCard({required this.y, required this.debt});

  final double y;
  final ActiveDebt debt;

  @override
  Widget build(BuildContext context) {
    final isStore = debt.icon == 'store';
    return Stack(
      children: [
        XRect(x: 21, y: y, w: 387, h: 128, color: AppColors.card, radius: 13),
        XText(debt.name, x: 36, y: y + 23, size: 14, weight: GW.bold,
            align: XAlign.left),
        Chevron(x: 374, y: y + 12),
        XRect(x: 36, y: y + 60, w: 41, h: 41, color: AppColors.brand,
            radius: 8),
        if (isStore)
          XSvg('store', x: 43.2, y: y + 67.18, w: 28.82, h: 25.18)
        else
          XSvg('friends', x: 41.41, y: y + 66.91, w: 31.18, h: 26.18),
        XText(debt.remaining, x: 91, y: y + 58, size: 18, weight: GW.bold,
            align: XAlign.left, color: AppColors.amount),
        XText('${debt.paidPercent}%', x: 394, y: y + 66, size: 11,
            weight: GW.medium, align: XAlign.right, color: AppColors.muted),
        ProgressBar(x: 91, y: y + 70, w: 303, h: 13, percent: debt.paidPercent),
        XText(
          '${AppContent.remainingFromLabel}${debt.remainingFrom}\n'
          '${AppContent.dueLabel}${debt.due}',
          x: 91,
          y: y + 99,
          size: 11,
          weight: GW.medium,
          align: XAlign.left,
          color: AppColors.muted,
          lineHeight: 15,
        ),
      ],
    );
  }
}

class _CompletedCard extends StatelessWidget {
  const _CompletedCard({required this.y, required this.debt});

  final double y;
  final CompletedDebt debt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XRect(x: 21, y: y, w: 387, h: 128, color: AppColors.card, radius: 13),
        XText(debt.name, x: 35, y: y + 22, size: 14, weight: GW.bold,
            align: XAlign.left),
        Chevron(x: 373, y: y + 8),
        XRect(x: 35, y: y + 62, w: 41, h: 41, color: AppColors.brand,
            radius: 8),
        XSvg('friends', x: 40.41, y: y + 68.91, w: 31.18, h: 26.18),
        XText(debt.amount, x: 90, y: y + 72, size: 18, weight: GW.bold,
            align: XAlign.left, color: AppColors.amount),
        XText(
          '${AppContent.paidSuccessfully}\n${AppContent.onLabel}${debt.paidOn}',
          x: 90,
          y: y + 89,
          size: 11,
          weight: GW.medium,
          align: XAlign.left,
          color: AppColors.muted,
          lineHeight: 15,
        ),
        ProgressRing(x: 327, y: y + 37.85, percent: 100, label: '100%',
            labelSize: 15),
      ],
    );
  }
}
