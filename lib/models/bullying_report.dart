import 'package:cloud_firestore/cloud_firestore.dart';

/// Model for a bullying report
class BullyingReport {
  final String? id;
  final String description;
  final String? school;
  final String? location;
  final DateTime timestamp;
  final String? userId; // Anonymous user ID
  
  BullyingReport({
    this.id,
    required this.description,
    this.school,
    this.location,
    required this.timestamp,
    this.userId,
  });
  
  /// Convert to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'description': description,
      'school': school ?? '',
      'location': location ?? '',
      'timestamp': Timestamp.fromDate(timestamp),
      'userId': userId ?? '',
    };
  }
  
  /// Create from Firestore document
  factory BullyingReport.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BullyingReport(
      id: doc.id,
      description: data['description'] ?? '',
      school: data['school'],
      location: data['location'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      userId: data['userId'],
    );
  }
}

