import 'package:faqt/demo/demo.dart';
import 'package:faqt/model/faqt.dart';
import 'package:faqt/model/space.dart';
import 'package:faqt/model/user.dart';
import 'package:faqt/model/hub.dart';

final demoUserRepo = DemoUserRepository();
final demoFaqtRepo = DemoFaqtRepository();
final demoSpaceRepo = DemoSpaceRepository();
final demoHubRepo = DemoHubRepository();


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


class DemoFaqtRepository {
  Future<Faqt?> getFaqt(String id) async {
    return demoFaqts.firstWhere(
      (f) => f.id == id,
      orElse: () => demoFaqts.first,
    );
  }

  Future<List<Faqt>> getFaqtsForHub(String hubId) async {
    return demoFaqts.where((f) => f.hubId == hubId).toList();
  }

  Future<List<Faqt>> getFaqtsForSpace(String spaceId) async {
    return demoFaqts.where((f) => f.spaceIds.contains(spaceId)).toList();
  }

  Future<List<Faqt>> getAllFaqts() async {
    return demoFaqts;
  }
}


class DemoSpaceRepository {
  Future<Space?> getSpace(String id) async {
    return demoSpaces.firstWhere(
      (s) => s.id == id,
      orElse: () => demoSpaces.first,
    );
  }

  Future<List<Space>> getSpacesForHub(String hubId) async {
    return demoSpaces.where((s) => s.hubId == hubId).toList();
  }

  Future<List<Space>> getAllSpaces() async {
    return demoSpaces;
  }
}


class DemoHubRepository {
  Future<Hub?> getHub(String id) async {
    return demoHubs.firstWhere(
      (w) => w.id == id,
      orElse: () => demoHubs.first,
    );
  }

  Future<List<Hub>> getAllHubs() async {
    return demoHubs;
  }

  Future<List<Hub>> getHubsForUser(String userId) async {
    return demoHubs
        .where((w) => w.memberIds.contains(userId))
        .toList();
  }
}
