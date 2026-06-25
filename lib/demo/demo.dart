import 'package:faqt/model/faqt_category.dart';
import 'package:faqt/model/faqt.dart';
import 'package:faqt/model/space.dart';
import 'package:faqt/model/user.dart';
import 'package:faqt/model/hub.dart';

// -----------------------------
// DEMO USERS
// -----------------------------
final demoUsers = <FaqtUser>[
  FaqtUser(
    id: "user_1",
    email: "alice@example.com",
    name: "Alice Johnson",
    photoUrl: null,
    hubs: ["ws_1", "ws_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_2",
    email: "ben@example.com",
    name: "Ben Carter",
    photoUrl: null,
    hubs: ["ws_1"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_3",
    email: "chloe@example.com",
    name: "Chloe Smith",
    photoUrl: null,
    hubs: ["ws_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  FaqtUser(
    id: "user_4",
    email: "david@example.com",
    name: "David Lee",
    photoUrl: null,
    hubs: ["ws_1"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];

// -----------------------------
// DEMO SHEETS
// -----------------------------
final demoFaqts = <Faqt>[
  // ---------------------------------------------------------
  // HUB 1 — Flat Share
  // ---------------------------------------------------------
  Faqt(
    id: "sheet_1",
    hubId: "hub_1",
    title: "WiFi Password",
    description: "Router is in the hallway. SSID: HomeNet",
    category: FaqtCategory.utilities,
    links: [],
    phoneNumbers: [],
    images: [],
    createdBy: "user_1",
    ownerId: "user_1",
    spaceIds: ["space_1"],   // Living Room
    isGlobal: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    permission: FactPermission.ownerOnly,
  ),

  Faqt(
    id: "sheet_2",
    hubId: "hub_1",
    title: "Landlord Contact",
    description: "Call only for emergencies.",
    category: FaqtCategory.contacts,
    links: [],
    phoneNumbers: ["+44 7123 456789"],
    images: [],
    createdBy: "user_2",
    ownerId: "user_2",
    spaceIds: ["space_2"],   // Emergency Info
    isGlobal: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    permission: FactPermission.ownerOnly,
  ),

  // ---------------------------------------------------------
  // HUB 2 — Engineering Team
  // ---------------------------------------------------------
  Faqt(
    id: "sheet_3",
    hubId: "hub_2",
    title: "Deployment Link",
    description: "Production dashboard for monitoring.",
    category: FaqtCategory.links,
    links: ["https://dashboard.example.com"],
    phoneNumbers: [],
    images: [],
    createdBy: "user_3",
    ownerId: "user_3",
    spaceIds: ["space_3"],   // Deployments
    isGlobal: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    permission: FactPermission.ownerOnly,
  ),

  Faqt(
    id: "sheet_4",
    hubId: "hub_2",
    title: "How to Reset Server",
    description: "Step-by-step instructions for rebooting.",
    category: FaqtCategory.howTo,
    links: [],
    phoneNumbers: [],
    images: [],
    createdBy: "user_4",
    ownerId: "user_4",
    spaceIds: ["space_4"],   // Server Ops
    isGlobal: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    permission: FactPermission.ownerOnly,
  ),
];


// -----------------------------
// DEMO WORKSPACES
// -----------------------------
final demoHubs = <Hub>[
  Hub(
    id: "hub_1",
    name: "Flat Share",
    description: "Shared apartment hub",
    ownerId: "user_1",
    spaces: const [], // will be filled by demoSpaces
    members: demoUsers.where((u) => u.hubs.contains("hub_1")).toList(),
    spaceIds: const ["space_1", "space_2"],
    memberIds: demoUsers
        .where((u) => u.hubs.contains("hub_1"))
        .map((u) => u.id)
        .toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.private,
    type: HubType.personal,
  ),

  Hub(
    id: "hub_2",
    name: "Engineering Team",
    description: "Internal engineering hub",
    ownerId: "user_3",
    spaces: const [],
    members: demoUsers.where((u) => u.hubs.contains("hub_2")).toList(),
    spaceIds: const ["space_3", "space_4"],
    memberIds: demoUsers
        .where((u) => u.hubs.contains("hub_2"))
        .map((u) => u.id)
        .toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.private,
    type: HubType.business,
  ),

  Hub(
    id: "hub_3",
    name: "Open Knowledge Hub",
    description: "A public hub for sharing general knowledge",
    ownerId: "user_2",
    spaces: const [],
    members: demoUsers.where((u) => u.hubs.contains("hub_3")).toList(),
    spaceIds: const ["space_5"],
    memberIds: demoUsers
        .where((u) => u.hubs.contains("hub_3"))
        .map((u) => u.id)
        .toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.public,
    type: HubType.organization,
  ),

  Hub(
    id: "hub_4",
    name: "Personal Notes",
    description: "Private hub for personal notes and ideas",
    ownerId: "user_4",
    spaces: const [],
    members: demoUsers.where((u) => u.id == "user_4").toList(),
    spaceIds: const ["space_6"],
    memberIds: const ["user_4"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.private,
    type: HubType.personal,
  ),

  Hub(
    id: "hub_5",
    name: "Marketing Department",
    description: "Hub for the entire marketing team",
    ownerId: "user_5",
    spaces: const [],
    members: demoUsers, // all demo users
    spaceIds: const ["space_7", "space_8"],
    memberIds: demoUsers.map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.private,
    type: HubType.organization,
  ),

  Hub(
    id: "hub_6",
    name: "New Project Space",
    description: "Fresh hub with no spaces yet",
    ownerId: "user_2",
    spaces: const [],
    members: demoUsers.where((u) => u.id == "user_2").toList(),
    spaceIds: const [],
    memberIds: const ["user_2"],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.private,
    type: HubType.business,
  ),

  Hub(
    id: "hub_7",
    name: "Community Recipes",
    description: "Public hub for sharing recipes",
    ownerId: "user_1",
    spaces: const [],
    members: demoUsers.take(3).toList(),
    spaceIds: const ["space_9"],
    memberIds: demoUsers.take(3).map((u) => u.id).toList(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    visibility: HubVisibility.public,
    type: HubType.personal,
  ),
];

// -----------------------------
// DEMO SPACES
// -----------------------------
final demoSpaces = <Space>[
  // ---------------------------------------------------------
  // HUB 1 — Flat Share
  // ---------------------------------------------------------
  Space(
    id: "space_1",
    hubId: "hub_1",
    name: "Living Room",
    description: "Shared living area",
    createdBy: "user_1",
    ownerId: "user_1",
    editorIds: ["user_1"],
    memberIds: ["user_1", "user_2", "user_4"],
    factIds: ["sheet_1"], // WiFi Password
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Space(
    id: "space_2",
    hubId: "hub_1",
    name: "Emergency Info",
    description: "Contacts and urgent information",
    createdBy: "user_2",
    ownerId: "user_2",
    editorIds: ["user_2"],
    memberIds: ["user_1", "user_2", "user_4"],
    factIds: ["sheet_2"], // Landlord Contact
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------
  // HUB 2 — Engineering Team
  // ---------------------------------------------------------
  Space(
    id: "space_3",
    hubId: "hub_2",
    name: "Deployments",
    description: "Deployment links and dashboards",
    createdBy: "user_3",
    ownerId: "user_3",
    editorIds: ["user_3"],
    memberIds: ["user_3"],
    factIds: ["sheet_3"], // Deployment Link
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Space(
    id: "space_4",
    hubId: "hub_2",
    name: "Server Ops",
    description: "Server maintenance and instructions",
    createdBy: "user_4",
    ownerId: "user_4",
    editorIds: ["user_4"],
    memberIds: ["user_3", "user_4"],
    factIds: ["sheet_4"], // How to Reset Server
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------
  // HUB 3 — Open Knowledge Hub
  // ---------------------------------------------------------
  Space(
    id: "space_5",
    hubId: "hub_3",
    name: "General Knowledge",
    description: "Public shared knowledge",
    createdBy: "user_2",
    ownerId: "user_2",
    editorIds: ["user_2"],
    memberIds: demoUsers
        .where((u) => u.hubs.contains("hub_3"))
        .map((u) => u.id)
        .toList(),
    factIds: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------
  // HUB 4 — Personal Notes
  // ---------------------------------------------------------
  Space(
    id: "space_6",
    hubId: "hub_4",
    name: "Private Notes",
    description: "Personal notes and ideas",
    createdBy: "user_4",
    ownerId: "user_4",
    editorIds: ["user_4"],
    memberIds: ["user_4"],
    factIds: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------
  // HUB 5 — Marketing Department
  // ---------------------------------------------------------
  Space(
    id: "space_7",
    hubId: "hub_5",
    name: "Campaigns",
    description: "Marketing campaigns and planning",
    createdBy: "user_5",
    ownerId: "user_5",
    editorIds: ["user_5"],
    memberIds: demoUsers.map((u) => u.id).toList(),
    factIds: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Space(
    id: "space_8",
    hubId: "hub_5",
    name: "Assets",
    description: "Brand assets and media",
    createdBy: "user_5",
    ownerId: "user_5",
    editorIds: ["user_5"],
    memberIds: demoUsers.map((u) => u.id).toList(),
    factIds: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------
  // HUB 7 — Community Recipes
  // ---------------------------------------------------------
  Space(
    id: "space_9",
    hubId: "hub_7",
    name: "Recipes",
    description: "Public recipe sharing",
    createdBy: "user_1",
    ownerId: "user_1",
    editorIds: ["user_1"],
    memberIds: demoUsers.take(3).map((u) => u.id).toList(),
    factIds: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];


