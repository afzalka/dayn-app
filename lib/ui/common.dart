import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import 'canvas.dart';

/// Small Dayn wordmark + notification bell, as on every inner screen.
class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.showBell = true});

  final bool showBell;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const XSvg('logo', x: 23, y: 28.27, w: 97.46, h: 35.71),
        if (showBell) ...[
          const XSvg('bell', x: 377.05, y: 33.5, w: 24, h: 24),
          const XCircle(x: 389.05, y: 30, d: 16, color: AppColors.badge),
          const XText(
            AppContent.notificationCount,
            x: 397.05,
            y: 42,
            size: 12,
            family: AppFonts.poppins,
            weight: GW.book,
            tracking: 0,
            color: AppColors.white,
          ),
        ],
      ],
    );
  }
}

enum NavTab { debts, goals, home, reminders, settings }

/// The bottom tab bar (XD: rounded 371 x 64 strip at y = 835).
class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.active});

  final NavTab active;

  static const _icons = {
    NavTab.debts: ('nav_debts', 50.01, 846.0, 39.99, 40.0),
    NavTab.goals: ('nav_goals', 123.01, 846.0, 39.99, 40.01),
    NavTab.home: ('nav_home', 195.0, 846.0, 40.0, 40.01),
    NavTab.reminders: ('nav_reminders', 268.0, 846.0, 40.0, 40.0),
    NavTab.settings: ('nav_settings', 340.01, 844.0, 39.97, 44.46),
  };

  void _go(BuildContext context, NavTab tab) {
    if (tab == active) return;
    switch (tab) {
      case NavTab.home:
        AppRouter.goHome(context);
      case NavTab.debts:
        AppRouter.goDebts(context);
      case NavTab.goals:
        AppRouter.goGoals(context);
      case NavTab.reminders:
      case NavTab.settings:
        break; // not part of the design yet
    }
  }

  @override
  Widget build(BuildContext context) {
    const top = BottomBarCanvas.top;
    return Stack(
      children: [
        const XRect(
          x: 29,
          y: 835 - top,
          w: 371,
          h: 64,
          color: AppColors.navBar,
          radius: 15,
          borderColor: AppColors.hairline,
          borderWidth: 0.2,
        ),
        for (final entry in _icons.entries) ...[
          XSvg(
            entry.value.$1,
            x: entry.value.$2,
            y: entry.value.$3 - top,
            w: entry.value.$4,
            h: entry.value.$5,
            color: entry.key == active
                ? AppColors.navActive
                : AppColors.navInactive,
          ),
          XTap(
            x: entry.value.$2 - 12,
            y: 835 - top,
            w: entry.value.$4 + 24,
            h: 64,
            onTap: () => _go(context, entry.key),
          ),
        ],
      ],
    );
  }
}

/// The grey circular chevron used for back buttons and card disclosure.
class Chevron extends StatelessWidget {
  const Chevron({super.key, required this.x, required this.y, this.onTap});

  final double x, y;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XSvg('chevron', x: x, y: y, w: 20, h: 20),
        if (onTap != null)
          XTap(x: x - 12, y: y - 12, w: 44, h: 44, onTap: onTap),
      ],
    );
  }
}

/// Bold label followed by the long arrow (Get Started / Next / View Debt).
class ArrowLabel extends StatelessWidget {
  const ArrowLabel({
    super.key,
    required this.text,
    required this.textX,
    required this.baseline,
    required this.arrowX,
    required this.arrowY,
    this.size = 22,
    this.arrowW = 32.08,
    this.arrowH = 13.74,
  });

  final String text;
  final double textX, baseline, arrowX, arrowY, size, arrowW, arrowH;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XText(text, x: textX, y: baseline, size: size, weight: GW.bold),
        XSvg('arrow_alt_right', x: arrowX, y: arrowY, w: arrowW, h: arrowH),
      ],
    );
  }
}

/// Green pill button with a "+" and a bold label (add debt / add goal).
class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
    required this.text,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    required this.plusX,
    required this.plusY,
    required this.plusSize,
    required this.textX,
    required this.baseline,
    required this.size,
    this.onTap,
  });

  final String text;
  final double x, y, w, h, plusX, plusY, plusSize, textX, baseline, size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XRect(x: x, y: y, w: w, h: h, color: AppColors.brand, radius: 6),
        XSvg('plus', x: plusX, y: plusY, w: plusSize, h: plusSize),
        XText(text, x: textX, y: baseline, size: size, weight: GW.bold),
        XTap(x: x, y: y, w: w, h: h, onTap: onTap),
      ],
    );
  }
}

