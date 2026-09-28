import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 10: Add a new debt, sections 4 to 6.
class AddDebtStep2Screen extends StatelessWidget {
  const AddDebtStep2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      children: [
        Chevron(x: 30, y: 34, onTap: () => Navigator.pop(context)),
        const XText(AppContent.addDebtTitle, x: 30.25, y: 90, size: 28,
            weight: GW.bold, align: XAlign.left, color: AppColors.heading),
        const XText(AppContent.addDebtSubtitle2, x: 28.5, y: 112, size: 14,
            weight: GW.book, align: XAlign.left, color: AppColors.hint),

        // 4. Installment details.
        const XRect(x: 30, y: 134, w: 369, h: 308,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 142, title: AppContent.section4,
            baseline: 163, icon: 'salary',
            iconX: 58.53, iconY: 149.53, iconW: 20.31, iconH: 20.31),
        const _Label(AppContent.numberOfInstallmentsLabel, x: 54.8, y: 195),
        const XRect(x: 54, y: 205, w: 321, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.numberOfInstallments, x: 72.1, y: 235,
            size: 16, weight: GW.medium, align: XAlign.left,
            color: AppColors.nearAlt),
        const XSvg('right_arrow', x: 343.67, y: 226.5, w: 11.92, h: 7),
        const _Label(AppContent.installmentAmountLabel, x: 52.6, y: 267),
        const _Label(AppContent.totalLabel, x: 220.4, y: 267),
        const XRect(x: 54, y: 277, w: 157, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.installmentAmount, x: 69.2, y: 305, size: 16,
            weight: GW.medium, align: XAlign.left),
        const XRect(x: 218, y: 277, w: 157, h: 46,
            color: AppColors.accentTint, radius: 7,
            borderColor: AppColors.accentBorder),
        const XText(AppContent.totalAmount, x: 256.1, y: 305, size: 18,
            weight: GW.bold, align: XAlign.left),
        const _Label(AppContent.firstPaymentDateLabel, x: 53.07, y: 339),
        const _Label(AppContent.frequencyLabel, x: 213.6, y: 339),
        const XRect(x: 56, y: 349, w: 153, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.firstPaymentDate, x: 67.3, y: 376, size: 14,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearDark),
        const XSvg('calendar_2', x: 175, y: 363, w: 19.26, h: 18),
        const XRect(x: 218, y: 349, w: 153, h: 46, color: AppColors.white,
            radius: 7),
        const XText(AppContent.frequency, x: 233.7, y: 376, size: 14,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearDark),
        const XSvg('right_arrow', x: 343.67, y: 368.5, w: 11.92, h: 7),
        const _Label(AppContent.totalDurationLabel, x: 62.5, y: 410, size: 9),
        const XText(AppContent.totalDuration, x: 62.8, y: 427, size: 12,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearAlt),
        const _Label(AppContent.lastPaymentDateLabel, x: 222, y: 410, size: 9),
        const XText(AppContent.lastPaymentDate, x: 221.9, y: 427, size: 12,
            weight: GW.medium, align: XAlign.left, color: AppColors.nearDark),

        // 5. Witness details.
        const XRect(x: 30, y: 447, w: 369, h: 232,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 454, title: AppContent.section5,
            baseline: 475, icon: 'witness',
            iconX: 61, iconY: 457.78, iconW: 14, iconH: 23.22),
        const XText(AppContent.witnessNote, x: 91.7, y: 491, size: 10,
            weight: GW.book, align: XAlign.left, color: AppColors.witnessNote),
        const _Label(AppContent.witness1Label, x: 56.2, y: 513, size: 9),
        XField(x: 54, y: 518, w: 321, h: 46, hint: AppContent.fieldName,
            hintStyle: FieldStyles.label13, paddingLeft: 14, paddingRight: 40),
        const XSvg('user', x: 339.81, y: 529.79, w: 18.37, h: 24.41),
        const _Label(AppContent.contactNumberLabel, x: 58, y: 578, size: 9),
        const XRect(x: 54, y: 583, w: 321, h: 46, color: AppColors.white,
            radius: 7),
        XText(AppContent.phonePrefix, x: 69.9, y: 611, size: 13,
            weight: GW.book, align: XAlign.left, color: AppColors.label,
            opacity: 0.75),
        const XLine(x: 116.5, y: 594.5, w: 1, h: 22),
        XField(x: 124, y: 583, w: 251, h: 46, hint: AppContent.phonePlaceholder,
            hintStyle: FieldStyles.book13, fill: Colors.transparent,
            paddingLeft: 6.6, keyboardType: TextInputType.phone),
        const XRect(x: 247, y: 639, w: 128, h: 30, color: AppColors.brand,
            radius: 6),
        const XSvg('plus', x: 264.14, y: 649, w: 11.11, h: 11.11),
        const XText(AppContent.addWitness, x: 321.18, y: 658, size: 13,
            weight: GW.bold),

        // 6. Notes.
        const XRect(x: 30, y: 684, w: 369, h: 158,
            color: AppColors.surface, radius: 7),
        const SectionHeader(circleY: 692, title: AppContent.section6,
            baseline: 713, icon: 'notes',
            iconX: 60.04, iconY: 699.54, iconW: 19.92, iconH: 19.93),
        XField(x: 54, y: 733, w: 321, h: 99, hint: AppContent.notesPlaceholder,
            hintStyle: FieldStyles.label13, paddingLeft: 16.2,
            maxLines: null, alignTop: true),
        const XText(AppContent.notesCounter, x: 348, y: 825, size: 9,
            weight: GW.book, color: AppColors.counter),

        // Save.
        const XRect(x: 30, y: 851, w: 369, h: 48, color: AppColors.brand,
            radius: 6),
        const XText(AppContent.saveDebt, x: 216, y: 882, size: 21,
            weight: GW.bold),
        XTap(x: 30, y: 851, w: 369, h: 48,
            onTap: () => Navigator.pushNamed(context, AppRouter.debtSaved)),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, {required this.x, required this.y, this.size = 10});

  final String text;
  final double x, y, size;

  @override
  Widget build(BuildContext context) {
    return XText(text, x: x, y: y, size: size, weight: GW.book,
        align: XAlign.left, opacity: 0.75);
  }
}
