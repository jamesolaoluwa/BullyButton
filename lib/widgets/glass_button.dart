import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_shadows.dart';
import '../utils/glass_effect.dart';

/// Glassmorphism button with glow effect and haptic feedback
class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;
  final double? width;
  
  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.width,
  });
  
  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  Future<void> _handleTap() async {
    // Light haptic feedback
    HapticFeedback.lightImpact();
    _controller.forward();
    await Future.delayed(const Duration(milliseconds: 150));
    _controller.reverse();
    widget.onPressed?.call();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: widget.onPressed != null ? _handleTap : null,
        child: Container(
          width: widget.width,
          height: 56,
          decoration: BoxDecoration(
            gradient: widget.isPrimary
                ? AppColors.buttonGradient
                : null,
            color: widget.isPrimary ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: widget.isPrimary
                ? null
                : Border.all(color: AppColors.royalBlue, width: 2),
            boxShadow: widget.isPrimary ? AppShadows.buttonGlow : null,
          ),
          child: GlassEffect.glassContainer(
            borderRadius: BorderRadius.circular(16),
            blur: widget.isPrimary ? 0 : 5,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      color: widget.isPrimary
                          ? AppColors.textLight
                          : AppColors.royalBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style: widget.isPrimary
                        ? AppTextStyles.buttonPrimary
                        : AppTextStyles.buttonSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

