import 'package:flutter/material.dart';

enum FaqtCategory {
  contacts(
    id: "contacts",
    label: "Contacts",
    color: Color(0xFFFCE4EC), // pastel pink
    icon: Icons.phone,
  ),

  howTo(
    id: "howto",
    label: "How‑To",
    color: Color(0xFFFFF9C4), // pastel yellow
    icon: Icons.help_outline,
  ),

  utilities(
    id: "utilities",
    label: "Utilities",
    color: Color(0xFFE1BEE7), // pastel purple
    icon: Icons.bolt,
  ),

  links(
    id: "links",
    label: "Links",
    color: Color(0xFFE8F5E9), // pastel green
    icon: Icons.link,
  ),

  notes(
    id: "notes",
    label: "Notes",
    color: Color(0xFFE0E0E0), // pastel grey
    icon: Icons.note,
  ),

  media(
    id: "media",
    label: "Media",
    color: Color(0xFFE0F7FA), // pastel teal
    icon: Icons.image,
  );

  final String id;
  final String label;
  final Color color;
  final IconData icon;

  const FaqtCategory({
    required this.id,
    required this.label,
    required this.color,
    required this.icon,
  });

  // Convert string → enum
  static FaqtCategory fromId(String id) {
    return FaqtCategory.values.firstWhere(
      (c) => c.id == id,
      orElse: () => FaqtCategory.notes,
    );
  }
}
