import 'package:flutter/material.dart';

/// Font weights as named in the XD file (Gotham Rounded styles).
enum GW { light, book, medium, bold }

/// Typography helpers.
///
/// The design uses Gotham Rounded (a licensed font). The family name is kept
/// as `Gotham Rounded` in pubspec so the real font files can be dropped in
/// later without touching code. Until then the family is backed by Nunito.
abstract final class AppFonts {
  static const gotham = 'Gotham Rounded';
  static const tajawal = 'Tajawal';
  static const poppins = 'Poppins';

  /// Nunito variable-font weight per Gotham style.
  static const _wght = {
    GW.light: 300.0,
    GW.book: 400.0,
    GW.medium: 600.0,
    GW.bold: 700.0,
  };

  static const _fw = {
    GW.light: FontWeight.w300,
    GW.book: FontWeight.w400,
    GW.medium: FontWeight.w600,
    GW.bold: FontWeight.w700,
  };

  /// Builds a style matching an XD text node.
  ///
  /// [tracking] is XD's character spacing in 1/1000 em (the file uses -25
  /// almost everywhere). [lineHeight] is the baseline-to-baseline distance in
  /// px for multi-line text, read from XD's line offsets.
  static TextStyle style({
    String family = gotham,
    required double size,
    GW weight = GW.book,
    Color color = Colors.black,
    double tracking = -25,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: size,
      fontWeight: _fw[weight],
      fontVariations: family == gotham
          ? [FontVariation('wght', _wght[weight]!)]
          : null,
      color: color,
      letterSpacing: tracking / 1000 * size,
      height: lineHeight == null ? null : lineHeight / size,
      leadingDistribution: TextLeadingDistribution.even,
      decoration: TextDecoration.none,
    );
  }
}
