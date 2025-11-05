import 'package:flutter/material.dart';

/// Glassmorphism shadow effects
class AppShadows {
  // Glass card shadows - soft glow effect
  static List<BoxShadow> get glassShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.2),
          blurRadius: 6,
          offset: const Offset(0, -2),
          spreadRadius: 0,
        ),
      ];
  
  // Button glow shadow
  static List<BoxShadow> get buttonGlow => [
        BoxShadow(
          color: const Color(0xFF1976D2).withOpacity(0.4),
          blurRadius: 20,
          offset: const Offset(0, 8),
          spreadRadius: 2,
        ),
      ];
  
  // Card hover shadow
  static List<BoxShadow> get cardHover => [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 30,
          offset: const Offset(0, 15),
          spreadRadius: 0,
        ),
      ];
  
  // Inner glow for glass effect
  static List<BoxShadow> get innerGlow => [
        BoxShadow(
          color: Colors.white.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 0),
          spreadRadius: -2,
        ),
      ];
}

