import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faqt/model/faqt_sheet.dart';
import 'package:faqt/model/user.dart';

class Workspace {
  final String id;
  final String name;
  final String? description;
  final String ownerId;

  // These are NOT stored directly in Firestore
  final List<FaqtSheet> sheets;
  final List<FaqtUser> members;

  final List<String> sheetIds;   // stored in Firestore
  final List<String> memberIds;  // stored in Firestore

  final DateTime createdAt;
  final DateTime updatedAt;

  Workspace({
    required this.id,
    required this.name,
    this.description,
    required this.ownerId,
    this.sheets = const [],
    this.members = const [],
    this.sheetIds = const [],
    this.memberIds = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // -----------------------------
  // Convert model → Firestore Map
  // -----------------------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ownerId': ownerId,
      'sheetIds': sheetIds,
      'memberIds': memberIds,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // -----------------------------
  // Convert Firestore Map → Model
  // -----------------------------
  factory Workspace.fromMap(Map<String, dynamic> map, String documentId) {
    return Workspace(
      id: documentId,
      name: map['name'] ?? '',
      description: map['description'],
      ownerId: map['ownerId'] ?? '',
      sheetIds: List<String>.from(map['sheetIds'] ?? []),
      memberIds: List<String>.from(map['memberIds'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // -----------------------------
  // Helper: copyWith
  // -----------------------------
  Workspace copyWith({
    String? name,
    String? description,
    List<FaqtSheet>? sheets,
    List<FaqtUser>? members,
    List<String>? sheetIds,
    List<String>? memberIds,
    DateTime? updatedAt,
  }) {
    return Workspace(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId,
      sheets: sheets ?? this.sheets,
      members: members ?? this.members,
      sheetIds: sheetIds ?? this.sheetIds,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
