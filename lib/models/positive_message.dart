import 'package:cloud_firestore/cloud_firestore.dart';

/// Model for a positive message in the feed
class PositiveMessage {
  final String? id;
  final String message;
  final String author; // Can be "Anonymous" or user name
  final DateTime timestamp;
  final int likes;
  
  PositiveMessage({
    this.id,
    required this.message,
    this.author = 'Anonymous',
    required this.timestamp,
    this.likes = 0,
  });
  
  /// Convert to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'message': message,
      'author': author,
      'timestamp': Timestamp.fromDate(timestamp),
      'likes': likes,
    };
  }
  
  /// Create from Firestore document
  factory PositiveMessage.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PositiveMessage(
      id: doc.id,
      message: data['message'] ?? '',
      author: data['author'] ?? 'Anonymous',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      likes: (data['likes'] ?? 0) as int,
    );
  }
}

