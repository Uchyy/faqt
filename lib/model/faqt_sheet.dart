import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faqt/model/faqt_category.dart';

class FaqtSheet {
  final String id;
  final String workspaceId;
  final String title;
  final String description;
  final FaqtCategory category;

  final List<String> links;
  final List<String> phoneNumbers;
  final List<String> images;

  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  final bool isPinned;
  final bool isArchived;

  FaqtSheet({
    required this.id,
    required this.workspaceId,
    required this.title,
    required this.description,
    required this.category,
    this.links = const [],
    this.phoneNumbers = const [],
    this.images = const [],
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
    this.isArchived = false,
  });

  // -----------------------------
  // Convert model → Firestore Map
  // -----------------------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'workspaceId': workspaceId,
      'title': title,
      'description': description,
      'category': category.id ,
      'links': links,
      'phoneNumbers': phoneNumbers,
      'images': images,
      'createdBy': createdBy,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'isPinned': isPinned,
      'isArchived': isArchived,
    };
  }

  // -----------------------------
  // Convert Firestore Map → Model
  // -----------------------------
  factory FaqtSheet.fromMap(Map<String, dynamic> map, String documentId) {
    return FaqtSheet(
      id: documentId,
      workspaceId: map['workspaceId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: FaqtCategory.fromId(map['category'] ?? ''),
      links: List<String>.from(map['links'] ?? []),
      phoneNumbers: List<String>.from(map['phoneNumbers'] ?? []),
      images: List<String>.from(map['images'] ?? []),
      createdBy: map['createdBy'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isPinned: map['isPinned'] ?? false,
      isArchived: map['isArchived'] ?? false,
    );
  }
}
