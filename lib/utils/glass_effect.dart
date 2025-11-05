import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/app_colors.dart';

/// Utility for creating glassmorphism effects
class GlassEffect {
  /// Creates a glassmorphism container with blur and transparency
  static Widget glassContainer({
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? borderColor,
    double borderWidth = 1.5,
    double blur = 10.0,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        border: Border.all(
          color: borderColor ?? AppColors.glassBorder,
          width: borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.glassBackground,
              borderRadius: borderRadius ?? BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
  
  /// Creates a glass card with hover effect
  static Widget glassCard({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: glassContainer(
          child: child,
          padding: padding ?? const EdgeInsets.all(20),
          margin: margin,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

