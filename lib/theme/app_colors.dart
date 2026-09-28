import 'package:flutter/material.dart';

/// Every colour used in the XD file, named by role.
abstract final class AppColors {
  // Brand
  static const brand = Color(0xFF6CFF93); // splash, primary buttons, pills
  static const accent = Color(0xFF04DE71); // progress fill, ring, links
  static const accentAlt = Color(0xFF29E16E); // goals progress, active dot
  static const accentSoft = Color(0xFFD3FBE3); // section icon circles
  static const accentTint = Color(0xFFF1FEF5); // selected option / quote card
  static const accentChip = Color(0xFFE8FCF0); // OMR chip, Active chip
  static const accentBorder = Color(0xFF73D59A); // chip / selected borders

  // Text
  static const heading = Color(0xFF1F1616);
  static const body = Color(0xFF484848);
  static const amount = Color(0xFF363636);
  static const muted = Color(0xFF727272);
  static const hint = Color(0xFF909090);
  static const placeholder = Color(0xFFA3A3A3);
  static const label = Color(0xFF656565);
  static const arabicMuted = Color(0xFF535353);
  static const near = Color(0xFF0F0F0D);
  static const nearAlt = Color(0xFF080808);
  static const nearDark = Color(0xFF210D0D);
  static const saved = Color(0xFF060F09);
  static const fullPayment = Color(0xFF000B02);
  static const witnessNote = Color(0xFF382828);
  static const counter = Color(0xFF9F9F9F);

  // Semantic
  static const paid = Color(0xFF38BD5A);
  static const remaining = Color(0xFFDB2929);
  static const error = Color(0xFFBF1C1C);
  static const badge = Color(0xFFF0142F);

  // Surfaces
  static const white = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF4F4F4);
  static const card = Color(0xFFF8F8F8);
  static const navBar = Color(0xFFF2F2F2);
  static const segment = Color(0xFFEDEDED);
  static const track = Color(0xFFDDDDDD);
  static const ringTrack = Color(0xFFD8D8D8);
  static const dot = Color(0xFFF5F5F5);
  static const chevron = Color(0xFFCCCCCC);
  static const iconMuted = Color(0xFFC1C1C1);
  static const hairline = Color(0xFF707070);

  // Navigation icons
  static const navActive = Color(0xFF343434);
  static const navInactive = Color(0xFF909090);
}
