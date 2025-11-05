import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/bullying_report.dart';
import '../models/positive_message.dart';

/// Service for Firebase operations
class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  /// Sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print('Error signing in anonymously: $e');
      return null;
    }
  }
  
  /// Submit a bullying report
  Future<bool> submitReport(BullyingReport report) async {
    try {
      // Ensure user is authenticated
      if (_auth.currentUser == null) {
        await signInAnonymously();
      }
      
      await _firestore.collection('reports').add(report.toFirestore());
      return true;
    } catch (e) {
      print('Error submitting report: $e');
      return false;
    }
  }
  
  /// Get all positive messages, ordered by timestamp
  Stream<List<PositiveMessage>> getPositiveMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => PositiveMessage.fromFirestore(doc))
          .toList();
    });
  }
  
  /// Submit a positive message
  Future<bool> submitPositiveMessage(PositiveMessage message) async {
    try {
      // Ensure user is authenticated
      if (_auth.currentUser == null) {
        await signInAnonymously();
      }
      
      await _firestore.collection('messages').add(message.toFirestore());
      return true;
    } catch (e) {
      print('Error submitting message: $e');
      return false;
    }
  }
  
  /// Like a positive message
  Future<void> likeMessage(String messageId) async {
    try {
      await _firestore.collection('messages').doc(messageId).update({
        'likes': FieldValue.increment(1),
      });
    } catch (e) {
      print('Error liking message: $e');
    }
  }
}

