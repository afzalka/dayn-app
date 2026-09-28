import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 9: Add a new debt, sections 1 to 3.
class AddDebtStep1Screen extends StatefulWidget {
  const AddDebtStep1Screen({super.key});

  @override
  State<AddDebtStep1Screen> createState() => _AddDebtStep1ScreenState();
}

class _AddDebtStep1ScreenState extends State<AddDebtStep1Screen> {
  int _repayment = 0; // 0 = full payment, 1 = installments

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      children: [
        Chevron(x: 30, y: 82, onTap: () => Navigator.pop(context)),
        const XText(AppContent.addDebtTitle, x: 70.25, y: 90, size: 28,
            weight: GW.bold, align: XAlign.left, color: AppColors.heading),
        const XText(AppContent.addDebtSubtitle1, x: 70.2, y: 112, size: 14,
            weight: GW.book, align: XAlign.left, color: AppColors.hint),

        // Qur'an quote.
        const XRect(x: 30, y: 134, w: 369, h: 86,
            color: AppColors.accentTint, radius: 7),
        const XCircle(x: 54, y: 146, d: 62, color: AppColors.accentSoft),
        const XSvg('quran', x: 60, y: 159, w: 50, h: 35.25),
        const XText(AppContent.quranQuote, x: 137, y: 165, size: 12,
            weight: GW.book, align: XAlign.left, color: AppColors.heading,
            lineHeight: 16),

        // 1. Person details.
        const XRect(x: 30, y: 226, w: 369, h: 173,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 234, title: AppContent.section1,
            baseline: 255, icon: 'user_filled',
            iconX: 58.25, iconY: 240, iconW: 18.49, iconH: 22.17),
        XField(x: 54, y: 283, w: 321, h: 46, hint: AppContent.fieldName,
            hintStyle: FieldStyles.label13, paddingLeft: 7, paddingRight: 40),
        const XSvg('user', x: 341.81, y: 293.79, w: 18.37, h: 24.41),
        XField(x: 54, y: 336, w: 321, h: 46,
            hint: AppContent.fieldContactNumber,
            hintStyle: FieldStyles.label13, paddingLeft: 7,
            keyboardType: TextInputType.phone),

        // 2. Debt details.
        const XRect(x: 30, y: 404, w: 369, h: 289,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 412, title: AppContent.section2,
            baseline: 433, icon: 'loan_contract',
            iconX: 61, iconY: 420, iconW: 20.01, iconH: 20),
        const XText(AppContent.currencyLabel, x: 299, y: 434, size: 10,
            weight: GW.medium, color: AppColors.placeholder),
        const XRect(x: 328, y: 422, w: 47, h: 19, color: AppColors.accentChip,
            radius: 5, borderColor: AppColors.accentBorder),
        const XText(AppContent.currency, x: 351.5, y: 435, size: 10,
            weight: GW.medium, color: AppColors.near),
        XText(AppContent.totalAmountLabel, x: 54.06, y: 471, size: 10,
            weight: GW.book, align: XAlign.left, opacity: 0.75),
        XField(x: 54, y: 481, w: 321, h: 46, hint: AppContent.amountPlaceholder,
            hintStyle: FieldStyles.amount, paddingLeft: 13.75,
            textStyle: AppFonts.style(size: 20, weight: GW.medium),
            keyboardType: const TextInputType.numberWithOptions(decimal: true)),
        XText(AppContent.repaymentTypeLabel, x: 54.1, y: 545, size: 10,
            weight: GW.book, align: XAlign.left, opacity: 0.75),
        _RepaymentOption(
          x: 54,
          selected: _repayment == 0,
          icon: 'loan',
          iconW: 23.58,
          iconH: 24.3,
          title: AppContent.fullPayment,
          titleColor: AppColors.fullPayment,
          subtitle: AppContent.fullPaymentSub,
          textCenterX: 149.29,
          onTap: () => setState(() => _repayment = 0),
        ),
        _RepaymentOption(
          x: 218,
          selected: _repayment == 1,
          icon: 'salary',
          iconW: 23.37,
          iconH: 23.37,
          title: AppContent.installments,
          titleColor: AppColors.label,
          subtitle: AppContent.installmentsSub,
          textCenterX: 313.37,
          onTap: () => setState(() => _repayment = 1),
        ),
        XText(AppContent.purposeLabel, x: 57.5, y: 619, size: 10,
            weight: GW.book, align: XAlign.left, opacity: 0.75),
        XField(x: 54, y: 629, w: 321, h: 46,
            hint: AppContent.purposePlaceholder,
            hintStyle: FieldStyles.placeholder12, paddingLeft: 14),

        // 3. Date.
        const XRect(x: 30, y: 700, w: 369, h: 126,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 708, title: AppContent.section3,
            baseline: 729, icon: 'calendar_3',
            iconX: 58, iconY: 716, iconW: 18.1, iconH: 19),
        XText(AppContent.borrowedDateLabel, x: 57.5, y: 762, size: 10,
            weight: GW.book, align: XAlign.left, opacity: 0.75),
        XText(AppContent.dueDateLabel, x: 226.7, y: 762, size: 10,
            weight: GW.book, align: XAlign.left, opacity: 0.75),
        const XRect(x: 57, y: 771, w: 153, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.borrowedDate, x: 69.9, y: 798, size: 14,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearDark),
        const XSvg('calendar_2', x: 176, y: 785, w: 19.26, h: 18),
        const XRect(x: 222, y: 771, w: 153, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.dueDate, x: 233.9, y: 798, size: 14,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearDark),
        const XSvg('calendar_2', x: 340, y: 785, w: 19.26, h: 18),

        // Next.
        const XRect(x: 30, y: 851, w: 369, h: 48, color: AppColors.brand,
            radius: 6),
        const ArrowLabel(text: AppContent.next, textX: 192, baseline: 882,
            arrowX: 227, arrowY: 867.01),
        XTap(x: 30, y: 851, w: 369, h: 48,
            onTap: () => Navigator.pushNamed(context, AppRouter.addDebt2)),
      ],
    );
  }
}

class _RepaymentOption extends StatelessWidget {
  const _RepaymentOption({
    required this.x,
    required this.selected,
    required this.icon,
    required this.iconW,
    required this.iconH,
    required this.title,
    required this.titleColor,
    required this.subtitle,
    required this.textCenterX,
    required this.onTap,
  });

  final double x, iconW, iconH, textCenterX;
  final bool selected;
  final String icon, title, subtitle;
  final Color titleColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XRect(
          x: x,
          y: 555,
          w: 157,
          h: 46,
          color: selected ? AppColors.accentTint : AppColors.white,
          radius: 7,
          borderColor: selected ? AppColors.accentBorder : null,
        ),
        XSvg(icon, x: x + 17, y: 566, w: iconW, h: iconH),
        XText(title, x: textCenterX, y: 576, size: 12, weight: GW.bold,
            color: selected ? AppColors.fullPayment : AppColors.label),
        XText(subtitle, x: textCenterX, y: 589, size: 10, weight: GW.book,
            color: AppColors.hint, opacity: 0.75),
        XTap(x: x, y: 555, w: 157, h: 46, onTap: onTap),
      ],
    );
  }
}
