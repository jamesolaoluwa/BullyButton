import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../models/support_resource.dart';
import 'glass_card.dart';

/// Expandable tile for support resources
class ExpandableResourceTile extends StatefulWidget {
  final SupportResource resource;
  
  const ExpandableResourceTile({
    super.key,
    required this.resource,
  });
  
  @override
  State<ExpandableResourceTile> createState() => _ExpandableResourceTileState();
}

class _ExpandableResourceTileState extends State<ExpandableResourceTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 16),
      onTap: _toggleExpanded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.resource.icon,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.resource.title,
                      style: AppTextStyles.h3,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.resource.description,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
              RotationTransition(
                turns: _rotationAnimation,
                child: const Icon(
                  Icons.expand_more,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          if (_isExpanded) ...[
            const SizedBox(height: 16),
            ...widget.resource.bulletPoints.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 18)),
                      Expanded(
                        child: Text(
                          point,
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )),
            if (widget.resource.link != null) ...[
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  // Handle link tap
                },
                child: Text(
                  'Learn more →',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.royalBlue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

