import 'package:faqt/model/workspaces.dart';
import 'package:flutter/material.dart';

class WorkspaceProvider extends ChangeNotifier {
  Workspace? activeWorkspace;

  Workspace? get current => activeWorkspace;

  void setActiveWorkspace(Workspace space) {
    activeWorkspace = space;
    notifyListeners();
  }

  void reset() {
    activeWorkspace = null;
    notifyListeners();
  }
}
