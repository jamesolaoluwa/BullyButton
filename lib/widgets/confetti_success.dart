import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

/// Confetti animation for success states
class ConfettiSuccess extends StatefulWidget {
  final Widget child;
  final bool trigger;
  
  const ConfettiSuccess({
    super.key,
    required this.child,
    required this.trigger,
  });
  
  @override
  State<ConfettiSuccess> createState() => _ConfettiSuccessState();
}

class _ConfettiSuccessState extends State<ConfettiSuccess> {
  late ConfettiController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 2));
  }
  
  @override
  void didUpdateWidget(ConfettiSuccess oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger && !oldWidget.trigger) {
      _controller.play();
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: pi / 2,
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.05,
            numberOfParticles: 50,
            gravity: 0.1,
            colors: const [
              Color(0xFFE3F2FD),
              Color(0xFFF9E0FF),
              Color(0xFFE8FFE6),
              Color(0xFFFFC6D4),
              Color(0xFF1976D2),
              Color(0xFF9C27B0),
            ],
          ),
        ),
      ],
    );
  }
}

