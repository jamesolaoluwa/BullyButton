// Script to add sample positive messages to Firestore
// Run with: dart run scripts/add_messages.dart

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../lib/firebase_options.dart';

void main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;
  
  // Extended list of positive messages
  final messages = [
    'You are stronger than you think. Keep going! 💪',
    'Kindness costs nothing but means everything. Spread love! ❤️',
    'Your voice matters. Never be afraid to speak up! 🗣️',
    'Every day is a fresh start. You\'ve got this! 🌟',
    'You are not alone. There are people who care about you! 🤝',
    'It\'s okay to ask for help. That\'s a sign of strength, not weakness. 💙',
    'You deserve to be treated with respect and kindness. Always. ✨',
    'Small acts of kindness can create big ripples of change. 🌊',
    'Your feelings are valid. Don\'t let anyone tell you otherwise. 💜',
    'Standing up for others is one of the bravest things you can do. 🛡️',
    'You are worthy of happiness and peace. Don\'t forget that. 🌈',
    'Together we can create a world where everyone feels safe. 🌍',
    'It\'s okay to not be okay. Take your time, be gentle with yourself. 🦋',
    'You have the power to make a difference. Start with kindness. 💫',
    'Remember: what someone says or does says more about them than you. 🎯',
    'You are enough, just as you are. Believe it. 💎',
    'Courage is not the absence of fear, but action despite it. 🦁',
    'Your mental health matters. Take care of yourself first. 🧠',
    'Empathy is a superpower. Use it to lift others up. 🚀',
    'You are creating a better world by being yourself. Keep shining! ☀️',
    'It takes courage to be kind in a world that can be cruel. You\'re doing great! 🌸',
    'Your story isn\'t over yet. Better days are ahead. 📖',
    'Surround yourself with people who lift you up, not tear you down. 👥',
    'Self-care isn\'t selfish. It\'s necessary. Take time for yourself. 🛁',
    'You are braver than you believe and stronger than you seem. 🐻',
  ];

  print('Adding ${messages.length} positive messages to Firestore...\n');

  int successCount = 0;
  int errorCount = 0;

  for (var i = 0; i < messages.length; i++) {
    try {
      final message = {
        'message': messages[i],
        'author': 'Anonymous',
        'timestamp': Timestamp.now(),
        'likes': 0,
      };

      await firestore.collection('messages').add(message);
      successCount++;
      print('✓ Added message ${i + 1}/${messages.length}: "${messages[i]}"');
    } catch (e) {
      errorCount++;
      print('✗ Error adding message ${i + 1}: $e');
    }

    // Small delay to avoid rate limiting
    await Future.delayed(const Duration(milliseconds: 100));
  }

  print('\n✅ Done! Successfully added $successCount messages.');
  if (errorCount > 0) {
    print('⚠️  Failed to add $errorCount messages.');
  }
  
  // Exit
  exit(0);
}

