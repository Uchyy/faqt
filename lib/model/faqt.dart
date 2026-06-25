import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faqt/model/faqt_category.dart';

enum FactPermission {
  ownerOnly,   // only the owner can edit
  editors,     // only users in editorIds can edit
  hubMembers,  // any hub member can edit
}

class Faqt {
  final String id;
  final String hubId;

  final String title;
  final String? description;

  // NEW CONTENT FIELDS
  final FaqtCategory category;
  final List<String> links;
  final List<String> images;
  final List<String> phoneNumbers;

  // Ownership + editing
  final String createdBy;        
  final String ownerId;          
  final List<String> editorIds;  

  // Visibility
  final bool isGlobal;           
  final List<String> spaceIds;   

  // Permissions
  final FactPermission permission;

  final DateTime createdAt;
  final DateTime updatedAt;

  Faqt({
    required this.id,
    required this.hubId,
    required this.title,
    this.description,
    required this.category,
    this.links = const [],
    this.images = const [],
    this.phoneNumbers = const [],
    required this.createdBy,
    required this.ownerId,
    this.editorIds = const [],
    this.isGlobal = false,
    this.spaceIds = const [],
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'hubId': hubId,
      'title': title,
      'description': description,
      'category': category.toString(),
      'links': links,
      'images': images,
      'phoneNumbers': phoneNumbers,
      'createdBy': createdBy,
      'ownerId': ownerId,
      'editorIds': editorIds,
      'isGlobal': isGlobal,
      'spaceIds': spaceIds,
      'permission': permission.toString(),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory Faqt.fromMap(Map<String, dynamic> map, String documentId) {
    return Faqt(
      id: documentId,
      hubId: map['hubId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      category: FaqtCategory.values.firstWhere(
        (c) => c.toString() == map['category'],
        orElse: () => FaqtCategory.notes,
      ),
      links: List<String>.from(map['links'] ?? []),
      images: List<String>.from(map['images'] ?? []),
      phoneNumbers: List<String>.from(map['phoneNumbers'] ?? []),
      createdBy: map['createdBy'] ?? '',
      ownerId: map['ownerId'] ?? '',
      editorIds: List<String>.from(map['editorIds'] ?? []),
      isGlobal: map['isGlobal'] ?? false,
      spaceIds: List<String>.from(map['spaceIds'] ?? []),
      permission: FactPermission.values.firstWhere(
        (v) => v.toString() == map['permission'],
        orElse: () => FactPermission.ownerOnly,
      ),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Faqt copyWith({
    String? title,
    String? description,
    FaqtCategory? category,
    List<String>? links,
    List<String>? images,
    List<String>? phoneNumbers,
    List<String>? editorIds,
    bool? isGlobal,
    List<String>? spaceIds,
    FactPermission? permission,
    DateTime? updatedAt,
  }) {
    return Faqt(
      id: id,
      hubId: hubId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      links: links ?? this.links,
      images: images ?? this.images,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      createdBy: createdBy,
      ownerId: ownerId,
      editorIds: editorIds ?? this.editorIds,
      isGlobal: isGlobal ?? this.isGlobal,
      spaceIds: spaceIds ?? this.spaceIds,
      permission: permission ?? this.permission,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
