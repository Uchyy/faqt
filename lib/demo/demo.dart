import 'package:faqt/model/faqt_category.dart';
import 'package:faqt/model/faqt_sheet.dart';
import 'package:faqt/model/user.dart';
import 'package:faqt/model/workspaces.dart';

// -----------------------------
// DEMO USERS
// -----------------------------
final demoUsers = <FaqtUser>[
  FaqtUser(
    id: "user_1",
    email: "alice@example.com",
    name: "Alice Johnson",
    photoUrl: null,
    workspaces: ["ws_1", "ws_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_2",
    email: "ben@example.com",
    name: "Ben Carter",
    photoUrl: null,
    workspaces: ["ws_1"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_3",
    email: "chloe@example.com",
    name: "Chloe Smith",
    photoUrl: null,
    workspaces: ["ws_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_4",
    email: "david@example.com",
    name: "David Lee",
    photoUrl: null,
    workspaces: ["ws_1"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];

// -----------------------------
// DEMO SHEETS
// -----------------------------
final demoSheets = <FaqtSheet>[
  FaqtSheet(
    id: "sheet_1",
    workspaceId: "ws_1",
    title: "WiFi Password",
    description: "Router is in the hallway. SSID: HomeNet",
    category: FaqtCategory.utilities,
    links: [],
    phoneNumbers: [],
    images: [],
    createdBy: "user_1",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtSheet(
    id: "sheet_2",
    workspaceId: "ws_1",
    title: "Landlord Contact",
    description: "Call only for emergencies.",
    category: FaqtCategory.contacts,
    links: [],
    phoneNumbers: ["+44 7123 456789"],
    images: [],
    createdBy: "user_2",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtSheet(
    id: "sheet_3",
    workspaceId: "ws_2",
    title: "Deployment Link",
    description: "Production dashboard for monitoring.",
    category: FaqtCategory.links,
    links: ["https://dashboard.example.com"],
    phoneNumbers: [],
    images: [],
    createdBy: "user_3",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtSheet(
    id: "sheet_4",
    workspaceId: "ws_2",
    title: "How to Reset Server",
    description: "Step-by-step instructions for rebooting.",
    category: FaqtCategory.howTo,
    links: [],
    phoneNumbers: [],
    images: [],
    createdBy: "user_4",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];

// -----------------------------
// DEMO WORKSPACES
// -----------------------------
final demoWorkspaces = <Workspace>[
  // 1. Personal flat-share workspace
  Workspace(
    id: "ws_1",
    name: "Flat Share",
    description: "Shared apartment workspace",
    ownerId: "user_1",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_1").toList(),
    members: demoUsers.where((u) => u.workspaces.contains("ws_1")).toList(),
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_1").map((s) => s.id).toList(),
    memberIds: demoUsers.where((u) => u.workspaces.contains("ws_1")).map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.private,
    type: WorkspaceType.personal,
  ),

  // 2. Engineering team workspace (business)
  Workspace(
    id: "ws_2",
    name: "Engineering Team",
    description: "Internal engineering workspace",
    ownerId: "user_3",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_2").toList(),
    members: demoUsers.where((u) => u.workspaces.contains("ws_2")).toList(),
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_2").map((s) => s.id).toList(),
    memberIds: demoUsers.where((u) => u.workspaces.contains("ws_2")).map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.private,
    type: WorkspaceType.business,
  ),

  // 3. Public community workspace
  Workspace(
    id: "ws_3",
    name: "Open Knowledge Hub",
    description: "A public workspace for sharing general knowledge",
    ownerId: "user_2",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_3").toList(),
    members: demoUsers.where((u) => u.workspaces.contains("ws_3")).toList(),
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_3").map((s) => s.id).toList(),
    memberIds: demoUsers.where((u) => u.workspaces.contains("ws_3")).map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.public,
    type: WorkspaceType.organization,
  ),

  // 4. Solo private workspace (no members except owner)
  Workspace(
    id: "ws_4",
    name: "Personal Notes",
    description: "Private workspace for personal notes and ideas",
    ownerId: "user_4",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_4").toList(),
    members: demoUsers.where((u) => u.id == "user_4").toList(),
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_4").map((s) => s.id).toList(),
    memberIds: ["user_4"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.private,
    type: WorkspaceType.personal,
  ),

  // 5. Large organization workspace (many members)
  Workspace(
    id: "ws_5",
    name: "Marketing Department",
    description: "Workspace for the entire marketing team",
    ownerId: "user_5",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_5").toList(),
    members: demoUsers, // all demo users
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_5").map((s) => s.id).toList(),
    memberIds: demoUsers.map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.private,
    type: WorkspaceType.organization,
  ),

  // 6. Empty workspace (no sheets yet)
  Workspace(
    id: "ws_6",
    name: "New Project Space",
    description: "Fresh workspace with no sheets yet",
    ownerId: "user_2",
    sheets: const [],
    members: demoUsers.where((u) => u.id == "user_2").toList(),
    sheetIds: const [],
    memberIds: ["user_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.private,
    type: WorkspaceType.business,
  ),

  // 7. Public workspace with mixed members
  Workspace(
    id: "ws_7",
    name: "Community Recipes",
    description: "Public workspace for sharing recipes",
    ownerId: "user_1",
    sheets: demoSheets.where((s) => s.workspaceId == "ws_7").toList(),
    members: demoUsers.take(3).toList(),
    sheetIds: demoSheets.where((s) => s.workspaceId == "ws_7").map((s) => s.id).toList(),
    memberIds: demoUsers.take(3).map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: WorkspaceVisibility.public,
    type: WorkspaceType.personal,
  ),
];

