import 'package:cloud_firestore/cloud_firestore.dart';

class FaqtUser {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;
  final List<String> workspaces;
  final DateTime createdAt;
  final DateTime updatedAt;

  FaqtUser({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
    this.workspaces = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'workspaces': workspaces,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory FaqtUser.fromMap(Map<String, dynamic> map, String documentId) {
    return FaqtUser(
      id: documentId,
      email: map['email'] ?? '',
      name: map['name'],
      photoUrl: map['photoUrl'],
      workspaces: List<String>.from(map['workspaces'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
