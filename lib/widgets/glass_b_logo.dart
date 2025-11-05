import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Glass 'B' logo with purple and white styling
class GlassBLogo extends StatelessWidget {
  final double size;
  
  const GlassBLogo({
    super.key,
    this.size = 100,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF9C27B0), // Purple
            Color(0xFF7B1FA2), // Darker purple
            Color(0xFFBA68C8), // Lighter purple
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpleAccent.withOpacity(0.4),
            blurRadius: 30,
            spreadRadius: 8,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2.5,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.white.withOpacity(0.1),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'B',
                style: AppTextStyles.heroTitle.copyWith(
                  fontSize: size * 0.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                    Shadow(
                      color: AppColors.purpleAccent.withOpacity(0.5),
                      offset: const Offset(0, 0),
                      blurRadius: 8,
                    ),
                  ],
                  letterSpacing: -2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

