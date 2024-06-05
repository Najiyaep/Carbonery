import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String title;
  final String message;
  final DateTime timestamp;

  Notification({
    required this.title,
    required this.message,
    required this.timestamp,
  });

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'],
      message: map['message'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
