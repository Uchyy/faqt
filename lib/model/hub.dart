import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faqt/model/space.dart';
import 'package:faqt/model/user.dart';

enum HubVisibility {
  public,
  private,
}

enum HubType {
  personal,
  business,
  organization,
}

class Hub {
  final String id;
  final String name;
  final String? description;
  final String ownerId;

  // NOT stored directly in Firestore
  final List<Space> spaces;
  final List<FaqtUser> members;

  // Stored in Firestore
  final List<String> spaceIds;
  final List<String> memberIds;

  final DateTime createdAt;
  final DateTime updatedAt;

  final HubVisibility visibility;
  final HubType type;

  Hub({
    required this.id,
    required this.name,
    this.description,
    required this.ownerId,
    this.spaces = const [],
    this.members = const [],
    this.spaceIds = const [],
    this.memberIds = const [],
    required this.createdAt,
    required this.updatedAt,
    required this.visibility,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ownerId': ownerId,
      'spaceIds': spaceIds,
      'memberIds': memberIds,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'visibility': visibility.toString(),
      'type': type.toString(),
    };
  }

  factory Hub.fromMap(Map<String, dynamic> map, String documentId) {
    return Hub(
      id: documentId,
      name: map['name'] ?? '',
      description: map['description'],
      ownerId: map['ownerId'] ?? '',
      spaceIds: List<String>.from(map['spaceIds'] ?? []),
      memberIds: List<String>.from(map['memberIds'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      visibility: HubVisibility.values.firstWhere(
        (v) => v.toString() == map['visibility'],
        orElse: () => HubVisibility.private,
      ),
      type: HubType.values.firstWhere(
        (v) => v.toString() == map['type'],
        orElse: () => HubType.personal,
      ),
    );
  }

  Hub copyWith({
    String? name,
    String? description,
    List<Space>? spaces,
    List<FaqtUser>? members,
    List<String>? spaceIds,
    List<String>? memberIds,
    DateTime? updatedAt,
  }) {
    return Hub(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId,
      spaces: spaces ?? this.spaces,
      members: members ?? this.members,
      spaceIds: spaceIds ?? this.spaceIds,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      visibility: visibility,
      type: type,
    );
  }
}
