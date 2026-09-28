import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

/// The XD artboards are 428 x 926 (iPhone 14 Plus). Every screen is laid out
/// on that canvas with the exact coordinates from the design file and scaled
/// to the device width. Content taller than the viewport scrolls.
class DesignCanvas extends StatelessWidget {
  const DesignCanvas({
    super.key,
    required this.children,
    this.background = AppColors.white,
    this.bottomBar,
    this.height = designHeight,
    this.onTap,
  });

  static const double designWidth = 428;
  static const double designHeight = 926;

  final List<Widget> children;
  final Color background;

  /// A widget pinned to the bottom of the viewport (the tab bar). It is laid
  /// out on its own 428 x [BottomBarCanvas.height] canvas.
  final Widget? bottomBar;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final scale = constraints.maxWidth / designWidth;
            final barSpace =
                bottomBar == null ? 0.0 : BottomBarCanvas.height * scale;
            Widget content = SingleChildScrollView(
              padding: EdgeInsets.only(bottom: barSpace + bottomInset),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: designWidth,
                  height: height,
                  child: Stack(clipBehavior: Clip.none, children: children),
                ),
              ),
            );
            if (onTap != null) {
              content = GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTap,
                child: content,
              );
            }
            if (bottomBar == null) return content;
            return Stack(
              children: [
                content,
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottomInset),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: designWidth,
                        height: BottomBarCanvas.height,
                        child: Stack(children: [bottomBar!]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Coordinate frame for [DesignCanvas.bottomBar]: the XD tab bar sits at
/// y = 835 on a 926 canvas, so the pinned strip is the bottom 91 px.
abstract final class BottomBarCanvas {
  static const double top = 835;
  static const double height = DesignCanvas.designHeight - top;
}

enum XAlign { left, center, right }

/// Text placed by its XD anchor: [x] is the alignment anchor and [y] is the
/// baseline of the first line. The widget measures the glyphs so the
/// baseline lands exactly on [y] whichever font is loaded.
class XText extends StatelessWidget {
  const XText(
    this.text, {
    super.key,
    required this.x,
    required this.y,
    required this.size,
    this.weight = GW.book,
    this.color = Colors.black,
    this.align = XAlign.center,
    this.family = AppFonts.gotham,
    this.tracking = -25,
    this.lineHeight,
    this.opacity = 1,
    this.maxWidth,
  });

  final String text;
  final double x;
  final double y;
  final double size;
  final GW weight;
  final Color color;
  final XAlign align;
  final String family;
  final double tracking;
  final double? lineHeight;
  final double opacity;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final style = AppFonts.style(
      family: family,
      size: size,
      weight: weight,
      color: opacity == 1 ? color : color.withValues(alpha: opacity),
      tracking: tracking,
      lineHeight: lineHeight,
    );
    final textAlign = switch (align) {
      XAlign.left => TextAlign.left,
      XAlign.center => TextAlign.center,
      XAlign.right => TextAlign.right,
    };
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      textScaler: TextScaler.noScaling,
    )..layout(maxWidth: maxWidth ?? double.infinity);
    final baseline =
        painter.computeDistanceToActualBaseline(TextBaseline.alphabetic);
    final w = painter.width;
    final left = switch (align) {
      XAlign.left => x,
      XAlign.center => x - w / 2,
      XAlign.right => x - w,
    };
    return Positioned(
      left: left,
      top: y - baseline,
      width: w,
      height: painter.height,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        textScaler: TextScaler.noScaling,
        softWrap: true,
      ),
    );
  }
}

/// A rectangle from the design (optionally rounded / stroked).
class XRect extends StatelessWidget {
  const XRect({
    super.key,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    this.color,
    this.radius = 0,
    this.borderColor,
    this.borderWidth = 1,
    this.opacity = 1,
    this.child,
  });

  final double x, y, w, h;
  final Color? color;
  final double radius;
  final Color? borderColor;
  final double borderWidth;
  final double opacity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: h,
      child: Opacity(
        opacity: opacity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!, width: borderWidth),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A circle given by its top-left corner and diameter.
class XCircle extends StatelessWidget {
  const XCircle({
    super.key,
    required this.x,
    required this.y,
    required this.d,
    required this.color,
  });

  final double x, y, d;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: d,
      height: d,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

/// A 1 px hairline (XD "Line").
class XLine extends StatelessWidget {
  const XLine({
    super.key,
    required this.x,
    required this.y,
    this.w = 1,
    this.h = 1,
    this.color = AppColors.hairline,
    this.opacity = 1,
  });

  final double x, y, w, h;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: h,
      child: ColoredBox(color: color.withValues(alpha: opacity)),
    );
  }
}

/// An SVG exported from the XD file, placed at its design bounds.
class XSvg extends StatelessWidget {
  const XSvg(
    this.name, {
    super.key,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    this.color,
  });

  final String name;
  final double x, y, w, h;

  /// Tints every path (used for the tab-bar icons' active/inactive states).
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: h,
      child: SvgPicture.asset(
        'assets/icons/$name.svg',
        width: w,
        height: h,
        fit: BoxFit.fill,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}

/// An invisible tap target covering a design rectangle.
class XTap extends StatelessWidget {
  const XTap({
    super.key,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    required this.onTap,
  });

  final double x, y, w, h;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: h,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: const SizedBox.expand(),
      ),
    );
  }
}

/// A text input drawn as the design's field box, with the XD label as hint.
class XField extends StatelessWidget {
  const XField({
    super.key,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
    required this.hint,
    required this.hintStyle,
    this.textStyle,
    this.fill = AppColors.white,
    this.radius = 7,
    this.paddingLeft = 8,
    this.paddingRight = 8,
    this.keyboardType,
    this.obscure = false,
    this.maxLines = 1,
    this.alignTop = false,
    this.controller,
  });

  final double x, y, w, h;
  final String hint;
  final TextStyle hintStyle;
  final TextStyle? textStyle;
  final Color fill;
  final double radius;
  final double paddingLeft;
  final double paddingRight;
  final TextInputType? keyboardType;
  final bool obscure;
  final int? maxLines;
  final bool alignTop;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      width: w,
      height: h,
      child: Container(
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: alignTop ? 12 : 0,
        ),
        alignment: alignTop ? Alignment.topLeft : Alignment.centerLeft,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          maxLines: maxLines,
          textAlignVertical:
              alignTop ? TextAlignVertical.top : TextAlignVertical.center,
          cursorColor: AppColors.accent,
          style: textStyle ?? hintStyle.copyWith(color: AppColors.heading),
          decoration: InputDecoration.collapsed(
            hintText: hint,
            hintStyle: hintStyle,
          ),
        ),
      ),
    );
  }
}
