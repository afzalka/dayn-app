import 'package:flutter/material.dart';

import '../app_router.dart';
import '../data/app_content.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../ui/canvas.dart';
import '../ui/common.dart';

/// XD screen 6: Create Account and Sign in stacked on one page.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hint = FieldStyles.signup;
    return DesignCanvas(
      children: [
        const AppHeader(showBell: false),
        const XText(
          AppContent.bismillah,
          x: 214,
          y: 135,
          size: 28,
          family: AppFonts.tajawal,
          weight: GW.medium,
          tracking: 0,
        ),
        const XText(
          AppContent.createAccount,
          x: 114,
          y: 204,
          size: 20,
          weight: GW.medium,
          color: AppColors.body,
        ),
        XField(x: 37, y: 229, w: 355, h: 51, hint: AppContent.fieldName,
            hintStyle: hint, fill: AppColors.surface),
        XField(x: 37, y: 287, w: 355, h: 51, hint: AppContent.fieldEmail,
            hintStyle: hint, fill: AppColors.surface,
            keyboardType: TextInputType.emailAddress),
        XField(x: 37, y: 345, w: 355, h: 51, hint: AppContent.fieldMobile,
            hintStyle: hint, fill: AppColors.surface,
            keyboardType: TextInputType.phone),
        XField(x: 37, y: 403, w: 355, h: 51, hint: AppContent.fieldCountry,
            hintStyle: hint, fill: AppColors.surface),
        const XText(
          AppContent.passwordHint,
          x: 223,
          y: 474,
          size: 11,
          weight: GW.light,
          color: AppColors.error,
        ),
        XField(x: 37, y: 487, w: 355, h: 51, hint: AppContent.fieldPassword,
            hintStyle: hint, fill: AppColors.surface, obscure: true),
        XField(x: 37, y: 545, w: 355, h: 51,
            hint: AppContent.fieldRepeatPassword,
            hintStyle: hint, fill: AppColors.surface, obscure: true),
        const XRect(
            x: 139, y: 611, w: 151, h: 36, color: AppColors.brand, radius: 15),
        const XText(AppContent.signUp, x: 215, y: 635, size: 20,
            weight: GW.medium, color: AppColors.body),
        XTap(x: 139, y: 611, w: 151, h: 36,
            onTap: () => AppRouter.goHome(context)),
        const XText(AppContent.signIn, x: 74, y: 684, size: 20,
            weight: GW.medium, color: AppColors.body),
        XField(x: 37, y: 709, w: 355, h: 51,
            hint: AppContent.fieldEmailOrMobile,
            hintStyle: hint, fill: AppColors.surface),
        XField(x: 37, y: 767, w: 355, h: 51, hint: AppContent.fieldPassword,
            hintStyle: hint, fill: AppColors.surface, obscure: true),
        const XRect(
            x: 139, y: 831, w: 151, h: 36, color: AppColors.brand, radius: 15),
        const XText(AppContent.signIn, x: 215, y: 855, size: 20,
            weight: GW.medium, color: AppColors.body),
        XTap(x: 139, y: 831, w: 151, h: 36,
            onTap: () => AppRouter.goHome(context)),
      ],
    );
  }
}
