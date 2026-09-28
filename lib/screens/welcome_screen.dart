import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screens 2, 7, 8: three onboarding pages sharing one layout. The page
/// dots in the design mark which page is showing, so the illustration and
/// tagline swipe while the rest stays put.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Illustration bounds per page, straight from the artboards.
  static const _illustrations = [
    (x: 42.0, y: 282.0, w: 343.39, h: 237.82),
    (x: 31.0, y: 284.0, w: 365.09, h: 229.61),
    (x: 99.0, y: 287.0, w: 231.64, h: 231.95),
  ];

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      children: [
        const XText(
          AppContent.salam,
          x: 214,
          y: 127,
          size: 50,
          family: AppFonts.tajawal,
          weight: GW.medium,
          tracking: 0,
        ),
        // Swipeable region: illustration + tagline (y 270..620).
        Positioned(
          left: 0,
          top: 270,
          width: DesignCanvas.designWidth,
          height: 350,
          child: PageView.builder(
            controller: _controller,
            itemCount: AppContent.onboarding.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) {
              final page = AppContent.onboarding[i];
              final b = _illustrations[i];
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  XSvg(page.illustration,
                      x: b.x, y: b.y - 270, w: b.w, h: b.h),
                  XText(
                    page.tagline,
                    x: 214,
                    y: 574 - 270,
                    size: 18,
                    weight: GW.medium,
                    color: AppColors.heading,
                    lineHeight: 26,
                  ),
                ],
              );
            },
          ),
        ),
        // Page dots.
        for (var i = 0; i < 3; i++)
          XCircle(
            x: [192.0, 209.0, 227.0][i],
            y: 680,
            d: 10,
            color: i == _page ? AppColors.brand : AppColors.dot,
          ),
        // Get Started.
        const XRect(
            x: 81, y: 731, w: 267, h: 64, color: AppColors.brand, radius: 15),
        const ArrowLabel(
          text: AppContent.getStarted,
          textX: 194,
          baseline: 772,
          arrowX: 263,
          arrowY: 757.01,
        ),
        XTap(
          x: 81,
          y: 731,
          w: 267,
          h: 64,
          onTap: () => Navigator.pushNamed(context, AppRouter.signup),
        ),
        const XText(
          AppContent.alreadyHaveAccount,
          x: 214,
          y: 866,
          size: 18,
          weight: GW.medium,
          tracking: 0,
          color: AppColors.accent,
        ),
        XTap(
          x: 81,
          y: 846,
          w: 267,
          h: 40,
          onTap: () => Navigator.pushNamed(context, AppRouter.signup),
        ),
      ],
    );
  }
}
