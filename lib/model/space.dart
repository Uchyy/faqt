import 'package:cloud_firestore/cloud_firestore.dart';

enum SpaceRole {
  viewer,   // can only view facts
  editor,   // can edit facts
  admin,    // can manage space + members
}

class Space {
  final String id;
  final String hubId;

  final String name;
  final String? description;

  // NEW FIELDS
  final String createdBy;     // user who created the space
  final String ownerId;       // user who owns the space
  final List<String> editorIds; // users who can edit the space

  // Stored in Firestore
  final List<String> memberIds; // users who can access the space
  final List<String> factIds;   // facts linked to this space

  final DateTime createdAt;
  final DateTime updatedAt;

  Space({
    required this.id,
    required this.hubId,
    required this.name,
    this.description,
    required this.createdBy,
    required this.ownerId,
    this.editorIds = const [],
    this.memberIds = const [],
    this.factIds = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'hubId': hubId,
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'ownerId': ownerId,
      'editorIds': editorIds,
      'memberIds': memberIds,
      'factIds': factIds,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory Space.fromMap(Map<String, dynamic> map, String documentId) {
    return Space(
      id: documentId,
      hubId: map['hubId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'],
      createdBy: map['createdBy'] ?? '',
      ownerId: map['ownerId'] ?? '',
      editorIds: List<String>.from(map['editorIds'] ?? []),
      memberIds: List<String>.from(map['memberIds'] ?? []),
      factIds: List<String>.from(map['factIds'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Space copyWith({
    String? name,
    String? description,
    List<String>? editorIds,
    List<String>? memberIds,
    List<String>? factIds,
    DateTime? updatedAt,
  }) {
    return Space(
      id: id,
      hubId: hubId,
      name: name ?? this.name,
      description: description ?? this.description,
      createdBy: createdBy,
      ownerId: ownerId,
      editorIds: editorIds ?? this.editorIds,
      memberIds: memberIds ?? this.memberIds,
      factIds: factIds ?? this.factIds,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