/// Two-option segmented control (Active / Completed).
class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({
    super.key,
    required this.y,
    required this.left,
    required this.right,
    required this.activeIndex,
    required this.onChanged,
  });

  final double y;
  final String left, right;
  final int activeIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XRect(
          x: 21,
          y: y,
          w: 387,
          h: 36,
          color: AppColors.segment,
          radius: 10,
          borderColor: AppColors.hairline,
          borderWidth: 0.2,
        ),
        XRect(
          x: activeIndex == 0 ? 21 : 214,
          y: y,
          w: 194,
          h: 36,
          color: AppColors.brand,
          radius: 10,
        ),
        XText(left, x: 114, y: y + 22, size: 13, weight: GW.medium),
        XText(right, x: 317, y: y + 22, size: 13, weight: GW.medium),
        XTap(x: 21, y: y, w: 194, h: 36, onTap: () => onChanged(0)),
        XTap(x: 214, y: y, w: 194, h: 36, onTap: () => onChanged(1)),
      ],
    );
  }
}

/// Horizontal progress bar (track + fill).
class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    required this.percent,
    this.fillColor = AppColors.accent,
  });

  final double x, y, w, h;
  final int percent;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XRect(x: x, y: y, w: w, h: h, color: AppColors.track, radius: h / 2),
        if (percent > 0)
          XRect(
            x: x,
            y: y,
            w: w * percent / 100,
            h: h,
            color: fillColor,
            radius: h / 2,
          ),
      ],
    );
  }
}

/// Circular progress ring with the percentage in the middle.
class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.x,
    required this.y,
    required this.percent,
    required this.label,
    required this.labelSize,
    this.d = 68.15,
    this.stroke = 4.5,
  });

  final double x, y, d, stroke;
  final int percent;
  final String label;
  final double labelSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: x,
          top: y,
          width: d,
          height: d,
          child: CustomPaint(
            painter: _RingPainter(percent: percent, stroke: stroke),
          ),
        ),
        XText(
          label,
          x: x + d / 2,
          y: y + d / 2 + labelSize * 0.37,
          size: labelSize,
          weight: GW.bold,
          tracking: 0,
          color: AppColors.amount,
        ),
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.percent, required this.stroke});

  final int percent;
  final double stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final inner = rect.deflate(stroke / 2);
    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.ringTrack.withValues(alpha: 0.3);
    final fill = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.accent;
    canvas.drawArc(inner, 0, math.pi * 2, false, track);
    if (percent > 0) {
      canvas.drawArc(
        inner,
        -math.pi / 2,
        math.pi * 2 * percent / 100,
        false,
        fill,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.percent != percent || old.stroke != stroke;
}

/// Section header inside the add-debt forms: tinted circle + icon + title.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.circleY,
    required this.title,
    required this.baseline,
    required this.icon,
    required this.iconX,
    required this.iconY,
    required this.iconW,
    required this.iconH,
    this.circleX = 50,
  });

  final double circleX, circleY, baseline, iconX, iconY, iconW, iconH;
  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XCircle(x: circleX, y: circleY, d: 35, color: AppColors.accentSoft),
        XSvg(icon, x: iconX, y: iconY, w: iconW, h: iconH),
        XText(
          title,
          x: 92,
          y: baseline,
          size: 14,
          weight: GW.bold,
          align: XAlign.left,
          color: AppColors.heading,
        ),
      ],
    );
  }
}

/// Hint styles shared by the forms.
abstract final class FieldStyles {
  static TextStyle label13 = AppFonts.style(
    size: 13,
    weight: GW.light,
    color: AppColors.label.withValues(alpha: 0.75),
  );
  static TextStyle book13 = AppFonts.style(
    size: 13,
    weight: GW.book,
    color: AppColors.label.withValues(alpha: 0.75),
  );
  static TextStyle signup = AppFonts.style(
    size: 15,
    weight: GW.light,
    color: AppColors.body.withValues(alpha: 0.75),
  );
  static TextStyle amount = AppFonts.style(
    size: 20,
    weight: GW.medium,
    color: AppColors.placeholder,
  );
  static TextStyle placeholder12 = AppFonts.style(
    size: 12,
    weight: GW.book,
    color: AppColors.placeholder,
  );
}
