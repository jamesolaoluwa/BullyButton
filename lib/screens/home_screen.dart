import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/glass_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/glass_b_logo.dart';
import 'report_screen.dart';
import 'positive_messages_screen.dart';
import 'support_resources_screen.dart';

/// Home/Welcome screen with glassmorphism hero card
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Hero logo - Purple and white glass 'B'
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: const GlassBLogo(size: 100),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Hero title
                  Text(
                    'BullyButton',
                    style: AppTextStyles.heroTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Tagline
                  GlassCard(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Speak Up. Stand Strong. Support Each Other.',
                      style: AppTextStyles.tagline,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Navigation buttons
                  GlassButton(
                    text: 'Report Bullying',
                    icon: Icons.shield_outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const ReportScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GlassButton(
                    text: 'Positive Messages',
                    icon: Icons.favorite_outline,
                    isPrimary: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const PositiveMessagesScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GlassButton(
                    text: 'Support Resources',
                    icon: Icons.help_outline,
                    isPrimary: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const SupportResourcesScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 40,
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

