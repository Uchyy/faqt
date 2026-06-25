import 'package:cloud_firestore/cloud_firestore.dart';

class FaqtUser {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  // Hubs the user belongs to
  final List<String> hubs;

  // Optional UX helpers
  final String? lastActiveHubId;
  final String? lastActiveSpaceId;

  final DateTime createdAt;
  final DateTime updatedAt;

  FaqtUser({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
    this.hubs = const [],
    this.lastActiveHubId,
    this.lastActiveSpaceId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'hubs': hubs,
      'lastActiveHubId': lastActiveHubId,
      'lastActiveSpaceId': lastActiveSpaceId,
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
      hubs: List<String>.from(map['hubs'] ?? []),
      lastActiveHubId: map['lastActiveHubId'],
      lastActiveSpaceId: map['lastActiveSpaceId'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
