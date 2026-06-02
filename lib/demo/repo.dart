import 'package:faqt/demo/demo.dart';
import 'package:faqt/model/faqt_sheet.dart';
import 'package:faqt/model/user.dart';
import 'package:faqt/model/workspaces.dart';

final demoUserRepo = DemoUserRepository();
final demoSheetRepo = DemoSheetRepository();
final demoWorkspaceRepo = DemoWorkspaceRepository();

class DemoUserRepository {
  Future<FaqtUser?> getUser(String id) async {
    return demoUsers.firstWhere(
      (u) => u.id == id,
      orElse: () => demoUsers.first,
    );
  }

  Future<List<FaqtUser>> getAllUsers() async {
    return demoUsers;
  }
}

class DemoSheetRepository {
  Future<FaqtSheet?> getSheet(String id) async {
    return demoSheets.firstWhere(
      (s) => s.id == id,
      orElse: () => demoSheets.first,
    );
  }

  Future<List<FaqtSheet>> getSheetsForWorkspace(String workspaceId) async {
    return demoSheets.where((s) => s.workspaceId == workspaceId).toList();
  }

  Future<List<FaqtSheet>> getAllSheets() async {
    return demoSheets;
  }
}

class DemoWorkspaceRepository {
  Future<Workspace?> getWorkspace(String id) async {
    return demoWorkspaces.firstWhere(
      (w) => w.id == id,
      orElse: () => demoWorkspaces.first,
    );
  }

  Future<List<Workspace>> getAllWorkspaces() async {
    return demoWorkspaces;
  }

  Future<List<Workspace>> getWorkspacesForUser(String userId) async {
    return demoWorkspaces
        .where((w) => w.memberIds.contains(userId))
        .toList();
  }
}
