import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/glass_button.dart';
import '../widgets/glass_card.dart';
import '../services/firebase_service.dart';
import '../models/positive_message.dart';
import 'package:intl/intl.dart';

/// Positive Messages Feed screen
class PositiveMessagesScreen extends ConsumerStatefulWidget {
  const PositiveMessagesScreen({super.key});
  
  @override
  ConsumerState<PositiveMessagesScreen> createState() => _PositiveMessagesScreenState();
}

class _PositiveMessagesScreenState extends ConsumerState<PositiveMessagesScreen> {
  final _firebaseService = FirebaseService();
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  bool _showAddMessage = false;
  
  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  
  Future<void> _submitMessage() async {
    if (_messageController.text.trim().isEmpty) {
      return;
    }
    
    final message = PositiveMessage(
      message: _messageController.text.trim(),
      author: 'Anonymous',
      timestamp: DateTime.now(),
    );
    
    final success = await _firebaseService.submitPositiveMessage(message);
    
    if (success && mounted) {
      _messageController.clear();
      setState(() {
        _showAddMessage = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message added! Thank you for spreading positivity.'),
          backgroundColor: Colors.green,
        ),
      );
    }
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
                        'Positive Messages',
                        style: AppTextStyles.h1,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _showAddMessage ? Icons.close : Icons.add_circle_outline,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          _showAddMessage = !_showAddMessage;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Add message form
              if (_showAddMessage)
                GlassCard(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Share a positive message',
                        style: AppTextStyles.h3,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _messageController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Write something uplifting...',
                          hintStyle: AppTextStyles.bodyMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                        ),
                        style: AppTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 12),
                      GlassButton(
                        text: 'Share',
                        icon: Icons.send,
                        onPressed: _submitMessage,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              if (_showAddMessage) const SizedBox(height: 16),
              // Messages feed
              Expanded(
                child: StreamBuilder<List<PositiveMessage>>(
                  stream: _firebaseService.getPositiveMessages(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error loading messages: ${snapshot.error}',
                          style: AppTextStyles.bodyMedium,
                        ),
                      );
                    }
                    
                    final messages = snapshot.data ?? [];
                    
                    if (messages.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite_outline,
                              size: 64,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No messages yet.\nBe the first to share positivity!',
                              style: AppTextStyles.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }
                    
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return _MessageCard(message: message, firebaseService: _firebaseService);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  final PositiveMessage message;
  final FirebaseService firebaseService;
  
  const _MessageCard({
    required this.message,
    required this.firebaseService,
  });
  
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.favorite,
                color: AppColors.peachRose,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message.message,
                  style: AppTextStyles.bodyLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '— ${message.author}',
                style: AppTextStyles.caption,
              ),
              const Spacer(),
              Text(
                DateFormat('MMM d, y').format(message.timestamp),
                style: AppTextStyles.caption,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 20),
                onPressed: message.id != null
                    ? () => firebaseService.likeMessage(message.id!)
                    : null,
                color: AppColors.peachRose,
              ),
              Text(
                '${message.likes}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

