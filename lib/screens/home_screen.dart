import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 3: dashboard.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      bottomBar: const BottomNav(active: NavTab.home),
      children: [
        const AppHeader(),
        // Greeting.
        const XText(AppContent.salam, x: 214, y: 124, size: 29,
            family: AppFonts.tajawal, weight: GW.medium, tracking: 0),
        const XText(AppContent.homeGreeting, x: 214, y: 164, size: 22,
            weight: GW.bold, color: AppColors.heading),
        const XText(AppContent.homeSubtitle, x: 214, y: 193, size: 16,
            weight: GW.book, color: AppColors.body),

        // Debt progress card.
        const XRect(x: 21, y: 229, w: 387, h: 212,
            color: AppColors.surface, radius: 13),
        const XText(AppContent.debtProgressTitle, x: 106, y: 254, size: 14,
            weight: GW.bold, color: AppColors.body),
        const XText('${AppContent.debtProgressPercent}%', x: 97, y: 318,
            size: 55, weight: GW.bold, tracking: 0, color: AppColors.amount),
        const ProgressBar(x: 40, y: 337, w: 349, h: 14,
            percent: AppContent.debtProgressPercent),
        const ProgressRing(x: 320.85, y: 250,
            percent: AppContent.debtProgressPercent,
            label: '${AppContent.debtProgressPercent}%', labelSize: 21),
        const XText(AppContent.debtPaid, x: 85, y: 400, size: 20,
            weight: GW.bold, color: AppColors.amount),
        const XText(AppContent.paidLabel, x: 54, y: 417, size: 13,
            weight: GW.medium, color: AppColors.paid),
        const XText(AppContent.debtRemaining, x: 343, y: 400, size: 20,
            weight: GW.bold, color: AppColors.amount),
        const XText(AppContent.remainingLabel, x: 356, y: 417, size: 13,
            weight: GW.medium, color: AppColors.remaining),

        // Next payment card.
        const XRect(x: 21, y: 448, w: 387, h: 128,
            color: AppColors.card, radius: 13),
        const XText(AppContent.nextPaymentTitle, x: 103, y: 470, size: 14,
            weight: GW.bold, color: AppColors.body),
        const Chevron(x: 373, y: 456),
        const XRect(x: 35, y: 510, w: 41, h: 41,
            color: AppColors.brand, radius: 8),
        const XSvg('wallet', x: 42.17, y: 516.93, w: 27.21, h: 26.12),
        const XText(AppContent.nextPaymentAmount, x: 131, y: 520, size: 18,
            weight: GW.bold, color: AppColors.amount),
        const XText('${AppContent.nextPaymentTo}\n${AppContent.nextPaymentDue}',
            x: 90, y: 537, size: 11, weight: GW.medium,
            align: XAlign.left, color: AppColors.muted, lineHeight: 15),
        const XRect(x: 231, y: 512, w: 161, h: 36,
            color: AppColors.brand, radius: 10),
        const XText(AppContent.recordPayment, x: 297, y: 534, size: 13,
            weight: GW.bold),
        const XSvg('arrow_alt_right', x: 355.08, y: 525.01, w: 23.33, h: 9.99),
        XTap(x: 21, y: 448, w: 387, h: 128,
            onTap: () => AppRouter.goDebts(context)),

        // Upcoming payments card (runs past the artboard, as designed).
        const XRect(x: 21, y: 584, w: 387, h: 358,
            color: AppColors.card, radius: 13),
        const XText(AppContent.upcomingPaymentsTitle, x: 103, y: 609,
            size: 14, weight: GW.bold, color: AppColors.body),
        const XText(AppContent.seeAll, x: 340, y: 609, size: 14,
            weight: GW.medium, color: AppColors.body),
        const Chevron(x: 373, y: 595),
      ],
    );
  }
}
