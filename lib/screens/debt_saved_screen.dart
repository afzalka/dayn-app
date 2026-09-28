import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 11: confirmation with the saved debt summary.
class DebtSavedScreen extends StatelessWidget {
  const DebtSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      bottomBar: const BottomNav(active: NavTab.debts),
      children: [
        const AppHeader(),
        const XSvg('tick', x: 175.16, y: 92.65, w: 77.34, h: 77.35),
        const XText(AppContent.alhamdulillah, x: 214, y: 215, size: 29,
            family: AppFonts.tajawal, weight: GW.medium, tracking: 0),
        const XText(AppContent.debtSavedTitle, x: 214, y: 251, size: 30,
            weight: GW.bold, color: AppColors.saved),
        const XText(AppContent.debtSavedSubtitle, x: 214, y: 272, size: 16,
            family: AppFonts.tajawal, weight: GW.book, color: AppColors.body),

        // Summary card.
        const XRect(x: 30, y: 298, w: 369, h: 334,
            color: AppColors.surface, radius: 7),
        const XCircle(x: 42, y: 313, d: 35, color: AppColors.accentSoft),
        const XSvg('user_filled', x: 50, y: 319, w: 18.49, h: 22.17),
        const XText(AppContent.savedDebtName, x: 84, y: 334, size: 18,
            weight: GW.bold, align: XAlign.left, color: AppColors.heading),
        const _Label(AppContent.savedDebtPurpose, x: 83.6, y: 346),
        const XRect(x: 316, y: 313, w: 62, h: 19, color: AppColors.accentChip,
            radius: 10, borderColor: AppColors.accentBorder),
        const XCircle(x: 325, y: 319, d: 8, color: AppColors.accentAlt),
        const XText(AppContent.activeStatus, x: 355, y: 326, size: 10,
            weight: GW.medium, color: AppColors.near),

        const XLine(x: 213.5, y: 368.5, h: 55, opacity: 0.3),
        const _Label(AppContent.totalAmountTitle, x: 41.75, y: 382),
        const XText(AppContent.savedDebtTotal, x: 44, y: 412, size: 28,
            weight: GW.bold, align: XAlign.left, color: AppColors.heading),
        const _Label(AppContent.paymentTypeTitle, x: 232.8, y: 382),
        const XSvg('salary', x: 233, y: 392, w: 23.37, h: 23.37),
        const XText(AppContent.savedDebtInstallments, x: 266, y: 401,
            size: 14, weight: GW.bold, align: XAlign.left,
            color: AppColors.heading),
        const _Label(AppContent.savedDebtPerMonth, x: 265.9, y: 416),

        const XLine(x: 44.5, y: 438.5, w: 334, opacity: 0.3),
        const XLine(x: 213.5, y: 453.5, h: 34, opacity: 0.3),
        const XSvg('calendar_3', x: 44.5, y: 464, w: 18.1, h: 19),
        const _Label(AppContent.firstPaymentTitle, x: 68, y: 469),
        const _Value(AppContent.firstPaymentDate, x: 67.4, y: 483),
        const XSvg('calendar_3', x: 233, y: 464, w: 18.1, h: 19),
        const _Label(AppContent.lastPaymentTitle, x: 257, y: 469),
        const _Value(AppContent.lastPaymentDate, x: 255.4, y: 483),

        const XLine(x: 44.5, y: 503.5, w: 334, opacity: 0.3),
        const XText(AppContent.savedDebtPaid, x: 44.8, y: 524, size: 12,
            weight: GW.bold, align: XAlign.left),
        const XText(AppContent.paidLabel, x: 45, y: 539, size: 11,
            weight: GW.book, align: XAlign.left, color: AppColors.muted),
        const XText(AppContent.savedDebtRemaining, x: 382.4, y: 524, size: 12,
            weight: GW.bold, align: XAlign.right),
        const XText(AppContent.remainingLabel, x: 382, y: 539, size: 11,
            weight: GW.book, align: XAlign.right, color: AppColors.muted),
        const XText('${AppContent.savedDebtPercent}%', x: 206, y: 539,
            size: 11, weight: GW.medium, align: XAlign.left,
            color: AppColors.muted),
        const ProgressBar(x: 45, y: 545, w: 337, h: 13,
            percent: AppContent.savedDebtPercent),

        const XLine(x: 44.5, y: 573, w: 334, opacity: 0.3),
        const XLine(x: 213.5, y: 579, h: 34, opacity: 0.3),
        const XSvg('witness', x: 48.6, y: 588, w: 14, h: 23.22),
        const _Label(AppContent.witness1Label, x: 73, y: 592),
        const _Value(AppContent.savedDebtWitness, x: 70.8, y: 606),
        const XText(AppContent.savedDebtWitnessPhone, x: 71.2, y: 616,
            size: 8, weight: GW.medium, align: XAlign.left, opacity: 0.75),
        const XSvg('notes', x: 232.58, y: 588, w: 19.92, h: 19.93),
        const _Label(AppContent.purposeTitle, x: 256.3, y: 592),
        const _Value(AppContent.savedDebtPurpose, x: 256, y: 606),

        // Actions.
        const XRect(x: 30, y: 649, w: 369, h: 48, color: AppColors.brand,
            radius: 6),
        const ArrowLabel(text: AppContent.viewDebt, textX: 192, baseline: 680,
            arrowX: 254, arrowY: 665.01),
        XTap(x: 30, y: 649, w: 369, h: 48,
            onTap: () => AppRouter.goDebts(context)),
        const XRect(x: 30, y: 709, w: 369, h: 48, color: AppColors.surface,
            radius: 6),
        const XSvg('share', x: 122, y: 721, w: 17.08, h: 22.14),
        const XText(AppContent.shareDebtRecord, x: 228.76, y: 737, size: 18,
            weight: GW.book),
        const XText(AppContent.done, x: 215, y: 785, size: 12,
            weight: GW.medium),
        XTap(x: 165, y: 765, w: 100, h: 32,
            onTap: () => AppRouter.goHome(context)),
        const XText(AppContent.debtSavedFooter, x: 215, y: 802, size: 10,
            weight: GW.book, lineHeight: 14),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, {required this.x, required this.y});

  final String text;
  final double x, y;

  @override
  Widget build(BuildContext context) {
    return XText(text, x: x, y: y, size: 10, weight: GW.book,
        align: XAlign.left, opacity: 0.75);
  }
}

class _Value extends StatelessWidget {
  const _Value(this.text, {required this.x, required this.y});

  final String text;
  final double x, y;

  @override
  Widget build(BuildContext context) {
    return XText(text, x: x, y: y, size: 12, weight: GW.medium,
        align: XAlign.left, opacity: 0.75);
  }
}
