import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/expandable_resource_tile.dart';
import '../widgets/glass_card.dart';
import '../models/support_resource.dart';

/// Support Resources screen with expandable sections
class SupportResourcesScreen extends StatelessWidget {
  const SupportResourcesScreen({super.key});
  
  // Sample support resources
  static final List<SupportResource> _resources = [
    SupportResource(
      title: 'What to do if you\'re being bullied',
      description: 'Steps you can take to protect yourself and get help',
      icon: '🛟',
      bulletPoints: [
        'Tell someone you trust - a teacher, parent, or counselor',
        'Stay calm and don\'t react aggressively',
        'Keep evidence - save messages, take screenshots',
        'Avoid being alone in places where bullying happens',
        'Remember: it\'s not your fault',
        'You have the right to feel safe',
      ],
      link: 'https://www.stopbullying.gov/what-you-can-do',
    ),
    SupportResource(
      title: 'How to support someone else',
      description: 'Be an upstander and help others who are being bullied',
      icon: '💛',
      bulletPoints: [
        'Speak up if you see bullying happening',
        'Be a friend to someone who\'s being bullied',
        'Include everyone - don\'t leave anyone out',
        'Report bullying to a trusted adult',
        'Show kindness and empathy',
        'Stand up for what\'s right, even when it\'s hard',
      ],
      link: 'https://www.stopbullying.gov/prevention/be-more-than-a-bystander',
    ),
    SupportResource(
      title: 'Understanding bullying',
      description: 'Learn about different types of bullying and their effects',
      icon: '🧠',
      bulletPoints: [
        'Physical bullying: hitting, pushing, or damaging property',
        'Verbal bullying: name-calling, teasing, threats',
        'Social bullying: spreading rumors, excluding others',
        'Cyberbullying: online harassment, mean messages',
        'All forms of bullying are serious and harmful',
        'Everyone deserves respect and kindness',
      ],
      link: 'https://www.stopbullying.gov/bullying/what-is-bullying',
    ),
    SupportResource(
      title: 'Getting help and support',
      description: 'Crisis contacts and resources for immediate help',
      icon: '🤝',
      bulletPoints: [
        'National Suicide Prevention Lifeline: 988',
        'Crisis Text Line: Text HOME to 741741',
        'StopBullying.gov: Official anti-bullying resources',
        'Talk to your school counselor or principal',
        'Reach out to a trusted teacher or adult',
        'Remember: asking for help is a sign of strength',
      ],
      link: 'https://www.stopbullying.gov/get-help-now',
    ),
  ];
  
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
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Support Resources',
                        style: AppTextStyles.h1,
                      ),
                    ),
                  ],
                ),
              ),
              // Resources list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You\'re not alone',
                            style: AppTextStyles.h2,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'These resources are here to help you understand bullying, protect yourself, and support others.',
                            style: AppTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ..._resources.map((resource) => ExpandableResourceTile(
                          resource: resource,
                        )),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

