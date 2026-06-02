import 'package:flutter/material.dart';

class WorkspaceProvider extends ChangeNotifier {
  String activeWorkspace = '';

  String get current => activeWorkspace;

  void setActiveWorkspace(String space) {
    activeWorkspace = space;
    notifyListeners();
  }

  void reset() {
    activeWorkspace = '';
    notifyListeners();
  }
}
