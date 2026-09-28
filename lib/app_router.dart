import 'package:flutter/material.dart';

import 'screens/add_debt_step1_screen.dart';
import 'screens/add_debt_step2_screen.dart';
import 'screens/debt_saved_screen.dart';
import 'screens/debts_screen.dart';
import 'screens/goals_screen.dart';
import 'screens/home_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';

/// Screen-to-screen navigation, mirroring the XD prototype wiring.
/// The prototype uses "none" transitions, so routes switch instantly.
abstract final class AppRouter {
  static const splash = '/';
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const home = '/home';
  static const debts = '/debts';
  static const addDebt1 = '/debts/add/1';
  static const addDebt2 = '/debts/add/2';
  static const debtSaved = '/debts/saved';
  static const goals = '/goals';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      splash => const SplashScreen(),
      welcome => const WelcomeScreen(),
      signup => const SignupScreen(),
      home => const HomeScreen(),
      debts => DebtsScreen(
          initialTab: (settings.arguments as int?) ?? 0,
        ),
      addDebt1 => const AddDebtStep1Screen(),
      addDebt2 => const AddDebtStep2Screen(),
      debtSaved => const DebtSavedScreen(),
      goals => const GoalsScreen(),
      _ => const SplashScreen(),
    };
    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (_, _, _) => page,
    );
  }

  // Tab destinations replace the whole stack so the tab bar never nests.
  static void goHome(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(context, home, (_) => false);
  static void goDebts(BuildContext context, {int tab = 0}) =>
      Navigator.pushNamedAndRemoveUntil(context, debts, (_) => false,
          arguments: tab);
  static void goGoals(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(context, goals, (_) => false);
}
