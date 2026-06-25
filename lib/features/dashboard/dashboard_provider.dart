import 'package:faqt/model/hub.dart';
import 'package:faqt/model/space.dart';
import 'package:flutter/material.dart';

class HubProvider extends ChangeNotifier {
  Hub? _activeHub;
  String? _activeSpaceId;

  List<Hub> _hubs = [];
  List<Space> _spaces = [];

  // Load hubs + spaces (from demo or backend)
  void loadData({
    required List<Hub> hubs,
    required List<Space> spaces,
  }) {
    _hubs = hubs;
    _spaces = spaces;

    // ⭐ Automatically select the first hub if none is active
    if (_activeHub == null && _hubs.isNotEmpty) {
      setActiveHub(_hubs.first);
    }

    notifyListeners();
  }

  // Active hub
  Hub? get currentHub => _activeHub;
  List<Hub> get hubs => _hubs;

  void setActiveHub(Hub hub) {
    _activeHub = hub;

    // ⭐ Default space = first space in this hub
    final hubSpaces = spacesForHub(hub.id);
    _activeSpaceId = hubSpaces.isNotEmpty ? hubSpaces.first.id : null;

    notifyListeners();
  }

  // Spaces inside the active hub
  List<Space> get currentSpaces {
    if (_activeHub == null) return [];
    return _spaces.where((s) => s.hubId == _activeHub!.id).toList();
  }

  // Active space
  String? get activeSpaceId => _activeSpaceId;

  void setActiveSpace(String? spaceId) {
    _activeSpaceId = spaceId; // null = All Faqts
    notifyListeners();
  }

  // Helper
  List<Space> spacesForHub(String hubId) {
    return _spaces.where((s) => s.hubId == hubId).toList();
  }
}

