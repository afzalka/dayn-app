import 'package:flutter/material.dart';

import '../app_router.dart';
import '../theme/app_colors.dart';
import '../ui/canvas.dart';

/// XD screen 1: brand green with the wordmark. Tap anywhere continues.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: AppColors.brand,
      onTap: () => Navigator.pushReplacementNamed(context, AppRouter.welcome),
      children: const [
        XSvg('logo', x: 45, y: 401, w: 337.66, h: 123.72),
      ],
    );
  }
}
