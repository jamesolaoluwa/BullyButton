import 'package:flutter/material.dart';

/// App color palette with glassmorphism-friendly colors
class AppColors {
  // Primary color palette - soft, supportive gradients
  static const Color lightSky = Color(0xFFE3F2FD);
  static const Color lavenderTint = Color(0xFFF9E0FF);
  static const Color mint = Color(0xFFE8FFE6);
  static const Color peachRose = Color(0xFFFFC6D4);
  
  // Accent colors for CTAs
  static const Color royalBlue = Color(0xFF1976D2);
  static const Color purpleAccent = Color(0xFF9C27B0);
  
  // Glassmorphism colors
  static const Color glassWhite = Color(0xFFFFFFFF);
  static const Color glassWhiteLight = Color(0x80FFFFFF);
  static const Color glassWhiteLighter = Color(0x40FFFFFF);
  
  // Text colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C6C6C);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // Background gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightSky, lavenderTint, mint],
    stops: [0.0, 0.5, 1.0],
  );
  
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [peachRose, lavenderTint],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [royalBlue, purpleAccent],
  );
  
  // Glass effect colors
  static Color get glassBackground => glassWhite.withOpacity(0.25);
  static Color get glassBorder => glassWhite.withOpacity(0.18);
}

