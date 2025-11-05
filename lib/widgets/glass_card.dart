import 'package:flutter/material.dart';
import '../utils/glass_effect.dart';

/// Reusable glass card widget
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
  });
  
  @override
  Widget build(BuildContext context) {
    return GlassEffect.glassCard(
      onTap: onTap,
      padding: padding ?? const EdgeInsets.all(20),
      margin: margin,
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

